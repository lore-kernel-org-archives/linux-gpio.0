From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpiolib: potential oops on failure path
Date: Fri, 17 Jun 2016 12:15:50 +0300
Message-ID: <20160617091550.GB25609@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

If anon_inode_getfd() fails then "i" is set to GPIOHANDLES_MAX.  It
means that we will read beyond the end of the array and dereference an
invalid pointer.

Fixes: d7c51b47ac11 ('gpio: userspace ABI for reading/writing GPIO lines')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8b3db59..8578b7f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -495,6 +495,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	return 0;
 
 out_free_descs:
+	if (i == GPIOHANDLES_MAX)
+		i--;
 	for (; i >= 0; i--)
 		gpiod_free(lh->descs[i]);
 	kfree(lh->label);
