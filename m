From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 4/5] pinctrl: mvebu: Use seq_puts() in
 mvebu_pinconf_group_dbg_show()
Date: Thu, 12 Jan 2017 17:36:38 +0100
Message-ID: <43337b05-dc83-da07-f4a0-030bf2cae63a@users.sourceforge.net>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 16:51:00 +0100

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 5b49bcda5e79..5dc29ba128c4 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -195,11 +195,12 @@ static void mvebu_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 				seq_printf(s, "o");
 			seq_printf(s, ")");
 		}
-	} else
-		seq_printf(s, "current: UNKNOWN");
+	} else {
+		seq_puts(s, "current: UNKNOWN");
+	}
 
 	if (grp->num_settings > 1) {
-		seq_printf(s, ", available = [");
+		seq_puts(s, ", available = [");
 		for (n = 0; n < grp->num_settings; n++) {
 			if (curr == &grp->settings[n])
 				continue;
@@ -222,7 +223,7 @@ static void mvebu_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 				seq_printf(s, ")");
 			}
 		}
-		seq_printf(s, " ]");
+		seq_puts(s, " ]");
 	}
 }
 
-- 
2.11.0
