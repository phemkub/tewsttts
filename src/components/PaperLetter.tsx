import { content } from '../config/content'

export default function PaperLetter() {
  return (
    <article className="paper-card">
      <p className="emoji-row">🎀 Wachirawit says hi! 🐶</p>
      <h2 className="paper-title">{content.letterTitle}</h2>
      <div className="paper-body">
        {content.letterParagraphs.map((text) => (
          <p key={text}>{text}</p>
        ))}
      </div>
      <p className="paper-closing">{content.letterClosing}</p>
    </article>
  )
}
