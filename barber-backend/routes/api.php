<?php

use App\Http\Controllers\UserController;
use App\Http\Middleware\ResetPasswordMiddleware;
use Illuminate\Support\Facades\Route;

Route::controller(UserController::class)->prefix("/user")->group(function(){
    Route::post("/login", "login");
    Route::post("/register", "register");
    Route::post("/verify-account", "verifyAccount");
    Route::post("/logout", "logout")->middleware("auth:sanctum");
    Route::post("/resend-code", "resendCode")->middleware("auth:sanctum");
    Route::post("/send-code-for-reset-password", "verifyOtpForResetPassword");
    Route::post("/reset-password", "resetPassword")->middleware(ResetPasswordMiddleware::class);
});
