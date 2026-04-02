import { useState } from 'react'
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

  const handleGiftOpened = () => {
    setShowFireworks(true)
    window.setTimeout(() => setShowFireworks(false), 2200)
    window.setTimeout(() => setStep('letter'), 1700)
  }

  return (
    <main className="app-shell">
      {showFireworks ? <MiniFireworks /> : null}

      {step === 'landing' ? (
        <section className="panel">
          <p className="emoji-row">My SKIBIDI GF 🎀 | 🐶 Puppy Lover</p>
          <TypewriterTitle text={content.mainTitle} />
          <p className="sub-title">
            สุขสันต์วันเกิด {content.partnerName} ({content.birthdayThai})
          </p>
          <p className="hint-text">
            เธอกดNEXTเร็ว
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
          <PaperLetter />
          <PhotoGallery />
        </section>
      ) : null}
    </main>
  )
}

export default App
