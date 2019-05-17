<?php

namespace App;

use Illuminate\Database\Eloquent\Relations\Pivot;

class Backpack extends Pivot
{
    /**
     * @var string
     */
    protected $connection = 'pgsql_game_db';

    /**
     * @var string
     */
    protected $table = 'backpacks';

    /**
     * @var string
     */
    protected $primaryKey = 'player_id';

    /**
     * @inheritDoc
     */
    protected $foreignKey = 'player_id';

    /**
     * @inheritDoc
     */
    protected $relatedKey = 'item_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'player_id',
        'item_id',
        'count',
    ];

    /**
     * @var bool
     */
    public $timestamps = false;
}
