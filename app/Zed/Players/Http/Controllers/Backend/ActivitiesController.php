<?php

namespace Zed\Players\Http\Controllers\Backend;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Zed\Players\Services\ActivitiesDiagramService;

class ActivitiesController extends Controller
{
    /**
     * @var ActivitiesDiagramService
     */
    private $activitiesDiagramService;

    /**
     * ActivitiesController constructor.
     *
     * @param ActivitiesDiagramService $activitiesDiagramService
     */
    public function __construct(ActivitiesDiagramService $activitiesDiagramService)
    {
        $this->activitiesDiagramService = $activitiesDiagramService;
    }

    /**
     * @param Request $request
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function activity(Request $request)
    {
        $lastDays = (int)$request->get('days', 5);

        $data = $this->activitiesDiagramService->getPlayersActivityData($lastDays);

        return view('admin.custom', [
            'data'     => json_encode($data),
            'days'     => json_encode(array_column($data, 'name')),
            'lastDays' => $lastDays,
        ]);
    }
}
