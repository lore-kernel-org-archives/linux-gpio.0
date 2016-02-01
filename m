From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [REGRESSION] gpio: pxa: change initcall level second attempt
Date: Mon, 01 Feb 2016 08:27:21 +0100
Message-ID: <1454311641.2952.2.camel@ziswiler.com>
References: <1453598314.3178.12.camel@ziswiler.com>
	 <87oac9ag32.fsf@belgarion.home> <87y4bc845m.fsf@belgarion.home>
	 <1453853124.25762.5.camel@ziswiler.com> <8737te7iz6.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.perfora.net ([74.208.4.197]:58814 "EHLO mout.perfora.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750722AbcBAH1a convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2016 02:27:30 -0500
In-Reply-To: <8737te7iz6.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Robert

On Sun, 2016-01-31 at 00:20 +0100, Robert Jarzmik wrote:
> Marcel, would you try the patch here after ?
> I have tested it on my cm-x300 with a devicetree build, let's see if
> that is a
> solution to your issue.

Yes, that indeed cuts it nicely. Thanks!

> Cheers.
>=20
> --=C2=A0
> Robert
>=20
> ---8<---
> From 5901e6d55061c0cd627cfbf090ef6362c712b3c8 Mon Sep 17 00:00:00
> 2001
> From: Robert Jarzmik <robert.jarzmik@free.fr>
> Date: Sun, 31 Jan 2016 00:06:21 +0100
> Subject: [PATCH] net: ethernet: davicom: fix devicetree irq resource
>=20
> The dm9000 driver doesn't work in at least one device-tree
> configuration, spitting an error message on irq resource :
> [=C2=A0=C2=A0=C2=A0=C2=A01.062495] dm9000 8000000.ethernet: insuffici=
ent resources
> [=C2=A0=C2=A0=C2=A0=C2=A01.068439] dm9000 8000000.ethernet: not found=
 (-2).
> [=C2=A0=C2=A0=C2=A0=C2=A01.073451] dm9000: probe of 8000000.ethernet =
failed with error -2
>=20
> The reason behind is that the interrupt might be provided by a gpio
> controller, not probed when dm9000 is probed, and needing the probe
> deferral mechanism to apply.
>=20
> Currently, the interrupt is directly taken from resources. This patch
> changes this to use the more generic platform_get_irq(), which
> handles
> the deferral.
>=20
> Moreover, since commit Fixes: 7085a7401ba5 ("drivers: platform: parse
> IRQ flags from resources"), the interrupt trigger flags are honored
> in
> platform_get_irq(), so remove the needless code in dm9000.
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> =C2=A0drivers/net/ethernet/davicom/dm9000.c | 28 ++++++++++++++------=
-----
> ---
> =C2=A01 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/davicom/dm9000.c
> b/drivers/net/ethernet/davicom/dm9000.c
> index cf94b72..22e1a9d 100644
> --- a/drivers/net/ethernet/davicom/dm9000.c
> +++ b/drivers/net/ethernet/davicom/dm9000.c
> @@ -128,7 +128,6 @@ struct board_info {
> =C2=A0	struct resource *data_res;
> =C2=A0	struct resource	*addr_req;=C2=A0=C2=A0=C2=A0/* resources reque=
sted
> */
> =C2=A0	struct resource *data_req;
> -	struct resource *irq_res;
> =C2=A0
> =C2=A0	int		=C2=A0irq_wake;
> =C2=A0
> @@ -1300,18 +1299,14 @@ static int
> =C2=A0dm9000_open(struct net_device *dev)
> =C2=A0{
> =C2=A0	struct board_info *db =3D netdev_priv(dev);
> -	unsigned long irqflags =3D db->irq_res->flags &
> IRQF_TRIGGER_MASK;
> +	unsigned long irqflags =3D 0;
> =C2=A0
> =C2=A0	if (netif_msg_ifup(db))
> =C2=A0		dev_dbg(db->dev, "enabling %s\n", dev->name);
> =C2=A0
> -	/* If there is no IRQ type specified, default to something
> that
> -	=C2=A0* may work, and tell the user that this is a problem */
> -
> -	if (irqflags =3D=3D IRQF_TRIGGER_NONE)
> -		irqflags =3D irq_get_trigger_type(dev->irq);
> -
> -	if (irqflags =3D=3D IRQF_TRIGGER_NONE)
> +	/* If there is no IRQ type specified, tell the user that
> this is a
> +	=C2=A0* problem */
> +	if (irq_get_trigger_type(dev->irq) =3D=3D IRQF_TRIGGER_NONE)
> =C2=A0		dev_warn(db->dev, "WARNING: no IRQ resource flags
> set.\n");
> =C2=A0
> =C2=A0	irqflags |=3D IRQF_SHARED;
> @@ -1500,15 +1495,21 @@ dm9000_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	db->addr_res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> 0);
> =C2=A0	db->data_res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> 1);
> -	db->irq_res=C2=A0=C2=A0=3D platform_get_resource(pdev, IORESOURCE_I=
RQ,
> 0);
> =C2=A0
> -	if (db->addr_res =3D=3D NULL || db->data_res =3D=3D NULL ||
> -	=C2=A0=C2=A0=C2=A0=C2=A0db->irq_res =3D=3D NULL) {
> -		dev_err(db->dev, "insufficient resources\n");
> +	if (db->addr_res =3D=3D NULL || db->data_res =3D=3D NULL) {
> +		dev_err(db->dev, "insufficient resources addr=3D%p
> data=3D%p\n",
> +			db->addr_res, db->data_res);
> =C2=A0		ret =3D -ENOENT;
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> +	ndev->irq =3D platform_get_irq(pdev, 0);
> +	if (ndev->irq <=3D 0) {
> +		dev_err(db->dev, "interrupt ressource unavailable:
> %d\n",
> +			ndev->irq);
> +		return ndev->irq;
> +	}
> +
> =C2=A0	db->irq_wake =3D platform_get_irq(pdev, 1);
> =C2=A0	if (db->irq_wake >=3D 0) {
> =C2=A0		dev_dbg(db->dev, "wakeup irq %d\n", db->irq_wake);
> @@ -1570,7 +1571,6 @@ dm9000_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	/* fill in parameters for net-dev structure */
> =C2=A0	ndev->base_addr =3D (unsigned long)db->io_addr;
> -	ndev->irq	=3D db->irq_res->start;
> =C2=A0
> =C2=A0	/* ensure at least we have a default set of IO routines */
> =C2=A0	dm9000_set_io(db, iosize);


Acked-by:=C2=A0Marcel Ziswiler <marcel@ziswiler.com>

Cheers

Marcel

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
