From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] gpio: generic: Revert to old error handling in bgpio_map
Date: Wed, 21 Oct 2015 00:12:00 -0700
Message-ID: <1445411520-7175-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58188 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751941AbbJUHML (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2015 03:12:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Heiner Kallweit <hkallweit1@gmail.com>

Returning an error instead of NULL in bgpio_map if
platform_get_resource_byname does not find a resource was introduced with
commit cf3f2a2c8bae ("gpio: generic: improve error handling in bgpio_map").
This results in several qemu runtime failures with default and non-default
configurations, if attempts are made to boot from mmcblk0. Examples for
failures with multi_v7_defconfig are

Machine: vexpress-a9	dtb: vexpress-v2p-ca9
Machine: vexpress-a15	dtb: vexpress-v2p-ca15-tc1

Crash:

VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error -6
Please append a correct "root=" boot option; here are the available partitions:
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

Looking into the code, always returning an error if bgpio_map fails
does not appear to make much sense, since the code in bgpio_setup_io
specifically supports some of the resources to be NULL.

Fixes: cf3f2a2c8bae ("gpio: generic: improve error handling in bgpio_map")
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpio/gpio-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index d8b1700b9519..bd5193c67a9c 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -586,7 +586,7 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
 	if (!r)
-		return IOMEM_ERR_PTR(-EINVAL);
+		return NULL;
 
 	sz = resource_size(r);
 	if (sz != sane_sz)
-- 
2.1.4

