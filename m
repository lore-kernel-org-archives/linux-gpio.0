From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: zynq: change error code for pinctrl_register failure
Date: Tue, 26 May 2015 13:18:29 +0900
Message-ID: <1432613909-13457-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [202.248.44.37] ([202.248.44.37]:56830 "EHLO
	conuserg011-v.nifty.com" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750874AbbEZEUM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 May 2015 00:20:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

pinctrl_register() could fail for memory unrelated errors.
Returning -EINVAL (or -ENODEV) seems more suitable for here.
At least, the other pinctrl drivers do so.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 04748a4..0ff653c 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1141,7 +1141,7 @@ static int zynq_pinctrl_probe(struct platform_device *pdev)
 
 	pctrl->pctrl = pinctrl_register(&zynq_desc, &pdev->dev, pctrl);
 	if (!pctrl->pctrl)
-		return -ENOMEM;
+		return -EINVAL;
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
1.9.1

