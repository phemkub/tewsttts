import { useEffect, useRef, useState } from 'react'
import GiftBox from './components/GiftBox'
import MiniFireworks from './components/MiniFireworks'
import PaperLetter from './components/PaperLetter'
import PhotoGallery from './components/PhotoGallery'
import TypewriterTitle from './components/TypewriterTitle'
import { content } from './config/content'

type Step = 'landing' | 'gift' | 'letter'

function App() {
  const [step, setStep] = useState<Step>('landing')
  const [showFireworks, setShowFireworks] = useState(false)
  const [isMuted, setIsMuted] = useState(false)
  const [isPlaying, setIsPlaying] = useState(false)
  const audioRef = useRef<HTMLAudioElement | null>(null)

  // ✅ แก้ตรงนี้: ใช้ path เดียว /superpowers.mp3 (ไฟล์ต้องอยู่ใน public/)
  const audioSrc = '/superpowers.mp3'

  const handleGiftOpened = () => {
    setShowFireworks(true)
    window.setTimeout(() => setShowFireworks(false), 2200)
    window.setTimeout(() => setStep('letter'), 1700)
  }

  useEffect(() => {
    const audio = audioRef.current
    if (!audio) return
    if (step === 'letter') {
      void audio.play().catch(() => {
        // Browser อาจ block autoplay ได้ กดปุ่ม "เปิดเพลง" แทนได้เลย
      })
      return
    }
    audio.pause()
  }, [step])

  const handlePlayToggle = () => {
    const audio = audioRef.current
    if (!audio) return
    if (audio.paused) {
      void audio.play()
      setIsPlaying(true)
      return
    }
    audio.pause()
    setIsPlaying(false)
  }

  return (
    <main className="app-shell">
      {showFireworks ? <MiniFireworks /> : null}

      {step === 'landing' ? (
        <section className="panel">
          <p className="emoji-row">My Melody 🎀 | 🐶 Puppy Love</p>
          <TypewriterTitle text={content.mainTitle} />
          <p className="sub-title">
            สุขสันต์วันเกิด {content.partnerName} ({content.birthdayThai})
          </p>
          <p className="hint-text">
            กดปุ่มด้านล่างเพื่อเปิดเซอร์ไพรส์ทีละด่าน
          </p>
          <button className="primary-btn" onClick={() => setStep('gift')}>
            {content.nextLabel}
          </button>
        </section>
      ) : null}

      {step === 'gift' ? (
        <section className="panel">
          <h2 className="section-title">กล่องของขวัญสำหรับ {content.partnerName}</h2>
          <p className="hint-text">แตะ/คลิกที่กล่องเพื่อเปิดของขวัญ</p>
          <GiftBox onOpen={handleGiftOpened} />
        </section>
      ) : null}

      {step === 'letter' ? (
        <section className="panel letter-stage">
          <div className="audio-wrap">
            {/* ✅ แก้ตรงนี้: src ใช้ audioSrc ตัวเดียว ไม่ต้อง fallback หลาย path แล้ว */}
            <audio
              ref={audioRef}
              src={audioSrc}
              controls
              loop
              muted={isMuted}
              onPlay={() => setIsPlaying(true)}
              onPause={() => setIsPlaying(false)}
            />
            <button className="primary-btn" onClick={handlePlayToggle}>
              {isPlaying ? 'หยุดเพลง' : 'เปิดเพลง'}
            </button>
            <button className="primary-btn" onClick={() => setIsMuted((prev) => !prev)}>
              {isMuted ? 'เปิดเสียง' : 'ปิดเสียง'}
            </button>
          </div>
          <PaperLetter />
          <PhotoGallery />
        </section>
      ) : null}
    </main>
  )
}

export default App
