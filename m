From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 2/3] gpio: mxs: Constify platform_device_id
Date: Sat,  2 May 2015 00:56:48 +0900
Message-ID: <1430495809-32061-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1430495809-32061-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430495809-32061-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/gpio/gpio-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 84cbda6acdda..150a3225aa41 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -239,7 +239,7 @@ static int mxs_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 	return !(dir & mask);
 }
 
-static struct platform_device_id mxs_gpio_ids[] = {
+static const struct platform_device_id mxs_gpio_ids[] = {
 	{
 		.name = "imx23-gpio",
 		.driver_data = IMX23_GPIO,
-- 
2.1.4
