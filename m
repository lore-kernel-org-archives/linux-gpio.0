From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 07/50] pinctrl: nsp-gpio: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:45:32 +0530
Message-ID: <1456319775-3216-8-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Jon Mason <jonmason@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index ac90043..2873f73 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -609,7 +609,7 @@ static int nsp_gpio_register_pinconf(struct nsp_gpio *chip)
 	pctldesc->npins = gc->ngpio;
 	pctldesc->confops = &nsp_pconf_ops;
 
-	chip->pctl = pinctrl_register(pctldesc, chip->dev, chip);
+	chip->pctl = devm_pinctrl_register(chip->dev, pctldesc, chip);
 	if (IS_ERR(chip->pctl)) {
 		dev_err(chip->dev, "unable to register pinctrl device\n");
 		return PTR_ERR(chip->pctl);
-- 
2.1.4
