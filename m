From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 1/2] dt-bindings: gpio-vf610: add imx7ulp support
Date: Mon, 15 May 2017 14:28:25 +0800
Message-ID: <1494829706-5661-2-git-send-email-aisheng.dong@nxp.com>
References: <1494829706-5661-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0064.outbound.protection.outlook.com ([104.47.37.64]:17285
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1759323AbdEOG2f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 02:28:35 -0400
In-Reply-To: <1494829706-5661-1-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, shawnguo@kernel.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>

The Rapid General-Purpose Input and Output with 2 Ports (RGPIO2P)
on MX7ULP is similar to GPIO on Vibrid, except it has an extra
Port Data Direction Register (PDDR) used to configure the individual
port pins for input or output.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt b/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
index 436cc99..0ccbae4 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
@@ -5,7 +5,9 @@ functionality. Each pair serves 32 GPIOs. The VF610 has 5 instances of
 each, and each PORT module has its own interrupt.
 
 Required properties for GPIO node:
-- compatible : Should be "fsl,<soc>-gpio", currently "fsl,vf610-gpio"
+- compatible : Should be "fsl,<soc>-gpio", below is supported list:
+	       "fsl,vf610-gpio"
+	       "fsl,imx7ulp-gpio"
 - reg : The first reg tuple represents the PORT module, the second tuple
   the GPIO module.
 - interrupts : Should be the port interrupt shared by all 32 pins.
-- 
2.7.4

