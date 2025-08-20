<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Gateway - QRIS & Dana</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8fafc;
            color: #1e293b;
        }
        
        .payment-card {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }
        
        .payment-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }
        
        .tab-button {
            transition: all 0.2s ease;
        }
        
        .tab-button.active {
            border-bottom: 3px solid #4f46e5;
            color: #4f46e5;
            font-weight: 600;
        }
        
        .amount-option {
            transition: all 0.2s ease;
        }
        
        .amount-option.selected {
            border-color: #4f46e5;
            background-color: #eef2ff;
            color: #4f46e5;
        }
        
        .payment-method {
            transition: all 0.2s ease;
            border: 2px solid transparent;
        }
        
        .payment-method:hover {
            border-color: #c7d2fe;
        }
        
        .payment-method.selected {
            border-color: #4f46e5;
            background-color: #eef2ff;
        }
        
        .progress-bar {
            transition: width 0.6s ease;
        }
    </style>
</head>
<body class="min-h-screen">
    <div class="container mx-auto px-4 py-8">
        <!-- Header -->
        <header class="text-center mb-8">
            <h1 class="text-3xl font-bold text-slate-800 mb-2">Payment Gateway</h1>
            <p class="text-slate-600">Pembayaran cepat dengan QRIS atau Dana</p>
        </header>
        
        <!-- Main Content -->
        <div class="max-w-2xl mx-auto bg-white rounded-xl shadow-md overflow-hidden">
            <!-- Tabs Navigation -->
            <div class="flex border-b">
                <button class="tab-button flex-1 py-4 px-6 text-center active" data-tab="payment">
                    <i class="fas fa-qrcode mr-2"></i> Pembayaran
                </button>
                <button class="tab-button flex-1 py-4 px-6 text-center" data-tab="donation">
                    <i class="fas fa-hand-holding-heart mr-2"></i> Donasi
                </button>
            </div>
            
            <!-- Tab Contents -->
            <div class="p-6">
                <!-- Payment Tab -->
                <div id="payment-tab" class="tab-content">
                    <h2 class="text-xl font-semibold mb-4 text-slate-800">Pilih Metode Pembayaran</h2>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                        <div class="payment-method selected p-4 rounded-lg cursor-pointer" data-method="qris">
                            <div class="flex items-center">
                                <div class="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center mr-3">
                                    <i class="fas fa-qrcode text-white"></i>
                                </div>
                                <span class="font-medium">QRIS</span>
                            </div>
                        </div>
                        <div class="payment-method p-4 rounded-lg cursor-pointer" data-method="dana">
                            <div class="flex items-center">
                                <div class="w-10 h-10 bg-blue-400 rounded-full flex items-center justify-center mr-3">
                                    <i class="fas fa-wallet text-white"></i>
                                </div>
                                <span class="font-medium">Dana</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- QRIS Payment Content -->
                    <div id="qris-content" class="payment-method-content">
                        <div class="bg-white p-4 rounded-lg border border-slate-200 mb-4 text-center">
                            <img src="https://placehold.co/250x250" alt="Kode QRIS untuk pembayaran dengan logo resmi QRIS di bagian tengah" class="mx-auto mb-4" />
                            <p class="text-slate-600 mb-2">Scan QR code di atas untuk membayar</p>
                            <p class="text-sm text-slate-500">Menerima pembayaran dari semua bank pendukung QRIS</p>
                        </div>
                        
                        <div class="bg-slate-50 p-4 rounded-lg">
                            <h3 class="font-medium text-slate-700 mb-2">Cara Pembayaran:</h3>
                            <ol class="list-decimal list-inside text-slate-600 space-y-1">
                                <li>Buka aplikasi mobile banking/e-wallet yang mendukung QRIS</li>
                                <li>Pilih menu pembayaran QR</li>
                                <li>Arahkan kamera ke kode QR di atas</li>
                                <li>Masukkan nominal pembayaran</li>
                                <li>Konfirmasi transaksi</li>
                            </ol>
                        </div>
                    </div>
                    
                    <!-- Dana Payment Content -->
                    <div id="dana-content" class="payment-method-content hidden">
                        <div class="bg-white p-4 rounded-lg border border-slate-200 mb-4 text-center">
                            <div class="w-24 h-24 mx-auto mb-4 bg-blue-50 rounded-lg flex items-center justify-center">
                                <i class="fas fa-wallet text-4xl text-blue-400"></i>
                            </div>
                            <p class="text-slate-600 mb-2">Bayar menggunakan aplikasi Dana</p>
                            <p class="text-sm text-slate-500">Transfer instan ke rekening Dana kami</p>
                        </div>
                        
                        <div class="mb-4">
                            <label class="block text-slate-700 font-medium mb-2">Nomor Telepon/ID Dana</label>
                            <div class="flex">
                                <input type="text" class="flex-1 px-4 py-2 border border-slate-300 rounded-l-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="081234567890" value="085712345678">
                                <button class="px-4 bg-blue-500 text-white rounded-r-lg hover:bg-blue-600 transition">
                                    Salin
                                </button>
                            </div>
                        </div>
                        
                        <div class="bg-blue-50 p-3 rounded-lg">
                            <p class="text-blue-800 text-sm">
                                <i class="fas fa-info-circle mr-1"></i> Buka aplikasi Dana, pilih transfer ke teman, dan masukkan ID di atas
                            </p>
                        </div>
                    </div>
                    
                    <div class="mt-6">
                        <label class="block text-slate-700 font-medium mb-2">Jumlah Pembayaran</label>
                        <input type="number" class="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="Masukkan nominal">
                    </div>
                    
                    <button id="pay-button" class="w-full mt-6 bg-blue-600 hover:bg-blue-700 text-white py-3 px-4 rounded-lg font-medium transition duration-300">
                        Proses Pembayaran
                    </button>
                </div>
                
                <!-- Donation Tab -->
                <div id="donation-tab" class="tab-content hidden">
                    <h2 class="text-xl font-semibold mb-4 text-slate-800">Berikan Donasi</h2>
                    <p class="text-slate-600 mb-6">Dukung kami dengan berkontribusi melalui donasi. Setiap rupiah sangat berarti untuk pengembangan layanan ini.</p>
                    
                    <div class="mb-6">
                        <h3 class="font-medium text-slate-700 mb-3">Pilih Nominal Donasi</h3>
                        <div class="grid grid-cols-2 md:grid-cols-4 gap-3">
                            <div class="amount-option p-3 border border-slate-200 rounded-lg text-center cursor-pointer" data-amount="10000">
                                <p class="font-medium">Rp10.000</p>
                            </div>
                            <div class="amount-option selected p-3 border border-slate-200 rounded-lg text-center cursor-pointer" data-amount="50000">
                                <p class="font-medium">Rp50.000</p>
                            </div>
                            <div class="amount-option p-3 border border-slate-200 rounded-lg text-center cursor-pointer" data-amount="100000">
                                <p class="font-medium">Rp100.000</p>
                            </div>
                            <div class="amount-option p-3 border border-slate-200 rounded-lg text-center cursor-pointer" data-amount="200000">
                                <p class="font-medium">Rp200.000</p>
                            </div>
                        </div>
                        
                        <div class="mt-4">
                            <label class="block text-slate-700 font-medium mb-2">Atau masukkan nominal lain</label>
                            <input type="number" id="custom-donation" class="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="Rp">
                        </div>
                    </div>
                    
                    <div class="mb-6">
                        <h3 class="font-medium text-slate-700 mb-3">Pilih Metode Pembayaran</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                            <div class="payment-method selected p-3 rounded-lg cursor-pointer" data-method="qris">
                                <div class="flex items-center">
                                    <div class="w-8 h-8 bg-blue-500 rounded-full flex items-center justify-center mr-2">
                                        <i class="fas fa-qrcode text-white text-xs"></i>
                                    </div>
                                    <span>QRIS</span>
                                </div>
                            </div>
                            <div class="payment-method p-3 rounded-lg cursor-pointer" data-method="dana">
                                <div class="flex items-center">
                                    <div class="w-8 h-8 bg-blue-400 rounded-full flex items-center justify-center mr-2">
                                        <i class="fas fa-wallet text-white text-xs"></i>
                                    </div>
                                    <span>Dana</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-6 p-4 bg-slate-50 rounded-lg">
                        <div class="flex justify-between mb-2">
                            <span class="text-sm font-medium text-slate-700">Target Donasi Bulan Ini</span>
                            <span class="text-sm font-medium text-slate-700">Rp5.000.000</span>
                        </div>
                        <div class="w-full bg-slate-200 rounded-full h-2.5">
                            <div class="progress-bar bg-blue-600 h-2.5 rounded-full" style="width: 45%"></div>
                        </div>
                        <div class="flex justify-between mt-1">
                            <span class="text-xs text-slate-500">Terkumpul: Rp2.250.000</span>
                            <span class="text-xs text-blue-600 font-medium">45%</span>
                        </div>
                    </div>
                    
                    <button id="donate-button" class="w-full mt-2 bg-indigo-600 hover:bg-indigo-700 text-white py-3 px-4 rounded-lg font-medium transition duration-300">
                        <i class="fas fa-heart mr-2"></i> Berikan Donasi
                    </button>
                    
                    <p class="text-xs text-slate-500 mt-3 text-center">Donasi tidak dapat dikembalikan</p>
                </div>
            </div>
        </div>
        
        <!-- Info Section -->
        <div class="mt-8 bg-white rounded-xl shadow-sm p-6">
            <h2 class="text-xl font-semibold text-slate-800 mb-4">Informasi Penting</h2>
            <div class="grid md:grid-cols-2 gap-6">
                <div class="flex items-start">
                    <div class="mr-4 text-blue-500">
                        <i class="fas fa-shield-alt text-xl"></i>
                    </div>
                    <div>
                        <h3 class="font-medium text-slate-800 mb-1">Pembayaran Aman</h3>
                        <p class="text-sm text-slate-600">Transaksi dilindungi dengan enkripsi standar industri</p>
                    </div>
                </div>
                <div class="flex items-start">
                    <div class="mr-4 text-blue-500">
                        <i class="fas fa-receipt text-xl"></i>
                    </div>
                    <div>
                        <h3 class="font-medium text-slate-800 mb-1">Rincian Transaksi</h3>
                        <p class="text-sm text-slate-600">Anda akan menerima bukti pembayaran melalui email</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Tab Switching
            const tabButtons = document.querySelectorAll('.tab-button');
            const tabContents = document.querySelectorAll('.tab-content');
            
            tabButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const tabId = button.getAttribute('data-tab');
                    
                    // Update active tab button
                    tabButtons.forEach(btn => btn.classList.remove('active'));
                    button.classList.add('active');
                    
                    // Show corresponding content
                    tabContents.forEach(content => content.classList.add('hidden'));
                    document.getElementById(`${tabId}-tab`).classList.remove('hidden');
                });
            });
            
            // Payment Method Selection
            const paymentMethods = document.querySelectorAll('.payment-method');
            
            paymentMethods.forEach(method => {
                method.addEventListener('click', () => {
                    const methodType = method.getAttribute('data-method');
                    const container = method.closest('.tab-content');
                    
                    // Update selected method
                    container.querySelectorAll('.payment-method').forEach(m => m.classList.remove('selected'));
                    method.classList.add('selected');
                    
                    // Show corresponding content if in payment tab
                    if (container.id === 'payment-tab') {
                        document.querySelectorAll('.payment-method-content').forEach(content => {
                            content.classList.add('hidden');
                        });
                        document.getElementById(`${methodType}-content`).classList.remove('hidden');
                    }
                });
            });
            
            // Amount Selection
            const amountOptions = document.querySelectorAll('.amount-option');
            const customDonationInput = document.getElementById('custom-donation');
            
            amountOptions.forEach(option => {
                option.addEventListener('click', () => {
                    // Remove selected from all options
                    amountOptions.forEach(opt => opt.classList.remove('selected'));
                    // Add selected to clicked option
                    option.classList.add('selected');
                    // Clear custom input
                    if (customDonationInput) customDonationInput.value = '';
                });
            });
            
            // Custom amount input clears selection
            if (customDonationInput) {
                customDonationInput.addEventListener('input', () => {
                    amountOptions.forEach(opt => opt.classList.remove('selected'));
                });
            }
            
            // Pay Button Action
            const payButton = document.getElementById('pay-button');
            if (payButton) {
                payButton.addEventListener('click', () => {
                    const activeTab = document.querySelector('.tab-button.active').getAttribute('data-tab');
                    const activeMethod = document.querySelector(`#${activeTab}-tab .payment-method.selected`).getAttribute('data-method');
                    const amountInput = activeTab === 'payment' 
                        ? document.querySelector('#payment-tab input[type="number"]')
                        : document.querySelector('#donation-tab #custom-donation') || 
                          document.querySelector('#donation-tab .amount-option.selected');
                    
                    let amount = 0;
                    
                    if (amountInput.tagName === 'INPUT') {
                        amount = parseInt(amountInput.value) || 0;
                    } else {
                        amount = parseInt(amountInput.getAttribute('data-amount')) || 0;
                    }
                    
                    if (amount <= 0) {
                        alert('Silakan masukkan nominal yang valid');
                        return;
                    }
                    
                    payButton.innerHTML = '<i class="fas fa
