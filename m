From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [REGRESSION] gpio: pxa: change initcall level second attempt
Date: Sun, 31 Jan 2016 00:20:13 +0100
Message-ID: <8737te7iz6.fsf@belgarion.home>
References: <1453598314.3178.12.camel@ziswiler.com>
	<87oac9ag32.fsf@belgarion.home> <87y4bc845m.fsf@belgarion.home>
	<1453853124.25762.5.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453853124.25762.5.camel@ziswiler.com> (Marcel Ziswiler's
	message of "Wed, 27 Jan 2016 01:05:24 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Marcel, would you try the patch here after ?
I have tested it on my cm-x300 with a devicetree build, let's see if th=
at is a
solution to your issue.

Cheers.

--=20
Robert

---8<---
=46rom 5901e6d55061c0cd627cfbf090ef6362c712b3c8 Mon Sep 17 00:00:00 200=
1
=46rom: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Sun, 31 Jan 2016 00:06:21 +0100
Subject: [PATCH] net: ethernet: davicom: fix devicetree irq resource

The dm9000 driver doesn't work in at least one device-tree
configuration, spitting an error message on irq resource :
[=C2=A0=C2=A0=C2=A0=C2=A01.062495] dm9000 8000000.ethernet: insufficien=
t resources
[=C2=A0=C2=A0=C2=A0=C2=A01.068439] dm9000 8000000.ethernet: not found (=
-2).
[=C2=A0=C2=A0=C2=A0=C2=A01.073451] dm9000: probe of 8000000.ethernet fa=
iled with error -2

The reason behind is that the interrupt might be provided by a gpio
controller, not probed when dm9000 is probed, and needing the probe
deferral mechanism to apply.

Currently, the interrupt is directly taken from resources. This patch
changes this to use the more generic platform_get_irq(), which handles
the deferral.

Moreover, since commit Fixes: 7085a7401ba5 ("drivers: platform: parse
IRQ flags from resources"), the interrupt trigger flags are honored in
platform_get_irq(), so remove the needless code in dm9000.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/net/ethernet/davicom/dm9000.c | 28 ++++++++++++++-------------=
-
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethern=
et/davicom/dm9000.c
index cf94b72..22e1a9d 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -128,7 +128,6 @@ struct board_info {
 	struct resource *data_res;
 	struct resource	*addr_req;   /* resources requested */
 	struct resource *data_req;
-	struct resource *irq_res;
=20
 	int		 irq_wake;
=20
@@ -1300,18 +1299,14 @@ static int
 dm9000_open(struct net_device *dev)
 {
 	struct board_info *db =3D netdev_priv(dev);
-	unsigned long irqflags =3D db->irq_res->flags & IRQF_TRIGGER_MASK;
+	unsigned long irqflags =3D 0;
=20
 	if (netif_msg_ifup(db))
 		dev_dbg(db->dev, "enabling %s\n", dev->name);
=20
-	/* If there is no IRQ type specified, default to something that
-	 * may work, and tell the user that this is a problem */
-
-	if (irqflags =3D=3D IRQF_TRIGGER_NONE)
-		irqflags =3D irq_get_trigger_type(dev->irq);
-
-	if (irqflags =3D=3D IRQF_TRIGGER_NONE)
+	/* If there is no IRQ type specified, tell the user that this is a
+	 * problem */
+	if (irq_get_trigger_type(dev->irq) =3D=3D IRQF_TRIGGER_NONE)
 		dev_warn(db->dev, "WARNING: no IRQ resource flags set.\n");
=20
 	irqflags |=3D IRQF_SHARED;
@@ -1500,15 +1495,21 @@ dm9000_probe(struct platform_device *pdev)
=20
 	db->addr_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	db->data_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	db->irq_res  =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
=20
-	if (db->addr_res =3D=3D NULL || db->data_res =3D=3D NULL ||
-	    db->irq_res =3D=3D NULL) {
-		dev_err(db->dev, "insufficient resources\n");
+	if (db->addr_res =3D=3D NULL || db->data_res =3D=3D NULL) {
+		dev_err(db->dev, "insufficient resources addr=3D%p data=3D%p\n",
+			db->addr_res, db->data_res);
 		ret =3D -ENOENT;
 		goto out;
 	}
=20
+	ndev->irq =3D platform_get_irq(pdev, 0);
+	if (ndev->irq <=3D 0) {
+		dev_err(db->dev, "interrupt ressource unavailable: %d\n",
+			ndev->irq);
+		return ndev->irq;
+	}
+
 	db->irq_wake =3D platform_get_irq(pdev, 1);
 	if (db->irq_wake >=3D 0) {
 		dev_dbg(db->dev, "wakeup irq %d\n", db->irq_wake);
@@ -1570,7 +1571,6 @@ dm9000_probe(struct platform_device *pdev)
=20
 	/* fill in parameters for net-dev structure */
 	ndev->base_addr =3D (unsigned long)db->io_addr;
-	ndev->irq	=3D db->irq_res->start;
=20
 	/* ensure at least we have a default set of IO routines */
 	dm9000_set_io(db, iosize);
--=20
2.1.4
