From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 4/5] gpio: gpio-mm: Utilize devm_ functions in driver probe callback
Date: Tue, 24 Jan 2017 15:01:04 -0500
Message-ID: <010e1799ddc02e5f41c2cebded47ed5478b3d7b6.1485287208.git.vilhelm.gray@gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1485287208.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The devm_ resource manager functions allow memory to be automatically
released when a device is unbound. This patch takes advantage of the
resource manager functions and replaces the gpiochip_add_data call with
the devm_gpiochip_add_data call. In addition, the gpiomm_remove function
has been removed as no longer necessary due to the use of the relevant
devm_ resource manager functions.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-gpio-mm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-gpio-mm.c b/drivers/gpio/gpio-gpio-mm.c
index 1e7def9449ce..c2837ce64ea3 100644
--- a/drivers/gpio/gpio-gpio-mm.c
+++ b/drivers/gpio/gpio-gpio-mm.c
@@ -224,7 +224,7 @@ static int gpiomm_probe(struct device *dev, unsigned int id)
 
 	dev_set_drvdata(dev, gpiommgpio);
 
-	err = gpiochip_add_data(&gpiommgpio->chip, gpiommgpio);
+	err = devm_gpiochip_add_data(dev, &gpiommgpio->chip, gpiommgpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		return err;
@@ -243,21 +243,11 @@ static int gpiomm_probe(struct device *dev, unsigned int id)
 	return 0;
 }
 
-static int gpiomm_remove(struct device *dev, unsigned int id)
-{
-	struct gpiomm_gpio *const gpiommgpio = dev_get_drvdata(dev);
-
-	gpiochip_remove(&gpiommgpio->chip);
-
-	return 0;
-}
-
 static struct isa_driver gpiomm_driver = {
 	.probe = gpiomm_probe,
 	.driver = {
 		.name = "gpio-mm"
 	},
-	.remove = gpiomm_remove
 };
 
 module_isa_driver(gpiomm_driver, num_gpiomm);
-- 
2.11.0
