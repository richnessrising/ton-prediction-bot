const express = require('express');
const { Telegraf } = require('telegraf');

const app = express();
const port = process.env.APP_PORT || 3000;

// تنظیم ربات تلگرام
const bot = new Telegraf(process.env.TELEGRAM_BOT_TOKEN);

// پاسخ به دستور /start
bot.start((ctx) => ctx.reply('Welcome to TON Prediction Bot!'));

// پاسخ به پیام‌های متنی
bot.on('text', (ctx) => {
  ctx.reply('Received your message! This is a test bot.');
});

// راه‌اندازی webhook یا polling
bot.launch();

// health endpoint
app.use(express.json());
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});

// مدیریت خاموش شدن ربات
process.once('SIGINT', () => bot.stop('SIGINT'));
process.once('SIGTERM', () => bot.stop('SIGTERM'));
