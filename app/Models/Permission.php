<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use OwenIt\Auditing\Contracts\Auditable;
use Spatie\Permission\Models\Permission as SpatiePermission;

class Permission extends SpatiePermission implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected function color(): Attribute
    {
        return Attribute::make(
            get: function (mixed $value, array $attributes) {
                if (str_contains($attributes['name'], 'access')) {
                    return 'azure';
                }

                if (str_contains($attributes['name'], 'add')) {
                    return 'green';
                }

                if (str_contains($attributes['name'], 'edit')) {
                    return 'yellow';
                }

                if (str_contains($attributes['name'], 'delete')) {
                    return 'red';
                }

                return 'dark';
            },
        );
    }
}
