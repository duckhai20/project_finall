# 🏪 Plastic Store - Laravel E-Commerce & AI Chatbot

> Modern e-commerce platform for plastic products with integrated AI chatbot powered by Groq AI.

## 📋 Quick Links
- [Installation](#-installation)
- [Configuration](#️-configuration)
- [Features](#-features)
- [Troubleshooting](#-troubleshooting)

---

## 🚀 Installation

### Prerequisites
- PHP >= 7.4 | Composer | MySQL | Node.js (optional)

### Setup Steps

```bash
# 1. Clone & navigate
git clone <repository-url>
cd plastic-store

# 2. Environment setup
cp .env.example .env

# 3. Install dependencies
composer install

# 4. Generate app key
php artisan key:generate

# 5. Configure database in .env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_DATABASE=plastic_store
DB_USERNAME=root
DB_PASSWORD=

# 6. Create database & migrate
# CREATE DATABASE plastic_store; (in MySQL)
php artisan migrate

# 7. Clear cache & start
php artisan config:clear
php artisan view:clear
php artisan serve

# 8. Access application
http://localhost:8000/admin/category/index
```

---

## ⚙️ Configuration

### Groq AI API (Required for Chatbot)

1. Get API key from [Groq Console](https://console.groq.com)
2. Add to `.env`:
```env
GROQ_API_KEY=your_api_key_here
```
3. Clear cache:
```bash
php artisan config:clear
php artisan view:clear
```

⚠️ **Never commit `.env` to GitHub**

---

## ✨ Features

### 1️⃣ Download Documents
**Branch:** `feature/download-documents`

#### Setup:
```bash
# Create storage folder
mkdir -p storage/app/product_documents
```

#### Route (routes/web.php):
```php
Route::get('/product/{id}/download', [ProductController::class, 'downloadFile'])
    ->name('product.download');
```

#### Controller Method (ProductController.php):
```php
use Illuminate\Support\Facades\File;

public function downloadFile($id)
{
    $product = Product::select('ProductID', 'ProductName', 'DocumentURL')
        ->where('ProductID', $id)
        ->firstOrFail();

    if (!$product->DocumentURL) {
        abort(404, 'No document available');
    }

    $filePath = storage_path('app/' . $product->DocumentURL);
    $fileName = $product->ProductName . '_TaiLieuKyThuat.pdf';

    if (!File::exists($filePath)) {
        abort(404, 'File not found');
    }

    return response()->download($filePath, $fileName);
}
```

#### View (blade template):
```blade
@if($product->DocumentURL)
<a href="{{ route('product.download', $product->ProductID) }}" class="primary-btn">
    <i class="fa fa-download"></i> Download Document
</a>
@endif
```

---

### 2️⃣ CAPTCHA Verification
**Branch:** `feature/captcha`

#### Install:
```bash
composer require mews/captcha
```

#### Fix GD Extension (if error):
```bash
# Find php.ini location
php --ini

# Open php.ini and uncomment: extension=gd

# Verify GD enabled
php -m | findstr /i "gd"
```

#### Form (register.blade.php):
```blade
<div class="form-group">
    <label>Captcha</label>
    <div>{!! captcha_img() !!}</div>
    <input type="text" class="form-control" name="captcha" placeholder="Enter captcha" required>
</div>
```

#### Validation (AuthController):
```php
$request->validate([
    'name' => 'required',
    'email' => 'required|email|unique:users',
    'password' => 'required|confirmed',
    'captcha' => 'required|captcha'
]);
```

#### Fix 404 Routing:
```bash
# 1. Edit public/.htaccess
RewriteEngine On
RewriteBase /your-project-name/public/

# 2. Enable Apache rewrite_module in httpd.conf
LoadModule rewrite_module modules/mod_rewrite.so

# 3. Clear Laravel cache
php artisan config:cache
php artisan cache:clear --store=file
php artisan view:clear
```

**Test:** http://localhost:8000/register

---

### 3️⃣ AI Chatbot
**Technology:** Groq AI (llama-3.1-8b-instant)

#### Structure:
```
resources/views/
├── layouts/app.blade.php
├── chat.blade.php
└── components/
    ├── header.blade.php
    └── footer.blade.php

app/Http/Controllers/ChatController.php

public/
├── css/chat.css
└── js/chat.js
```

#### Layout (resources/views/layouts/app.blade.php):
```blade
<!DOCTYPE html>
<html lang="en">
<head>
    <title>@yield('title', 'Plastic Store')</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    @yield('styles')
</head>
<body>
    @include('components.header')
    <main>@yield('content')</main>
    @include('components.footer')
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.min.js"></script>
    <script src="{{ asset('js/main.js') }}"></script>
    @yield('scripts')
</body>
</html>
```

#### Chat View (resources/views/chat.blade.php):
```blade
@extends('layouts.app')

@section('title', 'AI Chatbot')

@section('styles')
<link rel="stylesheet" href="{{ asset('css/chat.css') }}">
@endsection

@section('content')
<div class="container mt-5">
    <div class="chat-container">
        <div class="chat-header">
            <h3>🤖 AI Assistant</h3>
            <span class="badge badge-success">Connected</span>
        </div>

        <div id="chatBox" class="chat-box">
            <div class="chat-message ai-message">
                <p>👋 Hi! Ask me about plastic materials, products, or anything else!</p>
            </div>
        </div>

        <div class="quick-questions">
            <button class="quick-btn" onclick="sendQuickQuestion('What is PET plastic?')">PET Materials</button>
            <button class="quick-btn" onclick="sendQuickQuestion('What are plastic bottle applications?')">Bottle Uses</button>
            <button class="quick-btn" onclick="sendQuickQuestion('How can you help me?')">Need Help?</button>
        </div>

        <form id="promptForm" data-chat-route="{{ route('chat.send') }}">
            @csrf
            <div class="input-group">
                <input type="text" id="userMessage" name="message" class="form-control" placeholder="Ask a question...">
                <button class="btn btn-primary" type="submit"><i class="fa fa-paper-plane"></i></button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('scripts')
<script src="{{ asset('js/chat.js') }}"></script>
@endsection
```

#### Controller (app/Http/Controllers/ChatController.php):
```php
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
        $request->validate(['message' => 'required|string|max:500']);
        $userMessage = $request->input('message');

        try {
            $apiKey = config('services.groq.api_key');
            
            if (!$apiKey) {
                return response()->json([
                    'reply' => '🤖 API configuration error. Check GROQ_API_KEY.'
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
                        'content' => 'You are a professional AI assistant for Plastic Store. Reply in ENGLISH. Use bold text for key terms. Team: Khai (Leader), Duy, Vu, Tuan.'
                    ],
                    ['role' => 'user', 'content' => $userMessage]
                ],
                'max_tokens' => 500,
                'temperature' => 0.7
            ]);

            if ($response->successful()) {
                return response()->json([
                    'reply' => $response->json()['choices'][0]['message']['content']
                ]);
            }

            return response()->json([
                'reply' => '🤖 Connection error. Please try again.'
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'reply' => '🤖 Error occurred. Please try again or check GROQ_API_KEY.'
            ]);
        }
    }
}
```

#### Routes (routes/web.php):
```php
Route::get('/chat', [ChatController::class, 'index'])->name('chat.index');
Route::post('/chat/send', [ChatController::class, 'send'])->name('chat.send');
```

#### JavaScript (public/js/chat.js):
```javascript
$(document).ready(function () {
    const chatRoute = $('#promptForm').data('chat-route');

    $('#promptForm').on('submit', function (e) {
        e.preventDefault();
        const message = $('#userMessage').val().trim();
        if (!message) return;

        // Show user message
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
                        <p>🤖 Error. Please try again.</p>
                    </div>
                `);
            }
        });
    });

    function escapeHtml(text) {
        const map = {'&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#039;'};
        return text.replace(/[&<>"']/g, m => map[m]);
    }
});

function sendQuickQuestion(question) {
    $('#userMessage').val(question);
    $('#promptForm').submit();
}
```

#### Styles (public/css/chat.css):
```css
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
}

.chat-message { margin-bottom: 15px; display: flex; }
.chat-message p { max-width: 70%; padding: 10px 15px; border-radius: 8px; word-wrap: break-word; }
.user-message { justify-content: flex-end; }
.user-message p { background: #667eea; color: white; }
.ai-message p { background: #e9ecef; color: #333; }

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
    transition: 0.3s ease;
}

.quick-btn:hover { background: #667eea; color: white; border-color: #667eea; }

#promptForm { padding: 15px 20px; background: white; border-top: 1px solid #ddd; }
#promptForm .input-group { display: flex; gap: 10px; }
#promptForm input { flex: 1; border: 1px solid #ddd; border-radius: 5px; padding: 10px; }
#promptForm button { padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 5px; cursor: pointer; }
#promptForm button:hover { background: #764ba2; }
```

---

## 🔗 Access Points

| Feature | URL |
|---------|-----|
| Store | http://localhost:8000 |
| Admin | http://localhost:8000/admin/category/index |
| Chatbot | http://localhost:8000/chat |
| Register | http://localhost:8000/register |

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| CAPTCHA not showing | Enable GD extension: uncomment `extension=gd` in php.ini |
| API errors | Verify `GROQ_API_KEY` in .env file |
| 404 routing errors | Check `.htaccess` in public folder & Apache rewrite module enabled |
| Cache issues | Run `php artisan config:clear && php artisan view:clear` |
| Blank chatbot | Check browser console for errors, verify GROQ_API_KEY |

---

## 👥 Team

| Name | Role |
|------|------|
| Khai | 👨‍💼 Leader |
| Duy | 💻 Developer |
| Vu | 💻 Developer |
| Tuan | 💻 Developer |

---

## ⚡ Tech Stack

Laravel • PHP • Bootstrap 4 • jQuery • Groq AI • MySQL

---

## 📝 Notes

✅ Clear cache after pulling new changes  
✅ Never commit `.env` to GitHub  
✅ Keep `GROQ_API_KEY` secure  
✅ Test features on separate branches before merging

**Need help? Check troubleshooting section or open an issue on GitHub!** 🚀
