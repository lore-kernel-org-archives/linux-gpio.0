From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: intel-mid: Remove potentially harmful code
Date: Wed,  6 Jul 2016 12:50:12 +0300
Message-ID: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:12220 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751834AbcGFJuS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 6 Jul 2016 05:50:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, stable@vger.kernel.org, #@black.fi.intel.com, v3.13+@black.fi.intel.com

The commit d56d6b3d7d69 ("gpio: langwell: add Intel Merrifield support")
doesn't look at all as a proper support for Intel Merrifield and I dare to say
that it distorts the behaviour of the hardware.

The register map is different on Intel Merrifield, i.e. only 6 out of 8
register have the same purpose but none of them has same location in the
address space. The current case potentially harmful to existing hardware since
it's poking registers on wrong offsets and may set some pin to be GPIO output
when connected hardware doesn't expect such.

Besides the above GPIO and pinctrl on Intel Merrifield have been located in
different IP blocks. The functionality has been extended as well, i.e. added
support of level interrupts, special registers for wake capable sources and
thus, in my opinion, requires a completele separate driver.

If someone wondering the existing gpio-intel-mid.c would be converted to actual
pinctrl (which by the fact it is now), though I wouldn't be a volunteer to do
that.

Fixes: d56d6b3d7d69 ("gpio: langwell: add Intel Merrifield support")
Cc: stable@vger.kernel.org # v3.13+
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-intel-mid.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index a99cf4b..c0f7cce 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -17,7 +17,6 @@
  * Moorestown platform Langwell chip.
  * Medfield platform Penwell chip.
  * Clovertrail platform Cloverview chip.
- * Merrifield platform Tangier chip.
  */
 
 #include <linux/module.h>
@@ -64,10 +63,6 @@ enum GPIO_REG {
 /* intel_mid gpio driver data */
 struct intel_mid_gpio_ddata {
 	u16 ngpio;		/* number of gpio pins */
-	u32 gplr_offset;	/* offset of first GPLR register from base */
-	u32 flis_base;		/* base address of FLIS registers */
-	u32 flis_len;		/* length of FLIS registers */
-	u32 (*get_flis_offset)(int gpio);
 	u32 chip_irq_type;	/* chip interrupt type */
 };
 
@@ -252,15 +247,6 @@ static const struct intel_mid_gpio_ddata gpio_cloverview_core = {
 	.chip_irq_type = INTEL_MID_IRQ_TYPE_EDGE,
 };
 
-static const struct intel_mid_gpio_ddata gpio_tangier = {
-	.ngpio = 192,
-	.gplr_offset = 4,
-	.flis_base = 0xff0c0000,
-	.flis_len = 0x8000,
-	.get_flis_offset = NULL,
-	.chip_irq_type = INTEL_MID_IRQ_TYPE_EDGE,
-};
-
 static const struct pci_device_id intel_gpio_ids[] = {
 	{
 		/* Lincroft */
@@ -287,11 +273,6 @@ static const struct pci_device_id intel_gpio_ids[] = {
 		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x08f7),
 		.driver_data = (kernel_ulong_t)&gpio_cloverview_core,
 	},
-	{
-		/* Tangier */
-		PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x1199),
-		.driver_data = (kernel_ulong_t)&gpio_tangier,
-	},
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, intel_gpio_ids);
-- 
2.8.1

