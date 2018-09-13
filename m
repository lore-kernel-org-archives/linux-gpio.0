From: Jim Paris <jim@jtan.com>
Subject: [PATCH] gpiolib: fix freeing of descriptors on error
Date: Thu, 13 Sep 2018 12:35:41 -0400
Message-ID: <20180913163541.7364-1-jim@jtan.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Jim Paris <jim@jtan.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When the main loop in linehandle_create() encounters an error, it
fails to free one of the previously-requested GPIO descriptors.
This renders the unfreed GPIO unusable until reboot, and leaves
its label pointing to free'd kernel memory.

Cc: stable@vger.kernel.org
Fixes: ab3dbcf78f60 ("gpioib: do not free unrequested descriptors")
Signed-off-by: Jim Paris <jim@jtan.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8f8a1999393..a57300c1d649 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -571,7 +571,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (ret)
 			goto out_free_descs;
 		lh->descs[i] = desc;
-		count = i;
+		count = i + 1;
 
 		if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 			set_bit(FLAG_ACTIVE_LOW, &desc->flags);
-- 
2.18.0
