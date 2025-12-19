# 🏪 Plastic Store - Laravel E-Commerce & AI Chatbot

> A modern e-commerce platform for plastic products with integrated AI chatbot powered by Groq AI.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Features Setup](#features-setup)
- [Usage](#usage)
- [Team Members](#team-members)
- [License](#license)

---

## ✨ Features

### Core E-Commerce
- 📦 Product management with categories
- 🛒 Shopping cart functionality
- 📄 Document download for products
- 🔐 User authentication & authorization

### AI Chatbot
- 🤖 Real-time AI assistant powered by Groq (llama-3.1-8b-instant)
- 💬 Intelligent responses about plastic materials and products
- 🎯 Quick question suggestions
- 🛡️ Error handling with user-friendly messages

### Security & Validation
- 🔐 CAPTCHA verification for registration
- ✅ Form validation
- 🔒 Laravel security best practices

---

## 🛠 Tech Stack

| Technology | Purpose |
|-----------|---------|
| **Laravel** | Backend framework |
| **PHP** | Server-side language |
| **Bootstrap 4** | UI Framework |
| **jQuery** | DOM manipulation |
| **Groq AI API** | AI responses |
| **Blade Template** | View engine |

### Frontend Libraries
- Owl Carousel (Slider)
- SlickNav (Mobile menu)
- Font Awesome (Icons)

---

## 📦 Installation

### Prerequisites
- PHP >= 7.4
- Composer
- MySQL or similar database
- Node.js (optional, for frontend build)

### Step-by-Step Setup

#### 1. Clone the Repository
```bash
git clone <repository-url>
cd plastic-store
```

#### 2. Copy Environment File
```bash
cp .env.example .env
```

#### 3. Install Dependencies
```bash
composer install
```

#### 4. Generate Application Key
```bash
php artisan key:generate
```

#### 5. Configure Database
Edit your `.env` file with database credentials:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=plastic_store
DB_USERNAME=root
DB_PASSWORD=
```

#### 6. Create Database
```bash
# Create database (via MySQL client)
CREATE DATABASE plastic_store;
```

#### 7. Run Migrations
```bash
php artisan migrate
```

#### 8. Clear Configuration Cache
```bash
php artisan config:cache
php artisan view:clear
php artisan config:clear
```

#### 9. Start Development Server
```bash
php artisan serve
```

#### 10. Access the Application
```
http://localhost:8000/admin/category/index
```

---

## ⚙️ Configuration

### Groq AI API Setup

1. **Get API Key**
   - Visit [Groq Console](https://console.groq.com)
   - Create an API key

2. **Add to `.env`**
   ```env
   GROQ_API_KEY=your_api_key_here
   ```

3. **Clear Cache**
   ```bash
   php artisan config:clear
   php artisan view:clear
   ```

---

## 🚀 Features Setup

### 1. Download Documents Feature

**Branch:** `feature/download-documents`

#### 1.1 Create Storage Directory
```bash
mkdir -p storage/app/product_documents
```

#### 1.2 Add Route
```php
// routes/web.php
Route::get('/product/{id}/download', [ProductController::class, 'downloadFile'])
    ->name('product.download');
```

#### 1.3 Add Controller Method
```php
// app/Http/Controllers/ProductController.php
use Illuminate\Support\Facades\File;

public function downloadFile($id)
{
    // Find product and check document URL
    $product = Product::select('ProductID', 'ProductName', 'DocumentURL')
        ->where('ProductID', $id)
        ->firstOrFail();

    $documentUrl = $product->DocumentURL;

    if (!$documentUrl) {
        abort(404, 'Sản phẩm này không có tài liệu để tải xuống.');
    }

    // Build file path
    $filePath = storage_path('app/' . $documentUrl);
    $fileName = $product->ProductName . '_TaiLieuKyThuat.pdf';

    // Check if file exists
    if (!File::exists($filePath)) {
        abort(404, 'File tài liệu không tìm thấy trên server.');
    }

    return response()->download($filePath, $fileName);
}
```

#### 1.4 Display Download Link in View
```blade
@if($product->DocumentURL)
<div class="product__details__action mt-3">
    <button id="addToCartButton" class="primary-btn" style="border: none;">
        THÊM VÀO GIỎ
    </button>
    <a href="{{ route('product.download', $product->ProductID) }}" class="primary-btn">
        <i class="fa fa-download"></i> Tải Tài liệu
    </a>
</div>
@endif
```

---

### 2. CAPTCHA Feature

**Branch:** `feature/captcha`

#### 2.1 Install Package
```bash
composer require mews/captcha
```

#### 2.2 Fix GD Extension (if needed)
```bash
# Check location of php.ini
php --ini

# Open php.ini and uncomment:
# ;extension=gd
# Remove the semicolon to: extension=gd

# Verify GD is enabled
php -m | findstr /i "gd"
```

#### 2.3 Publish Config
```bash
php artisan vendor:publish --provider="Mews\Captcha\CaptchaServiceProvider"
```

#### 2.4 Add CAPTCHA to Registration Form
```blade
<div class="form-group">
    <label>Captcha</label>
    <div>{!! captcha_img() !!}</div>
    <input type="text" class="form-control" name="captcha" 
           placeholder="Nhập mã Captcha" required>
</div>
```

#### 2.5 Add Validation in AuthController
```php
$request->validate([
    'name' => 'required|string|max:255',
    'email' => 'required|email|unique:users',
    'password' => 'required|confirmed|min:8',
    'captcha' => 'required|captcha'
]);
```

#### 2.6 Fix .htaccess for Routing (if needed)
```apache
# public/.htaccess
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /plastic-store/public/

    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]
</IfModule>
```

#### 2.7 Enable Apache Rewrite Module
```bash
# Windows (XAMPP): Open httpd.conf
# Uncomment: LoadModule rewrite_module modules/mod_rewrite.so
# Restart Apache
```

#### 2.8 Clear Cache
```bash
php artisan config:cache
php artisan cache:clear --store=file
php artisan view:clear
```

#### 2.9 Test Registration
```
http://localhost:8000/register
```

---

### 3. AI Chatbot Feature

**Technology:** Groq AI (llama-3.1-8b-instant)

#### 3.1 Project Structure
```
resources/views/
├── layouts/
│   └── app.blade.php
├── chat.blade.php
└── components/
    ├── header.blade.php
    └── footer.blade.php

app/Http/Controllers/
└── ChatController.php

public/
├── css/
│   ├── style.css
│   └── chat.css
└── js/
    ├── main.js
    └── chat.js
```

#### 3.2 Main Layout (app.blade.php)
```blade
<!-- resources/views/layouts/app.blade.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Plastic Store')</title>
    
    <!-- Bootstrap & Frameworks -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    @yield('styles')
</head>
<body>
    @include('components.header')
    
    <main>
        @yield('content')
    </main>
    
    @include('components.footer')
    
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.min.js"></script>
    <script src="{{ asset('js/main.js') }}"></script>
    @yield('scripts')
</body>
</html>
```

#### 3.3 Chat View (chat.blade.php)
```blade
@extends('layouts.app')

@section('title', 'AI Chatbot - Plastic Store')

@section('styles')
<link rel="stylesheet" href="{{ asset('css/chat.css') }}">
@endsection

@section('content')
<div class="container mt-5">
    <div class="chat-container">
        <div class="chat-header">
            <h3>🤖 Plastic Store AI Assistant</h3>
            <span id="connectionStatus" class="badge badge-success">Connected</span>
        </div>

        <div id="chatBox" class="chat-box">
            <div class="chat-message ai-message">
                <p>👋 Xin chào! Tôi là trợ lý AI của Plastic Store. Hỏi tôi bất kỳ điều gì về vật liệu nhựa, sản phẩm của chúng tôi!</p>
            </div>
        </div>

        <div class="quick-questions">
            <button class="quick-btn" onclick="sendQuickQuestion('Loại nhựa PET có tính chất gì?')">
                PET Materials
            </button>
            <button class="quick-btn" onclick="sendQuickQuestion('Ứng dụng chai nhựa là gì?')">
                Bottle Applications
            </button>
            <button class="quick-btn" onclick="sendQuickQuestion('Tôi có thể giúp bạn như thế nào?')">
                How can I help?
            </button>
        </div>

        <form id="promptForm" data-chat-route="{{ route('chat.send') }}">
            @csrf
            <div class="input-group">
                <input type="text" id="userMessage" name="message" class="form-control" 
                       placeholder="Nhập câu hỏi của bạn...">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit">
                        <i class="fa fa-paper-plane"></i> Send
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection

@section('scripts')
<script src="{{ asset('js/chat.js') }}"></script>
@endsection
```

#### 3.4 Chat Controller
```php
// app/Http/Controllers/ChatController.php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ChatController extends Controller
{
    public function index()
    {
        return view('chat');
    }

    public function send(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:500'
        ]);

        $userMessage = $request->input('message');

        try {
            $apiKey = config('services.groq.api_key');

            if (!$apiKey) {
                return response()->json([
                    'reply' => '🤖 Plastic Store AI: Lỗi cấu hình API. Vui lòng kiểm tra GROQ_API_KEY.'
                ]);
            }

            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $apiKey,
                'Content-Type' => 'application/json'
            ])->post('https://api.groq.com/openai/v1/chat/completions', [
                'model' => 'llama-3.1-8b-instant',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => 'You are a professional AI assistant for Plastic Store. Reply in ENGLISH. Use bold text for key terms. Refer to members: Khai (Leader), Duy, Vu, Tuan.'
                    ],
                    [
                        'role' => 'user',
                        'content' => $userMessage
                    ]
                ],
                'max_tokens' => 500,
                'temperature' => 0.7
            ]);

            if ($response->successful()) {
                $reply = $response->json()['choices'][0]['message']['content'];
                return response()->json(['reply' => $reply]);
            }

            return response()->json([
                'reply' => '🤖 Plastic Store AI: Hiện tại tôi đang gặp sự cố kết nối. Vui lòng thử lại sau.'
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'reply' => '🤖 Plastic Store AI: Xin lỗi, có lỗi xảy ra. Vui lòng thử lại hoặc kiểm tra GROQ_API_KEY.'
            ]);
        }
    }
}
```

#### 3.5 Chat Routes
```php
// routes/web.php
Route::get('/chat', [ChatController::class, 'index'])->name('chat.index');
Route::post('/chat/send', [ChatController::class, 'send'])->name('chat.send');
```

#### 3.6 Chat JavaScript
```javascript
// public/js/chat.js
$(document).ready(function () {
    const chatRoute = $('#promptForm').data('chat-route');

    $('#promptForm').on('submit', function (e) {
        e.preventDefault();

        const message = $('#userMessage').val().trim();
        if (!message) return;

        // Display user message
        $('#chatBox').append(`
            <div class="chat-message user-message">
                <p>${escapeHtml(message)}</p>
            </div>
        `);

        $('#userMessage').val('');
        $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);

        // Send to server
        $.ajax({
            url: chatRoute,
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: { message: message },
            success: function (response) {
                $('#chatBox').append(`
                    <div class="chat-message ai-message">
                        <p>${escapeHtml(response.reply)}</p>
                    </div>
                `);
                $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
            },
            error: function () {
                $('#chatBox').append(`
                    <div class="chat-message ai-message">
                        <p>🤖 Plastic Store AI: Có lỗi xảy ra. Vui lòng thử lại.</p>
                    </div>
                `);
            }
        });
    });

    function escapeHtml(text) {
        const map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#039;'
        };
        return text.replace(/[&<>"']/g, m => map[m]);
    }
});

function sendQuickQuestion(question) {
    $('#userMessage').val(question);
    $('#promptForm').submit();
}
```

#### 3.7 Chat CSS
```css
/* public/css/chat.css */
.chat-container {
    max-width: 800px;
    margin: 0 auto;
    border: 1px solid #ddd;
    border-radius: 8px;
    background: #f9f9f9;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.chat-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 8px 8px 0 0;
}

.chat-box {
    height: 400px;
    overflow-y: auto;
    padding: 20px;
    background: white;
    border-radius: 0 0 0 0;
}

.chat-message {
    margin-bottom: 15px;
    display: flex;
}

.chat-message p {
    max-width: 70%;
    padding: 10px 15px;
    border-radius: 8px;
    word-wrap: break-word;
}

.user-message {
    justify-content: flex-end;
}

.user-message p {
    background: #667eea;
    color: white;
}

.ai-message p {
    background: #e9ecef;
    color: #333;
}

.quick-questions {
    padding: 15px 20px;
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    background: #f0f0f0;
    border-bottom: 1px solid #ddd;
}

.quick-btn {
    flex: 1;
    min-width: 150px;
    padding: 8px 12px;
    background: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    cursor: pointer;
    font-size: 13px;
    transition: all 0.3s ease;
}

.quick-btn:hover {
    background: #667eea;
    color: white;
    border-color: #667eea;
}

#promptForm {
    padding: 15px 20px;
    background: white;
    border-top: 1px solid #ddd;
}

#promptForm .input-group {
    display: flex;
    gap: 10px;
}

#promptForm input {
    flex: 1;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
}

#promptForm button {
    padding: 10px 20px;
    background: #667eea;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

#promptForm button:hover {
    background: #764ba2;
}

.badge-success {
    background: #28a745 !important;
}
```

---

## 💡 Usage

### Accessing Features

1. **Main Store**
   ```
   http://localhost:8000
   ```

2. **Admin Dashboard**
   ```
   http://localhost:8000/admin/category/index
   ```

3. **AI Chatbot**
   ```
   http://localhost:8000/chat
   ```

4. **User Registration**
   ```
   http://localhost:8000/register
   ```

### Chatbot Capabilities

The AI assistant can help with:
- 🔹 Plastic material properties (PET, PP, PC, etc.)
- 🔹 Product information and applications
- 🔹 Bottle and container usage
- 🔹 General inquiry support

---

## 👥 Team Members

| Member | Role |
|--------|------|
| **Khai** | 👨‍💼 Leader |
| **Duy** | 💻 Developer |
| **Vu** | 💻 Developer |
| **Tuan** | 💻 Developer |

---

## ⚠️ Important Notes

### Before First Run
```bash
php artisan config:clear
php artisan view:clear
```

### Environment Variables
- ✅ Never commit `.env` to GitHub
- ✅ Use `.env.example` as template
- ✅ Ensure `GROQ_API_KEY` is set

### Common Issues

| Issue | Solution |
|-------|----------|
| CAPTCHA not showing | Enable GD extension in php.ini |
| API errors | Check `GROQ_API_KEY` in .env |
| Routing 404 errors | Check `.htaccess` and Apache rewrite module |
| Cache issues | Run `php artisan config:clear` |

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📞 Support

For issues or questions, please contact the development team or open an issue on GitHub.

**Happy coding! 🚀**
