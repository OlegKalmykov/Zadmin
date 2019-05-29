<?php

namespace Zed\Players\Services;

use App\Player;
use Carbon\Carbon;
use Illuminate\Support\Collection;

class ActivitiesDiagramService
{
    /**
     * @return array
     */
    public function getPlayersActivityData(): array
    {
        /** @var Collection $players */
        $players = Player::orderBy('last_activity', 'desc')
            // ->take(100)
            ->pluck('last_activity');

        $days = $players->map(function ($item) {
            /** @var Carbon $item */
            return $item->format('d-m-Y');
        })->toArray();

        $playersCount = array_reverse(array_count_values($days));

        $data = [];
        foreach ($playersCount as $day => $count) {
            $data[] = [
                'name' => $day,
                'y'    => $count,
            ];
        }

        return $data;
    }
}