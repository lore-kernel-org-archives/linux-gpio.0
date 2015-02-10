From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH v4 1/4] gpiolib: define gpio suffixes globally
Date: Tue, 10 Feb 2015 14:40:49 +0100
Message-ID: <2387772.RYJ6BOfkAj@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:48296 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756042AbbBJNkz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 08:40:55 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Avoid multiple identical definitions of the gpio suffix strings by putting
them into a global constant array.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
Change log:
  v4: no change
  v3: add this change as a separate patch

 drivers/gpio/gpiolib.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf6016d..ff2b80d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -53,6 +53,9 @@ static DEFINE_MUTEX(gpio_lookup_lock);
 static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_chips);
 
+/* gpio suffixes used for ACPI and device tree lookup */
+static const char * const gpio_suffixes[] = { "gpios", "gpio" };
+
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
 	d->label = label;
@@ -1657,19 +1660,18 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 				      unsigned int idx,
 				      enum gpio_lookup_flags *flags)
 {
-	static const char * const suffixes[] = { "gpios", "gpio" };
 	char prop_name[32]; /* 32 is max size of property name */
 	enum of_gpio_flags of_flags;
 	struct gpio_desc *desc;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
 		if (con_id)
 			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
-							       suffixes[i]);
+				 gpio_suffixes[i]);
 		else
 			snprintf(prop_name, sizeof(prop_name), "%s",
-							       suffixes[i]);
+				 gpio_suffixes[i]);
 
 		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
 						&of_flags);
@@ -1690,7 +1692,6 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
 					unsigned int idx,
 					enum gpio_lookup_flags *flags)
 {
-	static const char * const suffixes[] = { "gpios", "gpio" };
 	struct acpi_device *adev = ACPI_COMPANION(dev);
 	struct acpi_gpio_info info;
 	struct gpio_desc *desc;
@@ -1698,13 +1699,13 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
 	int i;
 
 	/* Try first from _DSD */
-	for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
+	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
 		if (con_id && strcmp(con_id, "gpios")) {
 			snprintf(propname, sizeof(propname), "%s-%s",
-				 con_id, suffixes[i]);
+				 con_id, gpio_suffixes[i]);
 		} else {
 			snprintf(propname, sizeof(propname), "%s",
-				 suffixes[i]);
+				 gpio_suffixes[i]);
 		}
 
 		desc = acpi_get_gpiod_by_index(adev, propname, idx, &info);
-- 
2.0.5


