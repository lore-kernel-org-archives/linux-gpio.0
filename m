From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH] gpioib: do not free unrequested descriptors
Date: Thu, 29 Mar 2018 13:29:12 -0500
Message-ID: <1522348152-15024-1-git-send-email-timur@codeaurora.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, stable@vger.kernel.org
Cc: timur@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

If the main loop in linehandle_create() encounters an error, it
unwinds completely by freeing all previously requested GPIO
descriptors.  However, if the error occurs in the beginning of
the loop before that GPIO is requested, then the exit code
attempts to free a null descriptor.  If extrachecks is enabled,
gpiod_free() triggers a WARN_ON.

Instead, keep a separate count of legitimate GPIOs so that only
those are freed.

Cc: stable@vger.kernel.org
Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 43aeb07343ec..d07771797707 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -497,7 +497,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	struct gpiohandle_request handlereq;
 	struct linehandle_state *lh;
 	struct file *file;
-	int fd, i, ret;
+	int fd, i, count = 0, ret;
 	u32 lflags;
 
 	if (copy_from_user(&handlereq, ip, sizeof(handlereq)))
@@ -558,6 +558,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (ret)
 			goto out_free_descs;
 		lh->descs[i] = desc;
+		count = i;
 
 		if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 			set_bit(FLAG_ACTIVE_LOW, &desc->flags);
@@ -628,7 +629,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 out_put_unused_fd:
 	put_unused_fd(fd);
 out_free_descs:
-	for (; i >= 0; i--)
+	for (i = 0; i < count; i++)
 		gpiod_free(lh->descs[i]);
 	kfree(lh->label);
 out_free_lh:
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
