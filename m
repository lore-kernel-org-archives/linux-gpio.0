From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: make the iterator point to last handle
Date: Sat, 18 Jun 2016 10:59:53 +0200
Message-ID: <1466240393-28288-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34157 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061AbcFRI77 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 04:59:59 -0400
Received: by mail-lf0-f52.google.com with SMTP id h129so10373932lfh.1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 01:59:58 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, Walter Harms <wharms@bfs.de>

When initializing the GPIO handles, we use the iterator (i)
to back off if something goes wrong. But since the iterator
is also used after we pass the loop, we must decrement by
one after exiting the loop so that we point at the last
element in the array.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Walter Harms <wharms@bfs.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c826844abdeb..b504364fd644 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -474,6 +474,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
 	}
+	/* Let i point at the last handle */
+	i--;
 	lh->numdescs = handlereq.lines;
 
 	fd = anon_inode_getfd("gpio-linehandle",
-- 
2.4.11

