From: Jayachandran C <jnair@caviumnetworks.com>
Subject: [PATCH] gpio: xlp: update GPIO_XLP dependency
Date: Mon, 22 May 2017 08:58:31 +0000
Message-ID: <1495443511-82849-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-sn1nam01on0075.outbound.protection.outlook.com ([104.47.32.75]:25312
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753268AbdEVI6n (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 May 2017 04:58:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jayachandran C <jnair@caviumnetworks.com>, linux-gpio@vger.kernel.org

Broadcom Vulcan (ARCH_VULCAN) has been discontinued and will be deleted
soon. So, update the GPIO_XLP Kconfig entry to remove the ARCH_VULCAN
dependency.

Also update the documentation to note that Cavium ThunderX2 uses this
driver.

Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>
---

Broadcom Vulcan is now Cavium ThunderX2, and the rest of the
dependencies on ARCH_VULCAN has been moved to ARCH_THUNDER2 already.
This is the last remaining dependency of ARCH_VULCAN in drivers/

JC.

 drivers/gpio/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 23ca51e..ab35f7e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -504,12 +504,13 @@ config GPIO_XILINX
 
 config GPIO_XLP
 	tristate "Netlogic XLP GPIO support"
-	depends on OF_GPIO && (CPU_XLP || ARCH_VULCAN || ARCH_THUNDER2 || COMPILE_TEST)
+	depends on OF_GPIO && (CPU_XLP || ARCH_THUNDER2 || COMPILE_TEST)
 	select GPIOLIB_IRQCHIP
 	help
 	  This driver provides support for GPIO interface on Netlogic XLP MIPS64
 	  SoCs. Currently supported XLP variants are XLP8XX, XLP3XX, XLP2XX,
-	  XLP9XX and XLP5XX.
+	  XLP9XX and XLP5XX. The same GPIO controller block is also present in
+	  Cavium's ThunderX2 CN99XX SoCs.
 
 	  If unsure, say N.
 
-- 
2.7.4

