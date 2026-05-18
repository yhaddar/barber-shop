<?php

namespace App\Http\Repositories;

use App\Http\Repositories\Interfaces\TokenRepositoryInterface;
use Illuminate\Support\Facades\DB;

class TokenRepository implements TokenRepositoryInterface {
    public function findByToken($token){
        return DB::table('personal_access_tokens')->select('expires_at')->where('token', $token)->first();
    }
}
