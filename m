From: Laurent Meunier <laurent.meunier@st.com>
Subject: [PATCH V2] pinctrl: pinconf: remove needless loop
Date: Thu, 29 Oct 2015 14:25:47 +0100
Message-ID: <1446125147-10670-1-git-send-email-laurent.meunier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:24711 "EHLO
	mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932088AbbJ2N0F (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 29 Oct 2015 09:26:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, andriy.shevchenko@intel.com, Laurent Meunier <laurent.meunier@st.com>

This removes a needless loop which was caught in pinconf.c.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Laurent Meunier <laurent.meunier@st.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinconf.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 1fc09dc..19af718 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -414,7 +414,7 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
 	struct pinctrl_dev *pctldev;
 	const struct pinconf_ops *confops = NULL;
 	struct dbg_cfg *dbg = &pinconf_dbg_conf;
-	int i, j;
+	int i;
 	unsigned long config;
 
 	mutex_lock(&pinctrl_maps_mutex);
@@ -428,13 +428,10 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
 		if (strcmp(map->name, dbg->state_name))
 			continue;
 
-		for (j = 0; j < map->data.configs.num_configs; j++) {
-			if (!strcmp(map->data.configs.group_or_pin,
-					dbg->pin_name)) {
-				/* We found the right pin / state */
-				found = map;
-				break;
-			}
+		if (!strcmp(map->data.configs.group_or_pin, dbg->pin_name)) {
+			/* We found the right pin */
+			found = map;
+			break;
 		}
 	}
 
-- 
1.9.1

