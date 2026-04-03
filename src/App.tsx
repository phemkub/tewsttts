import { useEffect, useRef, useState } from 'react'
import GiftBox from './components/GiftBox'
import LandingFireworks from './components/LandingFireworks'
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
  const fireworkSoundRef = useRef<ReturnType<typeof setInterval> | null>(null)
  const audioSrc = '/tewsttts/superpowers.mp3'

  const startFireworkSound = () => {
    if (fireworkSoundRef.current) return
    const playSound = () => {
      const audio = new Audio('/tewsttts/fireworkl.mp3')
      audio.volume = 0.5
      void audio.play().catch(() => {})
    }
    playSound()
    fireworkSoundRef.current = setInterval(playSound, 3000)
  }

  const stopFireworkSound = () => {
    if (fireworkSoundRef.current) {
      clearInterval(fireworkSoundRef.current)
      fireworkSoundRef.current = null
    }
  }

  const handleNextClick = () => {
    startFireworkSound()
    setStep('gift')
  }

  const handleGiftOpened = () => {
    stopFireworkSound()
    setShowFireworks(true)
    window.setTimeout(() => setShowFireworks(false), 2200)
    window.setTimeout(() => setStep('letter'), 1700)
  }

  useEffect(() => {
    const audio = audioRef.current
    if (!audio) return
    if (step === 'letter') {
      void audio.play().catch(() => {})
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
          <LandingFireworks />
          <p className="emoji-row">My Melody 🎀 | 🐶 Puppy Love</p>
          <TypewriterTitle text={content.mainTitle} />
          <p className="sub-title">
            สุขสันต์วันเกิด {content.partnerName} ({content.birthdayThai})
          </p>
          <p className="hint-text">กดตรงไหนก็ได้ของจอก่อนกดnextน้าาา</p>
          <button className="primary-btn" onClick={handleNextClick}>
            {content.nextLabel}
          </button>
        </section>
      ) : null}
      {step === 'gift' ? (
        <section className="panel">
          <h2 className="section-title">กล่องของขวัญสำหรับ {content.partnerName}</h2>
          <p className="hint-text">กดที่กล่อง</p>
          <GiftBox onOpen={handleGiftOpened} />
        </section>
      ) : null}
      {step === 'letter' ? (
        <section className="panel letter-stage">
          <div className="audio-wrap">
            <audio
              ref={audioRef}
              src={audioSrc}
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
