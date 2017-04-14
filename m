From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 06/10] pinctrl: imx: Use seq_putc() in
 imx_pinconf_group_dbg_show()
Date: Fri, 14 Apr 2017 11:17:19 +0200
Message-ID: <03221724-642c-cf80-aebb-cdffe1afc826@users.sourceforge.net>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 15:43:55 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 078875361d76..71dbba892e70 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -443,7 +443,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	if (group > pctldev->num_groups)
 		return;
 
-	seq_printf(s, "\n");
+	seq_putc(s, '\n');
 	grp = pinctrl_generic_get_group(pctldev, group);
 	if (!grp)
 		return;
-- 
2.12.2
