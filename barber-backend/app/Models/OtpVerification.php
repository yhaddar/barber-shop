<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

#[Fillable(['code', 'user_id', 'expires_at', 'is_expired'])]
class OtpVerification extends Model
{
    use Notifiable;

    protected $keyType = 'string';
    public $incrementing = false;
}
