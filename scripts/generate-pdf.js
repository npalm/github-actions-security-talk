#!/usr/bin/env node

const { chromium } = require('playwright');
const { PDFDocument } = require('pdf-lib');
const fs = require('fs');
const path = require('path');

async function generatePDF() {
  const deckDir = process.cwd();
  const buildDir = path.join(deckDir, 'build');
  const htmlPath = path.join(buildDir, 'index.html');
  const outputPdf = path.join(buildDir, 'slides.pdf');

  if (!fs.existsSync(htmlPath)) {
    console.error(`Missing HTML input: ${htmlPath}`);
    console.error('Run `npm run build:html` first.');
    process.exit(1);
  }

  fs.mkdirSync(buildDir, { recursive: true });

  console.log('Starting PDF generation...');

  const browser = await chromium.launch();
  const page = await browser.newPage();

  await page.goto(`file://${htmlPath}`);
  await page.waitForTimeout(2000);

  await page.addStyleTag({
    content: '[data-bespoke-marp-osc] { display: none !important; }'
  });
  await page.waitForTimeout(500);

  try {
    console.log('Capturing slide screenshots...');
    const totalSlides = await page.evaluate(() => {
      const pageInfo = document.querySelector('div[class*="bespoke-marp-osc"]')?.textContent;
      const match = pageInfo?.match(/Page \d+ of (\d+)/);
      return match ? parseInt(match[1], 10) : 1;
    });

    console.log(`Found ${totalSlides} slides`);

    const imageBuffers = [];

    imageBuffers.push(await page.screenshot({ type: 'png', scale: 'css' }));
    for (let i = 2; i <= totalSlides; i++) {
      await page.keyboard.press('ArrowRight');
      await page.waitForTimeout(300);
      imageBuffers.push(await page.screenshot({ type: 'png', scale: 'css' }));
    }

    console.log('Composing PDF from screenshots...');
    const pdfDoc = await PDFDocument.create();

    for (const pngBuffer of imageBuffers) {
      const pngImage = await pdfDoc.embedPng(pngBuffer);
      const pngDims = pngImage.scale(1);
      const pdfPage = pdfDoc.addPage([pngDims.width, pngDims.height]);
      pdfPage.drawImage(pngImage, {
        x: 0,
        y: 0,
        width: pngDims.width,
        height: pngDims.height
      });
    }

    const pdfBytes = await pdfDoc.save();
    fs.writeFileSync(outputPdf, pdfBytes);
    await browser.close();
    console.log(`PDF generated successfully: ${outputPdf}`);
  } catch (error) {
    await browser.close();
    console.error('Failed to generate PDF from screenshots.');
    console.error(error.message || error);
    process.exit(1);
  }
}

generatePDF().catch((error) => {
  console.error('Error generating PDF:', error);
  process.exit(1);
});
