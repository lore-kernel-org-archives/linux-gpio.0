From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/8] gpio: decouple the IOP GPIO driver from platform
Date: Fri, 20 Sep 2013 22:17:47 +0200
Message-ID: <1379708267-7968-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:47693 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753925Ab3ITURw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 16:17:52 -0400
Received: by mail-ea0-f174.google.com with SMTP id z15so486330ead.19
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 13:17:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

This removes the only dependence between the IOP GPIO
driver and the GENERIC_GPIO header in <mach/gpio.h>
and its common implementation in the <asm/*> namespace
by copying the one constant it is using into the driver
file.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Mikael Pettersson <mikpe@it.uu.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-iop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index 697de6d..d4a170d 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -16,8 +16,8 @@
 #include <linux/errno.h>
 #include <linux/gpio.h>
 #include <linux/export.h>
-#include <asm/hardware/iop3xx.h>
-#include <mach/gpio.h>
+
+#define IOP3XX_N_GPIOS	8
 
 void gpio_line_config(int line, int direction)
 {
-- 
1.8.3.1

