# Nawaza AI

**The first integrated multi-portal AI platform built for Kurdish speakers.**

[![Live](https://img.shields.io/badge/Live-nawaza.krd-brightgreen?style=flat)](https://nawaza.krd)
[![Stack](https://img.shields.io/badge/Stack-React_19_+_Supabase-blue?style=flat)]()
[![Language](https://img.shields.io/badge/Language-Kurdish_First-orange?style=flat)]()

---

## What is Nawaza AI?

Nawaza AI is a Kurdish-first AI platform serving Kurdish speakers across Iraq, Iran, Turkey, Syria, and the diaspora. It is built for a population of 45 to 60 million people that has been largely overlooked by global AI platforms.

It is not a chatbot that happens to speak Kurdish. It is a multi-portal ecosystem with specialized AI tools built around real Kurdish needs: daily productivity, education, cultural identity, organizational intelligence, and professional translation.

The platform currently supports Sorani, with Kurmanji and Badini dialect support in development. It uses a credit-based free tier accessible to any registered user.

**[Visit nawaza.krd](https://nawaza.krd)**

---

## The Five Portals

| Portal | Subdomain | Description | Status |
|--------|-----------|-------------|--------|
| Nawaza Assistant | assistant.nawaza.krd | Kurdish-first AI for daily productivity, research, and creative work | Live |
| Nawaza Academy | academy.nawaza.krd | Socratic AI tutor that teaches through your own uploaded course materials | In Development |
| Nawaza Persona | persona.nawaza.krd | Character AI platform for entertainment, roleplay, and creative interaction with any persona | Planned |
| Nawaza Intel | intel.nawaza.krd | Real-time news intelligence for Kurdish organizations (B2B) | Planned |
| Nawaza Warger | warger.nawaza.krd | Professional document and audio translation into Kurdish dialects (B2B) | Planned |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | Vite 6 + React 19 + TypeScript |
| Routing | React Router DOM v7 |
| Styling | Tailwind CSS v4 + Framer Motion |
| Backend | Supabase (Postgres + Edge Functions) |
| AI | Advanced fine-tuned language models via API |
| Web Search | Real-time search integration |
| Hosting | Vercel |
| PWA | vite-plugin-pwa + Workbox |

---

## Dialect Support

Sorani is currently the supported dialect across all portals. Kurmanji and Badini support are in development.

| Dialect | Script | Direction | Primary Region | Status |
|---------|--------|-----------|----------------|--------|
| Sorani | Arabic script | RTL | Iraqi Kurdistan, Iran | Available |
| Kurmanji | Latin script | LTR | Turkey, Syria, diaspora | In Development |
| Badini | Arabic script | RTL | Duhok region, northern Iraq | In Development |

The layout system is built to handle all three. When Kurmanji is enabled, the entire UI flips from RTL to LTR dynamically. All components use CSS logical properties to support both text directions.

---

## How it Works (Assistant Portal)

- Register for a free account at [nawaza.krd](https://nawaza.krd)
- Every user gets 50 free credits one time when they first log in
- Chat in Sorani Kurdish
- Upgrade credits for web search, file analysis, and image generation

---

## Project Documentation

For a full technical and product overview, see [project-paper.md](./project-paper.md).

---

*Built by [Karo Bakhtiyar](https://github.com/Karo-Bakhtiyar), Sulaymaniyah, Kurdistan, Iraq*

---

<div dir="rtl">

# ناوازە ئەی ئای (Nawaza AI)

**یەکەمین پلاتفۆرمی فرە-دەروازەی ژیریی دەستکردی کوردی.**

[![Live](https://img.shields.io/badge/Live-nawaza.krd-brightgreen?style=flat)](https://nawaza.krd)
[![Stack](https://img.shields.io/badge/Stack-React_19_+_Supabase-blue?style=flat)]()
[![Language](https://img.shields.io/badge/Language-Kurdish_First-orange?style=flat)]()

---

## ناوازە ئەی ئای چییە؟

ناوازە پلاتفۆرمێکی ژیریی دەستکردی "کورد-پێشەنگە" کە خزمەت بە کوردزمانان دەکات. ئەم پلاتفۆرمە بۆ دانیشتووانێکی ٤٥ بۆ ٦٠ ملیۆن کەسی دروست کراوە کە لە لایەن پلاتفۆرمە جیهانییەکانی ژیریی دەستکردەوە تا ڕادەیەکی زۆر فەرامۆش کراون.

ئەمە تەنها چات بۆتێک نییە کە بە ڕێکەوت بە کوردی بدوێت؛ بەڵکو سیستمێکی فرە-دەروازەیە کە خاوەنی ئامرازی تایبەتمەندی ژیریی دەستکردە و لە دەوری پێداویستییە ڕاستەقینەکانی کورد بونیاد نراوە: بەرهەمهێنانی ڕۆژانە، پەروەردە، ناسنامەی کولتووری، زانیاریی دامەزراوەیی و وەرگێڕانی پیشەیی.

پلاتفۆرمەکە لە ئێستادا پشتگیری لە شێوەزاری سۆرانی دەکات، و کارکردن بۆ پشتگیریکردنی کرمانجی و بادینی لە گەشەپێداندایە. سیستمەکە پشت بە سیستمی کریدیت دەبەستێت و بەکارهێنانی سەرەتایی بۆ هەموو بەکارهێنەرێکی تۆمارکراو بێبەرامبەرە.

**[سەردانی nawaza.krd بکە](https://nawaza.krd)**

---

## پێنج دەروازەکە

| دۆخ | وەسف | ناونیشانی لاوەکی | دەروازە |
|-----|------|-----------------|---------|
| کارایە | ژیریی دەستکردی کورد-پێشەنگ بۆ بەرهەمهێنانی ڕۆژانە، توێژینەوە و کاری داهێنەرانە | assistant.nawaza.krd | یاریدەدەری ناوازە |
| لە گەشەپێداندایە | مامۆستایەکی سۆکراتیی ژیریی دەستکرد کە لە ڕێگەی سەرچاوە و کتێبەکانی خۆتەوە وانەت پێ دەڵێتەوە | academy.nawaza.krd | ناوازە ئەکادیمی |
| پلان بۆ داڕێژراو | پلاتفۆرمێکی کارەکتەرەکان بۆ کات بەسەربردن، ڕۆڵگێڕان و کارلێکی داهێنەرانە لەگەڵ هەر کەسایەتییەک | persona.nawaza.krd | ناوازە پێرسۆنا |
| پلان بۆ داڕێژراو | زانیاری و هەواڵی نوێ بە شیکاری ژیری دەستکرد بۆ ڕێکخراوە کوردییەکان (B2B) | intel.nawaza.krd | ناوازە ئینتێڵ |
| پلان بۆ داڕێژراو | وەرگێڕانی پیشەیی دۆکیومێنت و دەنگ بۆ سەر شێوەزارە کوردییەکان (B2B) | warger.nawaza.krd | ناوازە وەرگێڕ |

---

## تەکنەلۆژیاکانی بەکارهاتوو

| تەکنەلۆژیا | ئاست |
|-----------|------|
| Vite 6 + React 19 + TypeScript | Frontend |
| React Router DOM v7 | Routing |
| Tailwind CSS v4 + Framer Motion | Styling |
| Supabase (Postgres + Edge Functions) | Backend |
| مۆدێلە پێشکەوتووەکانی زمان لە ڕێگەی API | AI |
| ئینتیگەریشنی گەڕانی ڕاستەوخۆی ئینتەرنێت | Web Search |
| Vercel | Hosting |
| vite-plugin-pwa + Workbox | PWA |

---

## پشتگیری شێوەزارەکان

لە ئێستادا سۆرانی لە هەموو دەروازەکاندا بەردەستە. پشتگیری کرمانجی و بادینی لە قۆناغی گەشەپێداندایە.

| دۆخ | ناوچەی سەرەکی | ئاڕاستە | ڕێنووس | شێوەزار |
|-----|--------------|---------|--------|---------|
| بەردەستە | کوردستانی عێراق، ئێران | RTL | پیتی عەرەبی | سۆرانی |
| لە گەشەپێداندایە | باکوور، ڕۆژاڤا، دیاسپۆرا | LTR | پیتی لاتینی | کرمانجی |
| لە گەشەپێداندایە | ناوچەی دهۆک، هەرێمی کوردستان | RTL | پیتی عەرەبی | بادینی |

سیستمی دیزاینی پلاتفۆرمەکە توانای مامەڵەکردنی لەگەڵ هەر سێ شێوەزارەکەدا هەیە. کاتێک کرمانجی چالاک دەکرێت، تەواوی ڕووکاری بەکارهێنەر بە شێوەیەکی داینامیکی لە RTL دەگۆڕێت بۆ LTR. هەموو پێکهاتەکان تایبەتمەندییە لۆجیکییەکانی CSS بەکاردێنن بۆ پشتگیریکردنی هەردوو ئاڕاستەکە.

---

## چۆن کار دەکات؟ (دەروازەی یاریدەدەر)

- هەژمارێکی بێبەرامبەر لە [nawaza.krd](https://nawaza.krd) تۆمار بکە
- هەر بەکارهێنەرێک بۆ یەکەمجار ٥٠ کریدیتی بێبەرامبەر وەردەگرێت لە کاتی چوونەژوورەوەیدا
- بە کوردیی سۆرانی چات بکە
- کریدیتەکانت بەرز بکەرەوە بۆ گەڕانی وێب، شیکردنەوەی فایل و دروستکردنی وێنە

---

## دۆکیومێنتاسیۆنی پڕۆژەکە

بۆ بینینی تەواوی وردەکارییە تەکنیکییەکان و بەرهەمەکە، سەیری [project-paper.md](./project-paper.md) بکە.

---

*دروستکراوە لە لایەن [کارۆ بەختیار](https://github.com/Karo-Bakhtiyar)، سلێمانی، کوردستان، عێراق*

</div>
