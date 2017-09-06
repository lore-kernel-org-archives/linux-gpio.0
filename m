From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: thunderx: select IRQ_DOMAIN_HIERARCHY instead of depends on
Date: Wed,  6 Sep 2017 10:40:52 +0900
Message-ID: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:17225 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753474AbdIFBla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2017 21:41:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

IRQ_DOMAIN_HIERARCHY is not user-configurable, but supposed to be
selected by drivers that need IRQ domain hierarchy support.

GPIO_THUNDERX is the only user of "depends on IRQ_DOMAIN_HIERARCHY".
This means, we can not enable GPIO_THUNDERX unless other drivers
select IRQ_DOMAIN_HIERARCHY elsewhere.  This is odd.  Flip the logic.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3388d54..3f80f16 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -453,7 +453,8 @@ config GPIO_TS4800
 config GPIO_THUNDERX
 	tristate "Cavium ThunderX/OCTEON-TX GPIO"
 	depends on ARCH_THUNDER || (64BIT && COMPILE_TEST)
-	depends on PCI_MSI && IRQ_DOMAIN_HIERARCHY
+	depends on PCI_MSI
+	select IRQ_DOMAIN_HIERARCHY
 	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	help
 	  Say yes here to support the on-chip GPIO lines on the ThunderX
-- 
2.7.4

