From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] pinctrl: pinconf: Fix display of configs
Date: Tue, 14 Jul 2015 11:17:59 +0100
Message-ID: <1436869079-26594-2-git-send-email-jonathanh@nvidia.com>
References: <1436869079-26594-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16937 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753665AbbGNKSM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 06:18:12 -0400
In-Reply-To: <1436869079-26594-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>

The function pinconf_dbg_config_print() only prints the configuration of
the 1st pin config in an array of pin configurations. Fix this so that
all pin configurations in the array are displayed.

There are a few places in the code where the pin configs are displayed
and so add a helper function to display the pin configs to simplify the
code.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/pinctrl/pinconf.c | 64 ++++++++++++++++++++---------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 4744d6363dfb..cbf26a6992a0 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -202,18 +202,34 @@ int pinconf_apply_setting(struct pinctrl_setting const *setting)
 
 #ifdef CONFIG_DEBUG_FS
 
-void pinconf_show_map(struct seq_file *s, struct pinctrl_map const *map)
+void pinconf_show_config(struct seq_file *s, struct pinctrl_dev *pctldev,
+		      unsigned long *configs, unsigned num_configs)
 {
-	struct pinctrl_dev *pctldev;
 	const struct pinconf_ops *confops;
 	int i;
 
-	pctldev = get_pinctrl_dev_from_devname(map->ctrl_dev_name);
 	if (pctldev)
 		confops = pctldev->desc->confops;
 	else
 		confops = NULL;
 
+	for (i = 0; i < num_configs; i++) {
+		seq_puts(s, "config ");
+		if (confops && confops->pin_config_config_dbg_show)
+			confops->pin_config_config_dbg_show(pctldev, s,
+							    configs[i]);
+		else
+			seq_printf(s, "%08lx", configs[i]);
+		seq_puts(s, "\n");
+	}
+}
+
+void pinconf_show_map(struct seq_file *s, struct pinctrl_map const *map)
+{
+	struct pinctrl_dev *pctldev;
+
+	pctldev = get_pinctrl_dev_from_devname(map->ctrl_dev_name);
+
 	switch (map->type) {
 	case PIN_MAP_TYPE_CONFIGS_PIN:
 		seq_printf(s, "pin ");
@@ -227,15 +243,8 @@ void pinconf_show_map(struct seq_file *s, struct pinctrl_map const *map)
 
 	seq_printf(s, "%s\n", map->data.configs.group_or_pin);
 
-	for (i = 0; i < map->data.configs.num_configs; i++) {
-		seq_printf(s, "config ");
-		if (confops && confops->pin_config_config_dbg_show)
-			confops->pin_config_config_dbg_show(pctldev, s,
-						map->data.configs.configs[i]);
-		else
-			seq_printf(s, "%08lx", map->data.configs.configs[i]);
-		seq_printf(s, "\n");
-	}
+	pinconf_show_config(s, pctldev, map->data.configs.configs,
+			    map->data.configs.num_configs);
 }
 
 void pinconf_show_setting(struct seq_file *s,
@@ -243,9 +252,7 @@ void pinconf_show_setting(struct seq_file *s,
 {
 	struct pinctrl_dev *pctldev = setting->pctldev;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
-	const struct pinconf_ops *confops = pctldev->desc->confops;
 	struct pin_desc *desc;
-	int i;
 
 	switch (setting->type) {
 	case PIN_MAP_TYPE_CONFIGS_PIN:
@@ -269,17 +276,8 @@ void pinconf_show_setting(struct seq_file *s,
 	 * FIXME: We should really get the pin controler to dump the config
 	 * values, so they can be decoded to something meaningful.
 	 */
-	for (i = 0; i < setting->data.configs.num_configs; i++) {
-		seq_printf(s, " ");
-		if (confops && confops->pin_config_config_dbg_show)
-			confops->pin_config_config_dbg_show(pctldev, s,
-				setting->data.configs.configs[i]);
-		else
-			seq_printf(s, "%08lx",
-				   setting->data.configs.configs[i]);
-	}
-
-	seq_printf(s, "\n");
+	pinconf_show_config(s, pctldev, setting->data.configs.configs,
+			    setting->data.configs.num_configs);
 }
 
 static void pinconf_dump_pin(struct pinctrl_dev *pctldev,
@@ -412,10 +410,8 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
 	const struct pinctrl_map *map;
 	const struct pinctrl_map *found = NULL;
 	struct pinctrl_dev *pctldev;
-	const struct pinconf_ops *confops = NULL;
 	struct dbg_cfg *dbg = &pinconf_dbg_conf;
 	int i, j;
-	unsigned long config;
 
 	mutex_lock(&pinctrl_maps_mutex);
 
@@ -449,16 +445,10 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
 	}
 
 	pctldev = get_pinctrl_dev_from_devname(found->ctrl_dev_name);
-	config = *found->data.configs.configs;
-	seq_printf(s, "Dev %s has config of %s in state %s: 0x%08lX\n",
-			dbg->dev_name, dbg->pin_name,
-			dbg->state_name, config);
-
-	if (pctldev)
-		confops = pctldev->desc->confops;
-
-	if (confops && confops->pin_config_config_dbg_show)
-		confops->pin_config_config_dbg_show(pctldev, s, config);
+	seq_printf(s, "Dev %s has config of %s in state %s:\n",
+		   dbg->dev_name, dbg->pin_name, dbg->state_name);
+	pinconf_show_config(s, pctldev, found->data.configs.configs,
+			    found->data.configs.num_configs);
 
 exit:
 	mutex_unlock(&pinctrl_maps_mutex);
-- 
2.1.4

