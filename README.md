# Install Source

- Step 1: Change file .env.example to .env

- Step 2: Install Vendor Laravel

```
composer install
```

- Step 3: Create generate key

```
php artisan key:generate
```

- Step 4: Create DB and then check and update information to connect DB in .env

- Step 5: Run migrate

```
php artisan migrate
```

- Step 6: Clear cache server

```
php artisan config:cache
```

- Step 7: Run project

```
php artisan serve
```

- Step 8: Go link

```
http://localhost:8000/admin/category/index
```

---

## Download Tài Liệu (Branch: feature/download-documents)

- Step 1: Tạo thư mục lưu file PDF

```
Tạo thư mục: storage/app/product_documents
```

- Step 2: Cập nhật Route

```php
// Route download, nhận ProductID
Route::get('/product/{id}/download', [ProductController::class, 'downloadFile'])->name('product.download');
```

- Step 3: Thêm hàm downloadFile vào ProductController.php

```php
public function downloadFile($id)
{
    // 1. Tìm sản phẩm và kiểm tra đường dẫn
    $product = Product::select('ProductID', 'ProductName', 'DocumentURL')
        ->where('ProductID', $id)
        ->firstOrFail();

    $documentUrl = $product->DocumentURL;

    if (!$documentUrl) {
        abort(404, 'Sản phẩm này không có tài liệu để tải xuống.');
    }

    // 2. Xây dựng đường dẫn vật lý
    $filePath = storage_path('app/' . $documentUrl);

    // Đặt tên file tải xuống
    $fileName = $product->ProductName . '_TaiLieuKyThuat.pdf';

    // 3. Kiểm tra file có tồn tại
    if (!File::exists($filePath)) {
        abort(404, 'File tài liệu không tìm thấy trên server.');
    }

    // 4. Trả về Response download
    return response()->download($filePath, $fileName);
}
```

- Step 4: Hiển thị Link trong View

```php
<!-- download -->
@if($product->DocumentURL)
<div class="product__details__action mt-3">
    <!-- Action Buttons -->
    <button href="#" class="primary-btn" id="addToCartButton" style="border: none;">THÊM VÀO GIỎ</button>
    <a href="{{ route('product.download', $product->ProductID) }}" class="primary-btn">
        <i class="fa fa-download"></i> Tải Tài liệu
    </a>
</div>
@endif
<!-- end download -->
```

- Step 5: Thêm import File vào ProductController.php

```php
use Illuminate\Support\Facades\File;
```

---

## Captcha (Branch: feature/captcha)

- Step 1: Cài đặt gói mews/captcha

```
composer require mews/captcha
```

- Step 2: Nếu gặp lỗi GD Extension

```
Chạy: php --ini (xem php.ini ở đâu)
Mở file php.ini được xác định
Tìm và xóa dấu chấm phẩy (;) khỏi dòng: ;extension=gd
Lưu file
```

- Step 3: Kiểm tra GD đã kích hoạt

```
php -m | findstr /i "gd"
```

- Step 4: Thử cài đặt lại gói Captcha

```
composer require mews/captcha
```

- Step 5: Thêm Captcha vào form Register

```php
<div class="form-group">
    <label>Captcha</label>
    <div>{!! captcha_img() !!}</div>
    <input type="text" class="form-control" name="captcha" placeholder="Nhập mã Captcha" required>
</div>
```

- Step 6: Thêm validation trong AuthController

```php
$request->validate([
    'name' => 'required',
    'email' => 'required|email|unique:users',
    'password' => 'required|confirmed',
    'captcha' => 'required|captcha'
]);
```

- Step 7: Khắc phục lỗi Định Tuyến (404)

```
1. Mở file .htaccess trong thư mục public
2. Thêm dòng RewriteBase:
   RewriteEngine On
   RewriteBase /your-project-name/public/
3. Mở httpd.conf trong XAMPP
4. Bỏ dấu # khỏi: LoadModule rewrite_module modules/mod_rewrite.so
5. Restart Apache
```

- Step 8: Xóa cache Laravel

```
php artisan config:cache
php artisan cache:clear --store=file
php artisan view:clear
```

- Step 9: Truy cập trang đăng ký

```
http://localhost:8000/register
```
Lúc này Captcha image sẽ hiển thị thay cho chữ "captcha"

🧠 AI Chat Assistant – Plastic Store (Laravel)
📌 Giới thiệu

Dự án này tích hợp AI Chat Assistant vào website Plastic Store sử dụng Laravel + Groq AI API (llama-3.1-8b-instant).
Chatbot hỗ trợ tư vấn về vật liệu nhựa, sản phẩm, chai nhựa, ứng dụng thực tế, với giao diện thân thiện và xử lý lỗi an toàn.

🛠 Công nghệ sử dụng

Laravel

Blade Template

Groq AI API

Bootstrap 4

jQuery

Owl Carousel

SlickNav

Font Awesome

📂 Cấu trúc các file liên quan
resources/
 └── views/
     ├── layouts/
     │   └── app.blade.php
     ├── chat.blade.php
     └── components/
         ├── header.blade.php
         └── footer.blade.php

app/
 └── Http/
     └── Controllers/
         └── ChatController.php

public/
 ├── css/
 │   ├── style.css
 │   └── chat.css
 └── js/
     ├── main.js
     └── chat.js

1️⃣ Layout chính (app.blade.php)
✔ Những gì đã được thực hiện

Bổ sung SlickNav CSS & JS (tránh lỗi menu mobile)

Sắp xếp lại thứ tự script để tránh lỗi main.js

Tách @yield('styles') và @yield('scripts') rõ ràng

📌 Thư viện được load

Bootstrap 4

Font Awesome

Owl Carousel

SlickNav

CSS & JS custom

👉 File:

resources/views/layouts/app.blade.php

2️⃣ Giao diện Chat (chat.blade.php)
✔ Những tính năng chính

Hiển thị trạng thái kết nối Groq AI

Quick Questions (click để hỏi nhanh)

Khung chat scroll mượt

Form gửi tin nhắn AI

Truyền route động bằng data-chat-route

<form id="promptForm" data-chat-route="{{ route('chat.send') }}">


➡️ Giúp chat.js không hard-code URL, tương thích tốt với Laravel Route.

👉 File:

resources/views/chat.blade.php

3️⃣ Chat Controller (ChatController.php)
✔ Chức năng chính

Validate input người dùng

Gửi request tới Groq AI API

Xử lý lỗi API an toàn

Trả về phản hồi thân thiện nếu API lỗi

Format Markdown (bold, xuống dòng)

🔹 Model AI
llama-3.1-8b-instant

🔹 System Prompt
You are a professional AI assistant for Plastic Store.
Reply in ENGLISH.
Use bold text for key terms.
Refer to members: Khai (Leader), Duy, Vu, Tuan.


👉 File:

app/Http/Controllers/ChatController.php

4️⃣ Cấu hình bắt buộc (.env)

Thêm API Key của Groq vào file .env:

GROQ_API_KEY=your_api_key_here


⚠️ Lưu ý

Không để khoảng trắng thừa ở cuối dòng

Không commit .env lên GitHub

5️⃣ Lệnh bắt buộc sau khi pull code

Sau khi clone hoặc pull project, bắt buộc chạy các lệnh sau:

🔹 Xóa cache cấu hình
php artisan config:clear

🔹 Xóa cache view
php artisan view:clear


➡️ Đảm bảo Laravel nhận đúng GROQ_API_KEY và các thay đổi mới.

🚀 Cách sử dụng

Truy cập trang Chat:

/chat


Nhập câu hỏi hoặc chọn Quick Questions

AI sẽ phản hồi về:

Vật liệu nhựa (PET, PP, PC…)

Ứng dụng chai nhựa

Sản phẩm Plastic Store

🛡 Xử lý lỗi API

Nếu Groq API gặp sự cố, chatbot sẽ phản hồi:

🤖 Plastic Store AI:
Hiện tại tôi đang gặp sự cố kết nối.
Vui lòng thử lại sau hoặc kiểm tra GROQ_API_KEY.

➡️ Tránh tình trạng chatbot im lặng hoặc lỗi trắng trang.

👨‍💻 Thành viên được tham chiếu trong AI

Khai – Leader

Duy

Vu

Tuan

📌 Ghi chú

Dự án phù hợp cho:

Đồ án Laravel

Website bán hàng tích hợp AI

Demo AI Chatbot thực tế

Có thể mở rộng:

Streaming response

Lưu lịch sử chat

Multi-language
