import { useState } from 'react'
import { content } from '../config/content'

type GiftBoxProps = {
  onOpen: () => void
}

export default function GiftBox({ onOpen }: GiftBoxProps) {
  const [opened, setOpened] = useState(false)

  const openGift = () => {
    if (opened) return
    setOpened(true)
    spawnHearts()
    window.setTimeout(() => onOpen(), 900)
  }

  const spawnHearts = () => {
    const container = document.getElementById('heart-container')
    if (!container) return
    const emojis = ['💖', '🌸', '✨', '🎀', '💕']
    for (let i = 0; i < 10; i++) {
      const h = document.createElement('div')
      h.className = 'gift-heart'
      h.textContent = emojis[i % emojis.length]
      h.style.left = 20 + Math.random() * 60 + '%'
      h.style.animationDelay = i * 0.12 + 's'
      container.appendChild(h)
      window.setTimeout(() => h.remove(), 2000)
    }
  }

  return (
    <div className="gift-scene">
      <div className="gift-bubble b1" />
      <div className="gift-bubble b2" />
      <div className="gift-bubble b3" />
      <div className="gift-bubble b4" />
      <div className="gift-sparkle sp1" />
      <div className="gift-sparkle sp2" />
      <div className="gift-sparkle sp3" />

      <div
        className={`gift-container ${opened ? 'opened' : ''}`}
        onClick={openGift}
      >
        <div id="heart-container" className="gift-hearts" />

        <div className="gift-body">
          <div className="gift-ribbon-v" />
          <div className="gift-ribbon-h" />
        </div>

        <div className="gift-lid">
          <div className="gift-ribbon-v" />
          <div className="gift-ribbon-h" />
        </div>

        <div className="gift-bow">
          <div className="bow-left" />
          <div className="bow-right" />
          <div className="bow-center" />
        </div>
      </div>

      <div className="gift-label">
        {opened ? 'SURPRISE! 💖' : content.openGiftLabel + ' 🎀'}
      </div>
      <p className="hint-text">
        {opened ? 'กำลังเปิดของขวัญ...' : 'มีสุดหล่อ + น้องหมาแอบอยู่ 🐶🎀'}
      </p>
    </div>
  )
}
