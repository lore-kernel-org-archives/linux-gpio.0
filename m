Return-Path: <SRS0=KICV=VU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D802C7618B
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 15:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BA3C206B8
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 15:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731977AbfGWPzT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 23 Jul 2019 11:55:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:4168 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731508AbfGWPzS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 11:55:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 08:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="177332326"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2019 08:55:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C617E81; Tue, 23 Jul 2019 18:55:15 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Simplify offset validation in intel_get_padcfg()
Date:   Tue, 23 Jul 2019 18:55:14 +0300
Message-Id: <20190723155514.65177-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is more generic and simpler validation just against the nregs.
Using it allows to drop customization from the intel_get_padcfg().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 99c5bca789eb..1e8018edde4d 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -166,7 +166,7 @@ static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl,
 	padno = pin_to_padno(community, pin);
 	nregs = (community->features & PINCTRL_FEATURE_DEBOUNCE) ? 4 : 2;
 
-	if (reg == PADCFG2 && !(community->features & PINCTRL_FEATURE_DEBOUNCE))
+	if (reg >= nregs * 4)
 		return NULL;
 
 	return community->pad_regs + reg + padno * nregs * 4;
-- 
2.20.1

