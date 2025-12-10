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

## Download Tài Liệu

- Step 1: Sửa database, thêm cột DocumentURL

- Step 2: Trong Product.php, thêm dòng này

```php
protected $fillable = [..., 'DocumentURL'];
```

- Step 3: Tạo thư mục lưu file PDF

```
Tạo thư mục: storage/app/product_documents
```

- Step 4: Cập nhật Route

```php
// Route download, nhận ProductID
Route::get('/product/{id}/download', [ProductController::class, 'downloadFile'])->name('product.download');
```

- Step 5: Thêm hàm downloadFile vào ProductController.php

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

- Step 6: Hiển thị Link trong View

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

- Step 7: Thêm import File vào ProductController.php

```php
use Illuminate\Support\Facades\File;
```

---

## Captcha

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
