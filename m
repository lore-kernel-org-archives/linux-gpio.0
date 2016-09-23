From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: omap2: fix missing include
Date: Fri, 23 Sep 2016 14:40:12 +0200
Message-ID: <1474634412-7050-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34225 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933869AbcIWMkV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 08:40:21 -0400
Received: by mail-lf0-f49.google.com with SMTP id y6so91921011lff.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 05:40:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Tony Lindgren <tony@atomide.com>

commit d47529b2e9fe
"gpio: don't include module.h in shared driver header"
removed <linux/module.h> from the <linux/gpio/driver.h> header.

It seems arch/arm/mach-omap2/board-rx51-peripherals.c
is using __initdata_or_module from <linux/module.h> through
<linux/gpio.h> to <linux/gpio/driver.h>, so break this dependency
so that we get a clean compile.

Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Tony Lindgren <tony@atomide.com>
Fixes: d47529b2e9fe ("gpio: don't include module.h in shared driver header")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Tony: please ACK this if it's OK so I can merge it in front of
the offending patch.
---
 arch/arm/mach-omap2/board-rx51-peripherals.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/board-rx51-peripherals.c b/arch/arm/mach-omap2/board-rx51-peripherals.c
index a5ab712c1a59..6d3af43ae3e4 100644
--- a/arch/arm/mach-omap2/board-rx51-peripherals.c
+++ b/arch/arm/mach-omap2/board-rx51-peripherals.c
@@ -29,6 +29,7 @@
 #include <linux/power/isp1704_charger.h>
 #include <linux/platform_data/spi-omap2-mcspi.h>
 #include <linux/platform_data/mtd-onenand-omap2.h>
+#include <linux/module.h>
 
 #include <plat/dmtimer.h>
 
-- 
2.7.4

