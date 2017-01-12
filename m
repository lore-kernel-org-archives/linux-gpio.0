From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/5] pinctrl: mvebu: Use kmalloc_array() in
 mvebu_pinctrl_dt_node_to_map()
Date: Thu, 12 Jan 2017 17:31:44 +0100
Message-ID: <c4b535ba-be93-5b61-43e0-dcf5018609ee@users.sourceforge.net>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63532 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750730AbdALQbw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Jan 2017 11:31:52 -0500
In-Reply-To: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 16:00:15 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index b6ec6db78351..c2f74572ac01 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -398,7 +398,7 @@ static int mvebu_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return 0;
 	}
 
-	*map = kmalloc(nmaps * sizeof(struct pinctrl_map), GFP_KERNEL);
+	*map = kmalloc_array(nmaps, sizeof(**map), GFP_KERNEL);
 	if (*map == NULL) {
 		dev_err(pctl->dev,
 			"cannot allocate pinctrl_map memory for %s\n",
-- 
2.11.0

