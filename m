Return-Path: <SRS0=75sK=YP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5327FCA9EB7
	for <linux-gpio@archiver.kernel.org>; Tue, 22 Oct 2019 10:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28D76214B2
	for <linux-gpio@archiver.kernel.org>; Tue, 22 Oct 2019 10:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731469AbfJVKAI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 22 Oct 2019 06:00:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:55124 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731344AbfJVKAI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 06:00:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; 
   d="scan'208";a="398966119"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2019 03:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CAA1C40F; Tue, 22 Oct 2019 13:00:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/5] pinctrl: intel: Drop level from warning to debug in intel_restore_hostown()
Date:   Tue, 22 Oct 2019 13:00:03 +0300
Message-Id: <20191022100004.66532-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
References: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we didn't get any new reports from users about wrong settings
of pad ownership, there is no point to spam kernel log with it. Thus,
drop level from warning to debug.

Also, modify format to be in align with the rest restore helpers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index da34750a420f..54a5eb33c9fa 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1623,7 +1623,7 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
 	if (!((value ^ saved) & requested))
 		return;
 
-	dev_warn(dev, "restored hostown %u/%u %#8x->%#8x\n", c, gpp, value, saved);
+	dev_dbg(dev, "restored hostown %u/%u %#08x\n", c, gpp, readl(base + gpp * 4));
 }
 
 static void intel_restore_intmask(struct intel_pinctrl *pctrl, unsigned int c,
-- 
2.23.0

