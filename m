From: Jayachandran C <jnair@caviumnetworks.com>
Subject: [PATCH] gpio: xlp: Update for ARCH_THUNDER2
Date: Sun, 12 Mar 2017 11:14:28 +0000
Message-ID: <1489317268-5376-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-sn1nam02on0041.outbound.protection.outlook.com ([104.47.36.41]:51781
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755667AbdCLLPD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 12 Mar 2017 07:15:03 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Kamlakant.Patel@cavium.com
Cc: Jayachandran C <jnair@caviumnetworks.com>

ARCH_VULCAN arm64 platform (for Broadcom Vulcan ARM64 processors) has
been discontinued. Cavium's ThunderX2 CN99XX (ARCH_THUNDER2) will be
the next revision of this platform.

Update compile dependencies and ACPI ID to reflect this change. There
is not need to retain ARCH_VULCAN since the Vulcan processor was never
in production.

Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>
---
 drivers/gpio/Kconfig    | 2 +-
 drivers/gpio/gpio-xlp.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0504307..a3f0b4e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -505,7 +505,7 @@ config GPIO_XILINX
 
 config GPIO_XLP
 	tristate "Netlogic XLP GPIO support"
-	depends on OF_GPIO && (CPU_XLP || ARCH_VULCAN || COMPILE_TEST)
+	depends on OF_GPIO && (CPU_XLP || ARCH_THUNDER2 || COMPILE_TEST)
 	select GPIOLIB_IRQCHIP
 	help
 	  This driver provides support for GPIO interface on Netlogic XLP MIPS64
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 4620d05..15d7669 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -441,6 +441,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xlp_gpio_acpi_match[] = {
 	{ "BRCM9006", GPIO_VARIANT_VULCAN },
+	{ "CAV9006",  GPIO_VARIANT_VULCAN },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
-- 
2.7.4

