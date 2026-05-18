<?php

namespace App\Services;

use Twilio\Rest\Client;

class TwilioService
{
    protected $client;

    public function __construct(){
        $this->client = new Client(
            env('TWILIO_SID'),
            env('TWILIO_AUTH_TOKEN')
        );
    }

    public function sendSMS($phone, $message){
        return $this->client->messages->create($phone, [
            "from" => env('TWILIO_FROM'),
            "body" => $message,
        ]);
    }
}
