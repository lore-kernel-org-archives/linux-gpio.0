From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] gpio: mb86s7x: use builtin_platform_driver
Date: Fri, 18 Nov 2016 22:12:28 +0800
Message-ID: <368a15a27c8422e6e6b588a136241255c8fcefbb.1479456895.git.geliangtang@gmail.com>
References: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use builtin_platform_driver() helper to simplify the code.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/gpio/gpio-mb86s7x.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index d55af50..ffb73f6 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -217,8 +217,4 @@ static struct platform_driver mb86s70_gpio_driver = {
 	.remove = mb86s70_gpio_remove,
 };
 
-static int __init mb86s70_gpio_init(void)
-{
-	return platform_driver_register(&mb86s70_gpio_driver);
-}
-device_initcall(mb86s70_gpio_init);
+builtin_platform_driver(mb86s70_gpio_driver);
-- 
2.9.3
