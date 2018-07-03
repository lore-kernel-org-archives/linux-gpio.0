From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2] gpiolib: Defer on non-DT find_chip_by_name() failure
Date: Wed,  4 Jul 2018 00:18:19 +0200
Message-ID: <20180703221819.1825-1-jmkrzyszt@gmail.com>
References: <20180703172635.32508-1-jmkrzyszt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703172635.32508-1-jmkrzyszt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Avoid replication of error code conversion in non-DT GPIO consumers'
code by returning -EPROBE_DEFER from gpiod_find() in case a chip
identified by its label in a registered lookup table is not ready.

See https://lkml.org/lkml/2018/5/30/176 for example case.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changelog
v2: fix typo (latar -> later) - thanks Boris and Andy for catching this

I'm not sure if adding both Suggested-by: and Reviewed-by: heades both
with the same person name is in line with good practices, please remove
one if not.

Thanks,
Janusz

 drivers/gpio/gpiolib.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e11a3bb03820..01295c03b315 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3639,9 +3639,16 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		chip = find_chip_by_name(p->chip_label);
 
 		if (!chip) {
-			dev_err(dev, "cannot find GPIO chip %s\n",
-				p->chip_label);
-			return ERR_PTR(-ENODEV);
+			/*
+			 * As the lookup table indicates a chip with
+			 * p->chip_label should exist, assume it may
+			 * still appear later and let the interested
+			 * consumer be probed again or let the Deferred
+			 * Probe infrastructure handle the error.
+			 */
+			dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
+				 p->chip_label);
+			return ERR_PTR(-EPROBE_DEFER);
 		}
 
 		if (chip->ngpio <= p->chip_hwnum) {
-- 
2.16.4
