<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            "email" => "required|string|email|max:255",
            "password" => "required|string|min:8",
        ];
    }

    public function messages(): array
    {
        return [
            "email.required" => "Email is required.",
            "email.email" => "Email is invalid.",
            "password.required" => "Password is required.",
            "password.min" => "Password must be at least 8 characters.",
        ];
    }
}
