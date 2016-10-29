From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ACPI / gpio: add missing fwnode_handle_put() in acpi_gpiochip_scan_gpios()
Date: Sat, 29 Oct 2016 16:11:57 +0000
Message-ID: <1477757517-26498-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34426 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754138AbcJ2QMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2016 12:12:10 -0400
Received: by mail-pf0-f195.google.com with SMTP id u84so4233662pfj.1
        for <linux-gpio@vger.kernel.org>; Sat, 29 Oct 2016 09:12:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

fwnode_handle_put() should be used when terminating
device_for_each_child_node() iteration with break or
return to prevent stale device node references from
being left behind.

This is detected by Coccinelle semantic patch.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpiolib-acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 2d71ef6..f867618 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -925,6 +925,7 @@ static void acpi_gpiochip_scan_gpios(struct acpi_gpio_chip *achip)
 		ret = gpiod_hog(desc, name, lflags, dflags);
 		if (ret) {
 			dev_err(chip->parent, "Failed to hog GPIO\n");
+			fwnode_handle_put(fwnode);
 			return;
 		}
 	}



