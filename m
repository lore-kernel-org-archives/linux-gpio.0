Return-Path: <SRS0=l+I1=BI=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F19C433E0
	for <linux-gpio@archiver.kernel.org>; Wed, 29 Jul 2020 12:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7B192083E
	for <linux-gpio@archiver.kernel.org>; Wed, 29 Jul 2020 12:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgG2MCe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 29 Jul 2020 08:02:34 -0400
Received: from mga09.intel.com ([134.134.136.24]:21247 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgG2MCd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jul 2020 08:02:33 -0400
IronPort-SDR: 3cLRPLLJHAXtlBtHxgguZXwkoIRtosLDyycZ2pG5u75XdcZ2MeLsdrjJx7uGkrfCxo6rWAtqEO
 YHYZo5r0/nzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="152635279"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="152635279"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 05:02:33 -0700
IronPort-SDR: mhG7CTCWqCXgBXhxr28fbqfwzgvnESgR1/v4Sk/D1CNPkFES7Z+8aWqArMG76h7FIRaoIJ4Rs+
 i7MTUnYcUmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="364829283"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 29 Jul 2020 05:02:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 75B0EF4; Wed, 29 Jul 2020 15:02:31 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: cherryview: Utilize temporary variable to hold device pointer
Date:   Wed, 29 Jul 2020 15:02:30 +0300
Message-Id: <20200729120230.43005-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

By one of the previous clean up change we got a temporary variable to hold
a device pointer. It can be utilized in other calls in the ->probe() and
save a bit of LOCs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 595686e6a238..e48d4445e932 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1621,7 +1621,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	if (!pctrl)
 		return -ENOMEM;
 
-	pctrl->dev = &pdev->dev;
+	pctrl->dev = dev;
 	pctrl->soc = soc_data;
 
 	pctrl->ncommunities = pctrl->soc->ncommunities;
@@ -1657,14 +1657,13 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 		return irq;
 
 	pctrl->pctldesc = chv_pinctrl_desc;
-	pctrl->pctldesc.name = dev_name(&pdev->dev);
+	pctrl->pctldesc.name = dev_name(dev);
 	pctrl->pctldesc.pins = pctrl->soc->pins;
 	pctrl->pctldesc.npins = pctrl->soc->npins;
 
-	pctrl->pctldev = devm_pinctrl_register(&pdev->dev, &pctrl->pctldesc,
-					       pctrl);
+	pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pctldesc, pctrl);
 	if (IS_ERR(pctrl->pctldev)) {
-		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
+		dev_err(dev, "failed to register pinctrl driver\n");
 		return PTR_ERR(pctrl->pctldev);
 	}
 
@@ -1677,7 +1676,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 					chv_pinctrl_mmio_access_handler,
 					NULL, pctrl);
 	if (ACPI_FAILURE(status))
-		dev_err(&pdev->dev, "failed to install ACPI addr space handler\n");
+		dev_err(dev, "failed to install ACPI addr space handler\n");
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.27.0

