From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 2/2] gpio: Constify irq_domain_ops
Date: Mon, 27 Apr 2015 21:54:07 +0900
Message-ID: <1430139247-4198-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1430139247-4198-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430139247-4198-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The irq_domain_ops are not modified by the driver and the irqdomain core
code accepts pointer to a const data.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/gpio/gpio-bcm-kona.c  | 2 +-
 drivers/gpio/gpio-em.c        | 2 +-
 drivers/gpio/gpio-grgpio.c    | 2 +-
 drivers/gpio/gpio-mpc8xxx.c   | 2 +-
 drivers/gpio/gpio-sa1100.c    | 2 +-
 drivers/gpio/gpio-sodaville.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b164ce837b43..cb89f37ffc02 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -534,7 +534,7 @@ static void bcm_kona_gpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_data(irq, NULL);
 }
 
-static struct irq_domain_ops bcm_kona_irq_ops = {
+static const struct irq_domain_ops bcm_kona_irq_ops = {
 	.map = bcm_kona_gpio_irq_map,
 	.unmap = bcm_kona_gpio_irq_unmap,
 	.xlate = irq_domain_xlate_twocell,
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 3cfcfc620c8e..fbf287307c4c 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -266,7 +266,7 @@ static int em_gio_irq_domain_map(struct irq_domain *h, unsigned int irq,
 	return 0;
 }
 
-static struct irq_domain_ops em_gio_irq_domain_ops = {
+static const struct irq_domain_ops em_gio_irq_domain_ops = {
 	.map	= em_gio_irq_domain_map,
 	.xlate	= irq_domain_xlate_twocell,
 };
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 35a02770c8b0..0a8f7617e72e 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -332,7 +332,7 @@ static void grgpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 	spin_unlock_irqrestore(&priv->bgc.lock, flags);
 }
 
-static struct irq_domain_ops grgpio_irq_domain_ops = {
+static const struct irq_domain_ops grgpio_irq_domain_ops = {
 	.map	= grgpio_irq_map,
 	.unmap	= grgpio_irq_unmap,
 };
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a65b75161aa4..20aa66f34f6e 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -329,7 +329,7 @@ static int mpc8xxx_gpio_irq_map(struct irq_domain *h, unsigned int irq,
 	return 0;
 }
 
-static struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
+static const struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
 	.map	= mpc8xxx_gpio_irq_map,
 	.xlate	= irq_domain_xlate_twocell,
 };
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index bec397a60204..3fa22dade243 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -160,7 +160,7 @@ static int sa1100_gpio_irqdomain_map(struct irq_domain *d,
 	return 0;
 }
 
-static struct irq_domain_ops sa1100_gpio_irqdomain_ops = {
+static const struct irq_domain_ops sa1100_gpio_irqdomain_ops = {
 	.map = sa1100_gpio_irqdomain_map,
 	.xlate = irq_domain_xlate_onetwocell,
 };
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index d8da36cd8123..65bc9f47a68e 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -125,7 +125,7 @@ static int sdv_xlate(struct irq_domain *h, struct device_node *node,
 	return 0;
 }
 
-static struct irq_domain_ops irq_domain_sdv_ops = {
+static const struct irq_domain_ops irq_domain_sdv_ops = {
 	.xlate = sdv_xlate,
 };
 
-- 
2.1.0
