From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: add some comments to the hog/late init code
Date: Fri, 30 Dec 2016 14:45:32 +0100
Message-ID: <20161230134532.12884-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34857 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753749AbcL3Npi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 08:45:38 -0500
Received: by mail-lf0-f45.google.com with SMTP id b14so237134911lfg.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 05:45:38 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>

It confused me a bit so it may confuse others. Make it crystal
clear what is going on here for any future readers.

Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d02e8def9506..a9e3a75fb67d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1753,6 +1753,12 @@ static void pinctrl_late_init(struct work_struct *work)
 
 	pctldev = container_of(work, struct pinctrl_dev, late_init.work);
 
+	/*
+	 * If the pin controller does NOT have hogs, this will report an
+	 * error and we skip over this entire branch. This is why we can
+	 * call this function directly when we do not have hogs on the
+	 * device.
+	 */
 	pctldev->p = create_pinctrl(pctldev->dev, pctldev);
 	if (!IS_ERR(pctldev->p)) {
 		kref_get(&pctldev->p->users);
@@ -1847,6 +1853,12 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 		goto out_err;
 	}
 
+	/*
+	 * If the device has hogs we want the probe() function of the driver
+	 * to complete before we go in and hog them and add the pin controller
+	 * to the list of controllers. If it has no hogs, we can just complete
+	 * the registration immediately.
+	 */
 	if (pinctrl_dt_has_hogs(pctldev))
 		schedule_delayed_work(&pctldev->late_init, 0);
 	else
-- 
2.9.3

