From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 05/12] pinctrl: armada-37xx: account for const type of of_device_id.data
Date: Tue,  2 Jan 2018 14:28:01 +0100
Message-ID: <1514899688-27844-6-git-send-email-Julia.Lawall@lip6.fr>
References: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: kernel-janitors@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The data field of an of_device_id structure has type const void *, so
there is no need for a const-discarding cast when putting const values
into such a structure.

Done using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -1006,11 +1006,11 @@ static int armada_37xx_pinctrl_register(
 static const struct of_device_id armada_37xx_pinctrl_of_match[] = {
 	{
 		.compatible = "marvell,armada3710-sb-pinctrl",
-		.data = (void *)&armada_37xx_pin_sb,
+		.data = &armada_37xx_pin_sb,
 	},
 	{
 		.compatible = "marvell,armada3710-nb-pinctrl",
-		.data = (void *)&armada_37xx_pin_nb,
+		.data = &armada_37xx_pin_nb,
 	},
 	{ },
 };
