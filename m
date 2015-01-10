From: Janusz Uzycki <j.uzycki@elproma.com.pl>
Subject: [RFC PATCH v2 4/4] serial: clps711x: Update to new mctrl_gpio_init_dt
Date: Sat, 10 Jan 2015 15:32:46 +0100
Message-ID: <1420900366-9169-4-git-send-email-j.uzycki@elproma.com.pl>
References: <1420900366-9169-1-git-send-email-j.uzycki@elproma.com.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from v032797.home.net.pl ([89.161.177.31]:49721 "HELO
	v032797.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753898AbbAJOaw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Jan 2015 09:30:52 -0500
In-Reply-To: <1420900366-9169-1-git-send-email-j.uzycki@elproma.com.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Cc: fabio.estevam@freescale.com, Richard Genoud <richard.genoud@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org, Janusz Uzycki <j.uzycki@elproma.com.pl>

The patch updates clps711x serial driver to new mctrl_gpio_init_dt
which came with new helpers for gpio irqs.

Signed-off-by: Janusz Uzycki <j.uzycki@elproma.com.pl>
---

The patch exists since v2.
Compile-test only - please test it on real hardware.

---
 drivers/tty/serial/clps711x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/clps711x.c b/drivers/tty/serial/clps711x.c
index 6e11c27..4fa0210 100644
--- a/drivers/tty/serial/clps711x.c
+++ b/drivers/tty/serial/clps711x.c
@@ -500,7 +500,7 @@ static int uart_clps711x_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, s);
 
-	s->gpios = mctrl_gpio_init(&pdev->dev, 0);
+	s->gpios = mctrl_gpio_init_dt(&s->port, 0);
 
 	ret = uart_add_one_port(&clps711x_uart, &s->port);
 	if (ret)
-- 
1.7.11.3

