From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 09/11] gpio: ep93xx: Use for_each_set_bit() in IRQ handler
Date: Wed, 22 Aug 2018 22:41:09 +0200
Message-ID: <20180822204111.9581-10-linus.walleij@linaro.org>
References: <20180822204111.9581-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180822204111.9581-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: H Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

This simplifies and standardizes the AB IRQ handler by using
the for_each_set_bit() library function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index b2139ec43ce2..1248d83f860b 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -105,25 +105,21 @@ static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
-	unsigned char status;
-	int i;
+	unsigned long stat;
+	int offset;
 
 	chained_irq_enter(irqchip, desc);
 
-	status = readb(epg->base + EP93XX_GPIO_A_INT_STATUS);
-	for (i = 0; i < 8; i++) {
-		if (status & (1 << i)) {
-			int gpio_irq = gpio_to_irq(0) + i;
-			generic_handle_irq(gpio_irq);
-		}
+	stat = readb(epg->base + EP93XX_GPIO_A_INT_STATUS);
+	for_each_set_bit(offset, &stat, 8) {
+		int gpio_irq = gpio_to_irq(0) + offset;
+		generic_handle_irq(gpio_irq);
 	}
 
-	status = readb(epg->base + EP93XX_GPIO_B_INT_STATUS);
-	for (i = 0; i < 8; i++) {
-		if (status & (1 << i)) {
-			int gpio_irq = gpio_to_irq(8) + i;
-			generic_handle_irq(gpio_irq);
-		}
+	stat = readb(epg->base + EP93XX_GPIO_B_INT_STATUS);
+	for_each_set_bit(offset, &stat, 8) {
+		int gpio_irq = gpio_to_irq(8) + offset;
+		generic_handle_irq(gpio_irq);
 	}
 
 	chained_irq_exit(irqchip, desc);
-- 
2.17.1
