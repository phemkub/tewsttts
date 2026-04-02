import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  // Important for GitHub Pages project site: https://<user>.github.io/tewsttfs/
  base: '/tewsttfs/',
  plugins: [react()],
})
