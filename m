From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] pinctrl: pinconf: Allow groups to be configured via debugfs
Date: Tue, 14 Jul 2015 11:17:58 +0100
Message-ID: <1436869079-26594-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16932 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752633AbbGNKSL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 06:18:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>

The function pinconf_dbg_config_write() currently only supports configuring
a pin configuration mapping via the debugfs. Allow group mappings to also
be configured via the debugfs.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/pinctrl/pinconf.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 1fc09dc20199..4744d6363dfb 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -470,10 +470,12 @@ exit:
  * pinconf_dbg_config_write() - modify the pinctrl config in the pinctrl
  * map, of a dev/pin/state entry based on user entries to pinconf-config
  * @user_buf: contains the modification request with expected format:
- *     modify config_pin <devicename> <state> <pinname> <newvalue>
+ *     modify <config> <devicename> <state> <name> <newvalue>
  * modify is literal string, alternatives like add/delete not supported yet
- * config_pin is literal, alternatives like config_mux not supported yet
- * <devicename> <state> <pinname> are values that should match the pinctrl-maps
+ * <config> is the configuration to be changed. Supported configs are
+ *     "config_pin" or "config_group", alternatives like config_mux are not
+ *     supported yet.
+ * <devicename> <state> <name> are values that should match the pinctrl-maps
  * <newvalue> reflects the new config and is driver dependant
  */
 static ssize_t pinconf_dbg_config_write(struct file *file,
@@ -511,13 +513,19 @@ static ssize_t pinconf_dbg_config_write(struct file *file,
 	if (strcmp(token, "modify"))
 		return -EINVAL;
 
-	/* Get arg type: "config_pin" type supported so far */
+	/*
+	 * Get arg type: "config_pin" and "config_group"
+	 *                types are supported so far
+	 */
 	token = strsep(&b, " ");
 	if (!token)
 		return -EINVAL;
-	if (strcmp(token, "config_pin"))
+	if (!strcmp(token, "config_pin"))
+		dbg->map_type = PIN_MAP_TYPE_CONFIGS_PIN;
+	else if (!strcmp(token, "config_group"))
+		dbg->map_type = PIN_MAP_TYPE_CONFIGS_GROUP;
+	else
 		return -EINVAL;
-	dbg->map_type = PIN_MAP_TYPE_CONFIGS_PIN;
 
 	/* get arg 'device_name' */
 	token = strsep(&b, " ");
-- 
2.1.4

