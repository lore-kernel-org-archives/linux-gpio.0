From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] gpio: pxa: avoid attempting to set pin direction via pinctrl on MMP2
Date: Thu, 14 Feb 2019 00:06:18 +0100
Message-ID: <20190213230618.1907-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-gpio@vger.kernel.org

Similarly to PXA3xx, pinctrl-single can't set pin direction on MMP2 eithe=
r.
See also: commit 9dabfdd84bdfa ("gpio: pxa: disable pinctrl calls for
PXA3xx")

Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and reque=
st")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index e9600b556f39..bcc6be4a5cb2 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -245,6 +245,7 @@ static bool pxa_gpio_has_pinctrl(void)
 {
 	switch (gpio_type) {
 	case PXA3XX_GPIO:
+	case MMP2_GPIO:
 		return false;
=20
 	default:
--=20
2.20.1
