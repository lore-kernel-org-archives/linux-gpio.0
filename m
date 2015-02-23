From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/4] pinctrl: baytrail: Relax GPIO request rules
Date: Mon, 23 Feb 2015 14:53:10 +0200
Message-ID: <1424695993-43707-2-git-send-email-mika.westerberg@linux.intel.com>
References: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:46399 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751642AbbBWMxR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 23 Feb 2015 07:53:17 -0500
In-Reply-To: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Zotac ZBOX PI320, a Baytrail based mini-PC, has power button connected to a
GPIO pin and it is exposed to the operating system as Windows 8 button
array. This is implemented in Linux as a driver using gpio_keys.

However, BIOS on this particula machine forgot to mux the pin to be a GPIO
instead of native function, which results following message to be seen on
the console:

 byt_gpio INT33FC:02: pin 16 cannot be used as GPIO.

This causes power button to not work as the driver was not able to request
the GPIO it needs.

So instead of completely preventing this we allow turning the pin as GPIO
but issue warning that something might be wrong.

Reported-by: Benjamin Adler <benadler@gmx.net>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 35 ++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 5afe03e28b91..e44f2fd6753f 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -158,40 +158,49 @@ static void __iomem *byt_gpio_reg(struct gpio_chip *chip, unsigned offset,
 	return vg->reg_base + reg_offset + reg;
 }
 
-static bool is_special_pin(struct byt_gpio *vg, unsigned offset)
+static u32 byt_get_gpio_mux(struct byt_gpio *vg, unsigned offset)
 {
 	/* SCORE pin 92-93 */
 	if (!strcmp(vg->range->name, BYT_SCORE_ACPI_UID) &&
 		offset >= 92 && offset <= 93)
-		return true;
+		return 1;
 
 	/* SUS pin 11-21 */
 	if (!strcmp(vg->range->name, BYT_SUS_ACPI_UID) &&
 		offset >= 11 && offset <= 21)
-		return true;
+		return 1;
 
-	return false;
+	return 0;
 }
 
 static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	struct byt_gpio *vg = to_byt_gpio(chip);
 	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_CONF0_REG);
-	u32 value;
-	bool special;
+	u32 value, gpio_mux;
 
 	/*
 	 * In most cases, func pin mux 000 means GPIO function.
 	 * But, some pins may have func pin mux 001 represents
-	 * GPIO function. Only allow user to export pin with
-	 * func pin mux preset as GPIO function by BIOS/FW.
+	 * GPIO function.
+	 *
+	 * Because there are devices out there where some pins were not
+	 * configured correctly we allow changing the mux value from
+	 * request (but print out warning about that).
 	 */
 	value = readl(reg) & BYT_PIN_MUX;
-	special = is_special_pin(vg, offset);
-	if ((special && value != 1) || (!special && value)) {
-		dev_err(&vg->pdev->dev,
-			"pin %u cannot be used as GPIO.\n", offset);
-		return -EINVAL;
+	gpio_mux = byt_get_gpio_mux(vg, offset);
+	if (WARN_ON(gpio_mux != value)) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&vg->lock, flags);
+		value = readl(reg) & ~BYT_PIN_MUX;
+		value |= gpio_mux;
+		writel(value, reg);
+		spin_unlock_irqrestore(&vg->lock, flags);
+
+		dev_warn(&vg->pdev->dev,
+			 "pin %u forcibly re-configured as GPIO\n", offset);
 	}
 
 	pm_runtime_get(&vg->pdev->dev);
-- 
2.1.4

