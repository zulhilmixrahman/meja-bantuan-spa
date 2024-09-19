@extends('layouts.main')

@section('page-styles')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.js"
        integrity="sha512-ZwR1/gSZM3ai6vCdI+LVF1zSq/5HznD3ZSTk7kajkaj4D292NLuduDCO1c/NT8Id+jE58KYLKT7hXnbtryGmMg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
@endsection

@section('page-header')
    <div class="row g-2 align-items-center">
        <div class="col">
            <h2 class="page-title">Dashboard</h2>
        </div>
    </div>
@endsection

@section('content')
    <div class="card">
        <div class="card-body">
            <div class="d-flex justify-content-center">
                <div style="width: 50%; text-align: center; margin: 0 5% 50px;">
                    <x-chartjs-component :chart="$kategori_chart" />
                </div>
                <div style="width: 50%; text-align: center; margin: 0 5% 50px;">
                    <canvas id="OfficerChart"></canvas>
                    {{-- <x-chartjs-component :chart="$officer_chart" /> --}}
                </div>
            </div>

            <div class="d-flex">
                <div style="width: 30%; text-align: center; margin: 0 10%;">
                    <x-chartjs-component :chart="$status_chart" />
                </div>
                <div style="width: 30%; text-align: center; margin: 0 10%;">
                    <canvas id="officerStatusChart"></canvas>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('page-scripts')
    <script>
        (function() {
            var init = function() {
                "use strict";

                var ctx = document.getElementById("OfficerChart");
                var dataOfficer = {!! json_encode($officer_data) !!};
                var config = {
                    type: 'bar',
                    data: {
                        labels: {!! json_encode($officer_data->pluck('label')->toArray()) !!},
                        datasets: [{
                            label: 'Pegawai',
                            data: dataOfficer,
                        }]
                    },
                    options: {
                        indexAxis: 'y',
                        parsing: {
                            xAxisKey: 'total',
                            yAxisKey: 'label'
                        },
                        plugins: {
                            legend: {
                                position: 'none',
                            }
                        },
                        onClick: (e) => {
                            const activePoints = OfficerChart.getElementsAtEventForMode(e, 'nearest', {
                                intersect: true
                            }, false);
                            if (activePoints.length > 0) {
                                const index = activePoints[0].index;
                                const key = OfficerChart.data.datasets[0].data[index].id;
                                getOfficerData(key);
                            }
                        }
                    }
                };

                window.OfficerChart = new Chart(ctx, config);
            };

            if (document.readyState !== 'loading') {
                init();
            } else {
                document.addEventListener("DOMContentLoaded", init);
            }
        })();

        var officerStatusChart = new Chart(document.getElementById("officerStatusChart"), {
            type: 'pie',
            data: {},
            options: {}
        });

        async function getOfficerData(officer) {
            const url = '{{ url('get-officer-complaints') }}/' + officer;
            try {
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error(`Response status: ${response.status}`);
                }

                const json = await response.json();
                if (json.status === 'success') {
                    // console.log(typeof window.officerStatusChart);
                    // if (typeof window.officerStatusChart !== 'object') {
                    officerStatusChart.destroy();
                    // }

                    officerStatusChart = new Chart(document.getElementById("officerStatusChart"), {
                        type: 'pie',
                        data: {
                            labels: json.data.label,
                            datasets: [{
                                "label": "Status",
                                "data": json.data.value,
                            }]
                        },
                        options: {
                            "plugins": {
                                "legend": {
                                    "position": "bottom"
                                }
                            }
                        }
                    });


                    console.log(window.officerStatusChart);
                }

            } catch (error) {
                console.error(error.message);
            }
        }
    </script>
@endsection
