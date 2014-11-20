From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [RFC PATCH 1/1] gpio: pca953x: Allow interrupt support when compiled as module
Date: Thu, 20 Nov 2014 15:06:19 +0100
Message-ID: <1416492379-28433-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:37772 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751139AbaKTOEM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 20 Nov 2014 09:04:12 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

With commit 2fd36c55264926e268deb50f6de5f43fa5e490f7
("i2c: core: Map OF IRQ at probe time") it seems that there is no need
to force this driver to be compiled into the kernel.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
This is completely untested, as I lack a board capable of running a v3.18-rcX
kernel. But I noticed on an older kernel that this driver failed requesting
irq 0 during kernel boot. 0 because it's irq parent was not yet probed (also
a compiled in driver). With the mentioned commit this should work now.
It is currently only in
http://git.kernel.org/cgit/linux/kernel/git/wsa/linux.git/log/?h=i2c/for-next

 drivers/gpio/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0959ca9..29973d3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -547,11 +547,10 @@ config GPIO_PCA953X
 
 config GPIO_PCA953X_IRQ
 	bool "Interrupt controller support for PCA953x"
-	depends on GPIO_PCA953X=y
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable the pca953x to be used as an interrupt
-	  controller. It requires the driver to be built in the kernel.
+	  controller.
 
 config GPIO_PCF857X
 	tristate "PCF857x, PCA{85,96}7x, and MAX732[89] I2C GPIO expanders"
-- 
2.0.4

