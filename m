From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: wm831x: use the new open drain callback
Date: Sun, 10 Apr 2016 15:12:19 +0200
Message-ID: <1460293939-14181-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33062 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351AbcDJNM1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Apr 2016 09:12:27 -0400
Received: by mail-lf0-f47.google.com with SMTP id e190so124034475lfe.0
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2016 06:12:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

The WM831x GPIOs clearly have a dedicated open drain control
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
 drivers/gpio/gpio-wm831x.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 18cb0f534b91..c16c6fc3683c 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -132,6 +132,25 @@ static int wm831x_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
 	return wm831x_set_bits(wm831x, reg, WM831X_GPN_FN_MASK, fn);
 }
 
+static int wm831x_set_single_ended(struct gpio_chip *chip,
+				   unsigned int offset,
+				   enum single_ended_mode mode)
+{
+	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
+	struct wm831x *wm831x = wm831x_gpio->wm831x;
+	int reg = WM831X_GPIO1_CONTROL + offset;
+
+	if (mode == LINE_MODE_OPEN_DRAIN)
+		return wm831x_set_bits(wm831x, reg,
+				       WM831X_GPN_OD_MASK, WM831X_GPN_OD);
+
+	if (mode == LINE_MODE_PUSH_PULL)
+		return wm831x_set_bits(wm831x, reg,
+				       WM831X_GPN_OD_MASK, 0);
+
+	return -ENOTSUPP;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
@@ -216,7 +235,7 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			   pull,
 			   powerdomain,
 			   reg & WM831X_GPN_POL ? "" : " inverted",
-			   reg & WM831X_GPN_OD ? "open-drain" : "CMOS",
+			   reg & WM831X_GPN_OD ? "open-drain" : "push-pull",
 			   tristated ? " tristated" : "",
 			   reg);
 	}
@@ -234,6 +253,7 @@ static struct gpio_chip template_chip = {
 	.set			= wm831x_gpio_set,
 	.to_irq			= wm831x_gpio_to_irq,
 	.set_debounce		= wm831x_gpio_set_debounce,
+	.set_single_ended	= wm831x_set_single_ended,
 	.dbg_show		= wm831x_gpio_dbg_show,
 	.can_sleep		= true,
 };
-- 
2.4.3

