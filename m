From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 03/11] pinctrl: nomadik: use of_property_read_bool
Date: Fri,  5 Aug 2016 10:56:43 +0200
Message-ID: <1470387411-15879-4-git-send-email-Julia.Lawall@lip6.fr>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Alessandro Rubini <rubini@unipv.it>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
statement S2,S1;
@@
-       if (of_get_property(e1,e2,NULL))
+       if (of_property_read_bool(e1,e2))
        S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 35f6218..d8dc3fe 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1110,7 +1110,7 @@ static int nmk_gpio_probe(struct platform_device *dev)
 		return PTR_ERR(nmk_chip);
 	}
 
-	if (of_get_property(np, "st,supports-sleepmode", NULL))
+	if (of_property_read_bool(np, "st,supports-sleepmode"))
 		supports_sleepmode = true;
 	else
 		supports_sleepmode = false;
