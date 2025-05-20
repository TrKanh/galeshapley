<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả ghép đôi - Employer-Proposing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f8fafc;
        }

        h1, h2 {
            color: #2c3e50;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #3490dc;
            padding: 10px 15px;
            border-radius: 6px;
        }

        .table-container {
            max-height: 300px;
            overflow-y: auto;
            overflow-x: auto;
            margin-bottom: 40px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background-color: white;
        }

        table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #e2e8f0;
        }

        .status {
            font-weight: bold;
        }

        .status.success {
            color: green;
        }

        .status.partial {
            color: orange;
        }

        .status.fail {
            color: red;
        }

        .group-light {
            background-color: #ffffff;
        }

        .group-dark {
            background-color: #f1f5f9;
        }
    </style>
</head>
<body>
    <h1>🔗 Kết quả ghép đôi (Employer-Proposing)</h1>

    <h2>✔️ Các cặp ghép đôi thành công:</h2>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID Nhà tuyển dụng</th>
                    <th>Tên Nhà tuyển dụng</th>
                    <th>Ứng viên</th>
                    <th>Công việc</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $currentEmployer = null;
                    $rowColorToggle = false;
                @endphp
                @if(count($matches) > 0)
                    @foreach($matches as $match)
                        @php
                            if ($currentEmployer !== $match['employer_id']) {
                                $currentEmployer = $match['employer_id'];
                                $rowColorToggle = !$rowColorToggle;
                            }
                            $rowClass = $rowColorToggle ? 'group-light' : 'group-dark';
                        @endphp
                        <tr class="{{ $rowClass }}">
                            <td>{{ $match['employer_id'] }}</td>
                            <td>{{ $match['employer'] }}</td>
                            <td>{{ $match['candidate'] }}</td>
                            <td><em>{{ $match['job_description'] }}</em></td>
                            <td class="status success">✅ Ghép với công việc phù hợp</td>
                        </tr>
                    @endforeach
                @else
                    <tr><td colspan="5">Không có cặp ghép đôi thành công.</td></tr>
                @endif
            </tbody>
        </table>
    </div>

    <h2>⚠️ Nhà tuyển dụng không có ứng viên:</h2>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID Nhà tuyển dụng</th>
                    <th>Tên Nhà tuyển dụng</th>
                </tr>
            </thead>
            <tbody>
                @if(count($unmatchedEmployers) > 0)
                    @foreach($unmatchedEmployers as $employer)
                        <tr>
                            <td>{{ $employer->id }}</td>
                            <td>{{ $employer->name }}</td>
                        </tr>
                    @endforeach
                @else
                    <tr><td colspan="2">Tất cả nhà tuyển dụng đã có ứng viên.</td></tr>
                @endif
            </tbody>
        </table>
    </div>
    

    <p><a href="{{ route('choose-match-type') }}">⬅️ Quay lại</a></p>
</body>
</html>
