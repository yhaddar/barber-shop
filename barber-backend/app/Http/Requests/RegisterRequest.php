<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
            "first_name" => "required|string|between:3,8",
            "middle_name" => "nullable|string|between:3,8",
            "last_name" => "required|string|between:3,8",
            "email" => "required|string|email|max:255|unique:users,email",
            "password" => "required|string|confirmed|min:8",
            "gender" => "required|string|in:M,F",
            "phone" => "required|numeric|unique:users,phone",
            "date_birth" => "required|date|date_format:d-m-Y"
        ];
    }

    public function messages(): array
    {
        return [
            "first_name.required" => "First name is required.",
            "first_name.between" => "First name must be between 3 and 8 characters.",
            "last_name.required" => "Last name is required.",
            "last_name.between" => "Last name must be between 3 and 8 characters.",
            "email.required" => "Email is required.",
            "email.email" => "Email is invalid.",
            "email.unique" => "Email already exists.",
            "password.required" => "Password is required.",
            "password.min" => "Password must be at least 8 characters.",
            "password.confirmed" => "Password does not match.",
            "gender.required" => "Gender is required.",
            "gender.in" => "Please select a valid gender.",
            "date_birth.required" => "Date birth is required.",
            "date_birth.date" => "Please enter a valid date of birth.",
            "date_birth.date_format" => "Please enter a valid date of birth.",
            "phone.required" => "Phone is required.",
            "phone.unique" => "Phone already exists.",
            "phone.numeric" => "Please enter a valid phone number.",
        ];
    }
}
