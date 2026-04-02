# Nawaza AI - Project Overview

**Version 3.0 | 2025**

**Founder:** Karo Bakhtiyar | Sulaymaniyah, Kurdistan region, iraq | [nawaza.krd](https://nawaza.krd)

---

## The Problem

The Kurdish-speaking world, approximately 45 to 60 million people across Iraq, Iran, Turkey, Syria, and diaspora communities, has been systemically underserved by global AI platforms. Major platforms support Kurdish as one of over 100 languages, with no cultural depth, no dialect specialization, and no infrastructure built around how Kurdish people actually live and work.

The gaps are concrete:

- Individual users have no AI that understands their educational systems, cultural references, and dialect differences
- Kurdish media houses struggle to translate international content into Kurdish quickly and accurately
- NGOs need real-time situational awareness in Kurdish-language contexts
- Universities face months-long delays translating academic materials
- Publishers cannot bring international books to Kurdish markets at scale

These are not theoretical problems. They are documented, active bottlenecks for organizations working in the region today.

---

## The Solution

Nawaza AI is a five-portal platform where each portal is purpose-built for a specific Kurdish need, rather than a single general-purpose chatbot stretched across every use case.

### Portal 1 - Nawaza Assistant
*assistant.nawaza.krd | Live*

The foundation of the platform. A Kurdish-first AI for daily productivity, research, content creation, and business correspondence. Supports natural conversation in Sorani, Kurmanji, and Badini with real-time web search, file attachment, and image generation.

### Portal 2 - Nawaza Academy
*academy.nawaza.krd | In Development*

An AI tutor built on Socratic methodology. It never gives direct answers, only guiding questions and progressive hints. The core feature is material-based learning: students upload their own course materials and the AI becomes a personalized tutor for that specific content. Designed for Kurdish students at all levels, including offline use via PWA for areas with intermittent connectivity.

### Portal 3 - Nawaza Persona
*persona.nawaza.krd | Planned*

A character AI platform for entertainment, roleplay, and creative interaction. Users can create and converse with any persona, whether fictional characters, historical figures, original creations, or custom personalities they define themselves. It works similarly to platforms like Character AI, with conversations driven by consistent character personalities throughout each session. The platform is built in Kurdish, making it the first character AI experience native to the language.

### Portal 4 - Nawaza Intel
*intel.nawaza.krd | Planned*

Real-time news intelligence for Kurdish organizations. Aggregates global news, translates and summarizes into Sorani, Kurmanji, or Badini, and contextualizes events for Kurdish audiences. Built for NGOs, media organizations, government agencies, and international organizations with Kurdish stakeholders. Enterprise-grade security with organization-level data isolation.

### Portal 5 - Nawaza Warger
*warger.nawaza.krd | Planned*

Professional-grade document and audio translation into Kurdish dialects. A Kurdish publisher that previously spent months and thousands of dollars translating a book can now do it in hours at a fraction of the cost. Handles PDFs over 200 pages, scanned documents via OCR, audio transcription, subtitle generation, and batch processing.

---

## Architecture

### Subdomain Structure

Each portal runs on its own subdomain for performance isolation and deployment flexibility:

```
assistant.nawaza.krd   (Live)
academy.nawaza.krd     (In development)
persona.nawaza.krd     (Planned)
intel.nawaza.krd       (Planned, B2B)
warger.nawaza.krd      (Planned, B2B)
```

Phase 1 implements Vercel rewrite rules mapping subdomains to internal routes within a single Vite application. Phase 2 separates each portal into independent Vercel projects, which is particularly important for the B2B portals handling sensitive documents and intelligence data.

### Tech Stack

```
Frontend:     Vite 6 + React 19 + TypeScript
Routing:      React Router DOM v7
Styling:      Tailwind CSS v4 + Framer Motion
Backend:      Supabase (Postgres + Edge Functions)
AI:           Advanced fine-tuned language models via API
Search:       Real-time web search integration
Hosting:      Vercel
PWA:          vite-plugin-pwa + Workbox service worker
```

### Dialect and Layout System

The platform currently supports Sorani. Kurmanji and Badini are in development. The layout system is built to handle all three from day one:

- Sorani uses Arabic script and renders RTL (currently available)
- Kurmanji uses Latin script and renders LTR (in development)
- Badini uses Arabic script and renders RTL (in development)

When Kurmanji is enabled, switching dialects will flip the entire UI layout. All components already use CSS logical properties to support this without conditional styling.

### PWA Strategy

Kurdish users are smartphone-primary. Internet and electricity in parts of Kurdistan can be intermittent. Nawaza AI is a Progressive Web App from day one:

- Installs to the home screen and behaves like a native app
- Academy portal caches course materials for offline study
- Single codebase serves iOS, Android, and desktop with no separate native builds required

---

## Credit System

Every registered user gets 20 free credits per day, resetting every 24 hours. This is a permanent allowance, not a trial.

| Action | Cost |
|--------|------|
| Chat message | 1 credit |
| Web search | 3 credits |
| File attachment | 4 credits |
| Image generation | 10 credits |

Paid credit packages start at $2. Payment supports both Stripe for international users and local Kurdish market wallets, Zain Cash and FastPay, for users where cash-based and mobile wallet transactions are the norm.

---

## Prompt Engineering

Each portal has a distinct behavioral profile layered on top of a shared Kurdish cultural base. Core system prompts include Kurdish cultural context, dialect-specific language patterns, common phrases and expressions, and regional awareness.

Portal-specific behavior:

- Assistant: professional, flexible, general-purpose
- Academy: Socratic only, never provides direct answers under any condition
- Persona: character-consistent throughout the conversation, immersive roleplay enforced
- Intel: objective and analytical, with cultural contextualization of news for Kurdish audiences
- Warger: precision-focused, terminology consistency and formatting preservation throughout

---

## Why This Exists

Beyond the product, Nawaza AI addresses a real and underappreciated risk. Minority languages like Kurdish face digital marginalization when AI infrastructure is built primarily for major world languages. A generation that interacts with AI only in Arabic, English, or Turkish will gradually shift away from Kurdish in digital contexts.

Nawaza AI is built to make Kurdish the language of technology, learning, entertainment, and professional work. Not as a feature added on top, but as the foundation everything else is built on.

---

*Built by [Karo Bakhtiyar](https://github.com/Karo-Bakhtiyar), Sulaymaniyah, Kurdistan region*

---
---

# کورتەی پڕۆژەی نەوازە ئای (Nawaza AI)

**وەشانی ٣.٠ | ٢٠٢٥**

**دامەزرێنەر:** کارۆ بەختیار | سلێمانی، هەرێمی کوردستان | [nawaza.krd](https://nawaza.krd)

---

## کێشەکە

زمانی کوردی، بە شێوەیەکی سیستماتیک لە لایەن پلاتفۆرمە جیهانییەکانی ژیریی دەستکردەوە فەرامۆش کراون. پلاتفۆرمە سەرەکییەکان وەک یەکێک لە ١٠٠ زمانەکە پشتگیری لە کوردی دەکەن، بەبێ قووڵایی کولتووری، بەبێ ڕەچاوکردنی جیاوازی شێوەزارەکان، و بەبێ بوونی ژێرخانێک کە لە دەوری شێوازی ژیان و کاری مرۆڤی کورد بونیاد نرابێت.

بۆشاییەکان کۆنکرێتی و ڕوونن:

- بەکارهێنەرانی تاکەکەسی ژیریی دەستکردێکی وایان نییە کە لە سیستمی پەروەردە، ئاماژە کولتوورییەکان و جیاوازی شێوەزارەکانیان تێبگات.
- دامەزراوە میدیاییە کوردییەکان دەجەنگن بۆ وەرگێڕانی ناوەڕۆکە جیهانییەکان بۆ سەر زمانی کوردی بە خێرایی و وردی.
- ڕێکخراوە ناحکومییەکان (NGOs) پێویستیان بە زانیاریی ڕاسەوخۆ و شیکارکردنی (Real-time) هەیە لە چوارچێوەی زاراوە کوردییەکەدا.
- زانکۆکان ڕووبەڕووی دواکەوتنی چەند مانگە دەبنەوە لە وەرگێڕانی سەرچاوە ئەکادیمییەکاندا.
- ناوەندەکانی چاپ و بڵاوکردنەوە ناتوانن کتێبە نێودەوڵەتییەکان بە قەبارەیەکی گەورە بهێننە ناو بازاڕی کوردییەوە.

ئەم کێشانە تیۆری نین، بەڵکو بەربەستی چالاک و بەبەڵگەکراون بۆ ئەو ڕێکخراوانەی ئەمڕۆ لە ناوچەکەدا کار دەکەن.

---

## چارەسەر

ناوازە پلاتفۆرمێکی پێنج-دەروازەییە کە هەر دەروازەیەکی بۆ پێداویستییەکی دیاریکراوی کورد دروست کراوە، لەبری ئەوەی تەنها یەک چات بۆتی گشتی بێت کە بۆ هەموو بوارەکان بەکاربێت.

### دەروازەی ١ - یاریدەدەری نەوازە (Nawaza Assistant)
*assistant.nawaza.krd | کارایە*

بنچینەی پلاتفۆرمەکەیە. ژیریی دەستکردێکی کورد-پێشەنگ بۆ بەکارهێنانی ڕۆژانە، توێژینەوە، دروستکردنی ناوەڕۆک و نووسراوە ئاکادیمییەکان. پشتگیری لە گفتوگۆی سروشتی دەکات بە شێوەزارەکانی سۆرانی، لەگەڵ گەڕانی وێب، هاوپێچکردنی فایل و دروستکردنی وێنە.

### دەروازەی ٢ - ناوازە ئەکادیمیا (Nawaza Academy)
*academy.nawaza.krd | لە گەشەپێداندایە*

سیستەمێکی پەروەردەیی ژیریی دەستکردە کە لەسەر مێتۆدی سۆکراتی بونیاد نراوە. هەرگیز وەڵامی ڕاستەوخۆ نادات، بەڵکو تەنها پرسیاری ڕێنماییکەر و ئاماژەی هەنگاو بە هەنگاو دەخاتە ڕوو. تایبەتمەندی سەرەکی بریتییە لە فێربوون "لەڕێگەی هاوپێچکردنی سەرچاوە": خوێندکاران سەرچاوەکانی خوێندنی خۆیان ئەپڵۆد دەکەن و ژیریی دەستکردەکە دەبێتە مامۆستایەکی تایبەت بۆ ئەو ناوەڕۆکە. بۆ خوێندکارانی کورد لە هەموو ئاستەکاندا دیزاین کراوە و لە ڕێگەی PWAەوە لە کاتی نەبوونی هێڵی ئینتەرنێتیشدا کار دەکات.

### دەروازەی ٣ - ناوازە پێرسۆنا (Nawaza Persona)
*persona.nawaza.krd | پلان بۆ داڕێژراو*

پلاتفۆرمێکی ژیریی دەستکردی کارەکتەرەکانە بۆ کات بەسەربردن، ڕۆڵگێڕان و کارلێکی داهێنەرانە. بەکارهێنەران دەتوانن هەر کەسایەتییەک دروست بکەن و گفتوگۆی لەگەڵ بکەن، چ کارەکتەری خەیاڵی بن، چ کەسایەتی مێژوویی، یان کەسایەتییەکی داهێنراوی خۆیان. هاوشێوەی پلاتفۆرمەکانی وەک Character AI کار دەکات، بەڵام بە زمانی کوردی، کە دەبێتە یەکەمین ئەزموونی "کارەکتەر ئای" کە ڕەسەن بێت بۆ زمانەکە.

### دەروازەی ٤ - ناوازە ئینتێڵ (Nawaza Intel)
*intel.nawaza.krd | پلان بۆ داڕێژراو*

هێنانی نوێترین هەواڵ و ڕووداوەکان و شیکارکردنی بە شێوەیەکی ئۆتۆماتیک و دەرخستنی لەسەر نەخشەی ناوچەکە بۆ ڕێکخراوە کوردییەکان. هەواڵە جیهانییەکان کۆدەکاتەوە بە پشت بەستن بە سەرچاوە باوەڕپێکراوەکان، وەریان دەگێڕێت و پوختیان دەکاتەوە بۆ سەر سۆرانی، کرمانجی، یان بادینی، و ڕووداوەکان بۆ بینەری کورد دەخاتە چوارچێوەی گونجاوەوە. بۆ ڕێکخراوە ناحکومییەکان، میدیاکان و ئاژانسە حکومییەکان دروست کراوە. خاوەنی Enterprise-grade securityیە بۆ پاراستنی داتاکان.

### دەروازەی ٥ - ناوازە وەرگێڕ (Nawaza Warger)
*warger.nawaza.krd | پلان بۆ داڕێژراو*

وەرگێڕانی پیشەیی دۆکیومێنت و دەنگ بۆ سەر زاراوە کوردییەکان. ئەو ناوەندە چاپ و بڵاوکردنەوانەی کە پێشتر چەندین مانگ و هەزاران دۆلاریان بۆ وەرگێڕانی کتێبێک خەرج دەکرد، ئێستا دەتوانن لە چەند کاتژمێرێکدا و بە تێچوویەکی زۆر کەمتر ئەنجامی بدەن. توانای مامەڵەکردنی لەگەڵ PDFی سەروو ٢٠٠ لاپەڕە، بەڵگەنامە سکانکراوەکان (OCR)، نووسینەوەی دەنگ (Transcription) و دروستکردنی ژێرنووسی هەیە.

---

## تەلارسازی (Architecture)

### پێکهاتەی ساب-دۆمەین (Subdomain)

هەر دەروازەیەک لەسەر ساب-دۆمەینی خۆی کار دەکات بۆ باشترکردنی کارایی و نەرمیی لە گەشەپێداندا:

```
assistant.nawaza.krd   (Live - کارایە)
academy.nawaza.krd     (In development - لە گەشەپێداندایە)
persona.nawaza.krd     (Planned - پلان بۆ داڕێژراو)
intel.nawaza.krd       (Planned, B2B)
warger.nawaza.krd      (Planned, B2B)
```
قۆناغی یەکەم: ڕێسا کاتییەکانی Vercel بەکاردێنێت بۆ بەستنەوەی ساب-دۆمەینەکان بە ڕێڕەوە ناوخۆییەکان لەناو یەک ئەپی Viteدا. قۆناغی دووەم: هەر دەروازەیەک جیا دەکاتەوە بۆ پڕۆژەی سەربەخۆ لە Vercel، کە ئەمە زۆر گرنگە بۆ دەروازە بازرگانییەکان (B2B) کە مامەڵە لەگەڵ دۆکیومێنتە هەستیارەکاندا دەکەن.

### تەکنەلۆژیا بەکارهێنراوەکان (Tech Stack)

```
Frontend:      Vite 6 + React 19 + TypeScript
Routing:       React Router DOM v7
Styling:       Tailwind CSS v4 + Framer Motion
Backend:       Supabase (Postgres + Edge Functions)
AI:            Advanced fine-tuned language models via API
Search:        Real-time web search integration
Hosting:       Vercel
PWA:           vite-plugin-pwa + Workbox service worker
```


```
Frontend:      Vite 6 + React 19 + TypeScript
Routing:       React Router DOM v7
Styling:       Tailwind CSS v4 + Framer Motion
Backend:       Supabase (Postgres + Edge Functions)
AI:            Advanced fine-tuned language models via API
Search:        Real-time web search integration
Hosting:       Vercel
PWA:           vite-plugin-pwa + Workbox service worker
```

### سیستمی شێوەزار و ڕووکار

لە ئێستادا پلاتفۆرمەکە پشتگیری لە سۆرانی دەکات. کرمانجی و بادینی لە گەشەپێداندایە. سیستمی دیزاینەکە وا بونیاد نراوە کە لە ڕۆژی یەکەمەوە مامەڵە لەگەڵ هەر سێ شێوەزارەکە بکات:

- سۆرانی پیتی عەرەبی بەکاردێنێت و RTLە (بەردەستە).
- کرمانجی پیتی لاتینی بەکاردێنێت و LTRە (لە گەشەپێداندایە).
- بادینی پیتی عەرەبی بەکاردێنێت و RTLە (لە گەشەپێداندایە).

کاتێک کرمانجی چالاک دەکرێت، گۆڕینی شێوەزارەکە تەواوی ڕووکاری ئەپەکە هەڵدەگێڕێتەوە. هەموو پێکهاتەکان تایبەتمەندییە لۆجیکییەکانی CSS بەکاردێنن بۆ پشتگیریکردنی ئەم گۆڕانکارییە بەبێ پێویستی بە کۆدی زیادە.

---

## سیستمی کریدیت (Credit System)

هەر بەکارهێنەرێکی تۆمارکراو ڕۆژانە ٢٠ کریدیتی بێبەرامبەر وەردەگرێت، کە هەموو ٢٤ کاتژمێر جارێک نوێ دەبێتەوە. ئەمە دیارییەکی هەمیشەیییە و تەنها بۆ تاقیکردنەوە نییە.

| کردار | تێچوو |
|--------|------|
| نامەی چات | ١ کریدیت |
| گەڕانی وێب | ٣ کریدیت |
| هاوپێچکردنی فایل | ٤ کریدیت |
| دروستکردنی وێنە | ١٠ کریدیت |

کڕینی پاکێجەکانی کریدیت لە ١ دۆلارەوە دەست پێدەکات. پارەدان پشتگیری لە Stripe دەکات بۆ بەکارهێنەرانی نێودەوڵەتی، و جزدانە ناوخۆییەکانی وەک **Zain Cash** و **FastPay** بۆ بەکارهێنەرانی ناوخۆ.

---

## ئەندازیاریی پڕۆمپت (Prompt Engineering)

هەر دەروازەیەک خاوەنی ناسنامەیەکی ڕەفتاریی جیاوازە کە لەسەر بنەمایەکی کولتووری کوردی هاوبەش بونیاد نراوە. پڕۆمپتە سەرەکییەکانی سیستمەکە بریتین لە چوارچێوەی کولتووری کوردی، شێوازە زمانەوانییەکانی هەر شێوەزارێک، دەربڕینە باوەکان و هۆشیاری ناوچەیی.

ڕەفتاری تایبەت بە هەر دەروازەیەک:

- **یاریدەدەر:** پیشەیی، نەرم و گشتگیر.
- **ئەکادیمیا:** تەنها سۆکراتی، هەرگیز وەڵامی ڕاستەوخۆ نادات لە ژێر هیچ بارودۆخێکدا.
- **پێرسۆنا:** پاراستنی کەسایەتی کارەکتەرەکە لە تەواوی گفتوگۆکەدا و جێبەجێکردنی ڕۆڵگێڕانی قووڵ.
- **ئینتێل:** بابەتییانە و شیکارییانە، لەگەڵ گونجاندنی هەواڵەکان بۆ بینەری کورد.
- **وەرگێڕ:** تیشک خستنە سەر وردی، پاراستنی زاراوەکان و شێوازی فۆرماتی بەڵگەنامەکان.

---

## بۆچی ئەم پڕۆژەیە هەیە؟

جگە لە لایەنی بەرهەمهێنان، ناوازە ئەی ئای مەترسییەکی ڕاستەقینە ئادرێس دەکات. زمانە کەمینەکانی وەک کوردی ڕووبەڕووی پەراوێزخستنی دیجیتاڵی دەبنەوە کاتێک ژێرخانی ژیریی دەستکرد تەنها بۆ زمانە سەرەکییەکانی جیهان دروست دەکرێت. نەوەیەک کە تەنها بە عەرەبی، ئینگلیزی، یان تورکی لەگەڵ ژیریی دەستکرددا کارلێک بکات، وردە وردە لە زمانی کوردی دوور دەکەوێتەوە لە جیهانی دیجیتاڵیدا.

نەوازە ئای دروست کراوە تا کوردی بکاتە زمانی تەکنەلۆژیا، فێربوون، کات بەسەربردن و کاری پیشەیی. نەک وەک تایبەتمەندییەکی زیادە، بەڵکو وەک ئەو بنچینەیەی کە هەموو شتەکانی تری لەسەر بونیاد نراوە.

---

*دروستکراوە لە لایەن [کارۆ بەختیار](https://github.com/Karo-Bakhtiyar)، سلێمانی، هەرێمی کوردستان*
```
