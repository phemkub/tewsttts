import { useEffect, useState } from 'react'
import { bucketName, supabase } from '../lib/supabase'

type PhotoGalleryProps = {
  refreshKey: number
}

export default function PhotoGallery({ refreshKey }: PhotoGalleryProps) {
  const [photos, setPhotos] = useState<string[]>([])
  const [errorText, setErrorText] = useState('')

  useEffect(() => {
    const getImages = async () => {
      const { data, error } = await supabase.storage.from(bucketName).list('', {
        limit: 50,
        sortBy: { column: 'created_at', order: 'desc' },
      })

      if (error) {
        setErrorText(error.message)
        return
      }

      const urls =
        data?.map((item) => supabase.storage.from(bucketName).getPublicUrl(item.name).data.publicUrl) ??
        []

      setPhotos(urls)
      setErrorText('')
    }

    void getImages()
  }, [refreshKey])

  return (
    <section className="gallery-card">
      <h3>Photo Gallery 🐶🎀</h3>
      {errorText ? <p className="hint-text">โหลดรูปไม่ได้: {errorText}</p> : null}
      <div className="gallery-grid">
        {photos.length === 0 ? <p className="hint-text">ยังไม่มีรูป ลองอัปโหลดรูปแรกได้เลย</p> : null}
        {photos.map((url) => (
          <img key={url} src={url} alt="memory" loading="lazy" />
        ))}
      </div>
    </section>
  )
}
