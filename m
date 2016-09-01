From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 3/3] pinctrl: bcm281xx: constify pinctrl_ops and pinmux_ops structures
Date: Thu,  1 Sep 2016 20:42:21 +0200
Message-ID: <1472755341-9995-4-git-send-email-Julia.Lawall@lip6.fr>
References: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Check for pinctrl_ops and pinmux_ops structures that are only stored in the
pctlops field and the pmxops field, respectively, of a pinctrl_desc
structure.  These fields are declared const, so pinctrl_ops and pinmux_ops
structures that have this property can be declared as const also.

The semantic patch that makes this change in the pinctrl_ops is as
follows.  The pinmux_ops case is similar.  (http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct pinctrl_ops i@p = { ... };

@ok@
identifier r.i;
struct pinctrl_desc e;
position p;
@@
e.pctlops = &i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct pinctrl_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct pinctrl_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 582f6df..a5331fd 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1018,7 +1018,7 @@ static void bcm281xx_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, " %s", dev_name(pctldev->dev));
 }
 
-static struct pinctrl_ops bcm281xx_pinctrl_ops = {
+static const struct pinctrl_ops bcm281xx_pinctrl_ops = {
 	.get_groups_count = bcm281xx_pinctrl_get_groups_count,
 	.get_group_name = bcm281xx_pinctrl_get_group_name,
 	.get_group_pins = bcm281xx_pinctrl_get_group_pins,
@@ -1080,7 +1080,7 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 	return rc;
 }
 
-static struct pinmux_ops bcm281xx_pinctrl_pinmux_ops = {
+static const struct pinmux_ops bcm281xx_pinctrl_pinmux_ops = {
 	.get_functions_count = bcm281xx_pinctrl_get_fcns_count,
 	.get_function_name = bcm281xx_pinctrl_get_fcn_name,
 	.get_function_groups = bcm281xx_pinctrl_get_fcn_groups,
