From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 3/5] pinctrl: mvebu: Delete an unnecessary return statement in
 mvebu_pinconf_group_dbg_show()
Date: Thu, 12 Jan 2017 17:34:40 +0100
Message-ID: <18e9e48c-6200-22bb-16dc-90ec5b7e459b@users.sourceforge.net>
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
Date: Thu, 12 Jan 2017 16:30:24 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 0618311e75dc..5b49bcda5e79 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -224,7 +224,6 @@ static void mvebu_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		}
 		seq_printf(s, " ]");
 	}
-	return;
 }
 
 static const struct pinconf_ops mvebu_pinconf_ops = {
-- 
2.11.0
