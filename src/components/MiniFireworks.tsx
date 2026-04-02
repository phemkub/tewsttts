import type { CSSProperties } from 'react'

const bursts = new Array(12).fill(null)

export default function MiniFireworks() {
  return (
    <div className="fireworks-layer" aria-hidden="true">
      {bursts.map((_, index) => (
        <span
          key={index}
          className="spark"
          style={
            {
              '--x': `${(index % 4) * 22 + 14}%`,
              '--y': `${Math.floor(index / 4) * 20 + 12}%`,
              '--delay': `${index * 0.08}s`,
            } as CSSProperties
          }
        />
      ))}
    </div>
  )
}
