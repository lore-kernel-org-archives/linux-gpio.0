From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] pinctrl: at91-pio4: handle suspend to ram
Date: Thu,  6 Apr 2017 15:36:23 +0200
Message-ID: <20170406133623.19160-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42935 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934233AbdDFNg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Apr 2017 09:36:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>

When suspending to RAM, the power to the core is cut and the register
values are lost. Save and restore more registers than just IMR.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 28bbc1bb9e6c..dc8591543dee 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -126,7 +126,11 @@ struct atmel_pioctrl {
 	struct irq_domain	*irq_domain;
 	int			*irqs;
 	unsigned		*pm_wakeup_sources;
-	unsigned		*pm_suspend_backup;
+	struct {
+		u32		imr;
+		u32		odsr;
+		u32		cfgr[ATMEL_PIO_NPINS_PER_BANK];
+	} *pm_suspend_backup;
 	struct device		*dev;
 	struct device_node	*node;
 };
@@ -830,17 +834,26 @@ static int __maybe_unused atmel_pctrl_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct atmel_pioctrl *atmel_pioctrl = platform_get_drvdata(pdev);
-	int i;
+	int i, j;
 
 	/*
 	 * For each bank, save IMR to restore it later and disable all GPIO
 	 * interrupts excepting the ones marked as wakeup sources.
 	 */
 	for (i = 0; i < atmel_pioctrl->nbanks; i++) {
-		atmel_pioctrl->pm_suspend_backup[i] =
+		atmel_pioctrl->pm_suspend_backup[i].imr =
 			atmel_gpio_read(atmel_pioctrl, i, ATMEL_PIO_IMR);
 		atmel_gpio_write(atmel_pioctrl, i, ATMEL_PIO_IDR,
 				 ~atmel_pioctrl->pm_wakeup_sources[i]);
+		atmel_pioctrl->pm_suspend_backup[i].odsr =
+			atmel_gpio_read(atmel_pioctrl, i, ATMEL_PIO_ODSR);
+		for (j = 0; j < ATMEL_PIO_NPINS_PER_BANK; j++) {
+			atmel_gpio_write(atmel_pioctrl, i,
+					 ATMEL_PIO_MSKR, BIT(j));
+			atmel_pioctrl->pm_suspend_backup[i].cfgr[j] =
+				atmel_gpio_read(atmel_pioctrl, i,
+						ATMEL_PIO_CFGR);
+		}
 	}
 
 	return 0;
@@ -850,11 +863,20 @@ static int __maybe_unused atmel_pctrl_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct atmel_pioctrl *atmel_pioctrl = platform_get_drvdata(pdev);
-	int i;
+	int i, j;
 
-	for (i = 0; i < atmel_pioctrl->nbanks; i++)
+	for (i = 0; i < atmel_pioctrl->nbanks; i++) {
 		atmel_gpio_write(atmel_pioctrl, i, ATMEL_PIO_IER,
-				 atmel_pioctrl->pm_suspend_backup[i]);
+				 atmel_pioctrl->pm_suspend_backup[i].imr);
+		atmel_gpio_write(atmel_pioctrl, i, ATMEL_PIO_SODR,
+				 atmel_pioctrl->pm_suspend_backup[i].odsr);
+		for (j = 0; j < ATMEL_PIO_NPINS_PER_BANK; j++) {
+			atmel_gpio_write(atmel_pioctrl, i,
+					 ATMEL_PIO_MSKR, BIT(j));
+			atmel_gpio_write(atmel_pioctrl, i, ATMEL_PIO_CFGR,
+					 atmel_pioctrl->pm_suspend_backup[i].cfgr[j]);
+		}
+	}
 
 	return 0;
 }
-- 
2.11.0

