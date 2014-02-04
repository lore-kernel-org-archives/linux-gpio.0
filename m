From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: pl061: Select IRQ_DOMAIN rather than GENERIC_IRQ_CHIP
Date: Tue, 04 Feb 2014 20:39:01 +0800
Message-ID: <1391517541.3899.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:38427 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753832AbaBDMjI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2014 07:39:08 -0500
Received: by mail-pb0-f41.google.com with SMTP id up15so8426074pbc.28
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2014 04:39:07 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, linux-gpio@vger.kernel.org

commit f1f70479e999 "gpio: pl061: support irqdomain" drops the support of
irq generic chip and use irqdomain instead. Thus fixes the dependency by
selecting IRQ_DOMAIN rather than GENERIC_IRQ_CHIP.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 903f24d..9732c9b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -228,7 +228,7 @@ config GPIO_OCTEON
 config GPIO_PL061
 	bool "PrimeCell PL061 GPIO support"
 	depends on ARM_AMBA
-	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device
 
-- 
1.8.1.2



