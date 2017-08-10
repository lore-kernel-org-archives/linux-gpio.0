From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 02/17] pinctrl: artpec6: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:14 +0200
Message-ID: <1502359589-15970-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This pinctrl_ops structure is only stored in the const pctlops
field of a pinctrl_desc structure. Make the pinctrl_ops structure
const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/pinctrl-artpec6.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index 357516d..e33781c 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -445,7 +445,7 @@ static unsigned int artpec6_pconf_drive_field_to_mA(int field)
 	}
 }
 
-static struct pinctrl_ops artpec6_pctrl_ops = {
+static const struct pinctrl_ops artpec6_pctrl_ops = {
 	.get_group_pins		= artpec6_get_group_pins,
 	.get_groups_count	= artpec6_get_groups_count,
 	.get_group_name		= artpec6_get_group_name,
