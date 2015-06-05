From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: promote own request failure to pr_err()
Date: Fri,  5 Jun 2015 11:10:21 +0200
Message-ID: <1433495421-16267-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:35120 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932320AbbFEJK3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2015 05:10:29 -0400
Received: by labko7 with SMTP id ko7so49705858lab.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2015 02:10:27 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

These error messages are helpful to see that we fail to get
hogs. Promote them to real errors so they appear in the boot
crawl.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6bc612b8a49f..4861b2db2edc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2118,13 +2118,13 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 
 	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
 	if (IS_ERR(local_desc)) {
-		pr_debug("requesting own GPIO %s failed\n", name);
+		pr_err("requesting own GPIO %s failed\n", name);
 		return PTR_ERR(local_desc);
 	}
 
 	status = gpiod_configure_flags(desc, name, lflags, dflags);
 	if (status < 0) {
-		pr_debug("setup of GPIO %s failed\n", name);
+		pr_err("setup of GPIO %s failed\n", name);
 		gpiochip_free_own_desc(desc);
 		return status;
 	}
-- 
2.4.2

