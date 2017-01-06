From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] pinctrl: imx7d-pinctrl: Fix a typo
Date: Thu,  5 Jan 2017 22:55:43 -0200
Message-ID: <1483664143-26648-1-git-send-email-festevam@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33345 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753975AbdAFBED (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Jan 2017 20:04:03 -0500
Received: by mail-yw0-f194.google.com with SMTP id k6so1044240ywk.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jan 2017 17:04:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org, linux-gpio@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

From: Fabio Estevam <fabio.estevam@nxp.com>

Fix a typo in "Peripherals".

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
index 457b2c6..8c5d27c 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
@@ -19,7 +19,7 @@ iomuxc: iomuxc@30330000 {
 	reg = <0x30330000 0x10000>;
 };
 
-Pheriparials using pads from iomuxc-lpsr support low state retention power
+Peripherals using pads from iomuxc-lpsr support low state retention power
 state, under LPSR mode GPIO's state of pads are retain.
 
 Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-- 
2.7.4

