<?php

namespace App\Http\Controllers;

use App\Http\Requests\CodeRequest;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\ResetPasswordRequest;
use App\Mail\VerificationMailer;
use App\Models\OtpVerification;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Random\RandomException;

class UserController extends Controller
{
    public function login(LoginRequest $request){

        $data = $request->validated();

        if(User::where('email', $data['email'])->exists()){
            if(Auth::attempt(['email' => $data['email'], 'password' => $data['password']])){
                $account_verified = Auth::user();

                if($account_verified == null){
                    return response()->json([
                        "success" => false,
                        "message" => "verifier your account"
                    ]);
                }else {
                    return response()->json([
                        "success" => true,
                        "message" => $account_verified->createToken("token", [], Carbon::now()->addDays(3))->plainTextToken
                    ]);
                }

            }else {
                return response()->json([
                    "success" => false,
                    "message" => "Password incorrect"
                ]);
            }
        }else {
            return response()->json([
                "success" => false,
                "message" => "User not found"
            ]);
        }
    }

    /**
     * @throws RandomException
     */
    public function register(RegisterRequest $request){
        $data = $request->validated();

        $user = new User();
        $user['id'] = Str::uuid();
        $user['first_name'] = $data['first_name'];
        $user['middle_name'] = $data['middle_name'] ?? null;
        $user['last_name'] = $data['last_name'];
        $user['email'] = $data['email'];
        $user['password'] = Hash::make($data['password']);
        $user['gender'] = $data['gender'];
        $user['date_birth'] = $data['date_birth'];
        $user['phone'] = $data['phone'];
        $user['profile'] = $data['gender'] == "M" ? "https://berber-shop.s3.us-east-1.amazonaws.com/users/default/boy.png" : "https://berber-shop.s3.us-east-1.amazonaws.com/users/default/woman.png";

        if($user->save()){
            $this->otpCodeResend("your berber shop verification code is : ", $user);
            return response()->json([
                "success" => true,
                "message" => "account created"
            ])->cookie('user_id', $user['id']);
        }else {
            return response()->json([
                "success" => false,
                "message" => "Failed to create your account"
            ]);
        }
    }

    public function verifyAccount(CodeRequest $request){

        $user = User::where("email", $request['email'])->first();
        $code = OtpVerification::where('user_id', $user['id'])->where("used_for", "verification")->first();
        if($request['code'] == $code['code']){
            $expires_date = Carbon::parse($code['expires_at']);
            if($expires_date->diffInSeconds(Carbon::now()) >= 59){
                $code->delete();
                return response()->json([
                   "message" => "code expired"
                ]);
            }else {
                $user['is_verified'] = true;
                if($user->save()){
                    $code->delete();
                    return response()->json([
                        "message" => "your account is verified"
                    ]);
                }
            }

        }else {
            return response()->json([
                "message" => "Code Verification was incorrect"
            ]);
        }
    }

    public function logout(){
        $user = Auth::user();
        $user->tokens()->delete();
    }

    public function resendCode(){
        $user = Auth::user();

        $otp = OtpVerification::where("user_id", $user['id'])->first();

        if($otp != null){
            $otp->delete();
            $this->otpCodeResend("your berber shop code is : ", $user);
            return response()->json([
                "message" => "code resend"
            ]);
        }else {
            $this->otpCodeResend("your berber shop code is : ", $user);
            return response()->json([
                "message" => "code resend"
            ]);
        }
    }

    private function otpCodeResend($message, $user, $user_for = "verification"){
        $code = str_pad(random_int(0000, 9999), 4, "0", STR_PAD_LEFT);
        $otpVerification = new OtpVerification();
        $otpVerification['id'] = Str::uuid();
        $otpVerification['user_id'] = $user['id'];
        $otpVerification['code'] = $code;
        $otpVerification['expires_at'] = Carbon::now()->addSeconds(59);
        $otpVerification['used_for'] = $user_for;
        Mail::to($user['email'])->send(new VerificationMailer($message, $code));
        if($otpVerification->save()){
            return response()->json([
                "message" => "your code was send"
            ]);
        }
    }

    public function verifyOtpForResetPassword(Request $request){
        $email = $request->email;
        $user = User::where("email", $email);
        if($user->exists()){
            $this->otpCodeResend("your code for reset password is ", $user->first(), "reset");
            return response()->json([
                "message" => "code send"
            ]);

        }else {
            return response()->json([
               "message" => "User not found"
            ]);
        }
    }

    public function resetPassword(ResetPasswordRequest $request){
        $email = $request['email'];
        $user = User::where("email", $email)->first();
        return $user;
    }
}
