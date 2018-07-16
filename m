From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] gpiolib: don't allow userspace to set values of input lines
Date: Mon, 16 Jul 2018 10:34:23 +0200
Message-ID: <20180716083424.11157-2-brgl@bgdev.pl>
References: <20180716083424.11157-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716083424.11157-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

User space can currently both read and set values of input lines using
the character device. This was not allowed by the old sysfs interface
nor is it a correct behavior.

Check the first descriptor in the set for the OUT flag when asked to
set values and return -EPERM if the line is input.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e11a3bb03820..57973524360d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -449,7 +449,13 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 
 		return 0;
 	} else if (cmd == GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
-		/* TODO: check if descriptors are really output */
+		/*
+		 * All line descriptors were created at once with the same
+		 * flags so just check if the first one is really output.
+		 */
+		if (!test_bit(FLAG_IS_OUT, &lh->descs[0]->flags))
+			return -EPERM;
+
 		if (copy_from_user(&ghd, ip, sizeof(ghd)))
 			return -EFAULT;
 
-- 
2.17.1
