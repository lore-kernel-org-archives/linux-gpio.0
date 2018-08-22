From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 01/11] ARM/gpio: ep93xx: build standalone
Date: Wed, 22 Aug 2018 22:41:01 +0200
Message-ID: <20180822204111.9581-2-linus.walleij@linaro.org>
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

As a preparation for multiplatform support, this ensures
that the ep93xx gpio driver can be built without any of
the platform specific header files. We pass the IRQ numbers
as a resource now, and use the virtual mmio base from the
already existing resource, rather than relying on the
hardwired virtual address from the header file.

Some numbers are now hardcoded that came from macros
in the past, but for all I can tell, the driver already
relied on the specific values.

Cc: arm@kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Arnd/other ARM SoC person:
Please provide an ACK for this patch so I can merge it
with the rest of the refactorings into the GPIO tree.
---
 arch/arm/mach-ep93xx/core.c |  9 +++++++
 drivers/gpio/gpio-ep93xx.c  | 48 ++++++++++++++++++-------------------
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 574dfdc527ed..b82b632789f7 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -141,6 +141,15 @@ EXPORT_SYMBOL_GPL(ep93xx_chip_revision);
  *************************************************************************/
 static struct resource ep93xx_gpio_resource[] = {
 	DEFINE_RES_MEM(EP93XX_GPIO_PHYS_BASE, 0xcc),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO_AB),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO0MUX),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO1MUX),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO2MUX),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO3MUX),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO4MUX),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO5MUX),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO6MUX),
+	DEFINE_RES_IRQ(IRQ_EP93XX_GPIO7MUX),
 };
 
 static struct platform_device ep93xx_gpio_device = {
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 45d384039e9b..654525d6a9f1 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -22,11 +22,20 @@
 /* FIXME: this is here for gpio_to_irq() - get rid of this! */
 #include <linux/gpio.h>
 
-#include <mach/hardware.h>
-#include <mach/gpio-ep93xx.h>
-
 #define irq_to_gpio(irq)	((irq) - gpio_to_irq(0))
 
+void __iomem *ep93xx_gpio_base; /* FIXME: put this into irq_data */
+#define EP93XX_GPIO_REG(x) (ep93xx_gpio_base + (x))
+#define EP93XX_GPIO_F_INT_STATUS EP93XX_GPIO_REG(0x5c)
+#define EP93XX_GPIO_A_INT_STATUS EP93XX_GPIO_REG(0xa0)
+#define EP93XX_GPIO_B_INT_STATUS EP93XX_GPIO_REG(0xbc)
+
+/* Maximum value for gpio line identifiers */
+#define EP93XX_GPIO_LINE_MAX 63
+
+/* Maximum value for irq capable line identifiers */
+#define EP93XX_GPIO_LINE_MAX_IRQ 23
+
 struct ep93xx_gpio {
 	void __iomem		*mmio_base;
 	struct gpio_chip	gc[8];
@@ -87,7 +96,7 @@ static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
 	status = readb(EP93XX_GPIO_A_INT_STATUS);
 	for (i = 0; i < 8; i++) {
 		if (status & (1 << i)) {
-			int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_A(0)) + i;
+			int gpio_irq = gpio_to_irq(0) + i;
 			generic_handle_irq(gpio_irq);
 		}
 	}
@@ -95,7 +104,7 @@ static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
 	status = readb(EP93XX_GPIO_B_INT_STATUS);
 	for (i = 0; i < 8; i++) {
 		if (status & (1 << i)) {
-			int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_B(0)) + i;
+			int gpio_irq = gpio_to_irq(8) + i;
 			generic_handle_irq(gpio_irq);
 		}
 	}
@@ -110,7 +119,7 @@ static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
 	 */
 	unsigned int irq = irq_desc_get_irq(desc);
 	int port_f_idx = ((irq + 1) & 7) ^ 4; /* {19..22,47..50} -> {0..7} */
-	int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_F(0)) + port_f_idx;
+	int gpio_irq = gpio_to_irq(16) + port_f_idx;
 
 	generic_handle_irq(gpio_irq);
 }
@@ -228,9 +237,10 @@ static struct irq_chip ep93xx_gpio_irq_chip = {
 	.irq_set_type	= ep93xx_gpio_irq_type,
 };
 
-static void ep93xx_gpio_init_irq(void)
+static void ep93xx_gpio_init_irq(struct platform_device *pdev)
 {
 	int gpio_irq;
+	int i;
 
 	for (gpio_irq = gpio_to_irq(0);
 	     gpio_irq <= gpio_to_irq(EP93XX_GPIO_LINE_MAX_IRQ); ++gpio_irq) {
@@ -239,24 +249,11 @@ static void ep93xx_gpio_init_irq(void)
 		irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
 	}
 
-	irq_set_chained_handler(IRQ_EP93XX_GPIO_AB,
+	irq_set_chained_handler(platform_get_irq(pdev, 0),
 				ep93xx_gpio_ab_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO0MUX,
-				ep93xx_gpio_f_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO1MUX,
-				ep93xx_gpio_f_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO2MUX,
-				ep93xx_gpio_f_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO3MUX,
-				ep93xx_gpio_f_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO4MUX,
-				ep93xx_gpio_f_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO5MUX,
-				ep93xx_gpio_f_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO6MUX,
-				ep93xx_gpio_f_irq_handler);
-	irq_set_chained_handler(IRQ_EP93XX_GPIO7MUX,
-				ep93xx_gpio_f_irq_handler);
+	for (i = 1; i <= 8; i++)
+		irq_set_chained_handler(platform_get_irq(pdev, i),
+					ep93xx_gpio_f_irq_handler);
 }
 
 
@@ -362,6 +359,7 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 	ep93xx_gpio->mmio_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ep93xx_gpio->mmio_base))
 		return PTR_ERR(ep93xx_gpio->mmio_base);
+	ep93xx_gpio_base = ep93xx_gpio->mmio_base;
 
 	for (i = 0; i < ARRAY_SIZE(ep93xx_gpio_banks); i++) {
 		struct gpio_chip *gc = &ep93xx_gpio->gc[i];
@@ -373,7 +371,7 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 				bank->label);
 	}
 
-	ep93xx_gpio_init_irq();
+	ep93xx_gpio_init_irq(pdev);
 
 	return 0;
 }
-- 
2.17.1
