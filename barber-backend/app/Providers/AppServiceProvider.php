<?php

namespace App\Providers;

use App\Http\Repositories\Interfaces\TokenRepositoryInterface;
use App\Http\Repositories\TokenRepository;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(
            TokenRepositoryInterface::class,
            TokenRepository::class

        );
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
