From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 7/7 v2] gpio: dwapb: use d->mask instead od BIT(bit)
Date: Tue, 25 Mar 2014 22:18:41 +0100
Message-ID: <20140325211841.GA31253@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
 <1395505004-22650-8-git-send-email-bigeasy@linutronix.de>
 <CAAVeFu+WQCpo=LEZqdAhpMcO1PLqUzfcVKTafnwe=BiLGLjFZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:55467 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281AbaCYVSm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 17:18:42 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFu+WQCpo=LEZqdAhpMcO1PLqUzfcVKTafnwe=BiLGLjFZQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: atull@altera.com, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@altera.com, delicious.quinoa@gmail.com

d->mask contains exact the same information as BIT(bit) so we could sav=
e
a few cycles here.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v1=E2=80=A6v2: proper bit delete in dwapb_irq_disable()

 drivers/gpio/gpio-dwapb.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index f4276fa..aedbb53 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -113,7 +113,7 @@ static void dwapb_irq_enable(struct irq_data *d)
=20
 	irq_gc_lock(igc);
 	val =3D readl(gpio->regs + GPIO_INTEN);
-	val |=3D BIT(d->hwirq);
+	val |=3D d->mask;
 	writel(val, gpio->regs + GPIO_INTEN);
 	irq_gc_unlock(igc);
 }
@@ -126,7 +126,7 @@ static void dwapb_irq_disable(struct irq_data *d)
=20
 	irq_gc_lock(igc);
 	val =3D readl(gpio->regs + GPIO_INTEN);
-	val &=3D ~BIT(d->hwirq);
+	val &=3D ~d->mask;
 	writel(val, gpio->regs + GPIO_INTEN);
 	irq_gc_unlock(igc);
 }
@@ -158,7 +158,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u=
32 type)
 {
 	struct irq_chip_generic *igc =3D irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio =3D igc->private;
-	int bit =3D d->hwirq;
 	unsigned long level, polarity;
=20
 	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
@@ -171,24 +170,24 @@ static int dwapb_irq_set_type(struct irq_data *d,=
 u32 type)
=20
 	switch (type) {
 	case IRQ_TYPE_EDGE_BOTH:
-		level |=3D BIT(bit);
-		dwapb_toggle_trigger(gpio, bit);
+		level |=3D d->mask;
+		dwapb_toggle_trigger(gpio, d->hwirq);
 		break;
 	case IRQ_TYPE_EDGE_RISING:
-		level |=3D BIT(bit);
-		polarity |=3D BIT(bit);
+		level |=3D d->mask;
+		polarity |=3D d->mask;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		level |=3D BIT(bit);
-		polarity &=3D ~BIT(bit);
+		level |=3D d->mask;
+		polarity &=3D ~d->mask;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		level &=3D ~BIT(bit);
-		polarity |=3D BIT(bit);
+		level &=3D ~d->mask;
+		polarity |=3D d->mask;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		level &=3D ~BIT(bit);
-		polarity &=3D ~BIT(bit);
+		level &=3D ~d->mask;
+		polarity &=3D ~d->mask;
 		break;
 	}
=20
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
