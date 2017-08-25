From: "Bourque, Francis" <francis.bourque@intel.com>
Subject: RE: [PATCH v1 1/2] pinctrl: intel: Read back TX buffer state
Date: Fri, 25 Aug 2017 16:59:31 +0000
Message-ID: <B405CA830BD064429EB45705F7FE333674BC91E1@ORSMSX105.amr.corp.intel.com>
References: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:31490 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754410AbdHYQ7f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Aug 2017 12:59:35 -0400
In-Reply-To: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

Tested-by: "Bourque, Francis" <francis.bourque@intel.com>

We tested on KBL-Y based design with a 4.12.3 kernel + patch

Francis Bourque
Platform Architect at Intel
Phone (503) 712-4558


-----Original Message-----
From: Andy Shevchenko [mailto:andriy.shevchenko@linux.intel.com] 
Sent: Thursday, August 24, 2017 1:20 AM
To: Linus Walleij <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; Mika Westerberg <mika.westerberg@linux.intel.com>; Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Bourque, Francis <francis.bourque@intel.com>
Subject: [PATCH v1 1/2] pinctrl: intel: Read back TX buffer state

In the same way as it's done in pinctrl-cherryview.c we would provide a readback TX buffer state.

Fixes: 17fab473693 ("pinctrl: intel: Set pin direction properly")
Reported-by: "Bourque, Francis" <francis.bourque@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 6dc1096d3d34..c8675611b768 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -751,12 +751,17 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)  {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	void __iomem *reg;
+	u32 padcfg0;
 
 	reg = intel_get_padcfg(pctrl, offset, PADCFG0);
 	if (!reg)
 		return -EINVAL;
 
-	return !!(readl(reg) & PADCFG0_GPIORXSTATE);
+	padcfg0 = readl(reg);
+	if (!(padcfg0 & PADCFG0_GPIOTXDIS))
+		return !!(padcfg0 & PADCFG0_GPIOTXSTATE);
+
+	return !!(padcfg0 & PADCFG0_GPIORXSTATE);
 }
 
 static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
--
2.14.1

