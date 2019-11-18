Return-Path: <SRS0=L63o=ZK=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19610C432C0
	for <linux-gpio@archiver.kernel.org>; Mon, 18 Nov 2019 13:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC23D2071C
	for <linux-gpio@archiver.kernel.org>; Mon, 18 Nov 2019 13:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfKRNxB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 18 Nov 2019 08:53:01 -0500
Received: from mga14.intel.com ([192.55.52.115]:60016 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbfKRNxB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 08:53:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 05:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; 
   d="scan'208";a="406091366"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2019 05:52:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 246092D5; Mon, 18 Nov 2019 15:52:58 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Replace my email by one @kernel.org
Date:   Mon, 18 Nov 2019 15:52:58 +0200
Message-Id: <20191118135258.37574-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For the repositories we keep on git.kernel.org replace my email
to be on the same domain for sake of consistency.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f11e6ceb244..ec467bf0340f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12864,7 +12864,7 @@ F:	Documentation/devicetree/bindings/pinctrl/fsl,*
 
 PIN CONTROLLER - INTEL
 M:	Mika Westerberg <mika.westerberg@linux.intel.com>
-M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+M:	Andy Shevchenko <andy@kernel.org>
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
 S:	Maintained
 F:	drivers/pinctrl/intel/
-- 
2.24.0

