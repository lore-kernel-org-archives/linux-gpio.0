From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] gpio: remove useless check in gpiolib_sysfs_init()
Date: Wed, 23 Jul 2014 23:56:53 +0900
Message-ID: <1406127413-10672-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

An iterator variable cannot be NULL in its loop.

Reported-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 3516502..bcc0ec0 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -814,7 +814,7 @@ static int __init gpiolib_sysfs_init(void)
 	 */
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_for_each_entry(chip, &gpio_chips, list) {
-		if (!chip || chip->exported)
+		if (chip->exported)
 			continue;
 
 		spin_unlock_irqrestore(&gpio_lock, flags);
-- 
2.0.2
