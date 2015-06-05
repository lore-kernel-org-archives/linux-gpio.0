From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: improve error reporting on own descriptors
Date: Fri,  5 Jun 2015 11:36:10 +0200
Message-ID: <1433496970-20392-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:35122 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbbFEJgR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2015 05:36:17 -0400
Received: by labko7 with SMTP id ko7so50181491lab.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2015 02:36:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

When requesting own descriptors through hogs, it is useful to
get some details about what's going on if we encounter problems.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4861b2db2edc..2d01a691060b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2118,13 +2118,15 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 
 	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
 	if (IS_ERR(local_desc)) {
-		pr_err("requesting own GPIO %s failed\n", name);
+		pr_err("requesting own GPIO %s (chip %s, offset %d) failed\n",
+		       name, chip->label, hwnum);
 		return PTR_ERR(local_desc);
 	}
 
 	status = gpiod_configure_flags(desc, name, lflags, dflags);
 	if (status < 0) {
-		pr_err("setup of GPIO %s failed\n", name);
+		pr_err("setup of GPIO %s (chip %s, offset %d) failed\n",
+		       name, chip->label, hwnum);
 		gpiochip_free_own_desc(desc);
 		return status;
 	}
-- 
2.4.2

