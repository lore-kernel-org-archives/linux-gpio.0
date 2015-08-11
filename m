From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH] gpio: mxc: fix section mismatch warning
Date: Tue, 11 Aug 2015 15:51:59 +0300
Message-ID: <1439297519-6099-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:43874 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934106AbbHKMxs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2015 08:53:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>

From: Dirk Behme <dirk.behme@de.bosch.com>

Fix the section mismatch warning

WARNING: vmlinux.o(.text+0x2b2788): Section mismatch in reference from the function mxc_gpio_probe() to the function .init.text:mxc_gpio_init_gc()
The function mxc_gpio_probe() references
the function __init mxc_gpio_init_gc().
This is often because mxc_gpio_probe lacks a __init
annotation or the annotation of mxc_gpio_init_gc is wrong.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 0f74027..e877d82 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -339,7 +339,7 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	return 0;
 }
 
-static void __init mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
+static void mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 {
 	struct irq_chip_generic *gc;
 	struct irq_chip_type *ct;
-- 
2.1.4

