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

🤖 Plastic Store AI Chatbot Assistant
Dự án này là một chatbot thông minh được tích hợp vào website Plastic Store, giúp hỗ trợ khách hàng tìm hiểu về các loại nhựa (PET, PP, PC), tư vấn sản phẩm và giải đáp thắc mắc về kỹ thuật. Hệ thống sử dụng mô hình AI Llama 3.1 thông qua Groq Cloud API.

🚀 Tính năng chính
Trả lời thời gian thực: AI xử lý và phản hồi nhanh chóng nhờ Groq API.

Hiệu ứng Typing: Hiệu ứng chữ chạy giúp trải nghiệm trò chuyện tự nhiên hơn.

Giao diện thân thiện: Tương thích hoàn hảo với giao diện Bootstrap của Plastic Store.

Bảo mật: Sử dụng CSRF Token để bảo vệ các yêu cầu từ phía người dùng.

🛠 Công nghệ sử dụng
Backend: Laravel Framework 11.x

AI Engine: Groq Cloud API (Model: llama-3.1-8b-instant)

Frontend: JavaScript (ES6+), jQuery, Bootstrap 4

Thư viện bổ trợ: SlickNav (Menu mobile), FontAwesome

📋 Hướng dẫn cài đặt
1. Yêu cầu hệ thống
PHP >= 8.2

Composer

Tài khoản Groq Cloud để lấy API Key.

2. Cấu hình môi trường (.env)
Mở file .env trong thư mục gốc và thêm khóa API của bạn vào:

Code snippet

# Groq AI Configuration
GROQ_API_KEY=gsk_your_actual_api_key_here
3. Cấu hình Route
Đảm bảo file routes/web.php đã có định nghĩa cho Chatbot:

PHP

use App\Http\Controllers\ChatController;

Route::get('/chat', [ChatController::class, 'index'])->name('chat.index');
Route::post('/chat/send', [ChatController::class, 'send'])->name('chat.send');
4. Cập nhật hệ thống
Chạy các lệnh sau để làm sạch bộ nhớ cache và áp dụng cấu hình mới:

Bash

php artisan config:clear
php artisan view:clear
php artisan cache:clear
📂 Cấu trúc thư mục quan trọng
app/Http/Controllers/ChatController.php: Xử lý logic kết nối API Groq.

resources/views/chat.blade.php: Giao diện người dùng chatbot.

resources/views/layouts/app.blade.php: Layout chung tích hợp thư viện.

public/js/chat.js: Xử lý gửi/nhận tin nhắn không tải lại trang (AJAX).

⚠️ Lưu ý sửa lỗi thường gặp
Lỗi Slicknav: Nếu menu mobile không hoạt động, hãy đảm bảo thư viện jquery.slicknav.js được tải trước file main.js trong app.blade.php.

Lỗi CSRF: Luôn đảm bảo có thẻ <meta name="csrf-token"> trong phần <head> của trang web.

API Timeout: Nếu chatbot báo lỗi kết nối, hãy kiểm tra lại tốc độ mạng hoặc giới hạn (Rate limit) của tài khoản Groq.

👥 Đội ngũ phát triển (Aptech C2411L-NK)
Khải (Leader)

Duy

Vũ

Tuấn

Dự án này được phát triển cho mục đích học tập và cung cấp giải pháp hỗ trợ khách hàng thực tế cho ngành nhựa.

Cách Import lên GitHub:
Tạo một repository mới trên GitHub.

Mở terminal tại thư mục dự án của bạn.

Chạy các lệnh sau:

Bash

git init
git add .
git commit -m "Add AI Chatbot feature"
git branch -M main
git remote add origin <link-github-cua-ban>
git push -u origin main
