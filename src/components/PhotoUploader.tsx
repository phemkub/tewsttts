import { useState, type ChangeEvent } from 'react'
import { bucketName, supabase } from '../lib/supabase'

type PhotoUploaderProps = {
  onUploaded: () => void
}

export default function PhotoUploader({ onUploaded }: PhotoUploaderProps) {
  const [isUploading, setIsUploading] = useState(false)
  const [statusText, setStatusText] = useState('')

  const uploadImage = async (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0]
    if (!file) return

    setIsUploading(true)
    setStatusText('กำลังอัปโหลดรูป...')

    const ext = file.name.split('.').pop() ?? 'jpg'
    const safeName = `${Date.now()}-${Math.random().toString(36).slice(2)}.${ext}`

    const { error } = await supabase.storage.from(bucketName).upload(safeName, file, {
      cacheControl: '3600',
      upsert: false,
    })

    if (error) {
      setStatusText(`อัปโหลดไม่สำเร็จ: ${error.message}`)
      setIsUploading(false)
      return
    }

    setStatusText('อัปโหลดสำเร็จแล้ว 💖')
    setIsUploading(false)
    onUploaded()
    event.target.value = ''
  }

  return (
    <section className="uploader-card">
      <h3>อัปโหลดรูปแฟนได้ตรงนี้</h3>
      <label className="upload-btn">
        <input
          type="file"
          accept="image/*"
          disabled={isUploading}
          onChange={uploadImage}
        />
        {isUploading ? 'Uploading...' : 'เลือกไฟล์รูป'}
      </label>
      <p className="hint-text">{statusText || 'รองรับไฟล์ภาพทั่วไป เช่น JPG/PNG/WEBP'}</p>
    </section>
  )
}
