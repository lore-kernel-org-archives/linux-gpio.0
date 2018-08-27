From: Srikanth K H <srikanth.h@samsung.com>
Subject: [PATCH 1/1] Preventive patch in the pin control subsystem to handle
 NULL check.
Date: Mon, 27 Aug 2018 14:08:59 +0530
Message-ID: <1535359139-6264-1-git-send-email-srikanth.h@samsung.com>
References: <CGME20180827083916epcas1p43a3fc8570269411de215254ce0ae4b37@epcas1p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: srikanth.h@samsung.com
List-Id: linux-gpio@vger.kernel.org

If the pin descriptor requested for the physical pin fails then the
descriptor is dereferenced without checking for its validity which
may lead to crash, hence added preventive code to check for NULL
and accordingly dereference.

Signed-off-by: Srikanth K H <srikanth.h@samsung.com>
---
 drivers/pinctrl/pinconf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index d3fe143..576d08d 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -269,8 +269,9 @@ void pinconf_show_setting(struct seq_file *s,
 	case PIN_MAP_TYPE_CONFIGS_PIN:
 		desc = pin_desc_get(setting->pctldev,
 				    setting->data.configs.group_or_pin);
-		seq_printf(s, "pin %s (%d)", desc->name,
-			   setting->data.configs.group_or_pin);
+		if (desc)
+			seq_printf(s, "pin %s (%d)", desc->name,
+				   setting->data.configs.group_or_pin);
 		break;
 	case PIN_MAP_TYPE_CONFIGS_GROUP:
 		seq_printf(s, "group %s (%d)",
-- 
1.9.1
