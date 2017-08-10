From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 10/17] pinctrl: adi2: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Date: Thu, 10 Aug 2017 12:06:22 +0200
Message-ID: <1502359589-15970-11-git-send-email-Julia.Lawall@lip6.fr>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

These structures are only stored in fields of a pinctrl_desc
structure (pctlops and pmxops) that are const. Make the
structures const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pinctrl/pinctrl-adi2.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index 54569a7..56aa181 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -612,7 +612,7 @@ static int adi_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
-static struct pinctrl_ops adi_pctrl_ops = {
+static const struct pinctrl_ops adi_pctrl_ops = {
 	.get_groups_count = adi_get_groups_count,
 	.get_group_name = adi_get_group_name,
 	.get_group_pins = adi_get_group_pins,
@@ -696,7 +696,7 @@ static int adi_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct pinmux_ops adi_pinmux_ops = {
+static const struct pinmux_ops adi_pinmux_ops = {
 	.set_mux = adi_pinmux_set,
 	.get_functions_count = adi_pinmux_get_funcs_count,
 	.get_function_name = adi_pinmux_get_func_name,
