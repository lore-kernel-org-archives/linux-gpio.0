From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 6/7 v2] gpio: dwapb: use a second irq chip
Date: Wed, 30 Apr 2014 13:13:08 +0200
Message-ID: <20140430111308.GA11829@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
 <1395505004-22650-7-git-send-email-bigeasy@linutronix.de>
 <5331F6D5.7070809@gmail.com>
 <53427718.30406@linutronix.de>
 <CANk1AXSuBGj3vZ7knKmHTwDZLTkvVFT42Lt9ZTdk-E+sp=xQ+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:49833 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754864AbaD3LNK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Apr 2014 07:13:10 -0400
Content-Disposition: inline
In-Reply-To: <CANk1AXSuBGj3vZ7knKmHTwDZLTkvVFT42Lt9ZTdk-E+sp=xQ+g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: delicious quinoa <delicious.quinoa@gmail.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Alan Tull <atull@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

Right new have one irq chip running always in level mode. It would nice=
r
to have two irq chips where one is handling level type interrupts and
the other one is doing edge interrupts. So we can have at runtime two u=
sers
where one is using edge and the other level.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
I am very sorry for the delay. I assumed that I've already fixed the
patch sent it out. Just realized that it was not the case.

v1=E2=80=A6v2:
    - using the lopp again but breaking the assignment of type and
      handler out of the loop as suggested by delicious quinoa.

 drivers/gpio/gpio-dwapb.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 752ccb1..ca36f11 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -192,6 +192,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u=
32 type)
 		break;
 	}
=20
+	irq_setup_alt_chip(d, type);
+
 	writel(level, gpio->regs + GPIO_INTTYPE_LEVEL);
 	writel(polarity, gpio->regs + GPIO_INT_POLARITY);
 	irq_gc_unlock(igc);
@@ -207,7 +209,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio =
*gpio,
 	struct irq_chip_generic	*irq_gc;
 	unsigned int hwirq, ngpio =3D gc->ngpio;
 	struct irq_chip_type *ct;
-	int err, irq;
+	int err, irq, i;
=20
 	irq =3D irq_of_parse_and_map(node, 0);
 	if (!irq) {
@@ -221,7 +223,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio =
*gpio,
 	if (!gpio->domain)
 		return;
=20
-	err =3D irq_alloc_domain_generic_chips(gpio->domain, ngpio, 1,
+	err =3D irq_alloc_domain_generic_chips(gpio->domain, ngpio, 2,
 					     "gpio-dwapb", handle_level_irq,
 					     IRQ_NOREQUEST, 0,
 					     IRQ_GC_INIT_NESTED_LOCK);
@@ -242,17 +244,24 @@ static void dwapb_configure_irqs(struct dwapb_gpi=
o *gpio,
 	irq_gc->reg_base =3D gpio->regs;
 	irq_gc->private =3D gpio;
=20
-	ct =3D irq_gc->chip_types;
-	ct->chip.irq_ack =3D irq_gc_ack_set_bit;
-	ct->chip.irq_mask =3D irq_gc_mask_set_bit;
-	ct->chip.irq_unmask =3D irq_gc_mask_clr_bit;
-	ct->chip.irq_set_type =3D dwapb_irq_set_type;
-	ct->chip.irq_enable =3D dwapb_irq_enable;
-	ct->chip.irq_disable =3D dwapb_irq_disable;
-	ct->chip.irq_request_resources =3D dwapb_irq_reqres;
-	ct->chip.irq_release_resources =3D dwapb_irq_relres;
-	ct->regs.ack =3D GPIO_PORTA_EOI;
-	ct->regs.mask =3D GPIO_INTMASK;
+	for (i =3D 0; i < 2; i++) {
+		ct =3D &irq_gc->chip_types[i];
+		ct->chip.irq_ack =3D irq_gc_ack_set_bit;
+		ct->chip.irq_mask =3D irq_gc_mask_set_bit;
+		ct->chip.irq_unmask =3D irq_gc_mask_clr_bit;
+		ct->chip.irq_set_type =3D dwapb_irq_set_type;
+		ct->chip.irq_enable =3D dwapb_irq_enable;
+		ct->chip.irq_disable =3D dwapb_irq_disable;
+		ct->chip.irq_request_resources =3D dwapb_irq_reqres;
+		ct->chip.irq_release_resources =3D dwapb_irq_relres;
+		ct->regs.ack =3D GPIO_PORTA_EOI;
+		ct->regs.mask =3D GPIO_INTMASK;
+		ct->type =3D IRQ_TYPE_LEVEL_MASK;
+	}
+
+	irq_gc->chip_types[0].type =3D IRQ_TYPE_LEVEL_MASK;
+	irq_gc->chip_types[1].type =3D IRQ_TYPE_EDGE_BOTH;
+	irq_gc->chip_types[1].handler =3D handle_edge_irq;
=20
 	irq_set_chained_handler(irq, dwapb_irq_handler);
 	irq_set_handler_data(irq, gpio);
--=20
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
