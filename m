From: Mark Walton <mark.walton@serialtek.com>
Subject: [PATCH v2] gpio: pca953x: Fix dereference of irq data in shutdown
Date: Thu, 28 Feb 2019 14:27:33 +0000
Message-ID: <20190228142539.GA7744@mark-devvm>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <3F40215C3148F64CA2CCC29C55F9F8CD@namprd19.prod.outlook.com>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: Mark Walton <mark.walton@serialtek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

If a PCA953x gpio was used as an interrupt and then released,
the shutdown function was trying to extract the pca953x_chip
pointer directly from the irq_data, but in reality was getting
the gpio_chip structure.

The net effect was that the subsequent writes to the data
structure corrupted data in the gpio_chip structure, which wasn't
immediately obvious until attempting to use the GPIO again in the
future, at which point the kernel panics.

This fix correctly extracts the pca953x_chip structure via the
gpio_chip structure, as is correctly done in the other irq
functions.

Fixes: 0a70fe00efea ("gpio: pca953x: Clear irq trigger type on irq shutdown=
")
Signed-off-by: Mark Walton <mark.walton@serialtek.com>
---
 drivers/gpio/gpio-pca953x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index caf7dd1..6bd55a4 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -659,7 +659,8 @@ static int pca953x_irq_set_type(struct irq_data *d, uns=
igned int type)
=20
 static void pca953x_irq_shutdown(struct irq_data *d)
 {
-	struct pca953x_chip *chip =3D irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip =3D gpiochip_get_data(gc);
 	u8 mask =3D 1 << (d->hwirq % BANK_SZ);
=20
 	chip->irq_trig_raise[d->hwirq / BANK_SZ] &=3D ~mask;
--=20
2.7.4
