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

Plastic Store - AI Chat Assistant Integration
📋 Project Overview
E-commerce website for plastic products with integrated AI Chat Assistant using Groq API.

🚀 Key Features
Modern responsive e-commerce layout

AI Chat Assistant using Groq's llama-3.1-8b-instant model

Mobile-friendly navigation with SlickNav

Product carousels with Owl Carousel

Bootstrap 4 for responsive design

🔧 Installation & Setup
1. Clone Repository
bash
git clone <repository-url>
cd plastic-store
2. Install Dependencies
bash
composer install
3. Environment Configuration
Copy .env.example to .env:

bash
cp .env.example .env
Update .env file with your Groq API key:

env
GROQ_API_KEY=your_groq_api_key_here
Get your API key from Groq Cloud Console.

4. Generate Application Key
bash
php artisan key:generate
5. Clear Cache (Required after updates)
bash
php artisan config:clear
php artisan view:clear
6. Start Development Server
bash
php artisan serve
Visit: http://localhost:8000

📁 File Structure Updates
Fixed Files:
1. layouts/app.blade.php (Root layout)
Added missing SlickNav CSS/JS

Reordered script loading to prevent JavaScript conflicts

Fixed navigation menu hanging issues

2. chat.blade.php (AI Chat page)
Added data-chat-route attribute for proper Laravel route handling

Enhanced UI with suggestion cards

Improved error handling display

3. ChatController.php (Backend logic)
Optimized error handling for API failures

Added fallback responses when API is unavailable

Improved response formatting with HTML tags

🛠️ Technical Improvements
JavaScript Fixes
SlickNav Conflict Resolution: Reordered script loading sequence

Chat.js Compatibility: Added proper route data attribute

Optimized Loading: Ensured dependencies load in correct order

CSS Enhancements
Added SlickNav mobile menu styles

Maintained responsive design across devices

Fixed chat interface styling

Backend Optimizations
Error Handling: Graceful API failure responses

Security: CSRF protection and input validation

Performance: Reduced API timeout to 30 seconds

🐛 Bug Fixes Applied
Fixed: JavaScript SlickNav causing page freeze

Fixed: Missing route attributes in Blade templates

Fixed: Silent API failures in ChatController

Fixed: Mobile navigation issues

📱 Dependencies
Frontend Libraries:
jQuery 3.4.1: DOM manipulation

Bootstrap 4.4.1: Responsive framework

Owl Carousel 2.3.4: Product sliders

SlickNav 1.0.10: Mobile navigation

Font Awesome 5.10.0: Icons

Backend Requirements:
PHP 7.4+

Laravel 8+

Guzzle HTTP: For API requests

🔑 API Configuration
Groq API Setup:
Sign up at Groq Cloud

Generate API key from dashboard

Add to .env file:

text
GROQ_API_KEY=sk-your-api-key-here
Current Model Configuration:
Model: llama-3.1-8b-instant

Max Tokens: 500

Temperature: 0.7

System Prompt: Plastic Store product specialist

🧪 Testing the Chat
Navigate to /chat route

Test with suggested questions:

"What is the difference between PET, PP, and PC materials?"

"Which plastic bottle is suitable for drinking water?"

Verify real-time responses

⚠️ Troubleshooting
Common Issues:
Chat not responding:

Check Groq API key in .env

Run cache clear commands

Verify internet connection

Mobile menu not working:

Check console for JavaScript errors

Verify SlickNav script loading order

Slow API responses:

Reduce max_tokens in ChatController

Check Groq API status

Debug Commands:
bash
# Check routes
php artisan route:list

# Clear all caches
php artisan optimize:clear

# Check .env variables
php artisan tinker
>>> env('GROQ_API_KEY')
📄 License
This project is open-source and available for educational purposes.

👥 Team Members
Khai (Team Leader)

Duy

Vu

Tuan
