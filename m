From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mpc8xxx: drop references to "virtual" IRQ
Date: Fri, 11 Oct 2013 19:39:15 +0200
Message-ID: <1381513155-7588-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:59273 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752567Ab3JKRjZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:39:25 -0400
Received: by mail-wi0-f179.google.com with SMTP id hm2so1446113wib.12
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:39:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Anatolij Gustschin <agust@denx.de>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

Rename the argument "virq" to just "irq", this IRQ isn't any
more "virtual" than any other Linux IRQ number, we use "hwirq"
for the actual hw-numbers, "virq" is just bogus.

Cc: Anatolij Gustschin <agust@denx.de>
Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a0b33a2..b350649 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -282,16 +282,16 @@ static struct irq_chip mpc8xxx_irq_chip =3D {
 	.irq_set_type	=3D mpc8xxx_irq_set_type,
 };
=20
-static int mpc8xxx_gpio_irq_map(struct irq_domain *h, unsigned int vir=
q,
-				irq_hw_number_t hw)
+static int mpc8xxx_gpio_irq_map(struct irq_domain *h, unsigned int irq=
,
+				irq_hw_number_t hwirq)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D h->host_data;
=20
 	if (mpc8xxx_gc->of_dev_id_data)
 		mpc8xxx_irq_chip.irq_set_type =3D mpc8xxx_gc->of_dev_id_data;
=20
-	irq_set_chip_data(virq, h->host_data);
-	irq_set_chip_and_handler(virq, &mpc8xxx_irq_chip, handle_level_irq);
+	irq_set_chip_data(irq, h->host_data);
+	irq_set_chip_and_handler(irq, &mpc8xxx_irq_chip, handle_level_irq);
=20
 	return 0;
 }
--=20
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
