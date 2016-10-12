From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] gpio / ACPI: fix returned error from acpi_dev_gpio_irq_get()
Date: Wed, 12 Oct 2016 18:40:30 +0200
Message-ID: <1476290430-19542-1-git-send-email-benjamin.tissoires@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37114 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933140AbcJLQkf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 12:40:35 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@intel.com>
Cc: David Arcari <darcari@redhat.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

From: David Arcari <darcari@redhat.com>

acpi_dev_gpio_irq_get() currently ignores the error returned
by acpi_get_gpiod_by_index() and overwrites it with -ENOENT.

Problem is this error can be -EPROBE_DEFER, which just blows
up some drivers when the module ordering is not correct.

Cc: stable@vger.kernel.org
Signed-off-by: David Arcari <darcari@redhat.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---

Hi David,

I am planning on sending this to the list, any last minute comments?

Cheers,
Benjamin

 drivers/gpio/gpiolib-acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 9e48e69..f963a12 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -613,14 +613,17 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 {
 	int idx, i;
 	unsigned int irq_flags;
+	int ret = -ENOENT;
 
 	for (i = 0, idx = 0; idx <= index; i++) {
 		struct acpi_gpio_info info;
 		struct gpio_desc *desc;
 
 		desc = acpi_get_gpiod_by_index(adev, NULL, i, &info);
-		if (IS_ERR(desc))
+		if (IS_ERR(desc)) {
+			ret = PTR_ERR(desc);
 			break;
+		}
 		if (info.gpioint && idx++ == index) {
 			int irq = gpiod_to_irq(desc);
 
@@ -639,7 +642,7 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 		}
 
 	}
-	return -ENOENT;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_get);
 
-- 
2.7.4

