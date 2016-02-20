From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: brcmstb: Use list_for_each_entry at appropriate places
Date: Sat, 20 Feb 2016 09:50:37 +0800
Message-ID: <1455933037.31674.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:35122 "EHLO
	mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1428028AbcBTBum (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 20:50:42 -0500
Received: by mail-pf0-f170.google.com with SMTP id c10so62073374pfc.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 17:50:42 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Use list_for_each_entry to simplify the code a bit.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-brcmstb.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index d764425..42d51c5 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -233,17 +233,14 @@ static void brcmstb_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct list_head *pos;
+	struct brcmstb_gpio_bank *bank;
 
 	/* Interrupts weren't properly cleared during probe */
 	BUG_ON(!priv || !chip);
 
 	chained_irq_enter(chip, desc);
-	list_for_each(pos, &priv->bank_list) {
-		struct brcmstb_gpio_bank *bank =
-			list_entry(pos, struct brcmstb_gpio_bank, node);
+	list_for_each_entry(bank, &priv->bank_list, node)
 		brcmstb_gpio_irq_bank_handler(bank);
-	}
 	chained_irq_exit(chip, desc);
 }
 
@@ -280,7 +277,6 @@ static int brcmstb_gpio_sanity_check_banks(struct device *dev,
 static int brcmstb_gpio_remove(struct platform_device *pdev)
 {
 	struct brcmstb_gpio_priv *priv = platform_get_drvdata(pdev);
-	struct list_head *pos;
 	struct brcmstb_gpio_bank *bank;
 	int ret = 0;
 
@@ -293,10 +289,9 @@ static int brcmstb_gpio_remove(struct platform_device *pdev)
 	 * You can lose return values below, but we report all errors, and it's
 	 * more important to actually perform all of the steps.
 	 */
-	list_for_each(pos, &priv->bank_list) {
-		bank = list_entry(pos, struct brcmstb_gpio_bank, node);
+	list_for_each_entry(bank, &priv->bank_list, node)
 		gpiochip_remove(&bank->gc);
-	}
+
 	if (priv->reboot_notifier.notifier_call) {
 		ret = unregister_reboot_notifier(&priv->reboot_notifier);
 		if (ret)
-- 
2.1.4



