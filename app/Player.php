<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Player
 *
 * @property Carbon $last_activity             Время последней активности
 * @package App
 */
class Player extends Model
{
    /**
     * @var string
     */
    protected $connection = 'pgsql_game_db';

    /**
     * @var string
     */
    protected $table = 'players';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name',
        'location',
        'mileage',
        'current_health',
        'health_edge',
        'killed_zombies',
        'money',
        'last_activity',
        'is_mining',
        'is_selling',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;

    // private $breadDateFormat = '{"format": "%H:%M:%S %Y-%m-%d"}';

    /**
     * Мутатор для изменения часового пояса с Амстердаского на Московский
     *
     * @param $value
     *
     * @return string
     */
    public function getLastActivityAttribute($value)
    {
        return Carbon::parse($value)->addHour(1)/*->format('H:i:s d.m.Y')*/;
    }
}
