From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] gpio: make GPIO_OMAP bool instead of tristate
Date: Tue,  6 Oct 2015 17:31:11 +0530
Message-ID: <1444132871-25798-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:36117 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204AbbJFMBV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2015 08:01:21 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Tony Lindgren <tony@atomide.com>, Austin Schuh <austin@peloton-tech.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>

While building arm allmodconfig the build fails with the error:
ERROR: "handle_bad_irq" [drivers/gpio/gpio-omap.ko] undefined!

The build breaks as handle_bad_irq is not exported for module use.

Fixes: 450fa54cfd66 ("gpio: omap: convert to use generic irq handler")
Cc: Tony Lindgren <tony@atomide.com>
Cc: Austin Schuh <austin@peloton-tech.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

Same problem for pinctrl was fixed by
5ba341604a054294aeb812603349bba024d716ee

And for your reference:
https://lkml.org/lkml/2014/2/25/278

 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 63000b1..d910fd1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -330,7 +330,7 @@ config GPIO_OCTEON
 	  family of SOCs.
 
 config GPIO_OMAP
-	tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
+	bool "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
 	default y if ARCH_OMAP
 	depends on ARM
 	select GENERIC_IRQ_CHIP
-- 
1.9.1

