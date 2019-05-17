<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Weapon extends Model
{
    /**
     * @var string
     */
    protected $connection = 'pgsql_game_db';

    /**
     * @var string
     */
    protected $table = 'weapons';

    /**
     * @var string
     */
    protected $primaryKey = 'weapon_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'player_id',
        'weapon_uid',
        'weapon_name',
        'is_in_hand',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
