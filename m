From: Shaveta Leekha <shaveta@freescale.com>
Subject: [PATCH 2/3] drivers/gpio/Kconfig: enable GPIO configs for LS1021A SoC
Date: Thu, 30 Jul 2015 12:57:18 +0530
Message-ID: <1438241239-15178-2-git-send-email-shaveta@freescale.com>
References: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0142.outbound.protection.outlook.com ([157.56.111.142]:47427
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751588AbbG3H13 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 30 Jul 2015 03:27:29 -0400
In-Reply-To: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: r64188@freescale.com, gnurou@gmail.com, linus.walleij@linaro.org, Shaveta Leekha <shaveta@freescale.com>

This patch enable configs for GPIOs found on
Freescale's LS1021A SOCs

It also makes mutual exclusion with ARCH_MXC,
since the GPIO controller on LS1020A SOC
is different from ARCH_MXC GPIO controllers

Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
---
Tested on Freescale SDK 1.8, as LS1021aQDS support is not yet complete in upstream

 drivers/gpio/Kconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3a9dc1a..d933a77 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -290,10 +290,10 @@ config GPIO_MPC5200
 config GPIO_MPC8XXX
 	bool "MPC512x/MPC8xxx GPIO support"
 	depends on PPC_MPC512x || PPC_MPC831x || PPC_MPC834x || PPC_MPC837x || \
-		   FSL_SOC_BOOKE || PPC_86xx
+		   FSL_SOC_BOOKE || PPC_86xx || SOC_LS1021A
 	help
 	  Say Y here if you're going to use hardware that connects to the
-	  MPC512x/831x/834x/837x/8572/8610 GPIOs.
+	  MPC512x/831x/834x/837x/8572/8610/LS1021A GPIOs.
 
 config GPIO_MSM_V2
 	tristate "Qualcomm MSM GPIO v2"
@@ -311,7 +311,7 @@ config GPIO_MVEBU
 
 config GPIO_MXC
 	def_bool y
-	depends on ARCH_MXC
+	depends on ARCH_MXC && !SOC_LS1021A
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
-- 
1.7.7.4

