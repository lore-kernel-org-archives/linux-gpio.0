From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/1] pinctrl: core: Fix build error due to devm_pinctrl_dev_match()
Date: Wed, 20 Apr 2016 22:47:53 +0530
Message-ID: <1461172673-29500-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13874 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751515AbcDTR3e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 13:29:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>

The closing bracket missing from final patch which causes the
build break. Correcting the function.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
This may be happend by mistake when applyign the pathces for git hub from
test branch to devm_pinctrl branch.
This is happening on devel branch of pinctrl subsystem.
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 21df52e..98d2a1b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1883,7 +1883,7 @@ static int devm_pinctrl_dev_match(struct device *dev, void *res, void *data)
 {
 	struct pctldev **r = res;
 
-	if (WARN_ON(!r || !*r)
+	if (WARN_ON(!r || !*r))
 		return 0;
 
 	return *r == data;
-- 
2.1.4

