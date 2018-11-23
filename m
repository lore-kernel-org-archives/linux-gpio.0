From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
Date: Fri, 23 Nov 2018 10:54:27 +0000
Message-ID: <20181123105428.13457-1-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: linux-gpio@vger.kernel.org

This fixes the check for unused mdio bus setting and the following static
checker warning:
 drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
 warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max >= 0)'

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v3:
 - Split fixing the return var when calling of_get_child_count() into
   a separate patch.
v2:
 - Don't rely on rely on the implicit typecast from -1 to uint
---
 drivers/pinctrl/pinctrl-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
index 57886dcff53d..a04235e3bec4 100644
--- a/drivers/pinctrl/pinctrl-rzn1.c
+++ b/drivers/pinctrl/pinctrl-rzn1.c
@@ -112,7 +112,7 @@ struct rzn1_pinctrl {
 	struct rzn1_pinctrl_regs __iomem *lev2;
 	u32 lev1_protect_phys;
 	u32 lev2_protect_phys;
-	u32 mdio_func[2];
+	int mdio_func[2];
 
 	struct rzn1_pin_group *groups;
 	unsigned int ngroups;
-- 
2.17.1
