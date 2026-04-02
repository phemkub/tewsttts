import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  // Use relative asset paths for GitHub Pages to avoid base mismatch.
  base: './',
  plugins: [react()],
})
