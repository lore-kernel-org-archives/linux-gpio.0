From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] gpio: mpc8xxx: Do not use gpiochip_get_data() in mpc8xxx_gpio_save_regs()
Date: Thu,  7 Jan 2016 08:25:24 -0800
Message-ID: <1452183924-19390-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Alexander Stein <alexander.stein@systec-electronic.com>
List-Id: linux-gpio@vger.kernel.org

Commit 709d71a17c33 ("gpio: mpc8xxx: use gpiochip data pointer") replac=
es
the use of container_of() with gpiochip_get_data(). However, the data
pointer is not yet set by the time the save_regs function is called.

=46ixes: 709d71a17c33 ("gpio: mpc8xxx: use gpiochip data pointer")
Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
It might make sense to merge this patch into the patch causing the prob=
lem.

 drivers/gpio/gpio-mpc8xxx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 21eff0e1df87..9d40787e66c0 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -51,7 +51,8 @@ static inline u32 mpc8xxx_gpio2mask(unsigned int gpio=
)
=20
 static void mpc8xxx_gpio_save_regs(struct of_mm_gpio_chip *mm)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(&mm->gc);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D
+		container_of(mm, struct mpc8xxx_gpio_chip, mm_gc);
=20
 	mpc8xxx_gc->data =3D in_be32(mm->regs + GPIO_DAT);
 }
--=20
2.1.4
