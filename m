From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/8] ARM: iop32x: read N2100 power key using gpiolib
Date: Fri, 20 Sep 2013 22:17:39 +0200
Message-ID: <1379708259-7928-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:59704 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933Ab3ITURo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 16:17:44 -0400
Received: by mail-ee0-f41.google.com with SMTP id d17so497203eek.28
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 13:17:43 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

Refrain from using the custom gpio_line_get() to read the power
key on the N2100, use the gpiolib function gpio_get() instead.
Also request the line in the GPIOs initicall, and move the poll
timer setup to that inicall so the gpio chip is available before
we request this GPIO and start to poll it.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Mikael Pettersson <mikpe@it.uu.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Move the setup and poll init into the new GPIO initialization
  function to avoid probe order problems.
---
 arch/arm/mach-iop32x/n2100.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-iop32x/n2100.c b/arch/arm/mach-iop32x/n2100.c
index 6bace5b..bc40a97 100644
--- a/arch/arm/mach-iop32x/n2100.c
+++ b/arch/arm/mach-iop32x/n2100.c
@@ -306,7 +306,7 @@ static struct timer_list power_button_poll_timer;
 
 static void power_button_poll(unsigned long dummy)
 {
-	if (gpio_line_get(N2100_POWER_BUTTON) == 0) {
+	if (gpio_get_value(N2100_POWER_BUTTON) == 0) {
 		ctrl_alt_del();
 		return;
 	}
@@ -325,6 +325,20 @@ static int __init n2100_request_gpios(void)
 	ret = gpio_request(N2100_HARDWARE_RESET, "reset");
 	if (ret)
 		pr_err("could not request reset GPIO\n");
+
+	ret = gpio_request(N2100_POWER_BUTTON, "power");
+	if (ret)
+		pr_err("could not request power GPIO\n");
+	else {
+		ret = gpio_direction_input(N2100_POWER_BUTTON);
+		if (ret)
+			pr_err("could not set power GPIO as input\n");
+	}
+	/* Set up power button poll timer */
+	init_timer(&power_button_poll_timer);
+	power_button_poll_timer.function = power_button_poll;
+	power_button_poll_timer.expires = jiffies + (HZ / 10);
+	add_timer(&power_button_poll_timer);
 	return 0;
 }
 device_initcall(n2100_request_gpios);
@@ -341,11 +355,6 @@ static void __init n2100_init_machine(void)
 		ARRAY_SIZE(n2100_i2c_devices));
 
 	pm_power_off = n2100_power_off;
-
-	init_timer(&power_button_poll_timer);
-	power_button_poll_timer.function = power_button_poll;
-	power_button_poll_timer.expires = jiffies + (HZ / 10);
-	add_timer(&power_button_poll_timer);
 }
 
 MACHINE_START(N2100, "Thecus N2100")
-- 
1.8.3.1

