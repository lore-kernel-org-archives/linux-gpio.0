From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 4/5] gpio: davinci: Remove unneeded GPIO macro
Date: Fri, 31 Aug 2018 14:13:25 -0500
Message-ID: <20180831191326.25106-4-afd@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831191326.25106-1-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-Id: linux-gpio@vger.kernel.org

This macro does nothing and has only one user, remove it.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-davinci/board-neuros-osd2.c  | 8 ++++----
 include/linux/platform_data/gpio-davinci.h | 5 -----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-davinci/board-neuros-osd2.c b/arch/arm/mach-davinci/board-neuros-osd2.c
index 353f9e5a1454..efdaa27241c5 100644
--- a/arch/arm/mach-davinci/board-neuros-osd2.c
+++ b/arch/arm/mach-davinci/board-neuros-osd2.c
@@ -130,10 +130,10 @@ static struct platform_device davinci_fb_device = {
 };
 
 static const struct gpio_led ntosd2_leds[] = {
-	{ .name = "led1_green", .gpio = GPIO(10), },
-	{ .name = "led1_red",   .gpio = GPIO(11), },
-	{ .name = "led2_green", .gpio = GPIO(12), },
-	{ .name = "led2_red",   .gpio = GPIO(13), },
+	{ .name = "led1_green", .gpio = 10, },
+	{ .name = "led1_red",   .gpio = 11, },
+	{ .name = "led2_green", .gpio = 12, },
+	{ .name = "led2_red",   .gpio = 13, },
 };
 
 static struct gpio_led_platform_data ntosd2_leds_data = {
diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index b8e4957e7568..47695b342883 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -45,11 +45,6 @@ struct davinci_gpio_controller {
 	int			irqs[MAX_INT_PER_BANK];
 };
 
-/*
- * basic gpio routines
- */
-#define	GPIO(X)		(X)	/* 0 <= X <= (DAVINCI_N_GPIO - 1) */
-
 /* Convert GPIO signal to GPIO pin number */
 #define GPIO_TO_PIN(bank, gpio)	(16 * (bank) + (gpio))
 
-- 
2.18.0
