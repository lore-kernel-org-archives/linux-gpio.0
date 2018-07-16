From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/2] gpiolib: remove an unnecessary TODO
Date: Mon, 16 Jul 2018 10:34:24 +0200
Message-ID: <20180716083424.11157-3-brgl@bgdev.pl>
References: <20180716083424.11157-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716083424.11157-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

It's actually fine to read values of output lines. This was also
allowed by the legacy sysfs interface.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 57973524360d..19d36698574b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -431,7 +431,7 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 	int i;
 
 	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
-		/* TODO: check if descriptors are really input */
+		/* NOTE: It's ok to read values of output lines. */
 		int ret = gpiod_get_array_value_complex(false,
 							true,
 							lh->numdescs,
-- 
2.17.1
