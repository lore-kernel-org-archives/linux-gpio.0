From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: mockup: fix a return value check
Date: Wed,  6 Dec 2017 17:30:02 +0100
Message-ID: <20171206163002.26742-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:45935 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751823AbdLFQaG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Dec 2017 11:30:06 -0500
Received: by mail-wr0-f193.google.com with SMTP id h1so4512320wre.12
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2017 08:30:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

The return value of platform_device_register_resndata() on error is
an error code converted to pointer with ERR_PTR(), not NULL.

Check the return value correctly.

Fixes: 8a39f597bcfd ("gpio: mockup: rework device probing")
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index ea8c730d8af1..3a545ad17817 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -387,11 +387,11 @@ static int __init gpio_mockup_init(void)
 							 GPIO_MOCKUP_NAME,
 							 i, NULL, 0, &pdata,
 							 sizeof(pdata));
-		if (!pdev) {
+		if (IS_ERR(pdev)) {
 			gpio_mockup_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
-			return -ENOMEM;
+			return PTR_ERR(pdev);
 		}
 
 		gpio_mockup_pdevs[i] = pdev;
-- 
2.15.1

