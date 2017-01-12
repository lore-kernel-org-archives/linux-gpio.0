From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 5/5] pinctrl: mvebu: Use seq_putc() in
 mvebu_pinconf_group_dbg_show()
Date: Thu, 12 Jan 2017 17:37:48 +0100
Message-ID: <c35b1329-a197-c20c-dc3a-2fa8af2e2f35@users.sourceforge.net>
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
Date: Thu, 12 Jan 2017 17:12:30 +0100

Single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 5dc29ba128c4..ff314aa823e7 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -188,12 +188,12 @@ static void mvebu_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		if (curr->subname)
 			seq_printf(s, "(%s)", curr->subname);
 		if (curr->flags & (MVEBU_SETTING_GPO | MVEBU_SETTING_GPI)) {
-			seq_printf(s, "(");
+			seq_putc(s, '(');
 			if (curr->flags & MVEBU_SETTING_GPI)
-				seq_printf(s, "i");
+				seq_putc(s, 'i');
 			if (curr->flags & MVEBU_SETTING_GPO)
-				seq_printf(s, "o");
-			seq_printf(s, ")");
+				seq_putc(s, 'o');
+			seq_putc(s, ')');
 		}
 	} else {
 		seq_puts(s, "current: UNKNOWN");
@@ -215,12 +215,12 @@ static void mvebu_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 				seq_printf(s, "(%s)", grp->settings[n].subname);
 			if (grp->settings[n].flags &
 				(MVEBU_SETTING_GPO | MVEBU_SETTING_GPI)) {
-				seq_printf(s, "(");
+				seq_putc(s, '(');
 				if (grp->settings[n].flags & MVEBU_SETTING_GPI)
-					seq_printf(s, "i");
+					seq_putc(s, 'i');
 				if (grp->settings[n].flags & MVEBU_SETTING_GPO)
-					seq_printf(s, "o");
-				seq_printf(s, ")");
+					seq_putc(s, 'o');
+				seq_putc(s, ')');
 			}
 		}
 		seq_puts(s, " ]");
-- 
2.11.0
