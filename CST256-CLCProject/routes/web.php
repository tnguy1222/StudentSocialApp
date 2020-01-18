<?php

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

Route::get('/home', function () {
    return view('homePage');
});
    
/*
* this route is mapped to the '/login' URI render to the Login Form
* View (an HTML Form) 
*/
Route::get('/login', function()
{
    return view('loginForm');
});
