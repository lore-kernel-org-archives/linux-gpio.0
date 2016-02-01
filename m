From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 4/7] gpio: amd8111: Use devm_request_region
Date: Mon,  1 Feb 2016 18:54:29 -0500
Message-ID: <08f3cf28dbe9fd7c92441dff70502f7310039a91.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

By the time request_region is called in the AMD 8111 GPIO driver, a
corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-amd8111.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index c7040ff..30ad7d7 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -25,6 +25,7 @@
  * License version 2. This program is licensed "as is" without any
  * warranty of any kind, whether express or implied.
  */
+#include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/gpio.h>
@@ -204,7 +205,8 @@ found:
 	gp.pmbase &= 0x0000FF00;
 	if (gp.pmbase == 0)
 		goto out;
-	if (!request_region(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE, "AMD GPIO")) {
+	if (!devm_request_region(&pdev->dev, gp.pmbase + PMBASE_OFFSET,
+		PMBASE_SIZE, "AMD GPIO")) {
 		dev_err(&pdev->dev, "AMD GPIO region 0x%x already in use!\n",
 			gp.pmbase + PMBASE_OFFSET);
 		err = -EBUSY;
@@ -213,7 +215,6 @@ found:
 	gp.pm = ioport_map(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
 	if (!gp.pm) {
 		dev_err(&pdev->dev, "Couldn't map io port into io memory\n");
-		release_region(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
 		err = -ENOMEM;
 		goto out;
 	}
@@ -228,7 +229,6 @@ found:
 		printk(KERN_ERR "GPIO registering failed (%d)\n",
 		       err);
 		ioport_unmap(gp.pm);
-		release_region(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
 		goto out;
 	}
 out:
@@ -239,7 +239,6 @@ static void __exit amd_gpio_exit(void)
 {
 	gpiochip_remove(&gp.chip);
 	ioport_unmap(gp.pm);
-	release_region(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
 }
 
 module_init(amd_gpio_init);
-- 
2.4.10
