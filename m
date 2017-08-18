From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] pinctrl: rza1: off by one in rza1_parse_gpiochip()
Date: Fri, 18 Aug 2017 13:32:48 +0300
Message-ID: <20170818103248.ddguatdt5jhm5zx7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The rza1_pctl->ports[] array has RZA1_NPORTS (12) elements.  The > here
should be >= to prevent an out of bounds access.

Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 7e30134b3d18..464dbf2f0816 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1088,7 +1088,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 	 */
 	pinctrl_base = of_args.args[1];
 	gpioport = RZA1_PIN_ID_TO_PORT(pinctrl_base);
-	if (gpioport > RZA1_NPORTS) {
+	if (gpioport >= RZA1_NPORTS) {
 		dev_err(rza1_pctl->dev,
 			"Invalid values in property %s\n", list_name);
 		return -EINVAL;
