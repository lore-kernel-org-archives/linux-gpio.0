From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] pinctrl: sirf: Fix module autoloading for OF
Date: Wed, 16 Sep 2015 09:43:45 +0200
Message-ID: <1442389425-27846-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Fabio Estevam <fabio.estevam@freescale.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, Barry Song <baohua@kernel.org>, Wei Chen <Wei.Chen@csr.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Drivers needs to export the OF id table and this be built into
the module or udev won't have the necessary information to auto
load the driver module when the device is registered by OF.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/pinctrl/sirf/pinctrl-atlas7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 9df0c5f25824..dd6c9b7ac1ad 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -4304,6 +4304,7 @@ static const struct of_device_id atlas7_pinmux_ids[] = {
 	{ .compatible = "sirf,atlas7-ioc",},
 	{},
 };
+MODULE_DEVICE_TABLE(of, atlas7_pinmux_ids);
 
 static struct platform_driver atlas7_pinmux_driver = {
 	.driver = {
@@ -4702,6 +4703,7 @@ static const struct of_device_id atlas7_gpio_ids[] = {
 	{ .compatible = "sirf,atlas7-gpio", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, atlas7_gpio_ids);
 
 static int atlas7_gpio_probe(struct platform_device *pdev)
 {
-- 
2.4.3
