From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/2] gpio: acpi: acpi_dev_gpio_irq_get: ignore the status
 of unselected irqs
Date: Mon, 13 Mar 2017 18:56:09 +0100
Message-ID: <3133c2fe-427e-f742-9647-d1f45eeaed4a@redhat.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
 <1489425824.20145.223.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F56ED34A1BD061A1410F9EBC"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45190 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750925AbdCMR4M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 13:56:12 -0400
In-Reply-To: <1489425824.20145.223.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------F56ED34A1BD061A1410F9EBC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13-03-17 18:23, Andy Shevchenko wrote:
> On Fri, 2017-03-10 at 21:58 +0100, Hans de Goede wrote:
>> Hi All,
>>
>> While trying to get a driver working for a device where I want to
>> only use the irq in the acpi resources with index 1, and we do not
>> have a driver for the gpiochip with the irq with index 0 yet,
>> I hit this problem that acpi_dev_gpio_irq_get will bail with
>> -EPROBE_DEFER because it cannot get a gpio_desc for index 0,
>> this really should not be a problem when asking for index 1
>> and this series fixes this.
>>
>> Note these patches apply on top of the gpiolib acpi work
>> Andy Shevchenko has been doing and as such may not apply
>> cleanly on top of current master / next.
>
> I will incorporate slightly different version of this (due to changes
> happened) into my branch. Please verify if everything is okay.

I just noticed that my patch was botched up a bit, it is
taking a more complex approach then needed and it contained a bug
(it did lookup->index = index, which should be lookup->index = i).

I've just finished writing a v2 (sorry). I've attached the v2 here,
note this is against an unmodified v4.11-rc2 rather then your branch
as I needed a clean base to debug some problems. But it should be
easy to adapt to your branch I think.

Note this can go upstream either way (through your branch or
directly since it is based on a clean v4.11-rc2 now) but it is
probably easier to take it upstream through your branch to
avoid conflicts.

Regards,

Hans

--------------F56ED34A1BD061A1410F9EBC
Content-Type: text/x-patch;
 name="0001-gpio-acpi-acpi_dev_gpio_irq_get-ignore-EPROBE_DEFER-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-gpio-acpi-acpi_dev_gpio_irq_get-ignore-EPROBE_DEFER-.pa";
 filename*1="tch"

>From 93c2c9334a24b845c5e816299d61b92f93601b07 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 13 Mar 2017 18:43:30 +0100
Subject: [PATCH v2] gpio: acpi: acpi_dev_gpio_irq_get: ignore -EPROBE_DEFER
 for unselected gpioints

When acpi_dev_gpio_irq_get gets called with an index of say 2, it should
not care if acpi_get_gpiod for index 0 or 1 returns -EPROBE_DEFER.

This allows drivers which request a gpioint with index > 0 to function
if there is no gpiochip driver (loaded) for gpioints with a lower index.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Completely new patch replacing my previous somewhat broken attempt
---
 drivers/gpio/gpiolib-acpi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 9b37a36..fc6f34a 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -651,7 +651,7 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
  */
 int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 {
-	int idx, i;
+	int idx, i, irq;
 	unsigned int irq_flags;
 	int ret = -ENOENT;
 
@@ -660,13 +660,18 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 		struct gpio_desc *desc;
 
 		desc = acpi_get_gpiod_by_index(adev, NULL, i, &info);
-		if (IS_ERR(desc)) {
+		/* Ignore -EPROBE_DEFER, it only matters if idx matches */
+		if (IS_ERR(desc) && PTR_ERR(desc) != -EPROBE_DEFER) {
 			ret = PTR_ERR(desc);
 			break;
 		}
 		if (info.gpioint && idx++ == index) {
-			int irq = gpiod_to_irq(desc);
+			if (IS_ERR(desc)) {
+				ret = PTR_ERR(desc);
+				break;
+			}
 
+			irq = gpiod_to_irq(desc);
 			if (irq < 0)
 				return irq;
 
-- 
2.9.3


--------------F56ED34A1BD061A1410F9EBC--
