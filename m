From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags simultaneously
Date: Wed, 15 Nov 2017 16:47:43 +0100
Message-ID: <20171115154743.5921-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:53805 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932795AbdKOPrt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 10:47:49 -0500
Received: by mail-wr0-f194.google.com with SMTP id u40so20812766wrf.10
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2017 07:47:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
the hardware actually supports enabling both at the same time the
electrical result would be disastrous.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
There was a misunderstanding as to what the goal of my previous commit
609aaf6a6029 ("gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags for
input") was, which resulted in discovering another thing that needs
fixing. This change was suggested to me by Linus earlier today.

 drivers/gpio/gpiolib.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 641a5eb552cb..ec80e0146fd5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -459,6 +459,15 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
 		return -EINVAL;
 
+	/*
+	 * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
+	 * the hardware actually supports enabling both at the same time the
+	 * electrical result would be disastrous.
+	 */
+	if ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) &&
+	    (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE))
+		return -EINVAL;
+
 	/* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
 	if (!(lflags & GPIOHANDLE_REQUEST_OUTPUT) &&
 	    ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
-- 
2.13.2

