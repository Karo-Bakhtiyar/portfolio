# Background Removal Tool

A browser-based background removal tool that runs entirely on your device. No uploads, no servers, no API keys — just open it and use it.

**[Live Demo](https://karo-bakhtiyar.github.io/background-removal-tool)** | **[Repo](https://github.com/Karo-Bakhtiyar/background-removal-tool)**


---

## How it works

The tool uses the RMBG-1.4 model by BRIA AI, running locally in your browser via ONNX Runtime. The model file is bundled with the app so nothing is sent to any server. Your images stay on your device.

WebGPU acceleration is used automatically when your browser supports it, falling back to CPU otherwise.

---

## Features

- Fully client-side, no data leaves your device
- WebGPU acceleration with CPU fallback
- Upload while the model loads in the background
- Side by side comparison of original and result
- Download as transparent PNG
- Works on both desktop and mobile
- UI in Sorani Kurdish with RTL layout

---

## How to use

1. Open the live demo link above
2. Wait for the model to load (first visit only, cached after that)
3. Drag and drop an image or click to upload
4. Download the result as a PNG

---

## Run locally

Clone the repo and serve it with any local server:

```bash
npx serve .
```

Then open `http://localhost:3000` in your browser. Opening `index.html` directly as a file will not work due to browser security restrictions.

---

## Tech

- Pure HTML, CSS, JavaScript — single file
- RMBG-1.4 model by BRIA AI (bundled locally)
- ONNX Runtime Web via Transformers.js v3
- Rabar font for Kurdish text rendering

---

*Built by [Karo Bakhtiyar](https://github.com/Karo-Bakhtiyar), Sulaymaniyah, Kurdistan, Iraq*

---

<div dir="rtl">

# ئامرازی لادانی باکگراوند (Background Removal Tool)

ئامرازێکی وێبگەر بۆ لادانی باکگراوندی وێنە کە بە تەواوی لەسەر ئامێرەکەت کار دەکات. بێ ئەوەی وێنەکان ئەپڵۆد بکەیت، بێ سێرڤەر، و بێ کلیلی API؛ تەنها بیکەرەوە و بەکاری بهێنە.

**[تاقیکردنەوەی ڕاستەوخۆ](https://karo-bakhtiyar.github.io/background-removal-tool)** | **[کۆدەکە](https://github.com/Karo-Bakhtiyar/background-removal-tool)**

---

## چۆنیەتی کارکردن

ئەم ئامرازە مۆدێلی RMBG-1.4 ی کۆمپانیای BRIA AI بەکاردەهێنێت، کە بە شێوەیەکی لۆکاڵی لە ناو وێبگەرەکەتدا لە ڕێگەی ONNX Runtime کار دەکات. پەڕگەی مۆدێلەکە لەگەڵ ئەپڵیکەیشنەکەدایە، بۆیە هیچ شتێک بۆ هیچ سێرڤەرێک نانێردرێت. وێنەکانت لەسەر ئامێرەکەی خۆت دەمێننەوە.

خێراکەری WebGPU بە شێوەیەکی ئۆتۆماتیکی بەکاردێت ئەگەر وێبگەڕەکەت پشتگیری بکات، ئەگەر نا دەگەڕێتەوە سەر بەکارهێنانی CPU.

---

## تایبەتمەندییەکان

- بە تەواوی لەسەر ئامێری بەکارهێنەرە، هیچ داتایەک ئامێرەکەت جێناهێڵێت
- خێراکەری WebGPU لەگەڵ ئەگەری گۆڕین بۆ CPU
- دەتوانیت وێنە ئەپڵۆد بکەیت لەکاتێکدا مۆدێلەکە لە باکگراونددا ڵۆددەبێت
- بینینی وێنەی ڕەسەن و ئەنجامەکە تەنیشت یەک بۆ بەراوردکردن
- داگرتن بە شێوەی PNG شەفاف
- لەسەر کۆمپیوتەر و مۆبایل کار دەکات
- ڕووکاری بەکارهێنەر بە زمانی کوردی (سۆرانی) و دیزاینی ڕاست-بۆ-چەپ (RTL)

---

## چۆنیەتی بەکارهێنان

١. لینکی تاقیکردنەوەی ڕاستەوخۆی سەرەوە بیکەرەوە
٢. چاوەڕێ بکە تا مۆدێلەکە باردەبێت (تەنها تۆزێک چاوەڕێ بۆ یەکەمجار، دواتر خێراتر دەبێت)
٣. وێنەیەک ڕابکێشە ناو سندوقەکە یان کلیک بکە بۆ ئەپڵۆدکردن
٤. ئەنجامەکە وەک وێنەیەکی PNG دابگرە

---

## کارپێکردن بە شێوەی لۆکاڵی

پڕۆژەکە کلۆن بکە و بە هەر سێرڤەرێکی ناوخۆیی کارپێکردنی بۆ بکە:

```bash
npx serve .
```

دواتر ناونیشانی `http://localhost:3000` لە وێبگەرەکەتدا بکەرەوە. کردنەوەی ڕاستەوخۆی پەڕگەی `index.html` کار ناکات بەهۆی سنووردارکردنی ئاسایشی وێبگەڕەکانەوە.

---

## تەکنەلۆژیا بەکارهاتووکەن

- تەنها HTML, CSS, JavaScript — یەک پەڕگەیە
- مۆدێلی RMBG-1.4 لەلایەن BRIA AI (بە شێوەی لۆکاڵی دانراوە)
- بەکارهێنانی ONNX Runtime Web لە ڕێگەی Transformers.js v3
- فۆنتی ڕابەر (Rabar) بۆ نیشاندانی تێکستی کوردی

---

*دروستکراوە لەلایەن [کارۆ بەختیار](https://github.com/Karo-Bakhtiyar)، سلێمانی، کوردستان، عێراق*

</div>
