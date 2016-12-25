From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] pinctrl: simplify check for pin request conflicts
Date: Sun, 25 Dec 2016 02:59:28 +0200
Message-ID: <20161225005928.4417-1-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:54966 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752199AbcLYA7d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Dec 2016 19:59:33 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sonic Zhang <sonic.zhang@analog.com>, linux-gpio@vger.kernel.org

This is a non-functional change, which deletes code duplication in two
of four if-if branches by reordering the checks. Functional identity
of the code change can be shown by running through the whole truth table
of boolean arguments.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
I started looking at these checks to get better clarity, because I'd like
to see (and add) more strict type pinmux controllers, however for devices
described in DT I experience an unpleasant side effect that any GPIO pins
from a GPIO controller with gpio-ranges property requested by devices in
runtime should be exclusively placed into a GPIO hog group. This happens,
because all pins from a device pinctrl group are firstly pin_request()'ed
by a device with gpio_range as NULL on device driver instantiation phase
(see pinctrl_bind_pins()), then a device driver, let say gpio-leds, starts
requesting GPIOs with a specified gpio_range and strict controllers fail
to pass the check for getting a GPIO pin for the device driver neglecting
the fact that the pin belongs to the pinctrl group of the same device.
Any suggestions how to improve the situation described above are welcome.

The change may add a miserable runtime penalty due to unfolding nested
if's, but hopefully it can be dispelled by the improved code density and
definite enhanced human perception of the code.

 drivers/pinctrl/pinmux.c | 43 +++++++++++++++----------------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index ece7028..9373146 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -99,37 +99,24 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
-	if (gpio_range) {
-		/* There's no need to support multiple GPIO requests */
-		if (desc->gpio_owner) {
-			dev_err(pctldev->dev,
-				"pin %s already requested by %s; cannot claim for %s\n",
-				desc->name, desc->gpio_owner, owner);
-			goto out;
-		}
-		if (ops->strict && desc->mux_usecount &&
-		    strcmp(desc->mux_owner, owner)) {
-			dev_err(pctldev->dev,
-				"pin %s already requested by %s; cannot claim for %s\n",
-				desc->name, desc->mux_owner, owner);
-			goto out;
-		}
+	if ((!gpio_range || ops->strict) &&
+	    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
+		dev_err(pctldev->dev,
+			"pin %s already requested by %s; cannot claim for %s\n",
+			desc->name, desc->mux_owner, owner);
+		goto out;
+	}
+
+	if ((gpio_range || ops->strict) && desc->gpio_owner) {
+		dev_err(pctldev->dev,
+			"pin %s already requested by %s; cannot claim for %s\n",
+			desc->name, desc->gpio_owner, owner);
+		goto out;
+	}
 
+	if (gpio_range) {
 		desc->gpio_owner = owner;
 	} else {
-		if (desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
-			dev_err(pctldev->dev,
-				"pin %s already requested by %s; cannot claim for %s\n",
-				desc->name, desc->mux_owner, owner);
-			goto out;
-		}
-		if (ops->strict && desc->gpio_owner) {
-			dev_err(pctldev->dev,
-				"pin %s already requested by %s; cannot claim for %s\n",
-				desc->name, desc->gpio_owner, owner);
-			goto out;
-		}
-
 		desc->mux_usecount++;
 		if (desc->mux_usecount > 1)
 			return 0;
-- 
2.10.2

