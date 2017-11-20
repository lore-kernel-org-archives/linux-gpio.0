From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: intel: Initialize GPIO properly when used through irqchip
Date: Mon, 20 Nov 2017 18:19:36 +0300
Message-ID: <20171120151936.68726-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:28787 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751245AbdKTPUJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Nov 2017 10:20:09 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When a GPIO is requested using gpiod_get_* APIs the intel pinctrl driver
switches the pin to GPIO mode and makes sure interrupts are routed to
the GPIO hardware instead of IOAPIC. However, if the GPIO is used
directly through irqchip, as is the case with many I2C-HID devices where
I2C core automatically configures interrupt for the device, the pin is
not initialized as GPIO. Instead we rely that the BIOS configures the
pin accordingly which seems not to be the case at least in Asus X540NA
SKU3 with Focaltech touchpad.

When the pin is not properly configured it might result weird behaviour
like interrupts suddenly stop firing completely and the touchpad stops
responding to user input.

Fix this by properly initializing the pin to GPIO mode also when it is
used directly through irqchip.

Reported-by: Daniel Drake <drake@endlessm.com>
Reported-by: Chris Chiu <chiu@endlessm.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Chris, Daniel,

Could you check that this still solves the issue and maybe provide your
Tested-by? Thanks!

 drivers/pinctrl/intel/pinctrl-intel.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 3761fd29100f..a1fdda91f874 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -425,6 +425,18 @@ static void __intel_gpio_set_direction(void __iomem *padcfg0, bool input)
 	writel(value, padcfg0);
 }
 
+static void __intel_gpio_init_gpio(void __iomem *padcfg0)
+{
+	u32 value;
+
+	/* Put the pad into GPIO mode */
+	value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
+	/* Disable SCI/SMI/NMI generation */
+	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
+	value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
+	writel(value, padcfg0);
+}
+
 static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 				     struct pinctrl_gpio_range *range,
 				     unsigned pin)
@@ -432,7 +444,6 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *padcfg0;
 	unsigned long flags;
-	u32 value;
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
@@ -442,13 +453,7 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	}
 
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
-	/* Put the pad into GPIO mode */
-	value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
-	/* Disable SCI/SMI/NMI generation */
-	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
-	value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
-	writel(value, padcfg0);
-
+	__intel_gpio_init_gpio(padcfg0);
 	/* Disable TX buffer and enable RX (this will be input) */
 	__intel_gpio_set_direction(padcfg0, true);
 
@@ -935,6 +940,8 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
+	__intel_gpio_init_gpio(reg);
+
 	value = readl(reg);
 
 	value &= ~(PADCFG0_RXEVCFG_MASK | PADCFG0_RXINV);
-- 
2.15.0

