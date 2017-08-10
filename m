From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 03/17] pinctrl: armada-37xx: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:15 +0200
Message-ID: <1502359589-15970-4-git-send-email-Julia.Lawall@lip6.fr>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This pinconf_ops structure is only stored in the const pinconf_ops
field of a pinctrl_desc structure. Make the pinconf_ops structure
const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index f024e25..997ff05 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -243,7 +243,7 @@ static int armada_37xx_pin_config_group_set(struct pinctrl_dev *pctldev,
 	return -ENOTSUPP;
 }
 
-static struct pinconf_ops armada_37xx_pinconf_ops = {
+static const struct pinconf_ops armada_37xx_pinconf_ops = {
 	.is_generic = true,
 	.pin_config_group_get = armada_37xx_pin_config_group_get,
 	.pin_config_group_set = armada_37xx_pin_config_group_set,
