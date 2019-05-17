<?php

namespace Zed\Http\Controllers;

use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __construct()
    {

    }

    public function index()
    {

        dd("HELLO ZED ");
        // return view('welcome');
    }
}