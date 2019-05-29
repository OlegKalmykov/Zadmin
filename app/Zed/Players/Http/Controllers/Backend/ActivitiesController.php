<?php

namespace Zed\Players\Http\Controllers\Backend;

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

    public function activity()
    {
        $data = $this->activitiesDiagramService->getPlayersActivityData();

        return view('admin.custom', [
            'data' => json_encode($data),
        ]);
    }
}
