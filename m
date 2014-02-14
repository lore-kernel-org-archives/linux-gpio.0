From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [RESEND 5/6] gpio: ich: Add output levels cache support
Date: Fri, 14 Feb 2014 15:01:57 +0100
Message-ID: <1392386518-11025-6-git-send-email-vdonnefort@gmail.com>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:50146 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529AbaBNOCH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2014 09:02:07 -0500
Received: by mail-we0-f177.google.com with SMTP id t61so8828603wes.36
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2014 06:02:06 -0800 (PST)
In-Reply-To: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, asierra@xes-inc.com, lee.jones@linaro.org, Vincent Donnefort <vdonnefort@gmail.com>

This patch allows GPIO driver to cache GPIO_LVL output registers. The aim is to
support chipsets on which GPIO_LVL value can't be read for output pins.

Caching output levels implies the first output values reading as 0. The driver
so can't be aware of set values GPIOs by bootloader or BIOS.

Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
---
 drivers/gpio/gpio-ich.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index f3eb1c5..bfef20f 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -78,6 +78,12 @@ struct ichx_desc {
 	/* Some chipsets have quirks, let these use their own request/get */
 	int (*request)(struct gpio_chip *chip, unsigned offset);
 	int (*get)(struct gpio_chip *chip, unsigned offset);
+
+	/*
+	 * Some chipsets don't let reading output values on GPIO_LVL register
+	 * this option allows driver caching written output values
+	 */
+	bool use_outlvl_cache;
 };
 
 static struct {
@@ -89,6 +95,7 @@ static struct {
 	struct ichx_desc *desc;	/* Pointer to chipset-specific description */
 	u32 orig_gpio_ctrl;	/* Orig CTRL value, used to restore on exit */
 	u8 use_gpio;		/* Which GPIO groups are usable */
+	int outlvl_cache[3];	/* cached output values */
 } ichx_priv;
 
 static int modparam_gpiobase = -1;	/* dynamic */
@@ -106,14 +113,21 @@ static int ichx_write_bit(int reg, unsigned nr, int val, int verify)
 
 	spin_lock_irqsave(&ichx_priv.lock, flags);
 
-	data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
-			 ichx_priv.gpio_base);
+	if (reg == GPIO_LVL && ichx_priv.desc->use_outlvl_cache)
+		data = ichx_priv.outlvl_cache[reg_nr];
+	else
+		data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
+				 ichx_priv.gpio_base);
+
 	if (val)
 		data |= 1 << bit;
 	else
 		data &= ~(1 << bit);
 	ICHX_WRITE(data, ichx_priv.desc->regs[reg][reg_nr],
 			 ichx_priv.gpio_base);
+	if (reg == GPIO_LVL && ichx_priv.desc->use_outlvl_cache)
+		ichx_priv.outlvl_cache[reg_nr] = data;
+
 	tmp = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
 			ichx_priv.gpio_base);
 	if (verify && data != tmp)
@@ -136,6 +150,9 @@ static int ichx_read_bit(int reg, unsigned nr)
 	data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
 			 ichx_priv.gpio_base);
 
+	if (reg == GPIO_LVL && ichx_priv.desc->use_outlvl_cache)
+		data = ichx_priv.outlvl_cache[reg_nr] | data;
+
 	spin_unlock_irqrestore(&ichx_priv.lock, flags);
 
 	return data & (1 << bit) ? 1 : 0;
-- 
1.8.3.2

