From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH gpio-for-next 04/10] iio: magn: bmc150: use flags argument of devm_gpiod_get
Date: Mon,  6 Jul 2015 11:09:44 +0200
Message-ID: <1436173790-29963-4-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150706090759.GS11824@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150706090759.GS11824-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functions)
which appeared in v3.17-rc1, the gpiod_get* functions take an additiona=
l
parameter that allows to specify direction and initial value for output=
=2E

Simplify driver accordingly. Furthermore this is one caller less that
stops us making the flags argument to gpiod_get*() mandatory.

Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/iio/magnetometer/bmc150_magn.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iio/magnetometer/bmc150_magn.c b/drivers/iio/magne=
tometer/bmc150_magn.c
index d4c178869991..187a31fdc35a 100644
--- a/drivers/iio/magnetometer/bmc150_magn.c
+++ b/drivers/iio/magnetometer/bmc150_magn.c
@@ -839,16 +839,12 @@ static int bmc150_magn_gpio_probe(struct i2c_clie=
nt *client)
 	dev =3D &client->dev;
=20
 	/* data ready GPIO interrupt pin */
-	gpio =3D devm_gpiod_get_index(dev, BMC150_MAGN_GPIO_INT, 0);
+	gpio =3D devm_gpiod_get_index(dev, BMC150_MAGN_GPIO_INT, 0, GPIOD_IN)=
;
 	if (IS_ERR(gpio)) {
 		dev_err(dev, "ACPI GPIO get index failed\n");
 		return PTR_ERR(gpio);
 	}
=20
-	ret =3D gpiod_direction_input(gpio);
-	if (ret)
-		return ret;
-
 	ret =3D gpiod_to_irq(gpio);
=20
 	dev_dbg(dev, "GPIO resource, no:%d irq:%d\n", desc_to_gpio(gpio), ret=
);
--=20
2.1.4
