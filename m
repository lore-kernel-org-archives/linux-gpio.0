From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: tb10x: GPIO_TB10X needs to select GENERIC_IRQ_CHIP
Date: Tue, 04 Feb 2014 18:59:41 +0800
Message-ID: <1391511581.4664.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:64087 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751812AbaBDK7u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2014 05:59:50 -0500
Received: by mail-pa0-f41.google.com with SMTP id fa1so8355899pad.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2014 02:59:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sascha Leuenberger <sascha.leuenberger@abilis.com>, Christian Ruppert <christian.ruppert@abilis.com>, linux-gpio@vger.kernel.org

gpio-tb10x driver uses generic irq chip APIs (irq_alloc_domain_generic_chips,
irq_remove_generic_chip), so it needs to select GENERIC_IRQ_CHIP to avoid build
error.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6973387..903f24d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -403,6 +403,7 @@ config GPIO_GRGPIO
 
 config GPIO_TB10X
 	bool
+	select GENERIC_IRQ_CHIP
 	select OF_GPIO
 
 comment "I2C GPIO expanders:"
-- 
1.8.1.2



