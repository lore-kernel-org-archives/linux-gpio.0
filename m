From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: mockup: return -EFAULT if copy_from_user() fails
Date: Wed, 15 Feb 2017 02:02:06 +0300
Message-ID: <20170214230206.GA4048@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:22904 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750731AbdBNXCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2017 18:02:22 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_from_user() returns the number of bytes remaining to be copied but
we want to return negative error codes on failue.

Fixes: 9202ba2397d1 ("gpio: mockup: implement event injecting over debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 06dac72cb69c..d99338689213 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -197,7 +197,7 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	struct seq_file *sfile;
 	struct gpio_desc *desc;
 	struct gpio_chip *gc;
-	int status, val;
+	int val;
 	char buf;
 
 	sfile = file->private_data;
@@ -206,9 +206,8 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	chip = priv->chip;
 	gc = &chip->gc;
 
-	status = copy_from_user(&buf, usr_buf, 1);
-	if (status)
-		return status;
+	if (copy_from_user(&buf, usr_buf, 1))
+		return -EFAULT;
 
 	if (buf == '0')
 		val = 0;
