From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>
Subject: [PATCH] pinctrl: intel: merrifield: fix dup size in probe
Date: Wed, 31 Aug 2016 14:30:50 +0200
Message-ID: <20160831123050.13202-1-vincent.stehle@intel.com>
References: <1466678976-52598-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:44084 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933992AbcHaMdN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Aug 2016 08:33:13 -0400
In-Reply-To: <1466678976-52598-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>

In function mrfld_pinctrl_probe(), when duplicating the mrfld_families
array the requested memory region length is multiplied once too many by the
number of elements in the original array. Fix this to spare some memory.

Fixes: 4e80c8f505741cbd ("pinctrl: intel: Add Intel Merrifield pin controller support")
Signed-off-by: Vincent Stehlé <vincent.stehle@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 7fb7656..7826c7f 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -854,7 +854,7 @@ static int mrfld_pinctrl_probe(struct platform_device *pdev)
 	 */
 	nfamilies = ARRAY_SIZE(mrfld_families),
 	families = devm_kmemdup(&pdev->dev, mrfld_families,
-					    nfamilies * sizeof(mrfld_families),
+					    sizeof(mrfld_families),
 					    GFP_KERNEL);
 	if (!families)
 		return -ENOMEM;
-- 
2.9.3

