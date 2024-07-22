<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SampleForm extends FormRequest
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
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'username' => 'required',
            'email' => 'required|email|unique:users,email',
            'fullname' => 'required|max:255',
            'address' => 'required',
            'postcode' => 'required|numeric|min:5|max:5',
            'state' => 'required|integer',
            'rd' => 'nullable',
            'ck' => 'nullable',
        ];
    }
}
