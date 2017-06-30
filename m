From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: rza1: fix error handling
Date: Fri, 30 Jun 2017 18:09:53 +0200
Message-ID: <20170630161009.13762-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

A compiler warning points out a typo:

drivers/pinctrl/pinctrl-rza1.c: In function 'rza1_pinctrl_probe':
drivers/pinctrl/pinctrl-rza1.c:1260:5: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This changes the condition to the usual check for failure of the previous
function call.

Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 614a043f3038..1d57d4480a02 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1257,7 +1257,7 @@ static int rza1_pinctrl_probe(struct platform_device *pdev)
 	rza1_pctl->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (ret)
+	if (!res)
 		return -ENODEV;
 
 	rza1_pctl->base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.9.0
