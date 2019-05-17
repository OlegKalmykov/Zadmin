<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    /**
     * @var string
     */
    protected $connection = 'pgsql_game_db';

    /**
     * @var string
     */
    protected $table = 'items';

    /**
     * @var string
     */
    protected $primaryKey = 'item_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'item_name',
        'item_info',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
