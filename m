From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH] pinctrl: ingenic: Fix group & function error checking
Date: Sat, 25 Aug 2018 10:53:28 -0700
Message-ID: <20180825175328.16687-1-paul.burton@mips.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Paul Burton <paul.burton@mips.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Commit a203728ac6bb ("pinctrl: core: Return selector to the pinctrl
driver") and commit f913cfce4ee4 ("pinctrl: pinmux: Return selector to
the pinctrl driver") modified the return values of
pinctrl_generic_add_group() and pinmux_generic_add_function()
respectively, but did so without updating their callers. This broke the
pinctrl-ingenic driver, which treats non-zero return values from these
functions as errors & fails to probe. For example on a MIPS Ci20:

  pinctrl-ingenic 10010000.pin-controller: Failed to register group uart0-hwflow
  pinctrl-ingenic: probe of 10010000.pin-controller failed with error 1

Without the pinctrl driver probed, other drivers go on to fail to probe
too & the system is unusable.

Fix this by modifying the error checks to treat only negative values as
errors, matching the commits that introduced the breakage & similar
changes made to other drivers.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: a203728ac6bb ("pinctrl: core: Return selector to the pinctrl driver")
Fixes: f913cfce4ee4 ("pinctrl: pinmux: Return selector to the pinctrl driver")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/pinctrl-ingenic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6a1b6058b991..628817c40e3b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -793,7 +793,7 @@ static int ingenic_pinctrl_probe(struct platform_device *pdev)
 
 		err = pinctrl_generic_add_group(jzpc->pctl, group->name,
 				group->pins, group->num_pins, group->data);
-		if (err) {
+		if (err < 0) {
 			dev_err(dev, "Failed to register group %s\n",
 					group->name);
 			return err;
@@ -806,7 +806,7 @@ static int ingenic_pinctrl_probe(struct platform_device *pdev)
 		err = pinmux_generic_add_function(jzpc->pctl, func->name,
 				func->group_names, func->num_group_names,
 				func->data);
-		if (err) {
+		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
 					func->name);
 			return err;
-- 
2.18.0
