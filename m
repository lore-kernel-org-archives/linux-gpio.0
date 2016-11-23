From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] gpio: vf610: use builtin_platform_driver
Date: Wed, 23 Nov 2016 22:47:48 +0800
Message-ID: <73e366ec39db7aff079c47eefac5f3d5f3fe014e.1479912435.git.geliangtang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use builtin_platform_driver() helper to simplify the code.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/gpio/gpio-vf610.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 3edb09c..521fbe3 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -283,8 +283,4 @@ static struct platform_driver vf610_gpio_driver = {
 	.probe		= vf610_gpio_probe,
 };
 
-static int __init gpio_vf610_init(void)
-{
-	return platform_driver_register(&vf610_gpio_driver);
-}
-device_initcall(gpio_vf610_init);
+builtin_platform_driver(vf610_gpio_driver);
-- 
2.9.3
