From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 1/1] pinctrl: at91: Add set_multiple GPIO chip feature
Date: Thu,  2 Apr 2015 11:43:18 +0200
Message-ID: <1427967798-6962-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:58439 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750711AbbDBJni (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Apr 2015 05:43:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexanders83@web.de>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>

This adds the callback for set_multiple.
As this controller has a separate set and clear register, we can't write
directly to PIO_ODSR as this would required a cached variable and would
race with at91_gpio_set.
So build masks for the PIO_SODR and PIO_CODR registers and write them
together.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
Changes in v2:
* Greatly simplyfied the implementation: Generate the set- and clear-mask
  directly from 'mask' and 'bits'

I skipped the 'Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>'
due to the new implementation.

 drivers/pinctrl/pinctrl-at91.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index a4814066ea08..3a7b008a9a4e 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1330,6 +1330,18 @@ static void at91_gpio_set(struct gpio_chip *chip, unsigned offset,
 	writel_relaxed(mask, pio + (val ? PIO_SODR : PIO_CODR));
 }
 
+static void at91_gpio_set_multiple(struct gpio_chip *chip,
+				      unsigned long *mask, unsigned long *bits)
+{
+	struct at91_gpio_chip *at91_gpio = to_at91_gpio_chip(chip);
+	void __iomem *pio = at91_gpio->regbase;
+	uint32_t set_mask = *mask & *bits;
+	uint32_t clear_mask = *mask & ~(*bits);
+
+	writel_relaxed(set_mask, pio + PIO_SODR);
+	writel_relaxed(clear_mask, pio + PIO_CODR);
+}
+
 static int at91_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				int val)
 {
@@ -1689,6 +1701,7 @@ static struct gpio_chip at91_gpio_template = {
 	.get			= at91_gpio_get,
 	.direction_output	= at91_gpio_direction_output,
 	.set			= at91_gpio_set,
+	.set_multiple		= at91_gpio_set_multiple,
 	.dbg_show		= at91_gpio_dbg_show,
 	.can_sleep		= false,
 	.ngpio			= MAX_NB_GPIO_PER_BANK,
-- 
2.3.4

