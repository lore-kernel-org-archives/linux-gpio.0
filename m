From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH] gpio: raspberrypi-exp: decrease refcount on firmware dt node
Date: Mon, 10 Dec 2018 17:50:05 +0100
Message-ID: <20181210165005.27965-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-rpi-kernel@lists.infradead.org, dave.stevenson@raspberrypi.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

We're getting a reference RPi's firmware node in order to be able to
communicate with it's driver. We should decrease the reference count on
the dt node after being done with it.

Fixes: a98d90e7d588 ("gpio: raspberrypi-exp: Driver for RPi3 GPIO expander via mailbox service")
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/gpio/gpio-raspberrypi-exp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
index d6d36d537e37..b77ea16ffa03 100644
--- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -206,6 +206,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
 	}
 
 	fw = rpi_firmware_get(fw_node);
+	of_node_put(fw_node);
 	if (!fw)
 		return -EPROBE_DEFER;
 
-- 
2.19.2
