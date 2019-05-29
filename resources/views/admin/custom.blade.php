<?php
/** @var \App\Player $player */
?>
@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' Players Activity')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="icon voyager-activity"></i> Players Activity
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-body">
                    <div id="container"></div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('javascript')
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script type="text/javascript">
        $(function () {
            let data = {!! $data !!};
            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Player Activity'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    title: {
                        text: 'Count'
                    }
                },
                plotOptions: {
                    series: {
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                        }
                    }
                },
                series: [{
                    name: 'Players Count',
                    data: data
                }]
            });
        });
    </script>
@stop
