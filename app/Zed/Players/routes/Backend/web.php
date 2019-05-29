<?php

use Illuminate\Support\Facades\Route;

Route::group(['as' => 'backend.players.', 'middleware' => ['web', 'admin.user'], 'prefix' => 'players'], function () {
    Route::get('/activity', [
        'as'   => 'activity',
        'uses' => 'ActivitiesController@activity',
    ]);
});