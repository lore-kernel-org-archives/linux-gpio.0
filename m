From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 6/7] gpio: sch311x: Use devm_request_region
Date: Mon,  1 Feb 2016 18:56:52 -0500
Message-ID: <6e0b7b1603d2d12a0ef8192248b281aad74979a7.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

By the time request_region is called in the SMSC SCH311x GPIO driver, a
corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-sch311x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index 1cbd77a..57ee8f2 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -12,6 +12,7 @@
  * (at your option) any later version.
  */
 
+#include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -228,7 +229,8 @@ static int sch311x_gpio_probe(struct platform_device *pdev)
 	int err, i;
 
 	/* we can register all GPIO data registers at once */
-	if (!request_region(pdata->runtime_reg + GP1, 6, DRV_NAME)) {
+	if (!devm_request_region(&pdev->dev, pdata->runtime_reg + GP1, 6,
+		DRV_NAME)) {
 		dev_err(&pdev->dev, "Failed to request region 0x%04x-0x%04x.\n",
 			pdata->runtime_reg + GP1, pdata->runtime_reg + GP1 + 5);
 		return -EBUSY;
@@ -273,7 +275,6 @@ static int sch311x_gpio_probe(struct platform_device *pdev)
 	return 0;
 
 exit_err:
-	release_region(pdata->runtime_reg + GP1, 6);
 	/* release already registered chips */
 	for (--i; i >= 0; i--)
 		gpiochip_remove(&priv->blocks[i].chip);
@@ -286,8 +287,6 @@ static int sch311x_gpio_remove(struct platform_device *pdev)
 	struct sch311x_gpio_priv *priv = platform_get_drvdata(pdev);
 	int i;
 
-	release_region(pdata->runtime_reg + GP1, 6);
-
 	for (i = 0; i < ARRAY_SIZE(priv->blocks); i++) {
 		gpiochip_remove(&priv->blocks[i].chip);
 		dev_info(&pdev->dev,
-- 
2.4.10
