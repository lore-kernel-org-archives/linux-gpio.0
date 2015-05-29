From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: add pinctrl_register_reason() to return proper error code
Date: Fri, 29 May 2015 20:30:16 +0900
Message-ID: <1432899016-18155-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg012.nifty.com ([202.248.44.38]:23546 "EHLO
	conuserg012-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754600AbbE2LaX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2015 07:30:23 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

The pinctrl_register() just returns NULL on error, so the callers
can not know the exact reason of the failure.

Some of the pinctrl drivers return -EINVAL, some -ENODEV, and some
-ENOMEM on error of pinctrl_register() , although the error code
might be different from the actual cause of the error.

This new function, pinctrl_register_reason(), helps the drivers get
and return the appropriate error code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
---
If this patch is accepted, I can send a series to replace
the pinctrl_register() in each driver with pinctrl_register_reason().


 drivers/pinctrl/core.c          | 35 +++++++++++++++++++++++++----------
 include/linux/pinctrl/pinctrl.h |  2 ++
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index f3cf3a8..39c284a 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1692,26 +1692,27 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
 }
 
 /**
- * pinctrl_register() - register a pin controller device
+ * pinctrl_register_reason() - register a pin controller device
  * @pctldesc: descriptor for this pin controller
  * @dev: parent device for this pin controller
  * @driver_data: private pin controller data for this pin controller
  */
-struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
-				    struct device *dev, void *driver_data)
+struct pinctrl_dev *pinctrl_register_reason(struct pinctrl_desc *pctldesc,
+					    struct device *dev,
+					    void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
 	int ret;
 
 	if (!pctldesc)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	if (!pctldesc->name)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	pctldev = kzalloc(sizeof(*pctldev), GFP_KERNEL);
 	if (pctldev == NULL) {
 		dev_err(dev, "failed to alloc struct pinctrl_dev\n");
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	/* Initialize pin control device struct */
@@ -1724,20 +1725,23 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 	mutex_init(&pctldev->mutex);
 
 	/* check core ops for sanity */
-	if (pinctrl_check_ops(pctldev)) {
+	ret = pinctrl_check_ops(pctldev);
+	if (ret) {
 		dev_err(dev, "pinctrl ops lacks necessary functions\n");
 		goto out_err;
 	}
 
 	/* If we're implementing pinmuxing, check the ops for sanity */
 	if (pctldesc->pmxops) {
-		if (pinmux_check_ops(pctldev))
+		ret = pinmux_check_ops(pctldev);
+		if (ret)
 			goto out_err;
 	}
 
 	/* If we're implementing pinconfig, check the ops for sanity */
 	if (pctldesc->confops) {
-		if (pinconf_check_ops(pctldev))
+		ret = pinconf_check_ops(pctldev);
+		if (ret)
 			goto out_err;
 	}
 
@@ -1783,7 +1787,18 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 out_err:
 	mutex_destroy(&pctldev->mutex);
 	kfree(pctldev);
-	return NULL;
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(pinctrl_register_reason);
+
+struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
+				     struct device *dev, void *driver_data)
+{
+	struct pinctrl_dev *pctldev;
+
+	pctldev = pinctrl_register_reason(pctldesc, dev, driver_data);
+
+	return IS_ERR(pctldev) ? NULL : pctldev;
 }
 EXPORT_SYMBOL_GPL(pinctrl_register);
 
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 9ba59fc..cb05866 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -143,6 +143,8 @@ struct pinctrl_desc {
 /* External interface to pin controller */
 extern struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 				struct device *dev, void *driver_data);
+extern struct pinctrl_dev *pinctrl_register_reason(struct pinctrl_desc *pctldesc,
+				struct device *dev, void *driver_data);
 extern void pinctrl_unregister(struct pinctrl_dev *pctldev);
 extern bool pin_is_valid(struct pinctrl_dev *pctldev, int pin);
 extern void pinctrl_add_gpio_range(struct pinctrl_dev *pctldev,
-- 
1.9.1

