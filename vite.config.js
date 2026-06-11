import { defineConfig } from 'vite';
import { resolve } from 'path'; 

import react from '@vitejs/plugin-react';

export default defineConfig({
  base: '/for_testing_the_website/',
  plugins: [react()],
  resolve: {
    alias: {
      '@': resolve(__dirname, './src')
    }
  }
});
