# Birthday Surprise Web - Happy Birthday Katoon

เว็บเซอร์ไพรส์วันเกิดธีมสีชมพู สไตล์พิกเซล พร้อม flow:

- หน้าเปิดตัวข้อความ `HAPPY BIRTHDAY KATOON` แบบค่อยๆ แสดง
- ปุ่ม `NEXT` ไปหน้ากล่องของขวัญ
- เปิดกล่องแล้วมีพลุเล็กน้อย
- เข้าหน้า paper บอกความในใจ
- อัปโหลดรูปแฟนได้จริงผ่าน Supabase Storage

## Stack

- React + TypeScript + Vite
- Supabase (`@supabase/supabase-js`)

## 1) ติดตั้งและรัน

```bash
npm install
npm run dev
```

## 2) ตั้งค่า Supabase

1. สร้างโปรเจกต์ใน Supabase
2. เปิดเมนู Storage แล้วสร้าง bucket ชื่อ `katoon-photos` (หรือชื่ออื่น แล้วไปแก้ env)
3. แนะนำตั้ง bucket เป็น Public เพื่อให้แสดงรูปใน gallery ได้ง่าย
4. คัดลอกไฟล์ `.env.example` เป็น `.env`
5. ใส่ค่า env ดังนี้:

```env
VITE_SUPABASE_URL=https://your-project-ref.supabase.co
VITE_SUPABASE_ANON_KEY=your_anon_public_key
VITE_SUPABASE_BUCKET=katoon-photos
```

## 3) Policy ขั้นพื้นฐาน (ตัวอย่าง)

ถ้าตั้งเป็น public และต้องการให้ฝั่ง client อัปโหลด/อ่านได้ ให้เพิ่ม policy ใน bucket ตามแนวทางของ Supabase dashboard:

- `SELECT` อนุญาตอ่านไฟล์
- `INSERT` อนุญาตอัปโหลดไฟล์

หมายเหตุ: ถ้าต้องการความปลอดภัยมากขึ้น ให้ผูก auth user แล้วจำกัดสิทธิ์ตาม user id

## 4) แก้ข้อความเองตรงไหน

ไฟล์เดียวที่แก้ข้อความหลักได้เร็วที่สุด:

- `src/config/content.ts`

ในไฟล์นี้แก้ได้ทั้งหมด:

- หัวข้อหลัก `HAPPY BIRTHDAY KATOON`
- ชื่อแฟน
- วันเกิด (`5/4/2552`)
- ข้อความหน้า paper
- ข้อความปุ่ม `NEXT`, `OPEN GIFT`

## 5) โครงสร้างสำคัญ

- `src/App.tsx` - คุม flow หน้า Landing -> Gift -> Letter
- `src/components/TypewriterTitle.tsx` - ตัวอักษรค่อยๆ ขึ้น
- `src/components/GiftBox.tsx` - กล่องของขวัญ + animation
- `src/components/MiniFireworks.tsx` - พลุเบาๆ
- `src/components/PaperLetter.tsx` - กระดาษบอกความในใจ
- `src/components/PhotoUploader.tsx` - อัปโหลดรูปขึ้น Supabase
- `src/components/PhotoGallery.tsx` - ดึงรูปมาแสดง
- `src/lib/supabase.ts` - client + bucket config
- `src/styles/theme.css` - ธีมชมพู pixel UI

## 6) Build / Deploy

```bash
npm run build
npm run preview
```

สามารถนำขึ้น GitHub แล้ว deploy ต่อกับ Vercel / Netlify ได้ทันที โดยต้องตั้งค่า env variables เดียวกับใน `.env`
