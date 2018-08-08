From: Ivan Podovalov <ipodovalov@gmail.com>
Subject: [PATCH] gpio: it87: add support for IT8718F Super I/O.
Date: Wed,  8 Aug 2018 11:46:22 +0300
Message-ID: <20180808084622.26392-1-ipodovalov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ivan Podovalov <ipodovalov@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The DIO connector on the WAFER-945GSE is interfaced to GPIO ports
on the ITE IT8718F Super I/O chipset. From the datasheet of ITE IT8718F,
the GPIO interface is identical to IT8728, so just add it
to the same case as the other chip.

Signed-off-by: Ivan Podovalov <ipodovalov@gmail.com>
---
 drivers/gpio/gpio-it87.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index 7cad14d3f127..b334448e2b46 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -37,6 +37,7 @@
 #define NO_DEV_ID	0xffff
 #define IT8620_ID	0x8620
 #define IT8628_ID	0x8628
+#define IT8718_ID       0x8718
 #define IT8728_ID	0x8728
 #define IT8732_ID	0x8732
 #define IT8761_ID	0x8761
@@ -314,6 +315,7 @@ static int __init it87_gpio_init(void)
 		it87_gpio->simple_size = 0;
 		it87_gpio->chip.ngpio = 64;
 		break;
+	case IT8718_ID:
 	case IT8728_ID:
 	case IT8732_ID:
 	case IT8772_ID:
-- 
2.16.4
