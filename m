From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 2/3] pinctrl: nsp: constify pinctrl_ops and pinmux_ops
 structures
Date: Thu,  1 Sep 2016 20:42:20 +0200
Message-ID: <1472755341-9995-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
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
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index 4149db3..35c1765 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -348,7 +348,7 @@ static void nsp_pin_dbg_show(struct pinctrl_dev *pctrl_dev,
 	seq_printf(s, " %s", dev_name(pctrl_dev->dev));
 }
 
-static struct pinctrl_ops nsp_pinctrl_ops = {
+static const struct pinctrl_ops nsp_pinctrl_ops = {
 	.get_groups_count = nsp_get_groups_count,
 	.get_group_name = nsp_get_group_name,
 	.get_group_pins = nsp_get_group_pins,
@@ -518,7 +518,7 @@ static void nsp_gpio_disable_free(struct pinctrl_dev *pctrl_dev,
 	spin_unlock_irqrestore(&pinctrl->lock, flags);
 }
 
-static struct pinmux_ops nsp_pinmux_ops = {
+static const struct pinmux_ops nsp_pinmux_ops = {
 	.get_functions_count = nsp_get_functions_count,
 	.get_function_name = nsp_get_function_name,
 	.get_function_groups = nsp_get_function_groups,
