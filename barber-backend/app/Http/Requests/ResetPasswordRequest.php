<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class ResetPasswordRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "password" => "required|string|confirmed|min:8",
        ];
    }

    public function messages(): array
    {
        return [
            "password.required" => "Password is required.",
            "password.min" => "Password must be at least 8 characters.",
            "password.confirmed" => "Password does not match.",
        ];
    }
}
