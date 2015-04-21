From: <Frank.Li@freescale.com>
Subject: [PATCH v5 11/11] ARM: config: imx_v6_v7_defconfig add imx7d support
Date: Tue, 21 Apr 2015 22:53:27 +0800
Message-ID: <1429628007-8892-12-git-send-email-Frank.Li@freescale.com>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0127.outbound.protection.outlook.com ([207.46.100.127]:34894
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753959AbbDUO4t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 21 Apr 2015 10:56:49 -0400
In-Reply-To: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: lznuaa@gmail.com, shawn.guo@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Frank Li <Frank.Li@freescale.com>

From: Frank Li <Frank.Li@freescale.com>

Add imx7d support

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index fdeb1c8..c9c51e1f 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -38,6 +38,7 @@ CONFIG_SOC_IMX53=y
 CONFIG_SOC_IMX6Q=y
 CONFIG_SOC_IMX6SL=y
 CONFIG_SOC_IMX6SX=y
+CONFIG_SOC_IMX7D=y
 CONFIG_SOC_VF610=y
 CONFIG_PCI=y
 CONFIG_PCI_IMX6=y
-- 
1.9.1

