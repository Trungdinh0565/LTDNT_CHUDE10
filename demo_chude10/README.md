# LTDNT_CHUDE10 - Cơ sở quản lý trạng thái và cập nhật giao diện trong Flutter

Demo Chủ đề 10 - môn Lập trình đa nền tảng.

## 1. Giới thiệu

Ứng dụng cửa hàng nhỏ minh họa **State** và cách giao diện cập nhật khi State thay đổi, chỉ dùng `StatefulWidget` + `setState()`. Log vòng đời của State được in ra console để quan sát trực tiếp.

## 2. Nội dung minh họa

- **Trạng thái cục bộ (ephemeral):** nút thả tim trong `ProductCard`. Bấm tim chỉ build lại đúng thẻ đó.
- **Trạng thái chia sẻ (shared):** số sản phẩm trong giỏ nằm ở `HomePage`. Thẻ gọi callback lên cha, cha `setState()` rồi cập nhật AppBar và thanh tổng.
- **Vòng đời State:** `initState` → `didChangeDependencies` → `build` → `didUpdateWidget` → `deactivate` → `dispose`. Nút **Gỡ / Hiện danh sách** dùng để quan sát `dispose` và `initState`.
- **Giới hạn của `setState()`:** thêm/bớt giỏ làm toàn bộ thẻ bị build lại dù không thay đổi, và phải truyền callback qua constructor (prop drilling).

## 3. Cấu trúc thư mục

```
demo_chude10/
├── lib/
│   ├── model/
│   │   └── product.dart         # Model sản phẩm (bất biến)
│   ├── page/
│   │   └── home_page.dart       # Màn hình chính, giữ state giỏ hàng
│   ├── widget/
│   │   └── product_card.dart    # Thẻ sản phẩm, giữ state thả tim + log vòng đời
│   └── main.dart                # Điểm khởi chạy ứng dụng
└── pubspec.yaml
```

## 4. Chạy ứng dụng

Yêu cầu: Flutter SDK (>= 3.13.0), VS Code hoặc Android Studio.

```bash
git clone https://github.com/Trungdinh0565/LTDNT_CHUDE10.git
cd LTDNT_CHUDE10/demo_chude10
flutter pub get
flutter run
```

Xem log: tab **Debug Console** (VS Code, chạy bằng F5) hoặc tab **Run** (Android Studio).

## 5. Kịch bản demo

| Thao tác | Log quan sát được |
|---|---|
| Mở app | Mỗi thẻ: `initState` → `didChangeDependencies` → `build` |
| Thả tim 1 thẻ | `setState` → `build` (chỉ thẻ đó) |
| Thêm / Bớt giỏ | Cả 5 thẻ: `didUpdateWidget` → `build`; tim đã thả vẫn giữ nguyên |
| Gỡ danh sách | Mỗi thẻ: `deactivate` → `dispose` |
| Hiện lại danh sách | `initState` chạy lại, tim bị reset |

## 6. Thành viên thực hiện

- Đinh Tiến Trung
- Lê Văn Nhật

*Demo chỉ nhằm mục đích phục vụ môn học.*
