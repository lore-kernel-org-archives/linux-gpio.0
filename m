From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: Initialize pinctrl_dev.node
Date: Thu, 12 Jan 2017 17:03:34 +0100
Message-ID: <20170112160334.22943-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34310 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750805AbdALQDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 11:03:39 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>

From: Thierry Reding <treding@nvidia.com>

The struct pinctrl_dev's node field is not properly set up, which means
the .prev and .next fields will be NULL. That's not something that the
linked list code can deal with, so extra care must be taken when using
these fields. An example of this is introduced in commit 3429fb3cda34
("pinctrl: Fix panic when pinctrl devices with hogs are unregistered")
where list_del() is made conditional on the pinctrl device being part
of the pinctrl device list. This is to ensure that list_del() won't
crash upon encountering a NULL pointer in .prev and/or .next.

After initializing the list head there's no need to jump through these
extra hoops and list_del() will work unconditionally. This is because
the initialized list head points to itself and therefore the .prev and
.next fields can be properly dereferenced.

Cc: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 65c0ae0969dc..d878b6b9b32d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1983,6 +1983,7 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 	INIT_RADIX_TREE(&pctldev->pin_function_tree, GFP_KERNEL);
 #endif
 	INIT_LIST_HEAD(&pctldev->gpio_ranges);
+	INIT_LIST_HEAD(&pctldev->node);
 	INIT_DELAYED_WORK(&pctldev->late_init, pinctrl_late_init);
 	pctldev->dev = dev;
 	mutex_init(&pctldev->mutex);
@@ -2047,7 +2048,6 @@ EXPORT_SYMBOL_GPL(pinctrl_register);
 void pinctrl_unregister(struct pinctrl_dev *pctldev)
 {
 	struct pinctrl_gpio_range *range, *n;
-	struct pinctrl_dev *p, *p1;
 
 	if (pctldev == NULL)
 		return;
@@ -2063,9 +2063,7 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 	mutex_lock(&pinctrldev_list_mutex);
 	mutex_lock(&pctldev->mutex);
 	/* TODO: check that no pinmuxes are still active? */
-	list_for_each_entry_safe(p, p1, &pinctrldev_list, node)
-		if (p == pctldev)
-			list_del(&p->node);
+	list_del(&pctldev->node);
 	pinmux_generic_free_functions(pctldev);
 	pinctrl_generic_free_groups(pctldev);
 	/* Destroy descriptor tree */
-- 
2.11.0

