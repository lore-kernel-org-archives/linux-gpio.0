From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: Fix spelling typos
Date: Tue, 28 Feb 2017 16:59:56 +0200
Message-ID: <20170228145956.43476-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:64436 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752029AbdB1PAi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Feb 2017 10:00:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Just fix spelling typos in comments.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c            | 2 +-
 drivers/pinctrl/pinconf-generic.c | 2 +-
 drivers/pinctrl/pinconf.c         | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d69046537b75..3a84b45f9275 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1062,7 +1062,7 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 	mutex_unlock(&pinctrl_maps_mutex);
 
 	if (ret < 0) {
-		/* If some other error than deferral occured, return here */
+		/* If some other error than deferral occurred, return here */
 		pinctrl_free(p, false);
 		return ERR_PTR(ret);
 	}
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index ce3335accb5b..720a19fd38d2 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -187,7 +187,7 @@ static const struct pinconf_generic_params dt_params[] = {
  * @ncfg:	Number of entries in @cfg
  *
  * Parse the config options described in @params from @np and puts the result
- * in @cfg. @cfg does not need to be empty, entries are added beggining at
+ * in @cfg. @cfg does not need to be empty, entries are added beginning at
  * @ncfg. @ncfg is updated to reflect the number of entries after parsing. @cfg
  * needs to have enough memory allocated to hold all possible entries.
  */
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index c1c1ccc58267..a02dba35fcf3 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -284,7 +284,7 @@ void pinconf_show_setting(struct seq_file *s,
 	}
 
 	/*
-	 * FIXME: We should really get the pin controler to dump the config
+	 * FIXME: We should really get the pin controller to dump the config
 	 * values, so they can be decoded to something meaningful.
 	 */
 	pinconf_show_config(s, pctldev, setting->data.configs.configs,
@@ -473,7 +473,7 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
  *     "config_pin" or "config_group", alternatives like config_mux are not
  *     supported yet.
  * <devicename> <state> <name> are values that should match the pinctrl-maps
- * <newvalue> reflects the new config and is driver dependant
+ * <newvalue> reflects the new config and is driver dependent
  */
 static ssize_t pinconf_dbg_config_write(struct file *file,
 	const char __user *user_buf, size_t count, loff_t *ppos)
-- 
2.11.0

