From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 5/6] gpio: mvebu: extra whitespace fixes
Date: Thu, 16 Mar 2017 07:34:00 +0100
Message-ID: <20170316063402.8667-6-ralph.sennhauser@gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36131 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751490AbdCPGe0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2017 02:34:26 -0400
In-Reply-To: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>

Fix whitespace errors missed by checkpatch.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 1933e63..d9aa77b 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -87,12 +87,12 @@ struct mvebu_gpio_chip {
 	int		   soc_variant;
 
 	/* Used to preserve GPIO registers across suspend/resume */
-	u32                out_reg;
-	u32                io_conf_reg;
-	u32                blink_en_reg;
-	u32                in_pol_reg;
-	u32                edge_mask_regs[4];
-	u32                level_mask_regs[4];
+	u32		   out_reg;
+	u32		   io_conf_reg;
+	u32		   blink_en_reg;
+	u32		   in_pol_reg;
+	u32		   edge_mask_regs[4];
+	u32		   level_mask_regs[4];
 };
 
 /*
@@ -186,7 +186,6 @@ static void __iomem *mvebu_gpioreg_level_mask(struct mvebu_gpio_chip *mvchip)
 /*
  * Functions implementing the gpio_chip methods
  */
-
 static void mvebu_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
-- 
2.10.2

