From: David Lechner <david@lechnology.com>
Subject: [PATCH] gpiolib: suppress error message on EPROBE_DEFER
Date: Sun, 21 Jan 2018 14:32:54 -0600
Message-ID: <1516566774-1786-1-git-send-email-david@lechnology.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:37630 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751010AbeAUUdI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jan 2018 15:33:08 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>, Linus Walleij <linus.walleij@linaro.org>

This suppresses printing an error message during probe of gpio drivers
when the error is EPROBE_DEFER.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 44332b7..134d0e4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1289,9 +1289,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 err_free_gdev:
 	ida_simple_remove(&gpio_ida, gdev->id);
 	/* failures here can mean systems won't boot... */
-	pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
-	       gdev->base, gdev->base + gdev->ngpio - 1,
-	       chip->label ? : "generic");
+	if (status != -EPROBE_DEFER)
+		pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
+		       gdev->base, gdev->base + gdev->ngpio - 1,
+		       chip->label ? : "generic");
 	kfree(gdev);
 	return status;
 }
-- 
2.7.4

