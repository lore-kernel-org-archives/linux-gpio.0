From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] gpio: davinci: Use signed type for 'irq' variable
Date: Sat, 15 Feb 2014 17:12:05 +0400
Message-ID: <1392469925-16737-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback3.mail.ru ([94.100.176.58]:35171 "EHLO
	fallback3.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753050AbaBONMb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Feb 2014 08:12:31 -0500
Received: from smtp44.i.mail.ru (smtp44.i.mail.ru [94.100.177.104])
	by fallback3.mail.ru (mPOP.Fallback_MX) with ESMTP id 15DD510C559B0
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2014 17:12:27 +0400 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

Variable 'irq' is declared as unsigned and then used to store
negative return values from irq_alloc_descs() such as -EINVAL.
This patch fix this by declaring the variable as a signed.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-davinci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 7629b4f..29321ee 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -423,7 +423,8 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
 
 static int davinci_gpio_irq_setup(struct platform_device *pdev)
 {
-	unsigned	gpio, irq, bank;
+	unsigned	gpio, bank;
+	int		irq;
 	struct clk	*clk;
 	u32		binten = 0;
 	unsigned	ngpio, bank_irq;
-- 
1.8.3.2

