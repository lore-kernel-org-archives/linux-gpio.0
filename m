From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2] pinctrl: cherryview: Mask all interrupts on Intel_Strago based systems
Date: Mon,  4 Dec 2017 12:11:02 +0300
Message-ID: <20171204091102.40822-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:22328 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752860AbdLDJLG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Dec 2017 04:11:06 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org

Guenter Roeck reported an interrupt storm on a prototype system which is
based on Cyan Chromebook. The root cause turned out to be a incorrectly
configured pin that triggers spurious interrupts. This will be fixed in
coreboot but currently we need to prevent the interrupt storm from
happening by masking all interrupts (but not GPEs) on those systems.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=197953
Fixes: bcb48cca23ec ("pinctrl: cherryview: Do not mask all interrupts in probe")
Reported-and-tested-by: Guenter Roeck <linux@roeck-us.net>
Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: stable@vger.kernel.org
---
Changes from v1:

 * Correct Link to point to the right bugzilla entry
 * Add missing Fixes: and Cc: lines
 * Use GENMASK() instead

 drivers/pinctrl/intel/pinctrl-cherryview.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index aa6c9f569c2b..b1ae1618fefe 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1601,6 +1601,22 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 			clear_bit(i, chip->irq.valid_mask);
 	}
 
+	/*
+	 * The same set of machines in chv_no_valid_mask[] have incorrectly
+	 * configured GPIOs that generate spurious interrupts so we use
+	 * this same list to apply another quirk for them.
+	 *
+	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=197953.
+	 */
+	if (!need_valid_mask) {
+		/*
+		 * Mask all interrupts the community is able to generate
+		 * but leave the ones that can only generate GPEs unmasked.
+		 */
+		chv_writel(GENMASK(31, pctrl->community->nirqs),
+			   pctrl->regs + CHV_INTMASK);
+	}
+
 	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
-- 
2.15.0

