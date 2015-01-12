From: Johan Hovold <johan@kernel.org>
Subject: [PATCH] pinctrl: lantiq: remove bogus of_gpio_chip_add
Date: Mon, 12 Jan 2015 17:20:51 +0100
Message-ID: <1421079651-2650-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Remove bogus call to of_gpiochip_add (and of_gpio_chip remove in error
path) which is also called when adding the gpio chip.

This prevents adding the same pinctrl range twice.

Fixes: 3f8c50c9b110 ("OF: pinctrl: MIPS: lantiq: implement lantiq/xway
pinctrl support")

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/pinctrl/pinctrl-xway.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index c5cef59f5965..779950c62e53 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -798,10 +798,8 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 
 	/* load the gpio chip */
 	xway_chip.dev = &pdev->dev;
-	of_gpiochip_add(&xway_chip);
 	ret = gpiochip_add(&xway_chip);
 	if (ret) {
-		of_gpiochip_remove(&xway_chip);
 		dev_err(&pdev->dev, "Failed to register gpio chip\n");
 		return ret;
 	}
-- 
2.0.5
