From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH 4/6] gpio: ich: Add support for multiple register addresses
Date: Fri,  7 Feb 2014 14:21:05 +0100
Message-ID: <1391779267-27084-4-git-send-email-vdonnefort@lacie.com>
References: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:32905 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932142AbaBGNVm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2014 08:21:42 -0500
Received: by mail-wg0-f47.google.com with SMTP id m15so2225794wgh.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2014 05:21:40 -0800 (PST)
In-Reply-To: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, Vincent Donnefort <vdonnefort@gmail.com>

From: Vincent Donnefort <vdonnefort@gmail.com>

This patch introduces regs and reglen pointers which allow a chipset to have
register addresses differing from ICH ones.

Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 82887c5..f3eb1c5 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -62,6 +62,10 @@ struct ichx_desc {
 	/* Max GPIO pins the chipset can have */
 	uint ngpio;
 
+	/* chipset registers */
+	const u8 (*regs)[3];
+	const u8 *reglen;
+
 	/* GPO_BLINK is available on this chipset */
 	bool have_blink;
 
@@ -102,13 +106,16 @@ static int ichx_write_bit(int reg, unsigned nr, int val, int verify)
 
 	spin_lock_irqsave(&ichx_priv.lock, flags);
 
-	data = ICHX_READ(ichx_regs[reg][reg_nr], ichx_priv.gpio_base);
+	data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
+			 ichx_priv.gpio_base);
 	if (val)
 		data |= 1 << bit;
 	else
 		data &= ~(1 << bit);
-	ICHX_WRITE(data, ichx_regs[reg][reg_nr], ichx_priv.gpio_base);
-	tmp = ICHX_READ(ichx_regs[reg][reg_nr], ichx_priv.gpio_base);
+	ICHX_WRITE(data, ichx_priv.desc->regs[reg][reg_nr],
+			 ichx_priv.gpio_base);
+	tmp = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
+			ichx_priv.gpio_base);
 	if (verify && data != tmp)
 		ret = -EPERM;
 
@@ -126,7 +133,8 @@ static int ichx_read_bit(int reg, unsigned nr)
 
 	spin_lock_irqsave(&ichx_priv.lock, flags);
 
-	data = ICHX_READ(ichx_regs[reg][reg_nr], ichx_priv.gpio_base);
+	data = ICHX_READ(ichx_priv.desc->regs[reg][reg_nr],
+			 ichx_priv.gpio_base);
 
 	spin_unlock_irqrestore(&ichx_priv.lock, flags);
 
@@ -295,27 +303,37 @@ static struct ichx_desc i3100_desc = {
 static struct ichx_desc ich7_desc = {
 	.ngpio = 50,
 	.have_blink = true,
+	.regs = ichx_regs,
+	.reglen = ichx_reglen,
 };
 
 /* ICH9-based */
 static struct ichx_desc ich9_desc = {
 	.ngpio = 61,
 	.have_blink = true,
+	.regs = ichx_regs,
+	.reglen = ichx_reglen,
 };
 
 /* ICH10-based - Consumer/corporate versions have different amount of GPIO */
 static struct ichx_desc ich10_cons_desc = {
 	.ngpio = 61,
 	.have_blink = true,
+	.regs = ichx_regs,
+	.reglen = ichx_reglen,
 };
 static struct ichx_desc ich10_corp_desc = {
 	.ngpio = 72,
 	.have_blink = true,
+	.regs = ichx_regs,
+	.reglen = ichx_reglen,
 };
 
 /* Intel 5 series, 6 series, 3400 series, and C200 series */
 static struct ichx_desc intel5_desc = {
 	.ngpio = 76,
+	.regs = ichx_regs,
+	.reglen = ichx_reglen,
 };
 
 static int ichx_gpio_request_regions(struct resource *res_base,
@@ -326,11 +344,12 @@ static int ichx_gpio_request_regions(struct resource *res_base,
 	if (!res_base || !res_base->start || !res_base->end)
 		return -ENODEV;
 
-	for (i = 0; i < ARRAY_SIZE(ichx_regs[0]); i++) {
+	for (i = 0; i < ARRAY_SIZE(ichx_priv.desc->regs[0]); i++) {
 		if (!(use_gpio & (1 << i)))
 			continue;
-		if (!request_region(res_base->start + ichx_regs[0][i],
-				    ichx_reglen[i], name))
+		if (!request_region(
+				res_base->start + ichx_priv.desc->regs[0][i],
+				ichx_priv.desc->reglen[i], name))
 			goto request_err;
 	}
 	return 0;
@@ -340,8 +359,8 @@ request_err:
 	for (i--; i >= 0; i--) {
 		if (!(use_gpio & (1 << i)))
 			continue;
-		release_region(res_base->start + ichx_regs[0][i],
-			       ichx_reglen[i]);
+		release_region(res_base->start + ichx_priv.desc->regs[0][i],
+			       ichx_priv.desc->reglen[i]);
 	}
 	return -EBUSY;
 }
@@ -350,11 +369,11 @@ static void ichx_gpio_release_regions(struct resource *res_base, u8 use_gpio)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(ichx_regs[0]); i++) {
+	for (i = 0; i < ARRAY_SIZE(ichx_priv.desc->regs[0]); i++) {
 		if (!(use_gpio & (1 << i)))
 			continue;
-		release_region(res_base->start + ichx_regs[0][i],
-			       ichx_reglen[i]);
+		release_region(res_base->start + ichx_priv.desc->regs[0][i],
+			       ichx_priv.desc->reglen[i]);
 	}
 }
 
-- 
1.8.3.2

