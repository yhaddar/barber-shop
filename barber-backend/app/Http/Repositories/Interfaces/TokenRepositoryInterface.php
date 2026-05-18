<?php
namespace App\Http\Repositories\Interfaces;

interface TokenRepositoryInterface {
    public function findByToken($token);
}
