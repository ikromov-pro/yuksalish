<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    
    $data=[ 
        'socials'=>\App\Models\Social::all(),
        'activities'=>\App\Activity::all(),
        'filials'=>\App\Filial::all(),
        'priorities'=>\App\Priority::all(),
        'reviews'=>\App\Review::all(),
        'stats'=>\App\Stat::all(),
    ];

    return view('welcome', compact('data'));
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
