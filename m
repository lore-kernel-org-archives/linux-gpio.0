From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: rza1: Remove unneeded wrong check for wrong variable
Date: Fri, 30 Jun 2017 08:57:39 +0200
Message-ID: <1498805859-4136-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Chris Brandt <chris.brandt@renesas.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Depending on compiler version:

    drivers/pinctrl/pinctrl-rza1.c: In function ‘rza1_pinctrl_probe’:
    drivers/pinctrl/pinctrl-rza1.c:1260:5: warning: ‘ret’ may be used uninitialized in this function [-Wmaybe-uninitialized]
      if (ret)
	 ^

Indeed, the result returned by platform_get_resource() was stored in
"res", not "ret".  In addition, the correct error check would be
"if (!res)", as platform_get_resource() does not return an error code,
but returns NULL on failure.

However, as devm_ioremap_resource() verifies the validity of the passed
resource pointer anyway, the check can just be removed.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/pinctrl/pinctrl-rza1.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 614a043f3038d5d3..1188e6881e52ba7a 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1257,9 +1257,6 @@ static int rza1_pinctrl_probe(struct platform_device *pdev)
 	rza1_pctl->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (ret)
-		return -ENODEV;
-
 	rza1_pctl->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(rza1_pctl->base))
 		return PTR_ERR(rza1_pctl->base);
-- 
2.7.4
