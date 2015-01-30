From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: mb86s70: Return error if requesting an already
 assigned gpio
Date: Fri, 30 Jan 2015 18:26:25 +0800
Message-ID: <1422613585.24393.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:56642 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761166AbbA3K0a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 05:26:30 -0500
Received: by mail-pa0-f46.google.com with SMTP id lj1so50802661pab.5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 02:26:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Andy Green <andy.green@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-mb86s7x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 21b1ce5..ee93c0a 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -58,6 +58,11 @@ static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned gpio)
 	spin_lock_irqsave(&gchip->lock, flags);
 
 	val = readl(gchip->base + PFR(gpio));
+	if (!(val & OFFSET(gpio))) {
+		spin_unlock_irqrestore(&gchip->lock, flags);
+		return -EINVAL;
+	}
+
 	val &= ~OFFSET(gpio);
 	writel(val, gchip->base + PFR(gpio));
 
-- 
1.9.1



