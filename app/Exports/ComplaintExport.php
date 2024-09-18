<?php

namespace App\Exports;

use App\Models\Complaint;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class ComplaintExport implements FromQuery, WithMapping, WithHeadings
{
    use Exportable;
    public int $sub_cat_id, $year, $month;

    public function __construct(int $sub_cat_id, int $year, int $month)
    {
        $this->sub_cat_id = $sub_cat_id;
        $this->year = $year;
        $this->month = $month;
    }

    public function query()
    {
        return Complaint::query()
            ->where('sub_category_id', $this->sub_cat_id)
            // YEAR(created_at) = 2024 AND WHERE MONTH(created_at) = 9
            ->whereYear('created_at', $this->year)->whereMonth('created_at', $this->month);
    }

    public function map($item): array
    {
        return [
            $item->no_tiket,
            $item->sub_category->category->name,
            $item->sub_category->name,
            $item->user_name,
            $item->title,
        ];
    }

    public function headings(): array
    {
        return [
            'No Tiket',
            'Kategori',
            'Sub Kategori',
            'Nama Pengadu',
            'Aduan',
        ];
    }
}
