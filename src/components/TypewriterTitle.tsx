import { useEffect, useState } from 'react'

type TypewriterTitleProps = {
  text: string
}

export default function TypewriterTitle({ text }: TypewriterTitleProps) {
  const [visibleCount, setVisibleCount] = useState(0)

  useEffect(() => {
    const timer = window.setInterval(() => {
      setVisibleCount((prev) => {
        if (prev >= text.length) {
          window.clearInterval(timer)
          return prev
        }
        return prev + 1
      })
    }, 85)

    return () => window.clearInterval(timer)
  }, [text])

  return <h1 className="hero-title">{text.slice(0, visibleCount)}</h1>
}
