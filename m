From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] gpiolib: Fix typo in comment ("piochip_add_data")
Date: Thu, 21 Dec 2017 17:56:34 +0100
Message-ID: <20171221165635.20764-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aad84a6306c4..544efb3bd0a0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1381,7 +1381,7 @@ static int devm_gpio_chip_match(struct device *dev, void *res, void *data)
 }
 
 /**
- * devm_gpiochip_add_data() - Resource manager piochip_add_data()
+ * devm_gpiochip_add_data() - Resource manager gpiochip_add_data()
  * @dev: the device pointer on which irq_chip belongs to.
  * @chip: the chip to register, with chip->base initialized
  * @data: driver-private data associated with this chip
-- 
2.15.0
