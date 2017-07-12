From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] pinctrl: baytrail: Do not call WARN_ON for a firmware bug
Date: Wed, 12 Jul 2017 14:31:01 +0200
Message-ID: <20170712123101.26996-1-hdegoede@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45046 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755234AbdGLMbG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 08:31:06 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

WARN_ON causes a backtrace to get logged which is only useful for
kernel bugs. For signalling a firmware bug dev_warn(dev, FW_BUG "...")
should be used.

This fixes users running userspace software to monitor kernel oopses
getting a false positive bug-report every boot because of the wrong
use of WARN_ON.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index fa3c5758ac67..0f3a02495aeb 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -981,12 +981,12 @@ static int byt_gpio_request_enable(struct pinctrl_dev *pctl_dev,
 	 */
 	value = readl(reg) & BYT_PIN_MUX;
 	gpio_mux = byt_get_gpio_mux(vg, offset);
-	if (WARN_ON(gpio_mux != value)) {
+	if (gpio_mux != value) {
 		value = readl(reg) & ~BYT_PIN_MUX;
 		value |= gpio_mux;
 		writel(value, reg);
 
-		dev_warn(&vg->pdev->dev,
+		dev_warn(&vg->pdev->dev, FW_BUG
 			 "pin %u forcibly re-configured as GPIO\n", offset);
 	}
 
-- 
2.13.0

