import { useEffect, useRef } from 'react'

interface Particle {
  x: number
  y: number
  vx: number
  vy: number
  alpha: number
  color: string
  radius: number
}

interface Rocket {
  x: number
  y: number
  vy: number
  targetY: number
  exploded: boolean
  color: string
  particles: Particle[]
}

export default function LandingFireworks() {
  const canvasRef = useRef<HTMLCanvasElement>(null)

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return
    const ctx = canvas.getContext('2d')
    if (!ctx) return

    canvas.width = window.innerWidth
    canvas.height = window.innerHeight

    const colors = ['#ff6bae', '#ff4d9e', '#ffe066', '#fff', '#ffb3d1', '#ff94d5', '#ffd6ec']

    const playSound = () => {
      const audio = new Audio('/tewsttts/fireworkl.mp3')
      audio.volume = 0.5
      void audio.play().catch(() => {})
    }

    let soundInterval: ReturnType<typeof setInterval> | null = null

    const startSound = () => {
      if (soundInterval) return
      playSound()
      soundInterval = setInterval(() => {
        playSound()
      }, 800)
    }

    window.addEventListener('click', startSound)
    window.addEventListener('touchstart', startSound)

    const rockets: Rocket[] = []

    const spawnRocket = () => {
      const xOptions = [0.1, 0.18, 0.3, 0.5, 0.7, 0.82, 0.9]
      rockets.push({
        x: canvas.width * xOptions[Math.floor(Math.random() * xOptions.length)],
        y: canvas.height,
        vy: -(Math.random() * 3 + 9),
        targetY: canvas.height * (Math.random() * 0.2 + 0.15),
        exploded: false,
        color: colors[Math.floor(Math.random() * colors.length)],
        particles: [],
      })
    }

    spawnRocket()
    spawnRocket()
    const spawnInterval = setInterval(() => {
      spawnRocket()
    }, 700)

    function explode(rocket: Rocket) {
      rocket.exploded = true
      const count = 52
      for (let i = 0; i < count; i++) {
        const angle = (Math.PI * 2 * i) / count
        const speed = Math.random() * 4 + 1.5
        rocket.particles.push({
          x: rocket.x,
          y: rocket.y,
          vx: Math.cos(angle) * speed,
          vy: Math.sin(angle) * speed,
          alpha: 1,
          color: colors[Math.floor(Math.random() * colors.length)],
          radius: Math.random() * 3 + 1.5,
        })
      }
    }

    let animId: number

    function animate() {
      ctx!.clearRect(0, 0, canvas!.width, canvas!.height)

      for (let i = rockets.length - 1; i >= 0; i--) {
        const rocket = rockets[i]

        if (!rocket.exploded) {
          rocket.y += rocket.vy
          ctx!.beginPath()
          ctx!.arc(rocket.x, rocket.y, 3, 0, Math.PI * 2)
          ctx!.fillStyle = rocket.color
          ctx!.globalAlpha = 1
          ctx!.fill()

          if (rocket.y <= rocket.targetY) {
            explode(rocket)
          }
        }

        let allFaded = true
        for (const p of rocket.particles) {
          if (p.alpha > 0.01) {
            allFaded = false
            p.x += p.vx
            p.y += p.vy
            p.vy += 0.07
            p.alpha -= 0.018
            ctx!.beginPath()
            ctx!.arc(p.x, p.y, p.radius, 0, Math.PI * 2)
            ctx!.fillStyle = p.color
            ctx!.globalAlpha = Math.max(0, p.alpha)
            ctx!.fill()
          }
        }

        if (rocket.exploded && allFaded) {
          rockets.splice(i, 1)
        }
      }

      ctx!.globalAlpha = 1
      animId = requestAnimationFrame(animate)
    }

    animate()

    return () => {
      cancelAnimationFrame(animId)
      clearInterval(spawnInterval)
      if (soundInterval) clearInterval(soundInterval)
      window.removeEventListener('click', startSound)
      window.removeEventListener('touchstart', startSound)
    }
  }, [])

  return (
    <canvas
      ref={canvasRef}
      style={{
        position: 'fixed',
        inset: 0,
        pointerEvents: 'none',
        zIndex: 50,
      }}
      aria-hidden="true"
    />
  )
}
