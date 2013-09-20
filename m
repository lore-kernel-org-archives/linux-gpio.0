From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/8] ARM: iop32x: request and issue reset using gpio
Date: Fri, 20 Sep 2013 22:17:32 +0200
Message-ID: <1379708252-7887-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:51723 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933Ab3ITURg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 16:17:36 -0400
Received: by mail-ea0-f173.google.com with SMTP id g10so491275eak.32
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 13:17:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

As the IOP GPIO driver supports gpiolib we can use the standard
GPIO calls to issue a reset of the machine instead of using the
custom gpio_line_set/config calls. Also request the GPIO when
initializing the machine.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Mikael Pettersson <mikpe@it.uu.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Also check machine_is_n2100() so we don't request the GPIOs
  on any other machine at boot.
ChangeLog v1->v2:
- Request GPIOs in a separate device_initcall() instead of
  doing it from machine_init, as the gpio chip is registered
  after the machine init, what was I thinking about?
---
 arch/arm/mach-iop32x/n2100.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-iop32x/n2100.c b/arch/arm/mach-iop32x/n2100.c
index 0691443..6bace5b 100644
--- a/arch/arm/mach-iop32x/n2100.c
+++ b/arch/arm/mach-iop32x/n2100.c
@@ -30,6 +30,7 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/io.h>
+#include <linux/gpio.h>
 #include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
@@ -288,8 +289,14 @@ static void n2100_power_off(void)
 
 static void n2100_restart(enum reboot_mode mode, const char *cmd)
 {
-	gpio_line_set(N2100_HARDWARE_RESET, GPIO_LOW);
-	gpio_line_config(N2100_HARDWARE_RESET, GPIO_OUT);
+	int ret;
+
+	ret = gpio_direction_output(N2100_HARDWARE_RESET, 0);
+	if (ret) {
+		pr_crit("could not drive reset GPIO low\n");
+		return;
+	}
+	/* Wait for reset to happen */
 	while (1)
 		;
 }
@@ -308,6 +315,19 @@ static void power_button_poll(unsigned long dummy)
 	add_timer(&power_button_poll_timer);
 }
 
+static int __init n2100_request_gpios(void)
+{
+	int ret;
+
+	if (!machine_is_n2100())
+		return 0;
+
+	ret = gpio_request(N2100_HARDWARE_RESET, "reset");
+	if (ret)
+		pr_err("could not request reset GPIO\n");
+	return 0;
+}
+device_initcall(n2100_request_gpios);
 
 static void __init n2100_init_machine(void)
 {
-- 
1.8.3.1

