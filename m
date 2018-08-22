From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/11] gpio: ep93xx: Properly call the chained IRQ handler
Date: Wed, 22 Aug 2018 22:41:06 +0200
Message-ID: <20180822204111.9581-7-linus.walleij@linaro.org>
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

The chained irq handler should call chained_irq_enter()
and chained_irq_exit() before/after handling the chained
IRQ.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index a81d1e796912..ce7e88df9cc5 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -88,9 +88,12 @@ static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned char status;
 	int i;
 
+	chained_irq_enter(irqchip, desc);
+
 	status = readb(epg->base + EP93XX_GPIO_A_INT_STATUS);
 	for (i = 0; i < 8; i++) {
 		if (status & (1 << i)) {
@@ -106,6 +109,8 @@ static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
 			generic_handle_irq(gpio_irq);
 		}
 	}
+
+	chained_irq_exit(irqchip, desc);
 }
 
 static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
@@ -115,11 +120,14 @@ static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
 	 *
 	 *  IRQ_EP93XX_GPIO{0..7}MUX -> gpio_to_irq(EP93XX_GPIO_LINE_F({0..7})
 	 */
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	int port_f_idx = ((irq + 1) & 7) ^ 4; /* {19..22,47..50} -> {0..7} */
 	int gpio_irq = gpio_to_irq(16) + port_f_idx;
 
+	chained_irq_enter(irqchip, desc);
 	generic_handle_irq(gpio_irq);
+	chained_irq_exit(irqchip, desc);
 }
 
 static void ep93xx_gpio_irq_ack(struct irq_data *d)
-- 
2.17.1
