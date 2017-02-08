From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] pinctrl: Really force states during suspend/resume
Date: Tue,  7 Feb 2017 17:17:59 -0800
Message-ID: <20170208011759.15478-1-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34050 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932779AbdBHBSk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 20:18:40 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: alcooperx@gmail.com, swarren@nvidia.com, Florian Fainelli <f.fainelli@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

In case a platform only defaults a "default" set of pins, but not a
"sleep" set of pins, and this particular platform suspends and resumes
in a way that the pin states are not preserved by the hardware, when we
resume, we would call pinctrl_single_resume() -> pinctrl_force_default()
-> pinctrl_select_state() and the first thing we do is check that the
pins state is the same as before, and do nothing.

In order to fix this, decouple pinctrl_select_state and make it become
__pinctrl_select_state(), taking an additional ignore_state_check
boolean which allows us to bypass the state check during suspend/resume,
since we really want to re-apply the previous pin states in these case.

Fixes: 6e5e959dde0d ("pinctrl: API changes to support multiple states per device")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Linus,

This is against your "fixes" branch, thank you!

 drivers/pinctrl/core.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index fb38e208f32d..8b8017dc9e15 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -992,17 +992,21 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
 EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
 
 /**
- * pinctrl_select_state() - select/activate/program a pinctrl state to HW
+ * __pinctrl_select_state() - select/activate/program a pinctrl state to HW
  * @p: the pinctrl handle for the device that requests configuration
  * @state: the state handle to select/activate/program
+ * @force: ignore the state check (e.g: to re-apply default state during
+ * suspend/resume)
  */
-int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
+static int __pinctrl_select_state(struct pinctrl *p,
+				  struct pinctrl_state *state,
+				  bool ignore_state_check)
 {
 	struct pinctrl_setting *setting, *setting2;
 	struct pinctrl_state *old_state = p->state;
 	int ret;
 
-	if (p->state == state)
+	if (p->state == state && !ignore_state_check)
 		return 0;
 
 	if (p->state) {
@@ -1068,6 +1072,16 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 
 	return ret;
 }
+
+/**
+ * pinctrl_select_state() - select/activate/program a pinctrl state to HW
+ * @p: the pinctrl handle for the device that requests configuration
+ * @state: the state handle to select/activate/program
+ */
+int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
+{
+	return __pinctrl_select_state(p, state, false);
+}
 EXPORT_SYMBOL_GPL(pinctrl_select_state);
 
 static void devm_pinctrl_release(struct device *dev, void *res)
@@ -1236,7 +1250,8 @@ void pinctrl_unregister_map(struct pinctrl_map const *map)
 int pinctrl_force_sleep(struct pinctrl_dev *pctldev)
 {
 	if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_sleep))
-		return pinctrl_select_state(pctldev->p, pctldev->hog_sleep);
+		return __pinctrl_select_state(pctldev->p,
+					      pctldev->hog_sleep, true);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pinctrl_force_sleep);
@@ -1248,7 +1263,8 @@ EXPORT_SYMBOL_GPL(pinctrl_force_sleep);
 int pinctrl_force_default(struct pinctrl_dev *pctldev)
 {
 	if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_default))
-		return pinctrl_select_state(pctldev->p, pctldev->hog_default);
+		return __pinctrl_select_state(pctldev->p,
+					      pctldev->hog_default, true);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pinctrl_force_default);
-- 
2.9.3

