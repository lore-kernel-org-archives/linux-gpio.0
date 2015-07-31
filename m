From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 1/2] gpio: don't override irq_*_resources() callbacks
Date: Fri, 31 Jul 2015 14:48:56 +0200
Message-ID: <1438346937-9020-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: linux-gpio@vger.kernel.org

If the driver has specified its own irq_{request/release}_resources()
functions, don't override them.  The gpio-etraxfs driver will use this.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 drivers/gpio/gpiolib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d..6865874 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -636,8 +636,12 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 		gpiochip->irqchip = NULL;
 		return -EINVAL;
 	}
-	irqchip->irq_request_resources = gpiochip_irq_reqres;
-	irqchip->irq_release_resources = gpiochip_irq_relres;
+
+	if (!irqchip->irq_request_resources &&
+	    !irqchip->irq_release_resources) {
+		irqchip->irq_request_resources = gpiochip_irq_reqres;
+		irqchip->irq_release_resources = gpiochip_irq_relres;
+	}
 
 	/*
 	 * Prepare the mapping since the irqchip shall be orthogonal to
-- 
2.1.4
