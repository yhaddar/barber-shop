<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class ActivatedAccountMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $id = Auth::user()->id;
        $isTrue = User::where('id', $id)->first()->is_verified;
        if(!$isTrue){
            return \response()->json([
                "message" => "your account is not verified"
            ]);
        }
        return $next($request);
    }
}
