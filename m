From: Peng Fan <van.freenix@gmail.com>
Subject: [PATCH] pinctrl: core: handle pinctrl_get failure
Date: Thu, 10 Sep 2015 21:38:06 +0800
Message-ID: <1441892286-18989-1-git-send-email-van.freenix@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, van.freenix@gmail.com
List-Id: linux-gpio@vger.kernel.org

Need to do error handling path when pinctrl_get fails. Also when
pinctrl_get success, insert 'pctldev->node' to pinctrldev_list.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 69723e0..ae6f9b6 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1753,10 +1753,6 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 		goto out_err;
 	}
 
-	mutex_lock(&pinctrldev_list_mutex);
-	list_add_tail(&pctldev->node, &pinctrldev_list);
-	mutex_unlock(&pinctrldev_list_mutex);
-
 	pctldev->p = pinctrl_get(pctldev->dev);
 
 	if (!IS_ERR(pctldev->p)) {
@@ -1776,8 +1772,14 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 						    PINCTRL_STATE_SLEEP);
 		if (IS_ERR(pctldev->hog_sleep))
 			dev_dbg(dev, "failed to lookup the sleep state\n");
+	} else {
+		goto out_err;
 	}
 
+	mutex_lock(&pinctrldev_list_mutex);
+	list_add_tail(&pctldev->node, &pinctrldev_list);
+	mutex_unlock(&pinctrldev_list_mutex);
+
 	pinctrl_init_device_debugfs(pctldev);
 
 	return pctldev;
-- 
1.8.4
