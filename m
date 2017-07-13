From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/2] pinctrl: zynq: Fix kernel doc warnings
Date: Thu, 13 Jul 2017 11:12:42 +0200
Message-ID: <4c6e1f9b0635682518d2ffa50cf611efef4aff68.1499937148.git.michal.simek@xilinx.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33630 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbdGMJMq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2017 05:12:46 -0400
Received: by mail-wm0-f67.google.com with SMTP id j85so3743786wmj.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2017 02:12:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: Nava kishore Manne <nava.manne@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-gpio@vger.kernel.org, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, linux-arm-kernel@lists.infradead.org

From: Nava kishore Manne <nava.manne@xilinx.com>

This patch fixes the kernel doc warnings in the driver.

Signed-off-by: Nava kishore Manne <navam@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index b51a46dfdcc3..7565651acdc6 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -45,7 +45,7 @@
  * @syscon:		Syscon regmap
  * @pctrl_offset:	Offset for pinctrl into the @syscon space
  * @groups:		Pingroups
- * @ngroupos:		Number of @groups
+ * @ngroups:		Number of @groups
  * @funcs:		Pinmux functions
  * @nfuncs:		Number of @funcs
  */
-- 
1.9.1

