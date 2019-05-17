<?php

namespace App\Commands;

class BugReward
{
    private $message = [
        "playerId" => 282004798,
        "text"     => "<b>Команда DaysZ благодарит тебя за разработку админки!</b>",
        "money"    => 1,
    ];

    public function __construct(int $playerId, string $text, int $money)
    {

    }

    public function getMessage()
    {

    }
}