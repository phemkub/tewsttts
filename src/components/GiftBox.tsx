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
    window.setTimeout(() => onOpen(), 900)
  }

  return (
    <div className="gift-wrap">
      <button className={`gift-box ${opened ? 'opened' : ''}`} onClick={openGift}>
        <span className="gift-lid" />
        <span className="gift-ribbon-v" />
        <span className="gift-ribbon-h" />
        <span className="gift-message">{opened ? 'SURPRISE! 💖' : content.openGiftLabel}</span>
      </button>
      <p className="hint-text">{opened ? 'กำลังเปิดของขวัญ...' : 'มีสุดหล่อ + น้องหมาแอบอยู่ 🐶🎀'}</p>
    </div>
  )
}
