<!doctype html>
<html lang="th">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MedLink (เมดลิงก์)</title>
    <link
      rel="preconnect"
      href="https://fonts.googleapis.com"
    />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+Thai:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <style>
      :root {
        --brand-blue: #4361ee;
        --accent-teal: #14b8a6;

        --bg: #ffffff;
        --text: #3f3f46;
        --text-strong: #08060d;
        --border: rgba(15, 23, 42, 0.12);
        --muted: rgba(15, 23, 42, 0.62);

        --shadow: rgba(2, 6, 23, 0.08) 0 10px 20px -10px,
          rgba(2, 6, 23, 0.06) 0 6px 12px -8px;
        --shadow-soft: rgba(2, 6, 23, 0.08) 0 6px 16px -12px;

        --radius: 14px;
        --radius-pill: 999px;

        --base-font: 16px;
        --grid-line: rgba(67, 97, 238, 0.06);

        --grad-header: linear-gradient(135deg, rgba(67, 97, 238, 0.98), rgba(20, 184, 166, 0.92));
        --grad-hero: linear-gradient(135deg, rgba(67, 97, 238, 0.14), rgba(20, 184, 166, 0.12));
        --grad-btn: linear-gradient(135deg, rgba(67, 97, 238, 1), rgba(20, 184, 166, 1));

        --focus: rgba(67, 97, 238, 0.35);
      }

      html {
        font-size: var(--base-font);
      }

      body {
        margin: 0;
        font-family: "Noto Sans Thai", system-ui, -apple-system, Segoe UI, Roboto,
          Arial, sans-serif;
        background: var(--bg);
        color: var(--text);
        letter-spacing: 0.12px;
        text-rendering: optimizeLegibility;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        min-height: 100svh;
      }

      body.theme-dark {
        --bg: #0b1220;
        --text: rgba(226, 232, 240, 0.82);
        --text-strong: #f1f5f9;
        --border: rgba(148, 163, 184, 0.22);
        --muted: rgba(226, 232, 240, 0.62);
        --shadow: rgba(0, 0, 0, 0.35) 0 10px 20px -10px,
          rgba(0, 0, 0, 0.25) 0 6px 12px -8px;
        --shadow-soft: rgba(0, 0, 0, 0.3) 0 6px 16px -12px;
        --grid-line: rgba(67, 97, 238, 0.12);
        --grad-header: linear-gradient(
          135deg,
          rgba(67, 97, 238, 1),
          rgba(20, 184, 166, 0.8)
        );
        --grad-hero: linear-gradient(
          135deg,
          rgba(67, 97, 238, 0.18),
          rgba(20, 184, 166, 0.14)
        );
      }

      * {
        box-sizing: border-box;
      }

      .appShell {
        position: relative;
        min-height: 100svh;
        padding-bottom: 86px;
        background-image: linear-gradient(
            to right,
            var(--grid-line) 1px,
            transparent 1px
          ),
          linear-gradient(to bottom, var(--grid-line) 1px, transparent 1px);
        background-size: 32px 32px;
        background-position: center;
      }

      .container {
        width: 100%;
        max-width: 980px;
        margin: 0 auto;
        padding: 18px 16px;
      }

      .topBar {
        position: sticky;
        top: 0;
        z-index: 20;
        background: rgba(255, 255, 255, 0.68);
        backdrop-filter: blur(10px);
        border-bottom: 1px solid var(--border);
      }

      body.theme-dark .topBar {
        background: rgba(11, 18, 32, 0.68);
      }

      .topBarInner {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 12px 16px;
        max-width: 980px;
        margin: 0 auto;
      }

      .brand {
        display: flex;
        align-items: center;
        gap: 10px;
        min-width: 0;
      }

      .brandMark {
        width: 38px;
        height: 38px;
        border-radius: 12px;
        background: var(--grad-header);
        box-shadow: var(--shadow-soft);
        display: grid;
        place-items: center;
        color: #fff;
        flex: 0 0 auto;
      }

      .brandTitle {
        display: flex;
        flex-direction: column;
        line-height: 1.05;
        min-width: 0;
      }

      .brandTitle strong {
        font-size: 16px;
        color: var(--text-strong);
        font-weight: 800;
      }

      .brandTitle span {
        font-size: 12px;
        color: var(--muted);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }

      .topActions {
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .iconButton {
        border: 1px solid var(--border);
        background: rgba(255, 255, 255, 0.7);
        color: var(--text-strong);
        width: 42px;
        height: 42px;
        border-radius: 14px;
        display: grid;
        place-items: center;
        cursor: pointer;
        transition: transform 0.15s ease, box-shadow 0.2s ease, border-color 0.2s ease;
      }

      body.theme-dark .iconButton {
        background: rgba(2, 6, 23, 0.12);
      }

      .iconButton:hover {
        transform: translateY(-1px);
        border-color: rgba(67, 97, 238, 0.35);
        box-shadow: var(--shadow-soft);
      }

      .iconButton:focus-visible {
        outline: 2px solid var(--focus);
        outline-offset: 2px;
      }

      .pageTitle {
        margin: 18px 0 10px;
        font-size: 22px;
        color: var(--text-strong);
        font-weight: 800;
      }

      .pageSub {
        margin: 0 0 16px;
        color: var(--muted);
        font-size: 14px;
      }

      .hero {
        border: 1px solid var(--border);
        border-radius: calc(var(--radius) + 6px);
        box-shadow: var(--shadow-soft);
        overflow: hidden;
        background: var(--grad-hero);
        position: relative;
      }

      .heroInner {
        display: grid;
        grid-template-columns: 1.2fr 0.8fr;
        gap: 14px;
        padding: 18px;
        align-items: center;
      }

      @media (max-width: 860px) {
        .heroInner {
          grid-template-columns: 1fr;
        }
      }

      .hero h1 {
        margin: 0;
        font-size: 30px;
        font-weight: 900;
        color: var(--text-strong);
        letter-spacing: -0.2px;
      }

      .hero p {
        margin: 10px 0 0;
        color: var(--muted);
        font-size: 15px;
        max-width: 50ch;
      }

      .heroActions {
        margin-top: 16px;
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
      }

      .btn {
        cursor: pointer;
        border: 1px solid transparent;
        border-radius: var(--radius-pill);
        padding: 11px 14px;
        font-weight: 700;
        transition: transform 0.15s ease, filter 0.2s ease, background 0.2s ease,
          border-color 0.2s ease;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        color: #fff;
        background: var(--grad-btn);
        box-shadow: 0 8px 18px rgba(67, 97, 238, 0.18);
      }

      .btn:hover {
        filter: brightness(1.03) saturate(1.05);
        transform: translateY(-1px);
      }

      .btn:focus-visible {
        outline: 2px solid var(--focus);
        outline-offset: 2px;
      }

      .btn.secondary {
        background: rgba(67, 97, 238, 0.1);
        color: var(--brand-blue);
        border-color: rgba(67, 97, 238, 0.22);
        box-shadow: none;
      }

      .btn.secondary:hover {
        background: rgba(67, 97, 238, 0.16);
        filter: none;
      }

      .btn.ghost {
        background: transparent;
        color: var(--text-strong);
        border-color: var(--border);
        box-shadow: none;
      }

      .btn.ghost:hover {
        border-color: rgba(67, 97, 238, 0.35);
        background: rgba(67, 97, 238, 0.06);
      }

      .gridCards {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
        margin-top: 12px;
      }
      @media (max-width: 860px) {
        .gridCards {
          grid-template-columns: 1fr;
        }
      }

      .card {
        background: rgba(255, 255, 255, 0.75);
        border: 1px solid var(--border);
        border-radius: var(--radius);
        box-shadow: var(--shadow-soft);
        padding: 14px;
      }

      body.theme-dark .card {
        background: rgba(2, 6, 23, 0.14);
      }

      .cardHeader {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 10px;
      }

      .cardIcon {
        width: 40px;
        height: 40px;
        border-radius: 14px;
        display: grid;
        place-items: center;
        border: 1px solid var(--border);
        background: rgba(67, 97, 238, 0.07);
        color: var(--brand-blue);
        flex: 0 0 auto;
      }

      .cardTitle {
        font-weight: 850;
        color: var(--text-strong);
        margin: 0;
        font-size: 16px;
      }

      .cardText {
        margin: 0;
        color: var(--muted);
        font-size: 14px;
        line-height: 1.45;
      }

      .split {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px;
      }
      @media (max-width: 860px) {
        .split {
          grid-template-columns: 1fr;
        }
      }

      .formGrid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 12px;
      }
      @media (max-width: 720px) {
        .formGrid {
          grid-template-columns: 1fr;
        }
      }

      .field {
        display: flex;
        flex-direction: column;
        gap: 6px;
      }

      label {
        font-size: 13px;
        color: var(--muted);
        font-weight: 700;
      }

      input,
      select,
      textarea {
        width: 100%;
        border: 1px solid var(--border);
        border-radius: 12px;
        background: rgba(255, 255, 255, 0.85);
        padding: 10px 12px;
        color: var(--text-strong);
        font-size: 14px;
        outline: none;
        transition: border-color 0.15s ease, box-shadow 0.15s ease;
      }

      body.theme-dark input,
      body.theme-dark select,
      body.theme-dark textarea {
        background: rgba(2, 6, 23, 0.18);
      }

      textarea {
        min-height: 110px;
        resize: vertical;
      }

      input:focus,
      select:focus,
      textarea:focus {
        border-color: rgba(67, 97, 238, 0.45);
        box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
      }

      .hint {
        color: var(--muted);
        font-size: 12px;
        line-height: 1.4;
      }

      .row {
        display: flex;
        gap: 10px;
        align-items: center;
        flex-wrap: wrap;
      }

      .divider {
        height: 1px;
        background: var(--border);
        margin: 14px 0;
      }

      .bottomNav {
        position: fixed;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 50;
        background: rgba(255, 255, 255, 0.78);
        backdrop-filter: blur(10px);
        border-top: 1px solid var(--border);
      }

      body.theme-dark .bottomNav {
        background: rgba(11, 18, 32, 0.78);
      }

      .bottomNavInner {
        max-width: 980px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(5, minmax(0, 1fr));
      }

      .navItem {
        cursor: pointer;
        border: 0;
        background: transparent;
        padding: 10px 8px;
        color: var(--muted);
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 4px;
        transition: color 0.2s ease, transform 0.15s ease;
      }

      .navItem:hover {
        color: rgba(67, 97, 238, 0.95);
      }

      .navItem.active {
        color: var(--brand-blue);
        font-weight: 900;
      }

      .navItem svg {
        width: 20px;
        height: 20px;
      }

      .navLabel {
        font-size: 11px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 100%;
      }

      .reveal {
        opacity: 0;
        transform: translateY(10px);
        transition: opacity 0.55s ease, transform 0.55s ease;
      }
      .reveal.inView {
        opacity: 1;
        transform: translateY(0);
      }

      .skeleton {
        background: linear-gradient(90deg, rgba(67, 97, 238, 0.08), rgba(67, 97, 238, 0.22), rgba(67, 97, 238, 0.08));
        background-size: 200% 100%;
        animation: skeletonShimmer 1.2s ease-in-out infinite;
        border-radius: 12px;
      }
      @keyframes skeletonShimmer {
        0% {
          background-position: 200% 0;
        }
        100% {
          background-position: -200% 0;
        }
      }

      .skeletonRow {
        height: 14px;
        width: 100%;
      }
      .skeletonRow.md {
        height: 18px;
        width: 70%;
      }

      .videoWrap {
        display: grid;
        grid-template-columns: 1fr;
        gap: 10px;
      }

      video {
        width: 100%;
        border-radius: var(--radius);
        border: 1px solid var(--border);
        background: rgba(2, 6, 23, 0.03);
      }

      .previewImg {
        width: 100%;
        border-radius: var(--radius);
        border: 1px solid var(--border);
        background: rgba(2, 6, 23, 0.02);
      }

      .pillTag {
        padding: 6px 10px;
        border-radius: var(--radius-pill);
        border: 1px solid rgba(20, 184, 166, 0.25);
        background: rgba(20, 184, 166, 0.08);
        color: var(--accent-teal);
        font-weight: 800;
        font-size: 12px;
      }

      /* Modal */
      .modalOverlay {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.42);
        display: grid;
        place-items: center;
        z-index: 999;
        padding: 18px;
      }

      .modal {
        width: min(560px, 100%);
        border-radius: calc(var(--radius) + 6px);
        border: 1px solid var(--border);
        background: rgba(255, 255, 255, 0.9);
        box-shadow: var(--shadow);
        overflow: hidden;
      }

      body.theme-dark .modal {
        background: rgba(2, 6, 23, 0.6);
      }

      .modalHeader {
        padding: 14px 16px;
        border-bottom: 1px solid var(--border);
        background: linear-gradient(
          135deg,
          rgba(67, 97, 238, 0.18),
          rgba(20, 184, 166, 0.12)
        );
      }

      .modalHeader strong {
        font-weight: 900;
        color: var(--text-strong);
      }

      .modalBody {
        padding: 14px 16px;
        color: var(--text);
        line-height: 1.45;
      }

      .modalFooter {
        padding: 14px 16px;
        border-top: 1px solid var(--border);
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        flex-wrap: wrap;
      }

      .footerNote {
        color: var(--muted);
        font-size: 12px;
        margin: 10px 0 24px;
        text-align: center;
      }

      .toast {
        position: fixed;
        left: 50%;
        transform: translateX(-50%);
        bottom: 98px;
        z-index: 1000;
        background: rgba(255, 255, 255, 0.92);
        border: 1px solid var(--border);
        backdrop-filter: blur(10px);
        color: var(--text-strong);
        border-radius: calc(var(--radius) + 6px);
        box-shadow: var(--shadow-soft);
        padding: 10px 12px;
        width: min(560px, calc(100% - 24px));
        font-weight: 800;
        text-align: center;
      }

      body.theme-dark .toast {
        background: rgba(2, 6, 23, 0.72);
        color: var(--text-strong);
      }

      .copyBtn {
        padding: 9px 12px;
        border-radius: var(--radius-pill);
        border: 1px solid var(--border);
        background: transparent;
        font-weight: 900;
        color: var(--text-strong);
        cursor: pointer;
        transition: border-color 0.2s ease, background 0.2s ease;
      }
      .copyBtn:hover {
        border-color: rgba(67, 97, 238, 0.35);
        background: rgba(67, 97, 238, 0.06);
      }
      .copyBtn:focus-visible {
        outline: 2px solid var(--focus);
        outline-offset: 2px;
      }
    </style>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>

    <script src="https://cdn.jsdelivr.net/gh/davidshimjs/qrcodejs/qrcode.min.js"></script>

    <script src="https://unpkg.com/react@17/umd/react.production.min.js"></script>
    <script src="https://unpkg.com/react-dom@17/umd/react-dom.production.min.js"></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

    <script type="text/plain">
      const { useEffect, useMemo, useRef, useState } = React;

      function clamp(n, min, max) {
        return Math.max(min, Math.min(max, n));
      }

      function safeJsonParse(text) {
        try {
          return JSON.parse(text);
        } catch {
          return null;
        }
      }

      function getNowISO() {
        const d = new Date();
        const pad = (x) => String(x).padStart(2, "0");
        return \`\${d.getFullYear()}-\${pad(d.getMonth() + 1)}-\${pad(d.getDate())}\`;
      }

      async function dbRawGet(key) {
        if (window.serverStorage && typeof window.serverStorage.getItem === "function") {
          return new Promise((resolve, reject) => {
            try {
              window.serverStorage.getItem(key, (err, data) => {
                if (err) reject(err);
                else resolve(data);
              });
            } catch (e) {
              reject(e);
            }
          });
        }
        return localStorage.getItem(key);
      }

      async function dbRawSet(key, value) {
        if (window.serverStorage && typeof window.serverStorage.setItem === "function") {
          return new Promise((resolve, reject) => {
            try {
              window.serverStorage.setItem(key, value, (err) => {
                if (err) reject(err);
                else resolve(true);
              });
            } catch (e) {
              reject(e);
            }
          });
        }
        localStorage.setItem(key, value);
        return true;
      }

      async function dbRawRemove(key) {
        if (window.serverStorage && typeof window.serverStorage.removeItem === "function") {
          return new Promise((resolve, reject) => {
            try {
              window.serverStorage.removeItem(key, (err) => {
                if (err) reject(err);
                else resolve(true);
              });
            } catch (e) {
              reject(e);
            }
          });
        }
        localStorage.removeItem(key);
        return true;
      }

      async function dbGetJSON(key, fallback) {
        const raw = await dbRawGet(key);
        if (!raw) return fallback;
        const parsed = safeJsonParse(raw);
        return parsed ?? fallback;
      }

      async function dbSetJSON(key, value) {
        await dbRawSet(key, JSON.stringify(value));
      }

      function Icon(props) {
        return (
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" {...props} />
        );
      }

      function IconHome() {
        return (
          <Icon>
            <path d="M3 10.5L12 3l9 7.5" />
            <path d="M5 9.8V21h14V9.8" />
          </Icon>
        );
      }

      function IconScan() {
        return (
          <Icon>
            <path d="M4 7V4h3" />
            <path d="M20 7V4h-3" />
            <path d="M4 17v3h3" />
            <path d="M20 17v3h-3" />
            <path d="M7 12h10" />
          </Icon>
        );
      }

      function IconQR() {
        return (
          <Icon>
            <path d="M4 4h6v6H4z" />
            <path d="M14 4h6v6h-6z" />
            <path d="M4 14h6v6H4z" />
            <path d="M14 14h2v2h-2z" />
            <path d="M18 18h2v2h-2z" />
            <path d="M14 18h6" />
          </Icon>
        );
      }

      function IconDoctor() {
        return (
          <Icon>
            <path d="M10 2h4" />
            <path d="M12 2v20" />
            <path d="M3.5 6.5h17" />
            <path d="M6 10.5v-1a3 3 0 0 1 3-3h6a3 3 0 0 1 3 3v1" />
            <path d="M9 18a3 3 0 0 0 6 0" />
          </Icon>
        );
      }

      function IconInfo() {
        return (
          <Icon>
            <circle cx="12" cy="12" r="9" />
            <path d="M12 11v6" />
            <path d="M12 8h.01" />
          </Icon>
        );
      }

      function IconSunMoon({ dark }) {
        return (
          <Icon>
            {dark ? (
              <>
                <path d="M12 18a6 6 0 0 1 0-12 8 8 0 0 0 0 12Z" />
              </>
            ) : (
              <>
                <circle cx="12" cy="12" r="4" />
                <path d="M12 2v2" />
                <path d="M12 20v2" />
                <path d="M4.93 4.93l1.41 1.41" />
                <path d="M17.66 17.66l1.41 1.41" />
                <path d="M2 12h2" />
                <path d="M20 12h2" />
                <path d="M4.93 19.07l1.41-1.41" />
                <path d="M17.66 6.34l1.41-1.41" />
              </>
            )}
          </Icon>
        );
      }

      function IconTextSize() {
        return (
          <Icon>
            <path d="M5 19V5" />
            <path d="M19 19V5" />
            <path d="M5 12h14" />
          </Icon>
        );
      }

      function Modal({ modal, onClose }) {
        if (!modal) return null;
        const { type, title, message, confirmText, cancelText, onConfirm } = modal;
        const isError = type === "error";
        const isSuccess = type === "success";
        const isConfirm = type === "confirm";
        return (
          <div
            className="modalOverlay"
            role="dialog"
            aria-modal="true"
            onMouseDown={(e) => {
              if (e.target === e.currentTarget) onClose?.();
            }}
          >
            <div className="modal">
              <div className="modalHeader">
                <strong>
                  {title || (isError ? "เกิดข้อผิดพลาด" : isSuccess ? "สำเร็จ" : "ยืนยันการทำรายการ")}
                </strong>
              </div>
              <div className="modalBody">{message}</div>
              <div className="modalFooter">
                {isConfirm ? (
                  <>
                    <button className="btn ghost" onClick={onClose}>
                      {cancelText || "ยกเลิก"}
                    </button>
                    <button
                      className="btn"
                      onClick={() => {
                        onConfirm?.();
                        onClose?.();
                      }}
                    >
                      {confirmText || "ยืนยัน"}
                    </button>
                  </>
                ) : (
                  <button className="btn" onClick={onClose}>
                    {isError ? "เข้าใจแล้ว" : "ปิด"}
                  </button>
                )}
              </div>
            </div>
          </div>
        );
      }

      function useRevealOnScroll() {
        useEffect(() => {
          const els = Array.from(document.querySelectorAll(".reveal"));
          if (!("IntersectionObserver" in window)) {
            els.forEach((el) => el.classList.add("inView"));
            return;
          }
          const obs = new IntersectionObserver(
            (entries) => {
              entries.forEach((entry) => {
                if (entry.isIntersecting) entry.target.classList.add("inView");
              });
            },
            { threshold: 0.12 }
          );
          els.forEach((el) => obs.observe(el));
          return () => obs.disconnect();
        }, []);
      }

      function SkeletonBlock({ variant }) {
        if (variant === "hero") {
          return (
            <div className="card" style={{ padding: 16 }}>
              <div className="skeleton skeletonRow md" />
              <div style={{ height: 10 }} />
              <div className="skeleton skeletonRow" style={{ width: "88%" }} />
              <div style={{ height: 10 }} />
              <div className="skeleton skeletonRow" style={{ width: "76%" }} />
              <div style={{ height: 14 }} />
              <div className="skeleton skeletonRow" style={{ height: 42, borderRadius: 999 }} />
            </div>
          );
        }
        return (
          <div className="card">
            <div className="skeleton skeletonRow md" />
            <div style={{ height: 10 }} />
            <div className="skeleton skeletonRow" style={{ width: "92%" }} />
            <div style={{ height: 10 }} />
            <div className="skeleton skeletonRow" style={{ width: "82%" }} />
          </div>
        );
      }

      function CopyButton({ text, label }) {
        return (
          <button
            className="copyBtn"
            onClick={async () => {
              try {
                await navigator.clipboard.writeText(text || "");
              } catch {
                // fallback: do nothing (browser may block)
              }
            }}
          >
            {label || "คัดลอก"}
          </button>
        );
      }

      function App() {
        const [tab, setTab] = useState("home");
        const [modal, setModal] = useState(null);

        const SETTINGS_KEY = "medlink:settings:v1";
        const SCAN_HISTORY_KEY = "medlink:scan_history:v1";
        const QR_HISTORY_KEY = "medlink:qr_last:v1";

        const [theme, setTheme] = useState("light");
        const [sizeMode, setSizeMode] = useState("standard"); // standard | elderly

        const [scanHistory, setScanHistory] = useState([]);
        const [qrLast, setQrLast] = useState(null);

        const isDark = theme === "dark";
        useRevealOnScroll();

        useEffect(() => {
          (async () => {
            const s = await dbGetJSON(SETTINGS_KEY, { theme: "light", sizeMode: "standard" });
            setTheme(s.theme === "dark" ? "dark" : "light");
            setSizeMode(s.sizeMode === "elderly" ? "elderly" : "standard");

            const history = await dbGetJSON(SCAN_HISTORY_KEY, []);
            setScanHistory(Array.isArray(history) ? history : []);

            const last = await dbGetJSON(QR_HISTORY_KEY, null);
            setQrLast(last || null);
          })();
        }, []);

        useEffect(() => {
          document.body.classList.toggle("theme-dark", isDark);
          const base = sizeMode === "elderly" ? "18px" : "16px";
          document.documentElement.style.setProperty("--base-font", base);
          dbSetJSON(SETTINGS_KEY, { theme, sizeMode }).catch(() => {});
        }, [theme, sizeMode]);

        const [toast, setToast] = useState(null);
        const toastTimer = useRef(null);
        function showToast(msg) {
          setToast(msg);
          if (toastTimer.current) clearTimeout(toastTimer.current);
          toastTimer.current = setTimeout(() => setToast(null), 2400);
        }

        return (
          <div className="appShell">
            <div className="topBar">
              <div className="topBarInner">
                <div className="brand">
                  <div className="brandMark" aria-hidden="true">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                      <path d="M12 2v20" />
                      <path d="M2 12h20" />
                    </svg>
                  </div>
                  <div className="brandTitle">
                    <strong>MedLink</strong>
                    <span>เมดลิงก์สำหรับดูแลสุขภาพ</span>
                  </div>
                </div>
                <div className="topActions">
                  <button
                    className="iconButton"
                    onClick={() => setSizeMode((m) => (m === "elderly" ? "standard" : "elderly"))}
                    title="สลับขนาดตัวอักษร"
                    aria-label="สลับขนาดตัวอักษร"
                  >
                    <IconTextSize />
                  </button>
                  <button
                    className="iconButton"
                    onClick={() => setTheme((t) => (t === "dark" ? "light" : "dark"))}
                    title="สลับโหมดแสง/มืด"
                    aria-label="สลับโหมดแสง/มืด"
                  >
                    <IconSunMoon dark={isDark} />
                  </button>
                </div>
              </div>
            </div>

            <div className="container">
              {tab === "home" && (
                <>
                  <div className="hero reveal">
                    <div className="heroInner">
                      <div>
                        <h1>สแกนยา สร้าง QR บันทึกสุขภาพ</h1>
                        <p>
                          MedLink (เมดลิงก์) ช่วยคุณสแกนฉลากยาเพื่อสรุปข้อมูลที่อ่านง่าย และสร้าง Health QR สำหรับใช้เมื่อจำเป็น
                        </p>
                        <div className="heroActions">
                          <button className="btn" onClick={() => setTab("scan")}>
                            <IconScan /> เริ่มสแกนยา
                          </button>
                          <button className="btn secondary" onClick={() => setTab("qr")}>
                            <IconQR /> สร้าง Health QR
                          </button>
                        </div>
                      </div>
                      <div className="card" style={{ padding: 16 }}>
                        <div className="pillTag">คลินิก & เรียบสะอาด</div>
                        <div style={{ height: 10 }} />
                        <p className="cardText" style={{ marginTop: 0 }}>
                          เน้นอ่านง่าย ปรับขนาดตัวอักษรสำหรับผู้สูงอายุได้ และโหมดมืด/สว่าง
                        </p>
                        <div className="divider" />
                        <div className="row">
                          <span className="pillTag" style={{ borderColor: "rgba(67,97,238,.25)", background: "rgba(67,97,238,.08)", color: "var(--brand-blue)" }}>
                            UI เป็นภาษาไทยทั้งหมด
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div className="gridCards">
                    <div className="card reveal">
                      <div className="cardHeader">
                        <div className="cardIcon">
                          <IconScan />
                        </div>
                        <p className="cardTitle">Medication Scanner</p>
                      </div>
                      <p className="cardText">รองรับกล้องและอัปโหลดไฟล์ แล้วสรุปชื่อยา วิธีใช้ คำเตือน และอื่นๆ</p>
                    </div>
                    <div className="card reveal">
                      <div className="cardHeader">
                        <div className="cardIcon" style={{ color: "var(--accent-teal)" }}>
                          <IconQR />
                        </div>
                        <p className="cardTitle">Health QR</p>
                      </div>
                      <p className="cardText">สร้าง QR ข้อมูลผู้ป่วยแบบดาวน์โหลดได้ พร้อมกรอกข้อมูลที่เกี่ยวข้อง</p>
                    </div>
                    <div className="card reveal">
                      <div className="cardHeader">
                        <div className="cardIcon">
                          <IconDoctor />
                        </div>
                        <p className="cardTitle">ช่วยสื่อสารกับแพทย์</p>
                      </div>
                      <p className="cardText">สรุปอาการและประวัติยาเพื่อคัดลอกข้อความส่งให้แพทย์ได้ทันที</p>
                    </div>
                  </div>
                </>
              )}

              {tab === "scan" && (
                <ScanMedicine
                  onNavigate={(t) => setTab(t)}
                  scanHistory={scanHistory}
                  setScanHistory={setScanHistory}
                  onModal={(m) => setModal(m)}
                  onToast={showToast}
                  SCAN_HISTORY_KEY={SCAN_HISTORY_KEY}
                />
              )}

              {tab === "qr" && (
                <HealthQR
                  onModal={(m) => setModal(m)}
                  onToast={showToast}
                  qrLast={qrLast}
                  setQrLast={setQrLast}
                  QR_HISTORY_KEY={QR_HISTORY_KEY}
                />
              )}

              {tab === "doctor" && <ConsultDoctor onModal={(m) => setModal(m)} onToast={showToast} />}

              {tab === "about" && <About />}

              <div className="footerNote">
                © {new Date().getFullYear()} MedLink (เมดลิงก์) · ทำเพื่อช่วยให้ข้อมูลสุขภาพเข้าถึงง่ายขึ้น ·
                <span style={{ fontWeight: 800, color: "var(--text-strong)" }}>ติดต่อ:</span> support@medlink.example
              </div>
            </div>

            <div className="bottomNav">
              <div className="bottomNavInner">
                <button className={"navItem " + (tab === "home" ? "active" : "")} onClick={() => setTab("home")} aria-label="หน้าแรก">
                  <IconHome />
                  <div className="navLabel">หน้าหลัก</div>
                </button>
                <button className={"navItem " + (tab === "scan" ? "active" : "")} onClick={() => setTab("scan")} aria-label="สแกนยา">
                  <IconScan />
                  <div className="navLabel">สแกนยา</div>
                </button>
                <button className={"navItem " + (tab === "qr" ? "active" : "")} onClick={() => setTab("qr")} aria-label="Health QR">
                  <IconQR />
                  <div className="navLabel">Health QR</div>
                </button>
                <button className={"navItem " + (tab === "doctor" ? "active" : "")} onClick={() => setTab("doctor")} aria-label="ปรึกษาแพทย์">
                  <IconDoctor />
                  <div className="navLabel">แพทย์</div>
                </button>
                <button className={"navItem " + (tab === "about" ? "active" : "")} onClick={() => setTab("about")} aria-label="เกี่ยวกับแอป">
                  <IconInfo />
                  <div className="navLabel">เกี่ยวกับ</div>
                </button>
              </div>
            </div>

            {toast && (
              <div className="toast" role="status" aria-live="polite">
                {toast}
              </div>
            )}

            <Modal modal={modal} onClose={() => setModal(null)} />
          </div>
        );
      }

      function ScanMedicine({ scanHistory, setScanHistory, onModal, onToast, SCAN_HISTORY_KEY }) {
        const [method, setMethod] = useState("upload"); // upload | camera
        const [apiKey, setApiKey] = useState("");
        const [model, setModel] = useState("gpt-4o-mini");
        const [detail, setDetail] = useState("high");

        const [imageDataUrl, setImageDataUrl] = useState(null);
        const [previewName, setPreviewName] = useState("");

        const [cameraOn, setCameraOn] = useState(false);
        const videoRef = useRef(null);
        const streamRef = useRef(null);

        const [isAnalyzing, setIsAnalyzing] = useState(false);
        const [result, setResult] = useState(null);

        useEffect(() => {
          return () => {
            if (streamRef.current) {
              streamRef.current.getTracks().forEach((t) => t.stop());
              streamRef.current = null;
            }
          };
        }, []);

        async function startCamera() {
          try {
            const stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" }, audio: false });
            streamRef.current = stream;
            setCameraOn(true);
            if (videoRef.current) videoRef.current.srcObject = stream;
          } catch (e) {
            onModal({
              type: "error",
              message: "ไม่สามารถเปิดกล้องได้ โปรดตรวจสอบสิทธิ์การใช้งานกล้องและลองใหม่อีกครั้ง"
            });
          }
        }

        function stopCamera() {
          if (streamRef.current) {
            streamRef.current.getTracks().forEach((t) => t.stop());
            streamRef.current = null;
          }
          setCameraOn(false);
        }

        async function captureFromCamera() {
          const video = videoRef.current;
          if (!video) return;
          const w = video.videoWidth || 1280;
          const h = video.videoHeight || 720;
          const canvas = document.createElement("canvas");
          canvas.width = w;
          canvas.height = h;
          const ctx = canvas.getContext("2d");
          ctx.drawImage(video, 0, 0, w, h);
          const dataUrl = canvas.toDataURL("image/jpeg", 0.92);
          setImageDataUrl(dataUrl);
          setPreviewName("กล้อง");
          stopCamera();
        }

        function fileToDataUrl(file) {
          return new Promise((resolve, reject) => {
            const r = new FileReader();
            r.onload = () => resolve(String(r.result));
            r.onerror = reject;
            r.readAsDataURL(file);
          });
        }

        async function analyze() {
          if (!imageDataUrl) {
            onModal({ type: "error", message: "กรุณาเลือก/ถ่ายภาพยาก่อนเริ่มวิเคราะห์" });
            return;
          }
          if (!apiKey.trim()) {
            onModal({
              type: "error",
              title: "ต้องใส่ API Key",
              message: "โปรดใส่ OpenAI API Key ในช่องด้านล่างก่อน เพราะแอปนี้เรียก API จากเบราว์เซอร์ของคุณโดยตรง"
            });
            return;
          }

          setIsAnalyzing(true);
          setResult(null);
          try {
            const prompt = \`
คุณคือผู้ช่วยด้านข้อมูลยาเพื่อช่วยอ่านฉลากเท่านั้น (ไม่ใช่คำแนะนำทางการแพทย์โดยตรง)

จากภาพที่ให้มา โปรดวิเคราะห์และสรุปผลเป็น JSON เท่านั้น (ห้ามตอบข้อความอื่นนอกเหนือจาก JSON) และใช้ภาษาไทย

รูปแบบ JSON (ต้องมีทุกคีย์):
{
  "med_name_dose": "ชื่อยาและขนาดยา",
  "how_to_use": "สรุปวิธีใช้ภาษาไทย",
  "warnings": "คำเตือน/ข้อห้ามที่เกี่ยวข้อง",
  "interactions": "ปฏิกิริยาระหว่างยา (ถ้าพอระบุได้)",
  "missed_dose": "คำแนะนำกรณีลืมทาน",
  "confidence": 0,
  "confidence_explanation": "เหตุผลสั้นๆ ของระดับความมั่นใจ"
}

ถ้าข้อมูลไม่ชัด ให้เติมข้อความว่า \"ไม่พบข้อมูลที่ชัดเจน\" และให้ confidence ต่ำลง
            \`.trim();

            const body = {
              model,
              input: [
                {
                  role: "system",
                  content: [
                    {
                      type: "input_text",
                      text: "คุณต้องตอบเป็น JSON เท่านั้น"
                    }
                  ]
                },
                {
                  role: "user",
                  content: [
                    { type: "input_text", text: prompt },
                    { type: "input_image", image_url: imageDataUrl, detail }
                  ]
                }
              ],
              text: { format: { type: "json_object" } },
              max_output_tokens: 700
            };

            const resp = await fetch("https://api.openai.com/v1/responses", {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                Authorization: \`Bearer \${apiKey.trim()}\`
              },
              body: JSON.stringify(body)
            });

            const data = await resp.json().catch(() => ({}));

            if (!resp.ok) {
              throw new Error(data?.error?.message || "เรียก API ไม่สำเร็จ");
            }

            const textOut = data.output_text || (() => {
              try {
                const parts = data.output?.[0]?.content;
                if (!Array.isArray(parts)) return null;
                const t = parts.map((p) => p?.text).filter(Boolean).join("");
                return t || null;
              } catch {
                return null;
              }
            })();

            const parsed = safeJsonParse(textOut || "");
            if (!parsed) {
              throw new Error("ไม่สามารถอ่านผล JSON จาก API ได้");
            }

            const normalized = {
              med_name_dose: String(parsed.med_name_dose || ""),
              how_to_use: String(parsed.how_to_use || ""),
              warnings: String(parsed.warnings || ""),
              interactions: String(parsed.interactions || ""),
              missed_dose: String(parsed.missed_dose || ""),
              confidence: typeof parsed.confidence === "number" ? parsed.confidence : Number(parsed.confidence || 0),
              confidence_explanation: String(parsed.confidence_explanation || "")
            };

            setResult(normalized);

            const entry = {
              id: "scan_" + Math.random().toString(16).slice(2),
              createdAt: new Date().toISOString(),
              previewName,
              inputMeta: { model, detail },
              imageDataUrl: null, // เก็บเฉพาะภาพไว้ในเครื่อง ไม่เก็บในประวัติ
              result: normalized
            };

            const next = [entry, ...scanHistory].slice(0, 12);
            setScanHistory(next);
            await dbSetJSON(SCAN_HISTORY_KEY, next);

            onModal({ type: "success", message: "วิเคราะห์ยาเรียบร้อยแล้ว" });
          } catch (e) {
            onModal({ type: "error", message: "เกิดข้อผิดพลาดระหว่างการวิเคราะห์: " + (e?.message || String(e)) });
          } finally {
            setIsAnalyzing(false);
          }
        }

        const confidenceScore = result ? clamp(Number(result.confidence || 0), 0, 1) : null;

        return (
          <>
            <div className="pageTitle">สแกนยา</div>
            <div className="pageSub">เลือกวิธีสแกน แล้วให้ AI สรุปข้อมูลสำคัญจากภาพฉลากยา</div>

            <div className="split">
              <div className="card reveal">
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <div className="row">
                    <span className="pillTag" style={{ borderColor: "rgba(67,97,238,.25)", background: "rgba(67,97,238,.08)", color: "var(--brand-blue)" }}>
                      ขั้นตอนที่ 1
                    </span>
                    <strong style={{ color: "var(--text-strong)" }}>เลือกภาพยา</strong>
                  </div>
                  <div className="row">
                    <button
                      className={"btn ghost"}
                      style={{ padding: "9px 12px" }}
                      onClick={() => {
                        setMethod("camera");
                        setImageDataUrl(null);
                        setResult(null);
                      }}
                    >
                      กล้อง
                    </button>
                    <button
                      className={"btn ghost"}
                      style={{ padding: "9px 12px" }}
                      onClick={() => {
                        setMethod("upload");
                        setImageDataUrl(null);
                        setResult(null);
                      }}
                    >
                      อัปโหลด
                    </button>
                  </div>
                </div>

                <div className="divider" />

                {method === "camera" && (
                  <div className="videoWrap">
                    {!cameraOn ? (
                      <button className="btn" onClick={startCamera}>
                        <IconScan /> เริ่มเปิดกล้อง
                      </button>
                    ) : (
                      <>
                        <video ref={videoRef} playsInline autoPlay />
                        <div className="row" style={{ justifyContent: "space-between" }}>
                          <button className="btn ghost" onClick={stopCamera}>
                            ยกเลิกกล้อง
                          </button>
                          <button className="btn" onClick={captureFromCamera}>
                            ถ่ายรูปเพื่อวิเคราะห์
                          </button>
                        </div>
                      </>
                    )}
                  </div>
                )}

                {method === "upload" && (
                  <div className="videoWrap">
                    <label style={{ cursor: "pointer" }}>
                      เลือกรูปจากเครื่อง (PNG/JPG/WEBP)
                      <input
                        style={{ display: "block", marginTop: 8 }}
                        type="file"
                        accept="image/*"
                        onChange={async (e) => {
                          const file = e.target.files?.[0];
                          if (!file) return;
                          setPreviewName(file.name);
                          setResult(null);
                          const dataUrl = await fileToDataUrl(file);
                          setImageDataUrl(dataUrl);
                        }}
                      />
                    </label>
                    <div className="hint">แนะนำให้ถ่ายให้เห็นชื่อยาและขนาดยาชัดเจนที่สุด</div>
                  </div>
                )}

                {imageDataUrl && (
                  <>
                    <div className="divider" />
                    <img src={imageDataUrl} className="previewImg" alt="ภาพตัวอย่างยา" />
                    <div className="row" style={{ justifyContent: "space-between", marginTop: 10 }}>
                      <span className="hint">ไฟล์: {previewName}</span>
                      <button
                        className="btn secondary"
                        onClick={() => {
                          setImageDataUrl(null);
                          setPreviewName("");
                          setResult(null);
                        }}
                        style={{ padding: "9px 12px" }}
                      >
                        เริ่มใหม่
                      </button>
                    </div>
                  </>
                )}
              </div>

              <div className="card reveal">
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <div className="row">
                    <span className="pillTag">ขั้นตอนที่ 2</span>
                    <strong style={{ color: "var(--text-strong)" }}>ตั้งค่า AI & วิเคราะห์</strong>
                  </div>
                </div>

                <div className="divider" />

                <div className="field">
                  <label>OpenAI API Key</label>
                  <input
                    value={apiKey}
                    type="password"
                    placeholder="ใส่เฉพาะค่าคีย์ของคุณ"
                    onChange={(e) => setApiKey(e.target.value)}
                  />
                  <div className="hint">
                    หมายเหตุ: แอปนี้เรียก API จากฝั่งเบราว์เซอร์ ดังนั้นคุณควรใช้คีย์ส่วนตัวของคุณเท่านั้น
                  </div>
                </div>

                <div style={{ height: 12 }} />

                <div className="formGrid">
                  <div className="field">
                    <label>โมเดล (vision)</label>
                    <select value={model} onChange={(e) => setModel(e.target.value)}>
                      <option value="gpt-4o-mini">gpt-4o-mini</option>
                      <option value="gpt-4.1-mini">gpt-4.1-mini</option>
                      <option value="gpt-4.1-nano">gpt-4.1-nano</option>
                    </select>
                  </div>
                  <div className="field">
                    <label>ระดับรายละเอียดภาพ</label>
                    <select value={detail} onChange={(e) => setDetail(e.target.value)}>
                      <option value="low">low</option>
                      <option value="high">high</option>
                      <option value="auto">auto</option>
                      <option value="original">original</option>
                    </select>
                  </div>
                </div>

                <div style={{ height: 14 }} />

                <div className="row" style={{ justifyContent: "space-between" }}>
                  <button className="btn ghost" onClick={() => {
                    setResult(null);
                    onToast("ล้างผลลัพธ์แล้ว");
                  }}>
                    ล้างผล
                  </button>
                  <button className="btn" onClick={analyze} disabled={!imageDataUrl || isAnalyzing} style={{ opacity: (!imageDataUrl || isAnalyzing) ? 0.65 : 1 }}>
                    {isAnalyzing ? "กำลังวิเคราะห์..." : "เริ่มวิเคราะห์"}
                  </button>
                </div>

                {isAnalyzing && (
                  <div style={{ marginTop: 14 }}>
                    <div className="skeleton" style={{ height: 18 }} />
                    <div style={{ height: 10 }} />
                    <div className="skeleton" style={{ height: 46, borderRadius: 16 }} />
                    <div style={{ height: 10 }} />
                    <div className="skeleton" style={{ height: 14, borderRadius: 12, width: "85%" }} />
                  </div>
                )}
              </div>
            </div>

            {result && (
              <div style={{ marginTop: 12 }} className="card reveal">
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <strong style={{ color: "var(--text-strong)", fontSize: 16 }}>ผลการวิเคราะห์</strong>
                  {confidenceScore !== null && (
                    <span className="pillTag" style={{ borderColor: "rgba(20,184,166,.25)", background: "rgba(20,184,166,.10)" }}>
                      ความมั่นใจ: {Math.round(confidenceScore * 100)}%
                    </span>
                  )}
                </div>
                <div className="divider" />
                <div className="gridCards" style={{ gridTemplateColumns: "repeat(3, minmax(0, 1fr))" }}>
                  <div className="card" style={{ boxShadow: "none", background: "transparent" }}>
                    <div className="cardHeader">
                      <div className="cardIcon">
                        <IconScan />
                      </div>
                      <p className="cardTitle">ชื่อยา/ขนาดยา</p>
                    </div>
                    <p className="cardText">{result.med_name_dose || "-"}</p>
                  </div>
                  <div className="card" style={{ boxShadow: "none", background: "transparent" }}>
                    <div className="cardHeader">
                      <div className="cardIcon" style={{ color: "var(--accent-teal)" }}>
                        <IconQR />
                      </div>
                      <p className="cardTitle">วิธีใช้</p>
                    </div>
                    <p className="cardText">{result.how_to_use || "-"}</p>
                  </div>
                  <div className="card" style={{ boxShadow: "none", background: "transparent" }}>
                    <div className="cardHeader">
                      <div className="cardIcon">
                        <IconDoctor />
                      </div>
                      <p className="cardTitle">คำเตือน/ข้อห้าม</p>
                    </div>
                    <p className="cardText">{result.warnings || "-"}</p>
                  </div>
                </div>

                <div className="divider" />

                <div className="split">
                  <div className="card" style={{ boxShadow: "none", background: "transparent" }}>
                    <p className="cardTitle" style={{ marginTop: 0 }}>ปฏิกิริยาระหว่างยา</p>
                    <p className="cardText">{result.interactions || "-"}</p>
                  </div>
                  <div className="card" style={{ boxShadow: "none", background: "transparent" }}>
                    <p className="cardTitle" style={{ marginTop: 0 }}>กรณีลืมทาน</p>
                    <p className="cardText">{result.missed_dose || "-"}</p>
                  </div>
                </div>

                <div className="divider" />
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <strong style={{ color: "var(--text-strong)" }}>คำอธิบายความมั่นใจ</strong>
                  <span className="hint">อิงจากความชัดของข้อความบนภาพ</span>
                </div>
                <p className="cardText" style={{ marginTop: 8 }}>{result.confidence_explanation || "-"}</p>
              </div>
            )}

            <div style={{ marginTop: 12 }} className="card reveal">
              <div className="row" style={{ justifyContent: "space-between" }}>
                <div className="row">
                  <span className="pillTag" style={{ borderColor: "rgba(67,97,238,.25)", background: "rgba(67,97,238,.08)", color: "var(--brand-blue)" }}>
                    ประวัติการสแกน
                  </span>
                  <strong style={{ color: "var(--text-strong)" }}>ล่าสุด {Math.min(12, scanHistory.length)} รายการ</strong>
                </div>
                <button
                  className="btn ghost"
                  style={{ padding: "9px 12px" }}
                  onClick={() => {
                    onModal({
                      type: "confirm",
                      title: "ล้างประวัติ?",
                      message: "คุณแน่ใจหรือไม่ว่าต้องการล้างประวัติการสแกนทั้งหมด",
                      confirmText: "ล้างประวัติ",
                      cancelText: "ยกเลิก",
                      onConfirm: async () => {
                        setScanHistory([]);
                        await dbRawSet(SCAN_HISTORY_KEY, "[]");
                        onToast("ล้างประวัติแล้ว");
                      }
                    });
                  }}
                >
                  ล้างประวัติ
                </button>
              </div>
              <div className="divider" />
              {scanHistory.length === 0 ? (
                <p className="cardText">ยังไม่มีประวัติการสแกน</p>
              ) : (
                <div style={{ display: "grid", gap: 10 }}>
                  {scanHistory.slice(0, 8).map((h) => (
                    <div key={h.id} className="card" style={{ boxShadow: "none" }}>
                      <div className="row" style={{ justifyContent: "space-between" }}>
                        <div>
                          <strong style={{ color: "var(--text-strong)" }}>{h.result?.med_name_dose || "ไม่ทราบชื่อยา"}</strong>
                          <div className="hint">{new Date(h.createdAt).toLocaleString("th-TH")}</div>
                        </div>
                        <button
                          className="btn secondary"
                          style={{ padding: "9px 12px" }}
                          onClick={() => {
                            setResult(h.result);
                            onToast("โหลดผลการสแกนแล้ว");
                          }}
                        >
                          ดูผล
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </>
        );
      }

      function HealthQR({ onModal, onToast, qrLast, setQrLast, QR_HISTORY_KEY }) {
        const [patient, setPatient] = useState({
          name: "",
          idCode: "",
          dob: "",
          conditions: "",
          allergies: "",
          meds: "",
          emergency: "",
          updated: getNowISO(),
          bloodType: "O+"
        });

        const [payload, setPayload] = useState("");
        const [qrReady, setQrReady] = useState(false);
        const qrElRef = useRef(null);

        useEffect(() => {
          if (qrLast) {
            setPatient((p) => ({ ...p, ...qrLast }));
            if (qrLast?.payload) {
              setPayload(qrLast.payload);
              setQrReady(true);
            }
          }
        }, []);

        function buildPayload(p) {
          const record = {
            v: 1,
            createdAt: p.updated || getNowISO(),
            patient: {
              name: p.name || "",
              idCode: p.idCode || "",
              dob: p.dob || "",
              conditions: p.conditions || "",
              allergies: p.allergies || "",
              meds: p.meds || "",
              emergency: p.emergency || "",
              bloodType: p.bloodType || ""
            }
          };
          const json = JSON.stringify(record);
          // reduce size: base64
          const base64 = btoa(unescape(encodeURIComponent(json)));
          return base64;
        }

        function renderQRCode(text) {
          if (!qrElRef.current) return;
          qrElRef.current.innerHTML = "";
          // Use the in-file QRCode global created above
          const el = document.createElement("div");
          qrElRef.current.appendChild(el);
          new QRCode(el, {
            text,
            width: 256,
            height: 256,
            colorDark: "#0b1220",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.M
          });
        }

        useEffect(() => {
          if (qrReady && payload) {
            renderQRCode(payload);
          }
        }, [qrReady, payload]);

        async function generate() {
          const p = { ...patient, updated: patient.updated || getNowISO() };
          const pl = buildPayload(p);
          setPayload(pl);
          setQrReady(true);
          const store = { ...p, payload: pl };
          try {
            await dbSetJSON(QR_HISTORY_KEY, store);
            setQrLast(store);
            onToast("สร้าง Health QR แล้ว");
          } catch (e) {
            onModal({ type: "error", message: "สร้าง Health QR ไม่สำเร็จ: " + (e?.message || String(e)) });
          }
        }

        function downloadPNG() {
          if (!qrElRef.current) return;
          const canvas = qrElRef.current.querySelector("canvas");
          if (!canvas) {
            onModal({ type: "error", message: "ดาวน์โหลดไม่สำเร็จ: ไม่พบรูป QR แบบ canvas" });
            return;
          }
          const url = canvas.toDataURL("image/png");
          const a = document.createElement("a");
          a.href = url;
          a.download = "MedLink-HealthQR.png";
          document.body.appendChild(a);
          a.click();
          a.remove();
        }

        return (
          <>
            <div className="pageTitle">Health QR</div>
            <div className="pageSub">กรอกข้อมูลผู้ป่วย แล้วสร้าง QR ที่ดาวน์โหลดได้</div>

            <div className="split">
              <div className="card reveal">
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <div className="row">
                    <span className="pillTag" style={{ borderColor: "rgba(67,97,238,.25)", background: "rgba(67,97,238,.08)", color: "var(--brand-blue)" }}>
                      ฟอร์มข้อมูล
                    </span>
                    <strong style={{ color: "var(--text-strong)" }}>ข้อมูลผู้ป่วย</strong>
                  </div>
                  <button className="btn" style={{ padding: "9px 12px" }} onClick={generate}>
                    สร้าง Health QR
                  </button>
                </div>

                <div className="divider" />

                <div className="formGrid">
                  <div className="field">
                    <label>ชื่อ-นามสกุล</label>
                    <input value={patient.name} onChange={(e) => setPatient((p) => ({ ...p, name: e.target.value }))} placeholder="เช่น สมชาย ใจดี" />
                  </div>
                  <div className="field">
                    <label>เลขบัตร/รหัสผู้ป่วย</label>
                    <input value={patient.idCode} onChange={(e) => setPatient((p) => ({ ...p, idCode: e.target.value }))} placeholder="เช่น 1234567890123" />
                  </div>
                  <div className="field">
                    <label>วันเกิด</label>
                    <input type="date" value={patient.dob} onChange={(e) => setPatient((p) => ({ ...p, dob: e.target.value }))} />
                  </div>
                  <div className="field">
                    <label>กรุ๊ปเลือด</label>
                    <select value={patient.bloodType} onChange={(e) => setPatient((p) => ({ ...p, bloodType: e.target.value }))}>
                      <option value="O+">O+</option>
                      <option value="O-">O-</option>
                      <option value="A+">A+</option>
                      <option value="A-">A-</option>
                      <option value="B+">B+</option>
                      <option value="B-">B-</option>
                      <option value="AB+">AB+</option>
                      <option value="AB-">AB-</option>
                    </select>
                  </div>
                  <div className="field">
                    <label>โรคประจำตัว</label>
                    <input value={patient.conditions} onChange={(e) => setPatient((p) => ({ ...p, conditions: e.target.value }))} placeholder="เช่น ความดัน เบาหวาน" />
                  </div>
                  <div className="field">
                    <label>การแพ้ยา</label>
                    <input value={patient.allergies} onChange={(e) => setPatient((p) => ({ ...p, allergies: e.target.value }))} placeholder="เช่น แพ้เพนนิซิลลิน" />
                  </div>
                  <div className="field">
                    <label>รายการยาที่ใช้</label>
                    <input value={patient.meds} onChange={(e) => setPatient((p) => ({ ...p, meds: e.target.value }))} placeholder="เช่น ยาความดัน, ยาละลายลิ่มเลือด" />
                  </div>
                  <div className="field">
                    <label>ผู้ติดต่อฉุกเฉิน</label>
                    <input value={patient.emergency} onChange={(e) => setPatient((p) => ({ ...p, emergency: e.target.value }))} placeholder="ชื่อ-เบอร์โทร" />
                  </div>
                  <div className="field">
                    <label>วันที่อัปเดตล่าสุด</label>
                    <input type="date" value={patient.updated} onChange={(e) => setPatient((p) => ({ ...p, updated: e.target.value }))} />
                  </div>
                  <div className="field">
                    <label>อัปเดตอัตโนมัติ</label>
                    <div className="hint">กรอกเสร็จแล้วกด “สร้าง Health QR” เพื่ออัปเดตไฟล์</div>
                  </div>
                </div>
              </div>

              <div className="card reveal">
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <div className="row">
                    <span className="pillTag">ตัวอย่าง QR</span>
                    <strong style={{ color: "var(--text-strong)" }}>ดาวน์โหลดได้</strong>
                  </div>
                </div>
                <div className="divider" />
                <div className="row" style={{ justifyContent: "center" }}>
                  <div style={{ width: 270 }}>
                    <div
                      ref={qrElRef}
                      style={{ width: 256, height: 256, margin: "0 auto" }}
                    />
                  </div>
                </div>
                <div style={{ height: 12 }} />
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <button className="btn ghost" style={{ padding: "9px 12px" }} onClick={() => {
                    if (!payload) {
                      onModal({ type: "error", message: "กรุณาสร้าง QR ก่อนดาวน์โหลด" });
                      return;
                    }
                    downloadPNG();
                  }}>
                    ดาวน์โหลด QR (PNG)
                  </button>
                  <button className="btn secondary" style={{ padding: "9px 12px" }} onClick={() => {
                    if (!payload) return;
                    navigator.clipboard.writeText(payload).then(() => onToast("คัดลอกข้อมูล QR แล้ว"));
                  }}>
                    คัดลอกข้อมูล
                  </button>
                </div>
                <div style={{ height: 10 }} />
                <div className="hint">
                  หมายเหตุ: ข้อมูล QR ถูกเข้ารหัสด้วย Base64 เพื่อให้สั้นลง
                </div>
              </div>
            </div>
          </>
        );
      }

      function ConsultDoctor({ onModal, onToast }) {
        const [name, setName] = useState("");
        const [symptoms, setSymptoms] = useState("");
        const [duration, setDuration] = useState("");
        const [meds, setMeds] = useState("");
        const [notes, setNotes] = useState("");

        const message = useMemo(() => {
          const safe = (x) => (x || "").trim();
          return \`
เรียนแพทย์

ข้อมูลผู้ป่วย:
- ชื่อ: \${safe(name) || "-"}

อาการ:
\${safe(symptoms) || "-"}

ระยะเวลา:
\${safe(duration) || "-"}

ยาที่ใช้อยู่/ประวัติยา:
\${safe(meds) || "-"}

ข้อมูลเพิ่มเติม:
\${safe(notes) || "-"}
          \`.trim();
        }, [name, symptoms, duration, meds, notes]);

        return (
          <>
            <div className="pageTitle">ปรึกษาแพทย์</div>
            <div className="pageSub">สรุปอาการและข้อมูลยาเพื่อคัดลอกส่งแพทย์ได้ง่าย</div>

            <div className="split">
              <div className="card reveal">
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <div className="row">
                    <span className="pillTag" style={{ borderColor: "rgba(67,97,238,.25)", background: "rgba(67,97,238,.08)", color: "var(--brand-blue)" }}>
                      ฟอร์ม
                    </span>
                    <strong style={{ color: "var(--text-strong)" }}>กรอกข้อมูล</strong>
                  </div>
                </div>
                <div className="divider" />

                <div className="formGrid">
                  <div className="field">
                    <label>ชื่อผู้ป่วย</label>
                    <input value={name} onChange={(e) => setName(e.target.value)} placeholder="เช่น สมชาย ใจดี" />
                  </div>
                  <div className="field">
                    <label>ระยะเวลาอาการ</label>
                    <input value={duration} onChange={(e) => setDuration(e.target.value)} placeholder="เช่น 2 วัน/1 สัปดาห์" />
                  </div>
                </div>

                <div style={{ height: 12 }} />
                <div className="field">
                  <label>อาการหลัก</label>
                  <textarea value={symptoms} onChange={(e) => setSymptoms(e.target.value)} placeholder="อธิบายอาการอย่างละเอียด เช่น ปวดตรงไหน มีไข้ไหม..." />
                </div>

                <div style={{ height: 12 }} />
                <div className="field">
                  <label>ยาที่ใช้อยู่/ประวัติยา</label>
                  <textarea value={meds} onChange={(e) => setMeds(e.target.value)} placeholder="เช่น ยาความดัน, ยาเบาหวาน, ยาแก้ปวด..." />
                </div>

                <div style={{ height: 12 }} />
                <div className="field">
                  <label>ข้อมูลเพิ่มเติม</label>
                  <textarea value={notes} onChange={(e) => setNotes(e.target.value)} placeholder="เช่น มีโรคประจำตัว/การแพ้ยา/ผลตรวจล่าสุด..." />
                </div>

                <div style={{ height: 12 }} />
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <button className="btn ghost" onClick={() => {
                    onModal({ type: "confirm", title: "ล้างฟอร์ม?", message: "ต้องการล้างข้อมูลที่กรอกไว้หรือไม่", confirmText: "ล้างข้อมูล", cancelText: "ยกเลิก", onConfirm: () => {
                      setName(""); setSymptoms(""); setDuration(""); setMeds(""); setNotes("");
                      onToast("ล้างข้อมูลแล้ว");
                    }});
                  }}>
                    ล้างข้อมูล
                  </button>
                  <button className="btn" onClick={() => {
                    navigator.clipboard.writeText(message).then(() => onToast("คัดลอกข้อความส่งแพทย์แล้ว"));
                  }}>
                    คัดลอกข้อความ
                  </button>
                </div>
              </div>

              <div className="card reveal">
                <div className="row" style={{ justifyContent: "space-between" }}>
                  <div className="row">
                    <span className="pillTag">ข้อความพร้อมส่ง</span>
                  </div>
                </div>
                <div className="divider" />
                <pre style={{ whiteSpace: "pre-wrap", fontFamily: "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace", margin: 0, color: "var(--text)" }}>
                  {message}
                </pre>
                <div style={{ height: 12 }} />
                <div className="row" style={{ justifyContent: "flex-end" }}>
                  <CopyButton text={message} label="คัดลอกอีกครั้ง" />
                </div>
              </div>
            </div>
          </>
        );
      }

      function About() {
        return (
          <>
            <div className="pageTitle">เกี่ยวกับ MedLink</div>
            <div className="pageSub">แอปภาษาไทยเพื่อช่วยให้ข้อมูลสุขภาพเป็นระเบียบและเข้าถึงง่าย</div>

            <div className="gridCards">
              <div className="card reveal">
                <div className="cardHeader">
                  <div className="cardIcon">
                    <IconInfo />
                  </div>
                  <p className="cardTitle">ทำไมต้อง MedLink?</p>
                </div>
                <p className="cardText">
                  ช่วยสรุปข้อมูลจากฉลากยา และสร้าง Health QR เพื่อให้ผู้ดูแล/แพทย์เข้าใจข้อมูลสำคัญได้เร็วขึ้น
                </p>
              </div>
              <div className="card reveal">
                <div className="cardHeader">
                  <div className="cardIcon" style={{ color: "var(--accent-teal)" }}>
                    <IconQR />
                  </div>
                  <p className="cardTitle">ข้อมูลในเครื่องคุณ</p>
                </div>
                <p className="cardText">
                  ใช้ `serverStorage` (ถ้ามี) หรือ `localStorage` เป็นหลักในการเก็บประวัติและข้อมูลที่เกี่ยวข้อง
                </p>
              </div>
              <div className="card reveal">
                <div className="cardHeader">
                  <div className="cardIcon">
                    <IconScan />
                  </div>
                  <p className="cardTitle">ข้อจำกัด</p>
                </div>
                <p className="cardText">
                  การวิเคราะห์จากภาพเป็นการช่วยอ่านเท่านั้น ไม่ใช่การวินิจฉัยหรือคำแนะนำทางการแพทย์โดยตรง
                </p>
              </div>
            </div>
          </>
        );
      }

      const rootEl = document.getElementById("root");
      if (ReactDOM.createRoot) {
        const root = ReactDOM.createRoot(rootEl);
        root.render(<App />);
      } else if (ReactDOM.render) {
        ReactDOM.render(<App />, rootEl);
      } else {
        // fallback for unexpected ReactDOM builds
        throw new Error("ReactDOM does not support render/createRoot");
      }
    </script>
  </body>
</html>
