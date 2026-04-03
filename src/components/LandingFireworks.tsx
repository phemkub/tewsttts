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

function playFireworkSound(ctx: AudioContext, delay: number) {
  setTimeout(() => {
    const whoosh = ctx.createOscillator()
    const whooshGain = ctx.createGain()
    whoosh.connect(whooshGain)
    whooshGain.connect(ctx.destination)
    whoosh.frequency.setValueAtTime(200, ctx.currentTime)
    whoosh.frequency.exponentialRampToValueAtTime(800, ctx.currentTime + 0.3)
    whooshGain.gain.setValueAtTime(0.15, ctx.currentTime)
    whooshGain.gain.exponentialRampToValueAtTime(0.001, ctx.currentTime + 0.3)
    whoosh.start(ctx.currentTime)
    whoosh.stop(ctx.currentTime + 0.3)

    setTimeout(() => {
      const bufferSize = ctx.sampleRate * 0.15
      const buffer = ctx.createBuffer(1, bufferSize, ctx.sampleRate)
      const data = buffer.getChannelData(0)
      for (let i = 0; i < bufferSize; i++) {
        data[i] = (Math.random() * 2 - 1) * Math.pow(1 - i / bufferSize, 2)
      }
      const noise = ctx.createBufferSource()
      noise.buffer = buffer
      const noiseGain = ctx.createGain()
      const noiseFilter = ctx.createBiquadFilter()
      noiseFilter.type = 'bandpass'
      noiseFilter.frequency.value = 1800
      noiseFilter.Q.value = 0.8
      noise.connect(noiseFilter)
      noiseFilter.connect(noiseGain)
      noiseGain.connect(ctx.destination)
      noiseGain.gain.setValueAtTime(0.6, ctx.currentTime)
      noiseGain.gain.exponentialRampToValueAtTime(0.001, ctx.currentTime + 0.15)
      noise.start(ctx.currentTime)
      noise.stop(ctx.currentTime + 0.15)
    }, 300)
  }, delay)
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

    const rockets: Rocket[] = [
      {
        x: canvas.width * 0.18,
        y: canvas.height,
        vy: -12,
        targetY: canvas.height * 0.25,
        exploded: false,
        color: colors[Math.floor(Math.random() * colors.length)],
        particles: [],
      },
      {
        x: canvas.width * 0.82,
        y: canvas.height,
        vy: -11,
        targetY: canvas.height * 0.28,
        exploded: false,
        color: colors[Math.floor(Math.random() * colors.length)],
        particles: [],
      },
      {
        x: canvas.width * 0.12,
        y: canvas.height,
        vy: -10,
        targetY: canvas.height * 0.35,
        exploded: false,
        color: colors[Math.floor(Math.random() * colors.length)],
        particles: [],
      },
      {
        x: canvas.width * 0.88,
        y: canvas.height,
        vy: -10.5,
        targetY: canvas.height * 0.32,
        exploded: false,
        color: colors[Math.floor(Math.random() * colors.length)],
        particles: [],
      },
    ]

    try {
      const audioCtx = new AudioContext()
      playFireworkSound(audioCtx, 0)
      playFireworkSound(audioCtx, 150)
      playFireworkSound(audioCtx, 600)
      playFireworkSound(audioCtx, 750)
    } catch (_) {}

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
    let done = false

    function animate() {
      if (done) return
      ctx!.clearRect(0, 0, canvas!.width, canvas!.height)

      let allFaded = true

      for (const rocket of rockets) {
        if (!rocket.exploded) {
          allFaded = false
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
      }

      ctx!.globalAlpha = 1

      if (allFaded) {
        done = true
        return
      }

      animId = requestAnimationFrame(animate)
    }

    animate()

    return () => {
      cancelAnimationFrame(animId)
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
