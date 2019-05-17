<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTradeLotsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trade_lots', function (Blueprint $table) {
            $table->integerIncrements('lot_id');
            $table->bigInteger('player_id');
            $table->integer('item_id');
            $table->integer('count');
            $table->integer('price');
            $table->timestampTz('create_date')->default(now());
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trade_lots');
    }
}
