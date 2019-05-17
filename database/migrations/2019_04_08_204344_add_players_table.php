<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPlayersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('players', function (Blueprint $table) {
            $table->integerIncrements('id');
            $table->unsignedBigInteger('user_id');
            $table->char('first_name', 50);
            $table->integer('location');
            $table->bigInteger('mileage');
            $table->integer('current_health');
            $table->integer('health_edge');
            $table->integer('killed_zombies');
            $table->integer('money')->default(80);
            $table->timestampTz('last_activity')->default(now());
            $table->boolean('is_mining')->default(false);
            $table->boolean('is_selling')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('players');
    }
}
