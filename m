From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: zynq: add static to platform_driver remove callback
Date: Fri, 15 May 2015 12:31:38 +0900
Message-ID: <1431660698-30992-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

This function is only referenced in this file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 22280bd..3d5453a 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1149,7 +1149,7 @@ static int zynq_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-int zynq_pinctrl_remove(struct platform_device *pdev)
+static int zynq_pinctrl_remove(struct platform_device *pdev)
 {
 	struct zynq_pinctrl *pctrl = platform_get_drvdata(pdev);
 
-- 
1.9.1
