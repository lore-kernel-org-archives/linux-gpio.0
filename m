From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 10/10] pinctrl: mxs: Use kcalloc() in mxs_dt_node_to_map()
Date: Fri, 14 Apr 2017 11:23:51 +0200
Message-ID: <ed0b8015-20c7-c766-624b-d34b54444d1e@users.sourceforge.net>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 10:32:29 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus reuse the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 9e6dc0038c35..1479610091d5 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -96,7 +96,7 @@ static int mxs_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!purecfg && config)
 		new_num = 2;
 
-	new_map = kzalloc(sizeof(*new_map) * new_num, GFP_KERNEL);
+	new_map = kcalloc(new_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
 
-- 
2.12.2

