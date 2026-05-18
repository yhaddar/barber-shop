<?php

namespace App\Http\Middleware;

use App\Models\OtpVerification;
use App\Models\User;
use Carbon\Carbon;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ResetPasswordMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $code = $request['code'];
        $user = User::where("email", $request['email'])->first();
        $is_verified = OtpVerification::where('user_id', $user->id)->where("used_for", "reset");

        if(!$is_verified->exists()){
            return \response()->json([
                "message" => "code don't exists"
            ]);
        }else if($code == $is_verified->first()['code']){

            return $next($request);

        }else {
            return \response()->json([
                "message" => "the code is incorrect"
            ]);
        }

    }
}
