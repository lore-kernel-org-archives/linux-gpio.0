From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] extcon: int3496: don't use GPIOF_* with gpiod_get_direction
Date: Sun, 14 Jan 2018 22:07:08 +0100
Message-ID: <20180114210711.13863-2-wsa+renesas@sang-engineering.com>
References: <20180114210711.13863-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36559 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753146AbeANVHk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 14 Jan 2018 16:07:40 -0500
In-Reply-To: <20180114210711.13863-1-wsa+renesas@sang-engineering.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org

The documentation was wrong, gpiod_get_direction() returns 0/1 instead
of the GPIOF_* flags. The docs were fixed with commit 94fc73094abe47
("gpio: correct docs about return value of gpiod_get_direction"). Now,
fix this user (until a better, system-wide solution is in place). This
also means we can drop the deprecated use of 'linux/gpio.h'. Yay!

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Only build tested!

 drivers/extcon/extcon-intel-int3496.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index c8691b5a9cb00c..256a25e511671d 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -20,7 +20,7 @@
 
 #include <linux/acpi.h>
 #include <linux/extcon-provider.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -112,7 +112,7 @@ static int int3496_probe(struct platform_device *pdev)
 		ret = PTR_ERR(data->gpio_usb_id);
 		dev_err(dev, "can't request USB ID GPIO: %d\n", ret);
 		return ret;
-	} else if (gpiod_get_direction(data->gpio_usb_id) != GPIOF_DIR_IN) {
+	} else if (gpiod_get_direction(data->gpio_usb_id) != 1) {
 		dev_warn(dev, FW_BUG "USB ID GPIO not in input mode, fixing\n");
 		gpiod_direction_input(data->gpio_usb_id);
 	}
-- 
2.11.0

