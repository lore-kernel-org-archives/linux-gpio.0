From: Shardar Shariff Md <vreddytalla@nvidia.com>
Subject: [PATCH] gpio: max77620: add compatible string to device id list
Date: Wed, 16 Nov 2016 14:47:23 +0530
Message-ID: <1479287843-29838-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nat-hk.nvidia.com ([203.18.50.4]:11004 "EHLO
        hkmmgate102.nvidia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752360AbcKPJRj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2016 04:17:39 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ldewangan@nvidia.com, vreddytalla@nvidia.com

From: Venkat Reddy Talla <vreddytalla@nvidia.com>

Adding max20024 compatible string to the device id list
to support both max77620 and max20024 devices.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index b46b436..7bb2f11 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -296,6 +296,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id max77620_gpio_devtype[] = {
 	{ .name = "max77620-gpio", },
+	{ .name = "max20024-gpio", },
 	{},
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
-- 
2.1.4

