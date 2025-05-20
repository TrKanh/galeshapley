<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn kiểu ghép đôi</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            padding: 0 30px; 
            background: #f7f9fc; 
        }
        h1, h2 { 
            color: #333; 
        }
        .btn-danger {
            background: #dc3434 !important;
        }
        .btn-warning {
            background: #f0ad4e !important;
        }
        .btn-group { 
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
        }
        .btn-group form,
        .btn-group a {
            display: inline-block;
            margin-right: 10px;
        }
        .btn-group button,
        .btn-group a {
            padding: 12px 24px; /* Tăng kích thước padding */
            background: #3490dc;
            color: #fff;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 16px; /* Đặt kích thước font */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Thêm bóng cho nút */
        }
        .btn-group button:hover,
        .btn-group a:hover { 
            background: #2779bd; 
        }
        .table-container { 
            max-height: 400px; /* Mặc định chiều cao là 400px */
            overflow: auto;
            margin-bottom: 40px; 
            background: #fff; 
            border: 3px solid black;
            transition: max-height 0.5s ease-in-out; /* Thêm transition mượt mà cho chiều cao */
        }
        .table-container::-webkit-scrollbar {
            display: none;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            min-width: 800px; 
        }
        .sticky-thead {
            position: sticky;
            top: 0;
        }
        th, td { 
            padding: 12px; 
            border: 1px solid #ddd; 
        }
        th { 
            background: #ffc3a0; 
        }
        .nested-table { 
            width: 100%; 
            border-collapse: collapse; 
        }
        .nested-table th, .nested-table td { 
            border: 1px solid #bbb; 
            padding: 8px; 
            background: #f9f9f9; 
        }
        .nested-table th { 
            background: #dbeafe; 
            width: 12%;
        }
        .status {
            margin-bottom: 20px; 
            color: green; 
        }
        .toggle-button {
            padding: 12px 24px;
            background: #000000;
            color: #fff;
            border: none;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    

    @if(session('status'))
        <div class="status">{{ session('status') }}</div>
    @endif

    <div class="btn-group">
        {{-- 2 nút chuyển sang matching pages --}}
        <div>
            <h1>🔀 Chọn kiểu ghép đôi</h1>
            <a href="{{ route('match.candidate') }}">Ứng viên chủ động</a>
            <a href="{{ route('match.employer') }}">Nhà tuyển dụng chủ động</a>
        </div>
        {{-- Nút gửi POST để reset data --}}
        <div>
            <h1>🔀 Mô phỏng dữ liệu</h1>
            <form method="POST" action="{{ route('data.reset') }}">
                @csrf
                <button type="submit" class="btn-danger">Tạo mới dữ liệu</button>
            </form>
    
            {{-- Nút gửi POST để generate preferences --}}
            <form method="POST" action="{{ route('preferences.generate') }}">
                @csrf
                <button type="submit" class="btn-warning">Tạo danh sách ưu tiên</button>
            </form>
        </div>
    </div>

    <h2>📋 Danh sách Ứng viên</h2>
    <div>
        <button class="toggle-button" onclick="toggleTable('candidatesTable')">Mở rộng / Thu nhỏ</button>
        <div class="table-container" id="candidatesTable">
            <table>
                <thead class="sticky-thead">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Kỹ năng</th>
                        <th>Yêu cầu</th>
                        <th>Ưu tiên (Job Position IDs)</th>
                    </tr>
                </thead>
                <tbody>
                @foreach(\App\Models\Candidate::all() as $cand)
                    <tr>
                        <td>{{ $cand->id }}</td>
                        <td>{{ $cand->name }}</td>
                        <td>{{ implode(', ', $cand->skills ?? []) }}</td>
                        <td>
                            @foreach($cand->requirements ?? [] as $key => $value)
                                @if(is_array($value))
                                    {{ ucfirst($key) }}: {{ implode(', ', $value) }}<br>
                                @else
                                    {{ ucfirst($key + 1) }}: {{ $value }}<br>
                                @endif
                            @endforeach
                        </td>                    
                        <td style="width: 25%">
                            @foreach($cand->preferences ?? [] as $jobId)
                            @php
                                $job = \App\Models\JobPosition::find($jobId);
                            @endphp
                            @if($job)
                                {{ $job->id }}@if(!$loop->last), @endif
                            @else
                                Không có
                            @endif
                        @endforeach

                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <h2>🏢 Nhà tuyển dụng & Vị trí tuyển dụng</h2>
    <div>
        <button class="toggle-button" onclick="toggleTable('employersTable')">Mở rộng / Thu nhỏ</button>
        <div class="table-container" id="employersTable">
            <table>
                <thead class="sticky-thead">
                    <tr>
                        <th>Employer ID</th>
                        <th>Tên</th>
                        <th>Ưu tiên (Candidate IDs)</th>
                        <th>Vị trí tuyển dụng</th>
                    </tr>
                </thead>
                <tbody>
                @foreach(\App\Models\Employer::with('jobPositions')->get() as $emp)
                    <tr>
                        <td>{{ $emp->id }}</td>
                        <td>{{ $emp->name }}</td>
                        <td style="width: 25%;">{{ implode(', ', $emp->preferences ?? []) }}</td>
                        <td>
                            @if($emp->jobPositions->count())
                                <table class="nested-table">
                                    <thead>
                                        <tr>
                                            <th>Job ID</th>
                                            <th>Mô tả</th>
                                            <th>Kỹ năng yêu cầu</th>
                                            <th>Đặc điểm</th>
                                            <th>Ứng viên</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($emp->jobPositions as $job)
                                        <tr>
                                            <td>{{ $job->id }}</td>
                                            <td>{{ $job->job_description }}</td>
                                            <td>{{ implode(', ', $job->required_skills) }}</td>
                                            <td>
                                                @foreach($job->features ?? [] as $key => $value)
                                                    @if(is_array($value))
                                                        {{ ucfirst($key) }}: {{ implode(', ', $value) }}<br>
                                                    @else
                                                        {{ ucfirst($key + 1) }}: {{ $value }}<br>
                                                    @endif
                                                @endforeach
                                            </td>                                        
                                            <td>
                                                {{ $job->candidate_id
                                                    ? \App\Models\Candidate::find($job->candidate_id)?->name
                                                    : 'Chưa có' }}
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            @else
                                Không có vị trí
                            @endif
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function toggleTable(tableId) {
        const table = document.getElementById(tableId);
        // Kiểm tra chiều cao hiện tại của bảng
        if (table.style.maxHeight === "400px" || table.style.maxHeight === "") {
            // Mở rộng bảng và thay đổi maxHeight thành chiều cao thực tế
            table.style.maxHeight = table.scrollHeight + "px"; // Chiều cao tự động của bảng
        } else {
            // Thu nhỏ bảng về chiều cao mặc định
            table.style.maxHeight = "400px"; // Đặt lại chiều cao thành 400px
        }
    }

    </script>
</body>
</html>
