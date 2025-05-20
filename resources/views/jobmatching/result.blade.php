<!-- resources/views/jobmatching/result.blade.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết Quả Ghép Đôi</title>
</head>
<body>
    <h1>Kết Quả Ghép Đôi Ứng Viên và Nhà Tuyển Dụng</h1>

    <h2>Ứng Viên Được Ghép Đôi:</h2>
    @if($matches)
        <table border="1">
            <thead>
                <tr>
                    <th>Ứng Viên</th>
                    <th>Nhà Tuyển Dụng</th>
                    <th>Vị Trí Công Việc</th>
                </tr>
            </thead>
            <tbody>
                @foreach($matches as $match)
                    <tr>
                        <td>{{ $match['candidate'] }}</td>
                        <td>{{ $match['employer'] }}</td>
                        <td>{{ $match['job_description'] }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @else
        <p>Không có kết quả ghép đôi.</p>
    @endif

    <h2>Ứng Viên Không Có Việc Làm:</h2>
    @if($unmatchedCandidates)
        <ul>
            @foreach($unmatchedCandidates as $unmatched)
                <li>{{ $unmatched }}</li>
            @endforeach
        </ul>
    @else
        <p>Tất cả ứng viên đều đã có công việc.</p>
    @endif
</body>
</html>
