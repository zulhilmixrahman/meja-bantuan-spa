<?php

namespace App\Http\Controllers;
use App\Models\User;
use IcehouseVentures\LaravelChartjs\Facades\Chartjs;

class DashboardController extends Controller
{
    public function index()
    {
        return view('dashboard', [
            'kategori_chart' => $this->getCategoriesChart(),
            'status_chart' => $this->getStatusChart(),
            'officer_chart' => $this->getOfficerChart(),
        ]);
    }

    private function getCategoriesChart()
    {
        $data = \DB::table('complaints')
            ->select([
                'sub_categories.name AS label',
                \DB::raw('COUNT(complaints.id) AS total'),
            ])
            ->join('sub_categories', 'complaints.sub_category_id', '=', 'sub_categories.id')
            ->groupBy('complaints.sub_category_id')
            ->get();

        $chart = Chartjs::build()
            ->name("CategoryChart")
            ->type("bar")
            ->labels($data->pluck('label')->toArray())
            ->datasets([
                [
                    "label" => "Sub Kategori Aduan",
                    "backgroundColor" => "rgba(38, 185, 154, 0.31)",
                    "borderColor" => "rgba(38, 185, 154, 0.7)",
                    "data" => $data->pluck('total')->toArray()
                ]
            ])
            ->options([
                'plugins' => [
                    'legend' => [
                        'position' => 'none'
                    ]
                ]
            ]);

        return $chart;
    }

    private function getStatusChart()
    {
        $data = \DB::table('complaints')
            ->select([
                'complaints.status AS label',
                \DB::raw('COUNT(complaints.id) AS total'),
            ])
            ->groupBy('complaints.status')
            ->orderBy('complaints.status', 'ASC')
            ->get();

        $chart = Chartjs::build()
            ->name("StatusChart")
            ->type("doughnut")
            ->labels($data->pluck('label')->toArray())
            ->datasets([
                [
                    "label" => "Status Aduan",
                    "data" => $data->pluck('total')->toArray(),
                    "backgroundColor" => [
                        'rgb(234, 32, 39)',
                        'rgb(255, 195, 18)',
                        'rgb(0, 148, 50)'
                    ],
                ]
            ])
            ->options([
                'plugins' => [
                    'legend' => [
                        'position' => 'bottom'
                    ]
                ]
            ]);

        return $chart;
    }

    private function getOfficerChart()
    {
        $data = \DB::table('complaints')
            ->select([
                'complaints.officer_id AS id',
                'users.name AS label',
                \DB::raw('COUNT(complaints.id) AS total'),
            ])
            ->join('users', 'complaints.officer_id', '=', 'users.id')
            ->groupBy('complaints.officer_id')
            ->get();

        $chart = Chartjs::build()
            ->name("OfficerChart")
            ->type("bar")
            ->labels($data->pluck('label')->toArray())
            ->datasets([
                [
                    "label" => "Pegawai",
                    "data" => $data->pluck('total')->toArray(),
                ]
            ])
            ->optionsRaw("{
                indexAxis: 'y',
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
                        const label = OfficerChart.data.labels[index];
                        const value = OfficerChart.data.datasets[0].data[index];
                        getOfficerData(label);
                    }
                }
            }");

        return $chart;
    }

    public function getOfficerComplaint($officer)
    {
        $officer = User::where('name', $officer)->first();

        $data = \DB::table('complaints')
            ->select(['complaints.status AS label', \DB::raw('COUNT(complaints.id) AS total')])
            ->where('complaints.officer_id', $officer->id)
            ->groupBy('complaints.status')
            ->orderBy('complaints.status')
            ->get();

        if ($data->count() > 0) {
            return response()->json([
                'status' => 'success',
                'data' => [
                    'label' => $data->pluck('label')->toArray(),
                    'value' => $data->pluck('total')->toArray()
                ]
            ]);
        }

        return response()->json(['status' => 'failed', 'data' => []]);
    }
}
