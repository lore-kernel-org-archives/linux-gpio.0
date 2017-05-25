From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 05/10] gpio: mockup: improve the debugfs input sanitization
Date: Thu, 25 May 2017 10:33:42 +0200
Message-ID: <1495701227-28809-6-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38561 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937299AbdEYIeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:34:01 -0400
Received: by mail-wm0-f51.google.com with SMTP id e127so95409963wmg.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:34:01 -0700 (PDT)
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

We're currently only checking the first character of the input to the
debugfs event files, so a string like '0sdfdsf' is valid and indicates
a falling edge event.

Be more strict and only allow '0', '1', '0\n' & '1\n'.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index ba8d62a..b197b93 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -208,8 +208,8 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	struct seq_file *sfile;
 	struct gpio_desc *desc;
 	struct gpio_chip *gc;
+	char buf[2];
 	int val;
-	char buf;
 
 	sfile = file->private_data;
 	priv = sfile->private;
@@ -220,12 +220,18 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	if (!chip->lines[priv->offset].irq_enabled)
 		return size;
 
-	if (copy_from_user(&buf, usr_buf, 1))
+	if (size > 2)
+		return -EINVAL;
+
+	if (copy_from_user(&buf, usr_buf, 2))
 		return -EFAULT;
 
-	if (buf == '0')
+	if (size == 2 && buf[1] != '\n')
+		return -EINVAL;
+
+	if (buf[0] == '0')
 		val = 0;
-	else if (buf == '1')
+	else if (buf[0] == '1')
 		val = 1;
 	else
 		return -EINVAL;
-- 
2.9.3

