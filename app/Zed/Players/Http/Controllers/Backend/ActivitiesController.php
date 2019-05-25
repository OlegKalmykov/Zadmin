<?php

namespace Zed\Players\Http\Controllers\Backend;

use App\Player;
use Illuminate\Routing\Controller;

class ActivitiesController extends Controller
{
    public function activity()
    {
        dd("Activities page", Player::all()->toArray());
    }
}
