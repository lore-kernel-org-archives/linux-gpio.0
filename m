From: Laurent Meunier <laurent.meunier@st.com>
Subject: [PATCH V3] pinctrl: pinconf: remove needless loop
Date: Fri, 30 Oct 2015 15:15:51 +0100
Message-ID: <1446214551-9523-1-git-send-email-laurent.meunier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:2232 "EHLO
	mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756769AbbJ3OQC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 30 Oct 2015 10:16:02 -0400
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
index 29a7bb1..4dd7722 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -411,7 +411,7 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
 	const struct pinctrl_map *found = NULL;
 	struct pinctrl_dev *pctldev;
 	struct dbg_cfg *dbg = &pinconf_dbg_conf;
-	int i, j;
+	int i;
 
 	mutex_lock(&pinctrl_maps_mutex);
 
@@ -424,13 +424,10 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
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

