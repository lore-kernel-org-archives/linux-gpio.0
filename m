From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: sprd: Use seq_putc() in
 sprd_pinconf_group_dbg_show()
Date: Sat, 13 Jan 2018 12:48:23 +0100
Message-ID: <a951aa57-b12d-5c8c-561b-d11d385f9872@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@spreadtrum.com>, Colin Ian King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 12:42:14 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 63529911445c..ba1c2ca406e4 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -818,7 +818,7 @@ static void sprd_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 
 	grp = &info->groups[selector];
 
-	seq_printf(s, "\n");
+	seq_putc(s, '\n');
 	for (i = 0; i < grp->npins; i++, config++) {
 		unsigned int pin_id = grp->pins[i];
 
-- 
2.15.1
