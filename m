From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: wm8994: use the new open drain callback
Date: Sun, 10 Apr 2016 15:12:30 +0200
Message-ID: <1460293950-14232-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35300 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753101AbcDJNMl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Apr 2016 09:12:41 -0400
Received: by mail-lf0-f54.google.com with SMTP id c126so125861084lfb.2
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2016 06:12:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

The WM8994 GPIOs clearly have a dedicated open drain control
register. Implement support for controlling this from GPIO
descriptor tables or other hardware descriptions such as
device tree by implementing the .set_single_ended() callback.

Before this patch, lines requesting open drain will just be
switched to input mode by the framework, thus emulating open
drain. But the hardware can do the real thing, so let's
support that.

As part of this, rename the debugfs string for output mode
from "CMOS" to "push-pull" because it is the term used in
the framework to signify a tomem-pole CMOS output.

Cc: patches@opensource.wolfsonmicro.com
Cc: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-wm8994.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index b089df99a0d0..08570dcc785b 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -103,6 +103,25 @@ static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset, WM8994_GPN_LVL, value);
 }
 
+static int wm8994_gpio_set_single_ended(struct gpio_chip *chip,
+					unsigned int offset,
+					enum single_ended_mode mode)
+{
+	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
+	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
+
+	if (mode == LINE_MODE_OPEN_DRAIN)
+		return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset,
+				       WM8994_GPN_OP_CFG_MASK,
+				       WM8994_GPN_OP_CFG);
+
+	if (mode == LINE_MODE_PUSH_PULL)
+		return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset,
+				       WM8994_GPN_OP_CFG_MASK, 0);
+
+	return -ENOTSUPP;
+}
+
 static int wm8994_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
@@ -217,7 +236,7 @@ static void wm8994_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		if (reg & WM8994_GPN_OP_CFG)
 			seq_printf(s, "open drain ");
 		else
-			seq_printf(s, "CMOS ");
+			seq_printf(s, "push-pull ");
 
 		seq_printf(s, "%s (%x)\n",
 			   wm8994_gpio_fn(reg & WM8994_GPN_FN_MASK), reg);
@@ -235,6 +254,7 @@ static struct gpio_chip template_chip = {
 	.get			= wm8994_gpio_get,
 	.direction_output	= wm8994_gpio_direction_out,
 	.set			= wm8994_gpio_set,
+	.set_single_ended	= wm8994_gpio_set_single_ended,
 	.to_irq			= wm8994_gpio_to_irq,
 	.dbg_show		= wm8994_gpio_dbg_show,
 	.can_sleep		= true,
-- 
2.4.3

