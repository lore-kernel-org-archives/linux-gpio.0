Return-Path: <SRS0=IJzy=Z7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8B4C2BD09
	for <linux-gpio@archiver.kernel.org>; Mon,  9 Dec 2019 12:35:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF05720828
	for <linux-gpio@archiver.kernel.org>; Mon,  9 Dec 2019 12:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfLIMfu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 9 Dec 2019 07:35:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:12846 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727200AbfLIMft (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 07:35:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 04:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="210084786"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2019 04:35:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7C99C141; Mon,  9 Dec 2019 14:35:46 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: pca953x: Switch to bitops in IRQ callbacks
Date:   Mon,  9 Dec 2019 14:35:44 +0200
Message-Id: <20191209123545.85309-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have driver converted to use bitmap API we must use
traditional bit operations (set_bit(), clear_bit(), etc.)
against it.

Currently IRQ callbacks are missed in the conversion and
thus broken.

Let's fix it right here right now.

Fixes: 35d13d94893f ("gpio: pca953x: convert to use bitmap API")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 6652bee01966..9853547e7276 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -568,16 +568,18 @@ static void pca953x_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	chip->irq_mask[d->hwirq / BANK_SZ] &= ~BIT(d->hwirq % BANK_SZ);
+	clear_bit(hwirq, chip->irq_mask);
 }
 
 static void pca953x_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	chip->irq_mask[d->hwirq / BANK_SZ] |= BIT(d->hwirq % BANK_SZ);
+	set_bit(hwirq, chip->irq_mask);
 }
 
 static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
@@ -635,8 +637,7 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	int bank_nb = d->hwirq / BANK_SZ;
-	u8 mask = BIT(d->hwirq % BANK_SZ);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	if (!(type & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(&chip->client->dev, "irq %d: unsupported type %d\n",
@@ -644,15 +645,8 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	if (type & IRQ_TYPE_EDGE_FALLING)
-		chip->irq_trig_fall[bank_nb] |= mask;
-	else
-		chip->irq_trig_fall[bank_nb] &= ~mask;
-
-	if (type & IRQ_TYPE_EDGE_RISING)
-		chip->irq_trig_raise[bank_nb] |= mask;
-	else
-		chip->irq_trig_raise[bank_nb] &= ~mask;
+	assign_bit(hwirq, chip->irq_trig_fall, type & IRQ_TYPE_EDGE_FALLING);
+	assign_bit(hwirq, chip->irq_trig_raise, type & IRQ_TYPE_EDGE_RISING);
 
 	return 0;
 }
@@ -661,10 +655,10 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 mask = BIT(d->hwirq % BANK_SZ);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	chip->irq_trig_raise[d->hwirq / BANK_SZ] &= ~mask;
-	chip->irq_trig_fall[d->hwirq / BANK_SZ] &= ~mask;
+	clear_bit(hwirq, chip->irq_trig_raise);
+	clear_bit(hwirq, chip->irq_trig_fall);
 }
 
 static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pending)
-- 
2.24.0

