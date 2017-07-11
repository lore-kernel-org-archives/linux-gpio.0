From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] gpio: xgene-sb: select IRQ_DOMAIN_HIERARCHY
Date: Wed, 12 Jul 2017 08:11:50 +0900
Message-ID: <1499814710-16686-3-git-send-email-yamada.masahiro@socionext.com>
References: <1499814710-16686-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:31533 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755932AbdGKXMf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jul 2017 19:12:35 -0400
In-Reply-To: <1499814710-16686-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

This driver calls irq_domain_hierarchy() and irq_chip_*_parent().
They are available only when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f235eae04c16..461d6fc3688b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -504,6 +504,7 @@ config GPIO_XGENE_SB
 	depends on ARCH_XGENE && OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	  This driver supports the GPIO block within the APM X-Gene
 	  Standby Domain. Say yes here to enable the GPIO functionality.
-- 
2.7.4

