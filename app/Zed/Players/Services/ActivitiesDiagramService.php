<?php

namespace Zed\Players\Services;

use App\Player;
use Carbon\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class ActivitiesDiagramService
{
    /**
     * @param int $lastDays
     *
     * @return array
     */
    public function getPlayersActivityData(int $lastDays): array
    {
        $days = $this->getLastDays($lastDays);

        $playersCount = $this->getPlayersByDays($days);

        $data = [];
        foreach ($playersCount as $day => $count) {
            $data[] = [
                'name' => $day,
                'y'    => $count,
            ];
        }

        return $data;
    }

    /**
     * @param int $lastDays
     *
     * @return array
     */
    private function getLastDays(int $lastDays): array
    {
        /** @var Collection $days */
        $days = Player::selectRaw('last_activity :: DATE as last_activity')
            ->groupBy(DB::raw('date(last_activity)'))
            ->orderBy('last_activity', 'desc')
            ->take($lastDays)
            ->pluck('last_activity');

        return $days->map(function ($item) {
            /** @var Carbon $item */
            return $item->format('d-m-Y');
        })->toArray();
    }

    /**
     * @param array $days
     *
     * @return array
     */
    private function getPlayersByDays(array $days): array
    {
        /** @var Collection $players */
        $players = Player::where('last_activity', '>=', Carbon::parse(end($days))->format('Y-m-d'))
            ->selectRaw('last_activity :: DATE as last_activity, count(last_activity) as count')
            ->groupBy(DB::raw('date(last_activity)'))
            ->orderBy('last_activity', 'asc')
            ->get();

        return $players->mapWithKeys(function ($item) {
            return [$item->last_activity->format('d-m-Y') => $item->count];
        })->toArray();
    }
}