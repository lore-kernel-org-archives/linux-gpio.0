From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] gpio: rcar: Add Runtime PM handling for interrupts
Date: Tue, 22 May 2018 17:58:15 +0100
Message-ID: <1527008295-15516-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, stable@vger.kernel.org, Ben Hutchings <ben.hutchings@codethink.co.uk>
List-Id: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

commit b26a719bdba9aa926ceaadecc66e07623d2b8a53 upstream.

The R-Car GPIO driver handles Runtime PM for requested GPIOs only.

When using a GPIO purely as an interrupt source, no Runtime PM handling
is done, and the GPIO module's clock may not be enabled.

To fix this:
  - Add .irq_request_resources() and .irq_release_resources() callbacks
    to handle Runtime PM when an interrupt is requested,
  - Add irq_bus_lock() and sync_unlock() callbacks to handle Runtime PM
    when e.g. disabling/enabling an interrupt, or configuring the
    interrupt type.

Fixes: d5c3d84657db57bd "net: phy: Avoid polling PHY with PHY_IGNORE_INTERRUPTS"
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[fabrizio: cherry-pick to v4.4.y. Use container_of instead of
gpiochip_get_data.]
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
Hi Greg,

on R-Car we have found that if a GPIO is used purely as an interrupt source,
the corresponding clock is not enabled, therefore the interrupt doesn't work.
On Koelsch, the HDMI trasmitter node in the DT uses GPIO 3 29 for the
interrupt line, and since gpio3 is used only for this, its clock is OFF,
preventing the interrupt from working. This patch fixes this problem.
Would you please consider this patch for 4.4.y?

Thanks,
Fab

 drivers/gpio/gpio-rcar.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 2a81224..9ba4aaa 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -200,6 +200,48 @@ static int gpio_rcar_irq_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
+static void gpio_rcar_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
+						gpio_chip);
+
+	pm_runtime_get_sync(&p->pdev->dev);
+}
+
+static void gpio_rcar_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
+						gpio_chip);
+
+	pm_runtime_put(&p->pdev->dev);
+}
+
+
+static int gpio_rcar_irq_request_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
+						gpio_chip);
+	int error;
+
+	error = pm_runtime_get_sync(&p->pdev->dev);
+	if (error < 0)
+		return error;
+
+	return 0;
+}
+
+static void gpio_rcar_irq_release_resources(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
+						gpio_chip);
+
+	pm_runtime_put(&p->pdev->dev);
+}
+
 static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
 {
 	struct gpio_rcar_priv *p = dev_id;
@@ -460,6 +502,10 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	irq_chip->irq_unmask = gpio_rcar_irq_enable;
 	irq_chip->irq_set_type = gpio_rcar_irq_set_type;
 	irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
+	irq_chip->irq_bus_lock = gpio_rcar_irq_bus_lock;
+	irq_chip->irq_bus_sync_unlock = gpio_rcar_irq_bus_sync_unlock;
+	irq_chip->irq_request_resources = gpio_rcar_irq_request_resources;
+	irq_chip->irq_release_resources = gpio_rcar_irq_release_resources;
 	irq_chip->flags	= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
 
 	ret = gpiochip_add(gpio_chip);
-- 
2.7.4
