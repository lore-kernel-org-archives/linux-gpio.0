From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH gpio-for-next 09/10] usb: pass flags parameter to gpiod_get functions
Date: Mon,  6 Jul 2015 11:09:49 +0200
Message-ID: <1436173790-29963-9-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150706090759.GS11824@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150706090759.GS11824-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functions)
which appeared in v3.17-rc1, the gpiod_get* functions take an additiona=
l
parameter that allows to specify direction and initial value for output=
=2E

Currently this parameter is made optional with the help of a cpp trick.
To allow dropping this hack convert callers to explictly pass a value
for flags.

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Acked-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 2 +-
 drivers/usb/phy/phy-generic.c       | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/u=
dc/pxa27x_udc.c
index b51226abade6..042f06b52677 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2422,7 +2422,7 @@ static int pxa_udc_probe(struct platform_device *=
pdev)
 		}
 		udc->udc_command =3D mach->udc_command;
 	} else {
-		udc->gpiod =3D devm_gpiod_get(&pdev->dev, NULL);
+		udc->gpiod =3D devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
 	}
=20
 	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generi=
c.c
index deee68eafb72..ec6ecd03269c 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -218,11 +218,13 @@ int usb_phy_gen_create_phy(struct device *dev, st=
ruct usb_phy_generic *nop,
 			clk_rate =3D 0;
=20
 		needs_vcc =3D of_property_read_bool(node, "vcc-supply");
-		nop->gpiod_reset =3D devm_gpiod_get_optional(dev, "reset");
+		nop->gpiod_reset =3D devm_gpiod_get_optional(dev, "reset",
+							   GPIOD_ASIS);
 		err =3D PTR_ERR_OR_ZERO(nop->gpiod_reset);
 		if (!err) {
 			nop->gpiod_vbus =3D devm_gpiod_get_optional(dev,
-							 "vbus-detect");
+							 "vbus-detect",
+							 GPIOD_ASIS);
 			err =3D PTR_ERR_OR_ZERO(nop->gpiod_vbus);
 		}
 	} else if (pdata) {
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
