From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/8] ARM: iop32x: read N2100 power key using gpiolib
Date: Mon,  9 Sep 2013 17:40:31 +0200
Message-ID: <1378741231-12958-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:51881 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab3IIPkg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2013 11:40:36 -0400
Received: by mail-la0-f48.google.com with SMTP id er20so5067422lab.35
        for <linux-gpio@vger.kernel.org>; Mon, 09 Sep 2013 08:40:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

Refrain from using the custom gpio_line_get() to read the power
key on the N2100, use the gpiolib function gpio_get() instead.
Also request the line when initializing the machine.

Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Mikael Pettersson <mikpe@it.uu.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-iop32x/n2100.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-iop32x/n2100.c b/arch/arm/mach-iop32x/n2100.c
index cd199c1..d495b4f 100644
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
@@ -339,6 +339,14 @@ static void __init n2100_init_machine(void)
 	ret = gpio_request(N2100_HARDWARE_RESET, "reset");
 	if (ret)
 		pr_err("could not request reset GPIO\n");
+	ret = gpio_request(N2100_POWER_BUTTON, "power");
+	if (ret)
+		pr_err("could not request power GPIO\n");
+	else {
+		ret = gpio_direction_input(N2100_POWER_BUTTON);
+		if (ret)
+			pr_err("could not set power GPIO as input\n");
+	}
 }
 
 MACHINE_START(N2100, "Thecus N2100")
-- 
1.8.3.1

