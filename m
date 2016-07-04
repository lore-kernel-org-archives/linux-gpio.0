From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: free handles in fringe cases
Date: Mon,  4 Jul 2016 13:14:45 +0200
Message-ID: <1467630885-3042-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34559 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbcGDLOv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 07:14:51 -0400
Received: by mail-lf0-f49.google.com with SMTP id h129so115190090lfh.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 04:14:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

If we fail when copying the ioctl() struct to userspace we still
need to clean up the cruft otherwise left behind or it will stay
around until the issuing process terminates the file handle.

Reported-by: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b195ec406ff4..69efe278f74d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -488,8 +488,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	}
 
 	handlereq.fd = fd;
-	if (copy_to_user(ip, &handlereq, sizeof(handlereq)))
-		return -EFAULT;
+	if (copy_to_user(ip, &handlereq, sizeof(handlereq))) {
+		ret = -EFAULT;
+		goto out_free_descs;
+	}
 
 	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
 		lh->numdescs);
@@ -784,8 +786,10 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	}
 
 	eventreq.fd = fd;
-	if (copy_to_user(ip, &eventreq, sizeof(eventreq)))
-		return -EFAULT;
+	if (copy_to_user(ip, &eventreq, sizeof(eventreq))) {
+		ret = -EFAULT;
+		goto out_free_irq;
+	}
 
 	return 0;
 
-- 
2.4.11

