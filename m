From: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [RFC PATCH] gpio: Add initializer for unread register
Date: Fri,  5 Jun 2015 02:11:58 +0900
Message-ID: <1433437918-13162-1-git-send-email-ysato@users.sourceforge.jp>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail2.asahi-net.or.jp ([202.224.39.198]:10573 "EHLO
	mail2.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752849AbbFDRa4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2015 13:30:56 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>

Hello.

There was no procedure by which a read only register is initialized
in bgpio_init, so it was added.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/gpio/gpio-74xx-mmio.c   | 2 +-
 drivers/gpio/gpio-clps711x.c    | 4 ++--
 drivers/gpio/gpio-dwapb.c       | 2 +-
 drivers/gpio/gpio-ep93xx.c      | 2 +-
 drivers/gpio/gpio-ge.c          | 3 ++-
 drivers/gpio/gpio-grgpio.c      | 2 +-
 drivers/gpio/gpio-moxart.c      | 2 +-
 drivers/gpio/gpio-mxc.c         | 2 +-
 drivers/gpio/gpio-mxs.c         | 2 +-
 drivers/gpio/gpio-sodaville.c   | 2 +-
 drivers/gpio/gpio-xgene-sb.c    | 2 +-
 drivers/mfd/vexpress-sysreg.c   | 2 +-
 include/linux/basic_mmio_gpio.h | 2 +-
 13 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 0763655..2b5250b 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -133,7 +133,7 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 
 	err = bgpio_init(&priv->bgc, &pdev->dev,
 			 DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8),
-			 dat, NULL, NULL, NULL, NULL, 0);
+			 dat, NULL, NULL, NULL, NULL, 0, 0, 0);
 	if (err)
 		return err;
 
diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index b6908f1..42f66fc 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -44,11 +44,11 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	case 3:
 		/* PORTD is inverted logic for direction register */
 		err = bgpio_init(bgc, &pdev->dev, 1, dat, NULL, NULL,
-				 NULL, dir, 0);
+				 NULL, dir, 0, 0, 0);
 		break;
 	default:
 		err = bgpio_init(bgc, &pdev->dev, 1, dat, NULL, NULL,
-				 dir, NULL, 0);
+				 dir, NULL, 0, 0, 0);
 		break;
 	}
 
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 58faf04..8f2d0af 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -413,7 +413,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		(pp->idx * GPIO_SWPORT_DDR_SIZE);
 
 	err = bgpio_init(&port->bgc, gpio->dev, 4, dat, set, NULL, dirout,
-			 NULL, false);
+			 NULL, 0, 0, 0);
 	if (err) {
 		dev_err(gpio->dev, "failed to init gpio chip for %s\n",
 			pp->name);
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 45684f3..0e2a971 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -325,7 +325,7 @@ static int ep93xx_gpio_add_bank(struct bgpio_chip *bgc, struct device *dev,
 	void __iomem *dir =  mmio_base + bank->dir;
 	int err;
 
-	err = bgpio_init(bgc, dev, 1, data, NULL, NULL, dir, NULL, 0);
+	err = bgpio_init(bgc, dev, 1, data, NULL, NULL, dir, NULL, 0, 0, 0);
 	if (err)
 		return err;
 
diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index f9ac3f3..2f74090 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -69,7 +69,8 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 
 	ret = bgpio_init(bgc, &pdev->dev, 4, regs + GEF_GPIO_IN,
 			 regs + GEF_GPIO_OUT, NULL, NULL,
-			 regs + GEF_GPIO_DIRECT, BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+			 regs + GEF_GPIO_DIRECT, BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+			 0, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "bgpio_init failed\n");
 		goto err0;
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 35a0277..df57ada 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -365,7 +365,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	bgc = &priv->bgc;
 	err = bgpio_init(bgc, &ofdev->dev, 4, regs + GRGPIO_DATA,
 			 regs + GRGPIO_OUTPUT, NULL, regs + GRGPIO_DIR, NULL,
-			 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+			 BGPIOF_BIG_ENDIAN_BYTE_ORDER, 0, 0);
 	if (err) {
 		dev_err(&ofdev->dev, "bgpio_init() failed\n");
 		return err;
diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index c3ab46e..9573721 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -69,7 +69,7 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 
 	ret = bgpio_init(bgc, dev, 4, base + GPIO_DATA_IN,
 		    base + GPIO_DATA_OUT, NULL,
-		    base + GPIO_PIN_DIRECTION, NULL, 0);
+			 base + GPIO_PIN_DIRECTION, NULL, 0, 0, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "bgpio_init failed\n");
 		return ret;
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9f7446a..f6a991f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -450,7 +450,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	err = bgpio_init(&port->bgc, &pdev->dev, 4,
 			 port->base + GPIO_PSR,
 			 port->base + GPIO_DR, NULL,
-			 port->base + GPIO_GDIR, NULL, 0);
+			 port->base + GPIO_GDIR, NULL, 0, 0, 0);
 	if (err)
 		goto out_bgio;
 
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 84cbda6..82b90b4 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -327,7 +327,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 			 port->base + PINCTRL_DIN(port),
 			 port->base + PINCTRL_DOUT(port) + MXS_SET,
 			 port->base + PINCTRL_DOUT(port) + MXS_CLR,
-			 port->base + PINCTRL_DOE(port), NULL, 0);
+			 port->base + PINCTRL_DOE(port), NULL, 0, 0);
 	if (err)
 		goto out_irqdesc_free;
 
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index d8da36c..1823843 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -228,7 +228,7 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 
 	ret = bgpio_init(&sd->bgpio, &pdev->dev, 4,
 			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-			NULL, sd->gpio_pub_base + GPOER, NULL, 0);
+			 NULL, sd->gpio_pub_base + GPOER, NULL, 0, 0, 0);
 	if (ret)
 		goto unmap;
 	sd->bgpio.gc.ngpio = SDV_NUM_PUB_GPIOS;
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index fb9d29a..40892f5 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -99,7 +99,7 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 	ret = bgpio_init(&priv->bgc, &pdev->dev, 4,
 			regs + MPA_GPIO_IN_ADDR,
 			regs + MPA_GPIO_OUT_ADDR, NULL,
-			regs + MPA_GPIO_OE_ADDR, NULL, 0);
+			 regs + MPA_GPIO_OE_ADDR, NULL, 0, 0, 0);
         if (ret)
                 return ret;
 
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index 3e628df..5e36071 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -200,7 +200,7 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	if (!mmc_gpio_chip)
 		return -ENOMEM;
 	bgpio_init(mmc_gpio_chip, &pdev->dev, 0x4, base + SYS_MCI,
-			NULL, NULL, NULL, NULL, 0);
+		   NULL, NULL, NULL, NULL, 0, 0, 0);
 	mmc_gpio_chip->gc.ngpio = 2;
 	gpiochip_add(&mmc_gpio_chip->gc);
 
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio_gpio.h
index 0e97856..019646e 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -68,7 +68,7 @@ int bgpio_remove(struct bgpio_chip *bgc);
 int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
 	       unsigned long sz, void __iomem *dat, void __iomem *set,
 	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
-	       unsigned long flags);
+	       unsigned long flags, unsigned long data, unsigned long direction);
 
 #define BGPIOF_BIG_ENDIAN		BIT(0)
 #define BGPIOF_UNREADABLE_REG_SET	BIT(1) /* reg_set is unreadable */
-- 
2.1.4

