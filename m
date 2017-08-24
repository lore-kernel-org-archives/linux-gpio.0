From: Colin King <colin.king@canonical.com>
Subject: [PATCH][gpio-next] gpio: mockup: remove unused variable gc
Date: Thu, 24 Aug 2017 12:34:22 +0100
Message-ID: <20170824113422.22214-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50463 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751290AbdHXLeY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2017 07:34:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable gc is assigned but never read and is redundant. Remove it.
Cleans up clang warning:

drivers/gpio/gpio-mockup.c:169:2: warning: Value stored to 'gc' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 6db7163e6d98..9532d86a82f7 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -153,7 +153,6 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	struct gpio_mockup_chip *chip;
 	struct seq_file *sfile;
 	struct gpio_desc *desc;
-	struct gpio_chip *gc;
 	int rv, val;
 
 	rv = kstrtoint_from_user(usr_buf, size, 0, &val);
@@ -166,7 +165,6 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	priv = sfile->private;
 	desc = priv->desc;
 	chip = priv->chip;
-	gc = &chip->gc;
 
 	gpiod_set_value_cansleep(desc, val);
 	irq_sim_fire(&chip->irqsim, priv->offset);
-- 
2.14.1

