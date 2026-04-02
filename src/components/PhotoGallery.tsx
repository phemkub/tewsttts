import { content } from '../config/content'

export default function PhotoGallery() {
  const photos = content.galleryImageUrls

  return (
    <section className="gallery-card">
      <h3>Photo Gallery 🐶🎀</h3>
      <div className="gallery-grid">
        {photos.length === 0 ? (
          <p className="hint-text">ยังไม่มีลิงก์รูป เพิ่มได้ที่ไฟล์ src/config/content.ts</p>
        ) : null}
        {photos.map((url) => (
          <img key={url} src={url} alt="memory" loading="lazy" />
        ))}
      </div>
    </section>
  )
}
