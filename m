From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 1/3] gpio: mxc: Constify platform_device_id
Date: Sat,  2 May 2015 00:56:47 +0900
Message-ID: <1430495809-32061-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9f7446a7ac64..e2d3eda1fe87 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -131,7 +131,7 @@ static struct mxc_gpio_hwdata *mxc_gpio_hwdata;
 #define GPIO_INT_FALL_EDGE	(mxc_gpio_hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
-static struct platform_device_id mxc_gpio_devtype[] = {
+static const struct platform_device_id mxc_gpio_devtype[] = {
 	{
 		.name = "imx1-gpio",
 		.driver_data = IMX1_GPIO,
-- 
2.1.4
