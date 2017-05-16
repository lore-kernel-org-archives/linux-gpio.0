From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] pinctrl: core: do not explicitly free on unregister
Date: Mon, 15 May 2017 23:18:59 -0700
Message-ID: <20170516061859.396-1-stefan@agner.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:57771 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751137AbdEPGTN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2017 02:19:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

When using the resource managed version of pinctrl, resources
might already been freed when pinctrl_unregister is called by the
devres framework. When calling devm_kfree on such a already freed
resource, devres prints a warning:
  WARNING: CPU: 0 PID: 1 at drivers/base/devres.c:891 pinmux_generic_free_functions+0xf4/0x128
  ...

Solve this by not explicitly free resources. The two affected
functions (pinmux_generic_free_functions/pinctrl_generic_free_groups)
are only used in pinctrl_unregister. When not using the resource
managed version of pinctrl, the underlying device will presumably
get freed freed soon anyway.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/pinctrl/core.c   | 1 -
 drivers/pinctrl/pinmux.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1653cbda6a82..bc4c12008cd4 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -702,7 +702,6 @@ static void pinctrl_generic_free_groups(struct pinctrl_dev *pctldev)
 		group = radix_tree_lookup(&pctldev->pin_group_tree,
 					  indices[i]);
 		radix_tree_delete(&pctldev->pin_group_tree, indices[i]);
-		devm_kfree(pctldev->dev, group);
 	}
 
 	pctldev->num_groups = 0;
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 9fd6d9087dc5..87098be84a3c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -848,7 +848,6 @@ void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
 		function = radix_tree_lookup(&pctldev->pin_function_tree,
 					     indices[i]);
 		radix_tree_delete(&pctldev->pin_function_tree, indices[i]);
-		devm_kfree(pctldev->dev, function);
 	}
 
 	pctldev->num_functions = 0;
-- 
2.13.0

