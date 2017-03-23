From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3] pinctrl: cherryview: Add support for GMMR GPIO opregion
Date: Thu, 23 Mar 2017 14:23:25 +0100
Message-ID: <20170323132325.21558-1-hdegoede@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40788 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932284AbdCWNX3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Mar 2017 09:23:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

On some Cherry Trail devices the ASL uses the GMMR GPIO to access
GPIOs so as to serialize MMIO accesses to GPIO registers with the
OS, because:

"Due to a silicon issue, a shared lock must be used to prevent concurrent
accesses across the 4 GPIO controllers.

See Intel Atom Z8000 Processor Series Specification Update (Rev. 005),
errata #CHT34, for further information."

This commit adds support for this opregion, this fixes a number of
ASL errors on my Ezpad mini3 tablet and makes the otg port device/host
muxing which is controlled in firmware on this model work properly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Changes in v2:
-Call acpi_remove_address_space_handler on remove
Changes in v3:
-Return actual status from the handler rather then always returning AE_OK
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index f80134e..83640af 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -148,6 +148,7 @@ struct chv_community {
 	size_t ngpio_ranges;
 	size_t ngpios;
 	size_t nirqs;
+	acpi_adr_space_type acpi_space_id;
 };
 
 struct chv_pin_context {
@@ -404,6 +405,7 @@ static const struct chv_community southwest_community = {
 	 * trigger GPEs.
 	 */
 	.nirqs = 8,
+	.acpi_space_id = 0x91,
 };
 
 static const struct pinctrl_pin_desc north_pins[] = {
@@ -493,6 +495,7 @@ static const struct chv_community north_community = {
 	 * GPEs.
 	 */
 	.nirqs = 8,
+	.acpi_space_id = 0x92,
 };
 
 static const struct pinctrl_pin_desc east_pins[] = {
@@ -536,6 +539,7 @@ static const struct chv_community east_community = {
 	.ngpio_ranges = ARRAY_SIZE(east_gpio_ranges),
 	.ngpios = ARRAY_SIZE(east_pins),
 	.nirqs = 16,
+	.acpi_space_id = 0x93,
 };
 
 static const struct pinctrl_pin_desc southeast_pins[] = {
@@ -662,6 +666,7 @@ static const struct chv_community southeast_community = {
 	.ngpio_ranges = ARRAY_SIZE(southeast_gpio_ranges),
 	.ngpios = ARRAY_SIZE(southeast_pins),
 	.nirqs = 16,
+	.acpi_space_id = 0x94,
 };
 
 static const struct chv_community *chv_communities[] = {
@@ -1586,11 +1591,34 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	return 0;
 }
 
+static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
+	acpi_physical_address address, u32 bits, u64 *value,
+	void *handler_context, void *region_context)
+{
+	struct chv_pinctrl *pctrl = region_context;
+	unsigned long flags;
+	acpi_status ret = AE_OK;
+
+	raw_spin_lock_irqsave(&chv_lock, flags);
+
+	if (function == ACPI_WRITE)
+		chv_writel((u32)(*value), pctrl->regs + (u32)address);
+	else if (function == ACPI_READ)
+		*value = readl(pctrl->regs + (u32)address);
+	else
+		ret = AE_BAD_PARAMETER;
+
+	raw_spin_unlock_irqrestore(&chv_lock, flags);
+
+	return ret;
+}
+
 static int chv_pinctrl_probe(struct platform_device *pdev)
 {
 	struct chv_pinctrl *pctrl;
 	struct acpi_device *adev;
 	struct resource *res;
+	acpi_status status;
 	int ret, irq, i;
 
 	adev = ACPI_COMPANION(&pdev->dev);
@@ -1646,11 +1674,29 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	status = acpi_install_address_space_handler(adev->handle,
+					pctrl->community->acpi_space_id,
+					chv_pinctrl_mmio_access_handler,
+					NULL, pctrl);
+	if (ACPI_FAILURE(status))
+		dev_err(&pdev->dev, "failed to install ACPI addr space handler\n");
+
 	platform_set_drvdata(pdev, pctrl);
 
 	return 0;
 }
 
+static int chv_pinctrl_remove(struct platform_device *pdev)
+{
+	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
+
+	acpi_remove_address_space_handler(ACPI_COMPANION(&pdev->dev),
+					  pctrl->community->acpi_space_id,
+					  chv_pinctrl_mmio_access_handler);
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int chv_pinctrl_suspend_noirq(struct device *dev)
 {
@@ -1758,6 +1804,7 @@ MODULE_DEVICE_TABLE(acpi, chv_pinctrl_acpi_match);
 
 static struct platform_driver chv_pinctrl_driver = {
 	.probe = chv_pinctrl_probe,
+	.remove = chv_pinctrl_remove,
 	.driver = {
 		.name = "cherryview-pinctrl",
 		.pm = &chv_pinctrl_pm_ops,
-- 
2.9.3

