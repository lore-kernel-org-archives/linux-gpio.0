From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] gpiolib: only check line handle flags once
Date: Mon, 16 Oct 2017 11:32:29 +0200
Message-ID: <20171016093230.5329-2-brgl@bgdev.pl>
References: <20171016093230.5329-1-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:55075 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751448AbdJPJch (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 05:32:37 -0400
Received: by mail-wm0-f54.google.com with SMTP id i124so1114304wmf.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 02:32:37 -0700 (PDT)
In-Reply-To: <20171016093230.5329-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

There's no need to check the validity of handle request flags more
than once, right after copying the data from user. Move the check
out of the for loop and simplify the error path by bailing out before
allocating any resources.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eb80dac4e26a..5d98345c9dc8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -444,12 +444,19 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	struct linehandle_state *lh;
 	struct file *file;
 	int fd, i, ret;
+	u32 lflags;
 
 	if (copy_from_user(&handlereq, ip, sizeof(handlereq)))
 		return -EFAULT;
 	if ((handlereq.lines == 0) || (handlereq.lines > GPIOHANDLES_MAX))
 		return -EINVAL;
 
+	lflags = handlereq.flags;
+
+	/* Return an error if an unknown flag is set */
+	if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
@@ -470,7 +477,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	/* Request each GPIO */
 	for (i = 0; i < handlereq.lines; i++) {
 		u32 offset = handlereq.lineoffsets[i];
-		u32 lflags = handlereq.flags;
 		struct gpio_desc *desc;
 
 		if (offset >= gdev->ngpio) {
@@ -478,12 +484,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			goto out_free_descs;
 		}
 
-		/* Return an error if a unknown flag is set */
-		if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) {
-			ret = -EINVAL;
-			goto out_free_descs;
-		}
-
 		desc = &gdev->descs[offset];
 		ret = gpiod_request(desc, lh->label);
 		if (ret)
-- 
2.13.2

