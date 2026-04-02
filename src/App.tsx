import { useEffect, useRef, useState } from 'react'

// --- Mock Components (ถ้าคุณมีไฟล์แยกอยู่แล้ว ให้เปลี่ยนเป็นการ import ปกติ) ---
// Note: หากก๊อปไปใส่โปรเจกต์เดิมที่มีไฟล์เหล่านี้อยู่แล้ว ให้คงการ import ด้านบนไว้ครับ
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
  const [audioSourceIndex, setAudioSourceIndex] = useState(0)
  const audioRef = useRef<HTMLAudioElement | null>(null)

  // จัดการลำดับเพลง (แนะนำให้เช็คว่าไฟล์อยู่ในโฟลเดอร์ public นะครับ)
  const audioSources = [
    content.finalSongUrl, // ลำดับ 1 จากไฟล์ config
    '/superpowers.mp3',   // ลำดับ 2 (ถ้าอยู่ใน public)
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' // ลำดับสำรองเผื่อไฟล์พัง
  ]

  // ฟังก์ชันสลับสถานะเล่น/หยุด
  const togglePlay = () => {
    if (!audioRef.current) return
    if (isPlaying) {
      audioRef.current.pause()
    } else {
      audioRef.current.play().catch(err => console.log("Playback error:", err))
    }
    setIsPlaying(!isPlaying)
  }

  // ฟังก์ชันเมื่อกดเปิดของขวัญ
  const handleGiftOpened = () => {
    setShowFireworks(true)
    
    // เคล็ดลับ: สั่งเริ่มเล่นเพลงที่นี่เพื่อให้ Browser อนุญาต (เพราะเกิดจากการคลิก)
    if (audioRef.current) {
      audioRef.current.volume = 0.5
      audioRef.current.play().then(() => {
        setIsPlaying(true)
      }).catch(() => {
        console.log("Autoplay blocked: จะเล่นเมื่อเข้าหน้าจดหมาย")
      })
    }

    window.setTimeout(() => setShowFireworks(false), 2200)
    window.setTimeout(() => setStep('letter'), 1700)
  }

  // จัดการ Error ของไฟล์เพลง
  const handleAudioError = () => {
    console.log(`Audio error on source ${audioSourceIndex}, trying next...`)
    if (audioSourceIndex < audioSources.length - 1) {
      setAudioSourceIndex(prev => prev + 1)
    }
  }

  return (
    <main className="app-shell">
      {/* ส่วนของ CSS แบบ Inline เพื่อความสวยงาม (รวมไว้ที่เดียวตามคำขอ) */}
      <style>{`
        .app-shell {
          min-height: 100vh;
          background-color: #fff0f3; /* ชมพูอ่อนมาก */
          font-family: 'Kanit', sans-serif;
          display: flex;
          align-items: center;
          justify-content: center;
          overflow-x: hidden;
          padding: 20px;
        }
        .panel {
          background: white;
          padding: 40px;
          border-radius: 30px;
          box-shadow: 0 10px 30px rgba(255, 182, 193, 0.3);
          text-align: center;
          max-width: 500px;
          width: 100%;
          border: 4px solid #ffcad4;
          position: relative;
        }
        .emoji-row { font-size: 1.2rem; margin-bottom: 10px; }
        .sub-title { color: #ff758f; font-weight: bold; margin: 15px 0; }
        .hint-text { font-size: 0.9rem; color: #a0a0a0; margin-bottom: 25px; }
        
        /* ปุ่มสไตล์ My Melody */
        .primary-btn {
          background: #ff85a2;
          color: white;
          border: none;
          padding: 12px 30px;
          border-radius: 50px;
          font-size: 1.1rem;
          font-weight: bold;
          cursor: pointer;
          transition: all 0.3s;
          box-shadow: 0 5px 15px rgba(255, 133, 162, 0.4);
        }
        .primary-btn:hover {
          background: #ff4d7d;
          transform: translateY(-3px);
          box-shadow: 0 8px 20px rgba(255, 133, 162, 0.6);
        }

        /* ส่วนควบคุมเพลงลอยด้านบน */
        .music-player-container {
          position: fixed;
          top: 20px;
          right: 20px;
          z-index: 1000;
          display: flex;
          flex-direction: column;
          align-items: flex-end;
          gap: 10px;
        }
        .music-card {
          background: rgba(255, 255, 255, 0.9);
          backdrop-filter: blur(10px);
          padding: 12px 20px;
          border-radius: 50px;
          border: 2px solid #ff85a2;
          display: flex;
          align-items: center;
          gap: 12px;
          box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .music-btn-circle {
          width: 40px;
          height: 40px;
          border-radius: 50%;
          background: #ff85a2;
          border: none;
          color: white;
          display: flex;
          align-items: center;
          justify-content: center;
          cursor: pointer;
          font-size: 1.2rem;
        }
        .playing-anim {
          animation: rotate 3s linear infinite;
        }
        @keyframes rotate { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
        
        .letter-stage { max-width: 800px; }
      `}</style>

      {/* พลุ (แสดงเมื่อเปิดของขวัญ) */}
      {showFireworks && <MiniFireworks />}

      {/* เครื่องเล่นเพลง (จะปรากฏเฉพาะเมื่อเข้าสู่หน้าจดหมาย) */}
      {step === 'letter' && (
        <div className="music-player-container">
          <div className="music-card">
            <span style={{ fontSize: '0.8rem', color: '#ff85a2', fontWeight: 'bold' }}>
              {isPlaying ? 'กำลังเล่นเพลง... ✨' : 'เพลงหยุดอยู่'}
            </span>
            <button className={`music-btn-circle ${isPlaying ? 'playing-anim' : ''}`} onClick={togglePlay}>
              {isPlaying ? '⏸' : '▶'}
            </button>
            <button 
              style={{ background: 'none', border: 'none', cursor: 'pointer', fontSize: '1.2rem' }}
              onClick={() => setIsMuted(!isMuted)}
            >
              {isMuted ? '🔇' : '🔊'}
            </button>
          </div>
          <audio
            ref={audioRef}
            src={audioSources[audioSourceIndex]}
            loop
            muted={isMuted}
            onPlay={() => setIsPlaying(true)}
            onPause={() => setIsPlaying(false)}
            onError={handleAudioError}
          />
        </div>
      )}

      {/* --- ด่านที่ 1: Landing Page --- */}
      {step === 'landing' && (
        <section className="panel animate-in">
          <p className="emoji-row">My Melody 🎀 | 🐶 Puppy Love</p>
          <TypewriterTitle text={content.mainTitle} />
          <p className="sub-title">
            สุขสันต์วันเกิด {content.partnerName} ({content.birthdayThai})
          </p>
          <p className="hint-text">
            ความทรงจำดีๆ ของเราสองคนรวมอยู่ในนี้แล้วนะ <br/>
            กดปุ่มด้านล่างเพื่อเริ่มการเดินทางกันเลย!
          </p>
          <button className="primary-btn" onClick={() => setStep('gift')}>
            {content.nextLabel} ➔
          </button>
        </section>
      )}

      {/* --- ด่านที่ 2: กล่องของขวัญ --- */}
      {step === 'gift' && (
        <section className="panel">
          <h2 className="sub-title" style={{ fontSize: '1.5rem' }}>
            กล่องของขวัญสำหรับ {content.partnerName}
          </h2>
          <p className="hint-text">ลองแตะที่กล่องดูสิ มีอะไรอยู่ข้างในนะ?</p>
          <div style={{ transform: 'scale(1.2)', margin: '40px 0' }}>
            <GiftBox onOpen={handleGiftOpened} />
          </div>
        </section>
      )}

      {/* --- ด่านที่ 3: จดหมายและแกลเลอรี --- */}
      {step === 'letter' && (
        <section className="panel letter-stage">
          {/* ส่วนเนื้อหาหลัก */}
          <PaperLetter />
          <div style={{ marginTop: '30px', borderTop: '2px dashed #ffcad4', paddingTop: '30px' }}>
            <h3 className="sub-title">Photo Memories 📸</h3>
            <PhotoGallery />
          </div>
          
          <p className="hint-text" style={{ marginTop: '40px' }}>
            - Always beside you -
          </p>
        </section>
      )}
    </main>
  )
}

export default App
