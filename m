From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [RFC v1 5/9] gpio: davinci: reuse for Keystone SoC
Date: Tue, 26 Nov 2013 21:40:11 +0200
Message-ID: <1385494815-15740-6-git-send-email-grygorii.strashko@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1385494815-15740-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

The similar GPIO HW block is used by keystone SoCs as
in Davinci SoCs.
Hence, reuse Davinci GPIO driver for Keystone.

Documentation:
 http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-davinci.txt      |    4 +-
 drivers/gpio/gpio-davinci.c                        |   55 ++++++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index a2e839d..4ce9862 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -1,7 +1,7 @@
-Davinci GPIO controller bindings
+Davinci/Keystone GPIO controller bindings
 
 Required Properties:
-- compatible: should be "ti,dm6441-gpio"
+- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio"
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 6a48bf8..545f25c 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -542,11 +542,65 @@ static int davinci_gpio_banked_irq_init(struct platform_device *pdev)
 	return 0;
 }
 
+static int keystone_gpio_unbanked_irq_init(struct platform_device *pdev)
+{
+	int base_irq, irq;
+	unsigned gpio, ngpio;
+	struct davinci_gpio_regs __iomem *g;
+	struct device *dev = &pdev->dev;
+	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
+	struct davinci_gpio_platform_data *pdata = dev->platform_data;
+
+	static struct irq_chip gpio_unbanked;
+
+	if (pdata->gpio_unbanked > chips[0].chip.ngpio) {
+		dev_err(dev, "Invalid IRQ configuration\n");
+		return -EINVAL;
+	}
+
+	ngpio = pdata->ngpio;
+
+	base_irq = platform_get_irq(pdev, 0);
+	if (base_irq <= 0) {
+		dev_err(dev, "Invalid first banked IRQ number %d\n", base_irq);
+		return base_irq < 0 ? base_irq : -EINVAL;
+	}
+
+	/* pass "bank 0" GPIO IRQs to GIC */
+	chips[0].chip.to_irq = gpio_to_irq_unbanked;
+	chips[0].gpio_irq = base_irq;
+	chips[0].gpio_unbanked = pdata->gpio_unbanked;
+
+	/* GIC handles mask/unmask; GPIO handles triggering */
+	gpio_unbanked = *irq_get_chip(base_irq);
+	gpio_unbanked.name = "GPIO-GIC";
+	gpio_unbanked.irq_set_type = gpio_irq_type_unbanked;
+
+	/* default trigger: both edges */
+	g = gpio2regs(0);
+	writel(~0, &g->set_falling);
+	writel(~0, &g->set_rising);
+
+	irq = base_irq;
+	/* set the direct IRQs up to use that irqchip */
+	for (gpio = 0; gpio < pdata->gpio_unbanked; gpio++, irq++) {
+		irq_set_chip(irq, &gpio_unbanked);
+		irq_set_handler_data(irq, &chips[gpio / 32]);
+		irq_set_status_flags(irq, IRQ_TYPE_EDGE_BOTH);
+	}
+
+	return 0;
+};
+
 static const struct davinci_gpio_init_data davinci_gpio_pdata = {
 	.unbanked_irq_init = davinci_gpio_unbanked_irq_init,
 	.banked_irq_init = davinci_gpio_banked_irq_init,
 };
 
+static const struct davinci_gpio_init_data keystone_gpio_pdata = {
+	.unbanked_irq_init = keystone_gpio_unbanked_irq_init,
+};
+
 /*
  * NOTE:  for suspend/resume, probably best to make a platform_device with
  * suspend_late/resume_resume calls hooking into results of the set_wake()
@@ -622,6 +676,7 @@ done:
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id davinci_gpio_ids[] = {
 	{ .compatible = "ti,dm6441-gpio", &davinci_gpio_pdata},
+	{ .compatible = "ti,keystone-gpio", &keystone_gpio_pdata},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
-- 
1.7.9.5
