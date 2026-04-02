import { useRef, useState } from 'react'


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


  const songUrl = './superpowers.mp3'

  
  const togglePlay = () => {
    if (!audioRef.current) return
    if (isPlaying) {
      audioRef.current.pause()
    } else {
      audioRef.current.play().catch(err => console.log("Error playing audio:", err))
    }
    setIsPlaying(!isPlaying)
  }


  const handleGiftOpened = () => {
    setShowFireworks(true)
    
  
    if (audioRef.current) {
      audioRef.current.play()
        .then(() => setIsPlaying(true))
        .catch(() => console.log("Waiting for manual play..."))
    }

    window.setTimeout(() => setShowFireworks(false), 2200)
    window.setTimeout(() => setStep('letter'), 1700)
  }

  return (
    <main className="app-shell">
      {/* --- CSS Styling (My Melody Style) --- */}
      <style>{`
        .app-shell {
          min-height: 100vh;
          background-color: #fff5f7;
          font-family: 'Kanit', sans-serif;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 20px;
        }
        .panel {
          background: white;
          padding: 40px;
          border-radius: 30px;
          box-shadow: 0 10px 40px rgba(255, 182, 193, 0.2);
          text-align: center;
          max-width: 500px;
          width: 100%;
          border: 3px solid #ffcad4;
          position: relative;
        }
        .primary-btn {
          background: #ff85a2;
          color: white;
          border: none;
          padding: 12px 35px;
          border-radius: 50px;
          font-size: 1.1rem;
          font-weight: bold;
          cursor: pointer;
          transition: 0.3s;
          box-shadow: 0 5px 15px rgba(255, 133, 162, 0.3);
        }
        .primary-btn:hover {
          background: #ff4d7d;
          transform: translateY(-2px);
        }

        /* Music Controls Overlay */
        .music-overlay {
          position: fixed;
          top: 20px;
          right: 20px;
          z-index: 1000;
        }
        .music-pill {
          background: white;
          border: 2px solid #ff85a2;
          padding: 8px 15px;
          border-radius: 50px;
          display: flex;
          align-items: center;
          gap: 10px;
          box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .play-circle {
          width: 35px;
          height: 35px;
          border-radius: 50%;
          background: #ff85a2;
          border: none;
          color: white;
          cursor: pointer;
          display: flex;
          align-items: center;
          justify-content: center;
        }
        .spinning { animation: spin 4s linear infinite; }
        @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
      `}</style>

      {showFireworks && <MiniFireworks />}

      {/* แถบควบคุมเพลง (จะเห็นเฉพาะหน้าสุดท้าย) */}
      {step === 'letter' && (
        <div className="music-overlay">
          <div className="music-pill">
            <span style={{ fontSize: '0.8rem', color: '#ff85a2', fontWeight: 'bold' }}>
              {isPlaying ? 'Music On 🎵' : 'Paused'}
            </span>
            <button className={`play-circle ${isPlaying ? 'spinning' : ''}`} onClick={togglePlay}>
              {isPlaying ? '⏸' : '▶'}
            </button>
            <button 
              style={{ background: 'none', border: 'none', cursor: 'pointer', fontSize: '1.1rem' }}
              onClick={() => setIsMuted(!isMuted)}
            >
              {isMuted ? '🔇' : '🔊'}
            </button>
          </div>
          <audio
            ref={audioRef}
            src={songUrl}
            loop
            muted={isMuted}
            onPlay={() => setIsPlaying(true)}
            onPause={() => setIsPlaying(false)}
          />
        </div>
      )}

      {/* Step 1: Landing */}
      {step === 'landing' && (
        <section className="panel">
          <p style={{ fontSize: '1.5rem' }}>🎀 🐶</p>
          <TypewriterTitle text={content.mainTitle} />
          <p style={{ color: '#ff758f', fontWeight: 'bold', margin: '15px 0' }}>
            {content.partnerName}'s Birthday ({content.birthdayThai})
          </p>
          <button className="primary-btn" onClick={() => setStep('gift')}>
            {content.nextLabel} ➔
          </button>
        </section>
      )}

      {/* Step 2: Gift Box */}
      {step === 'gift' && (
        <section className="panel">
          <h2 style={{ color: '#ff758f', marginBottom: '30px' }}>เปิดของขวัญกันเถอะ!</h2>
          <GiftBox onOpen={handleGiftOpened} />
        </section>
      )}

      {/* Step 3: Letter & Gallery */}
      {step === 'letter' && (
        <section className="panel" style={{ maxWidth: '800px' }}>
          <PaperLetter />
          <hr style={{ border: 'none', borderTop: '2px dashed #ffcad4', margin: '30px 0' }} />
          <PhotoGallery />
          <p style={{ color: '#a0a0a0', fontSize: '0.8rem', marginTop: '30px' }}>- My Melody Surprise -</p>
        </section>
      )}
    </main>
  )
}

export default App
