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
    <div style={{
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      gap: '20px',
      padding: '24px',
    }}>

      {/* กล่องของขวัญ */}
      <button
        onClick={openGift}
        style={{
          background: 'none',
          border: 'none',
          cursor: opened ? 'default' : 'pointer',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          gap: '0',
          filter: opened ? 'drop-shadow(0 0 18px #ff8fab)' : 'drop-shadow(0 4px 12px #f9a8d4)',
          transform: opened ? 'scale(1.08)' : 'scale(1)',
          transition: 'all 0.4s cubic-bezier(.34,1.56,.64,1)',
          animation: opened ? 'none' : 'giftBounce 2s ease-in-out infinite',
        }}
      >
        {/* ฝากล่อง */}
        <div style={{
          width: '160px',
          height: '52px',
          background: opened
            ? 'linear-gradient(135deg, #ff8fab, #ff4d8d)'
            : 'linear-gradient(135deg, #ffb3c6, #ff85a1)',
          borderRadius: '16px 16px 4px 4px',
          border: '3px solid #fff',
          position: 'relative',
          boxShadow: '0 4px 0 #f472b6',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          marginBottom: '-2px',
          transition: 'transform 0.4s ease, background 0.3s',
          transform: opened ? 'translateY(-24px) rotate(-8deg)' : 'translateY(0)',
        }}>
          {/* โบว์ */}
          <div style={{ position: 'absolute', top: '-18px', display: 'flex', gap: '0' }}>
            <div style={{
              width: '36px', height: '28px',
              background: 'linear-gradient(135deg, #ff4d8d, #ff85a1)',
              borderRadius: '50% 4px 4px 50%',
              border: '2px solid #fff',
              marginRight: '-6px',
              transform: 'rotate(-15deg)',
              boxShadow: '0 2px 6px #f9a8d4',
            }} />
            <div style={{
              width: '36px', height: '28px',
              background: 'linear-gradient(135deg, #ff4d8d, #ff85a1)',
              borderRadius: '4px 50% 50% 4px',
              border: '2px solid #fff',
              marginLeft: '-6px',
              transform: 'rotate(15deg)',
              boxShadow: '0 2px 6px #f9a8d4',
            }} />
            <div style={{
              position: 'absolute',
              left: '50%', top: '50%',
              transform: 'translate(-50%, -50%)',
              width: '16px', height: '16px',
              borderRadius: '50%',
              background: '#fff',
              border: '2px solid #ff4d8d',
              zIndex: 2,
            }} />
          </div>
          {/* ริบบิ้นแนวตั้งบนฝา */}
          <div style={{
            width: '16px', height: '100%',
            background: 'linear-gradient(180deg, #fff5 0%, #fff3 100%)',
            borderLeft: '2px solid #fff4',
            borderRight: '2px solid #fff4',
          }} />
        </div>

        {/* ตัวกล่อง */}
        <div style={{
          width: '180px',
          height: '130px',
          background: opened
            ? 'linear-gradient(135deg, #ff8fab, #ff4d8d)'
            : 'linear-gradient(135deg, #ffb3c6, #ff85a1)',
          borderRadius: '8px 8px 20px 20px',
          border: '3px solid #fff',
          boxShadow: '0 8px 0 #f472b6, inset 0 2px 8px #fff4',
          position: 'relative',
          overflow: 'hidden',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          transition: 'background 0.3s',
        }}>
          {/* ริบบิ้นแนวตั้ง */}
          <div style={{
            position: 'absolute',
            top: 0, left: '50%',
            transform: 'translateX(-50%)',
            width: '20px', height: '100%',
            background: 'linear-gradient(180deg, #fff5, #fff2)',
            borderLeft: '2px solid #fff5',
            borderRight: '2px solid #fff5',
          }} />
          {/* ริบบิ้นแนวนอน */}
          <div style={{
            position: 'absolute',
            top: '50%', left: 0,
            transform: 'translateY(-50%)',
            width: '100%', height: '20px',
            background: 'linear-gradient(90deg, #fff2, #fff5, #fff2)',
            borderTop: '2px solid #fff5',
            borderBottom: '2px solid #fff5',
          }} />
          {/* ลายดอก */}
          {['10%', '80%', '20%', '75%'].map((left, i) => (
            <div key={i} style={{
              position: 'absolute',
              left, top: ['15%', '20%', '65%', '60%'][i],
              fontSize: '16px',
              opacity: 0.35,
            }}>🌸</div>
          ))}
          {/* ข้อความ */}
          <span style={{
            position: 'relative', zIndex: 2,
            color: '#fff',
            fontWeight: 800,
            fontSize: '13px',
            letterSpacing: '1px',
            textShadow: '0 2px 6px #ff4d8d',
            fontFamily: "'Press Start 2P', cursive",
          }}>
            {opened ? 'SURPRISE! 💖' : content.openGiftLabel}
          </span>
        </div>
      </button>

      {/* hint text */}
      <div style={{
        background: 'linear-gradient(135deg, #fce7f3, #fdf2f8)',
        border: '2px dashed #f9a8d4',
        borderRadius: '20px',
        padding: '12px 24px',
        color: '#be185d',
        fontWeight: 600,
        fontSize: '14px',
        textAlign: 'center',
        boxShadow: '0 2px 8px #f9a8d420',
      }}>
        {opened ? '✨ กำลังเปิดของขวัญ...' : 'มีสุดหล่อ + น้องหมาแอบอยู่ 🐶🎀'}
      </div>

      <style>{`
        @keyframes giftBounce {
          0%, 100% { transform: translateY(0px); }
          50% { transform: translateY(-8px); }
        }
      `}</style>
    </div>
  )
}
