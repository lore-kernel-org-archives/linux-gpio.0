From: Grigoryev Denis <grigoryev@fastwel.ru>
Subject: [PATCH] gpio: pca953x: Clear irq trigger type on irq shutdown
Date: Fri, 4 May 2018 16:53:18 +0000
Message-ID: <no_message-id@ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Grigoryev Denis <grigoryev@fastwel.ru>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

The driver stores the result of irq_set_type() in the internal variables
irq_trig_raise and irq_trig_fall, which later are used to determine
the GPIOs that must be re-configured as input. These variables retain their
value between gpiolib's  export / unexport, resulting in an incorrect
state in some cases. The corresponding bits in the variables
irq_trig_raise and irq_trig_fall should be cleared in irq_shutdown().

Signed-off-by: Denis Grigoryev <grigoryev@fastwel.ru>
---
 drivers/gpio/gpio-pca953x.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d2ead4b..b41be8c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -522,6 +522,15 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+static void pca953x_irq_shutdown(struct irq_data *d)
+{
+	struct pca953x_chip *chip = irq_data_get_irq_chip_data(d);
+	u8 mask = 1 << (d->hwirq % BANK_SZ);
+
+	chip->irq_trig_raise[d->hwirq / BANK_SZ] &= ~mask;
+	chip->irq_trig_fall[d->hwirq / BANK_SZ] &= ~mask;
+}
+
 static struct irq_chip pca953x_irq_chip = {
 	.name			= "pca953x",
 	.irq_mask		= pca953x_irq_mask,
@@ -529,6 +538,7 @@ static struct irq_chip pca953x_irq_chip = {
 	.irq_bus_lock		= pca953x_irq_bus_lock,
 	.irq_bus_sync_unlock	= pca953x_irq_bus_sync_unlock,
 	.irq_set_type		= pca953x_irq_set_type,
+	.irq_shutdown		= pca953x_irq_shutdown,
 };
 
 static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
-- 
2.7.4
