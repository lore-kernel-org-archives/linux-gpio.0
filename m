From: =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>
Subject: [PATCH] gpio-it87: add support for IT8772F Super I/O.
Date: Tue, 25 Jul 2017 22:10:29 +0100
Message-ID: <20170725211029.20301-1-flameeyes@flameeyes.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37341 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751979AbdGYVKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jul 2017 17:10:33 -0400
Received: by mail-wm0-f53.google.com with SMTP id c184so66221794wmd.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jul 2017 14:10:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Sergey Tkachev <tssergey22@gmail.com>, =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>

>From the datasheet, the GPIO interface is identical to IT8728 (same
description), so just add it to the same case as the other chip.

Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.eu>
---
 drivers/gpio/gpio-it87.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index 45d29e488dbb..d43d0a2cc4c5 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -2,6 +2,7 @@
  *  GPIO interface for IT87xx Super I/O chips
  *
  *  Author: Diego Elio Pettenò <flameeyes@flameeyes.eu>
+ *  Copyright (c) 2017 Google, Inc.
  *
  *  Based on it87_wdt.c     by Oliver Schuster
  *           gpio-it8761e.c by Denis Turischev
@@ -39,6 +40,7 @@
 #define IT8728_ID	0x8728
 #define IT8732_ID	0x8732
 #define IT8761_ID	0x8761
+#define IT8772_ID	0x8772
 
 /* IO Ports */
 #define REG		0x2e
@@ -314,6 +316,7 @@ static int __init it87_gpio_init(void)
 		break;
 	case IT8728_ID:
 	case IT8732_ID:
+	case IT8772_ID:
 		gpio_ba_reg = 0x62;
 		it87_gpio->io_size = 8;
 		it87_gpio->output_base = 0xc8;
-- 
2.13.3

