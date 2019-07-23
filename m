Return-Path: <SRS0=KICV=VU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B04C761A9
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 15:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C2EA206B8
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Jul 2019 15:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbfGWP4i (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 23 Jul 2019 11:56:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:13172 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733236AbfGWP4i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 11:56:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 08:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="177332551"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2019 08:56:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EB592546; Tue, 23 Jul 2019 18:56:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 7/8] pinctrl: lewisburg: Provide Interrupt Status register offset
Date:   Tue, 23 Jul 2019 18:56:32 +0300
Message-Id: <20190723155633.65232-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723155633.65232-1-andriy.shevchenko@linux.intel.com>
References: <20190723155633.65232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since some of the GPIO controllers use different Interrupt Status offset,
it make sense to provide it explicitly in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lewisburg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-lewisburg.c b/drivers/pinctrl/intel/pinctrl-lewisburg.c
index 03b04c7ae9e8..2e06fb1464ab 100644
--- a/drivers/pinctrl/intel/pinctrl-lewisburg.c
+++ b/drivers/pinctrl/intel/pinctrl-lewisburg.c
@@ -17,6 +17,7 @@
 #define LBG_PAD_OWN	0x020
 #define LBG_PADCFGLOCK	0x060
 #define LBG_HOSTSW_OWN	0x080
+#define LBG_GPI_IS	0x100
 #define LBG_GPI_IE	0x110
 
 #define LBG_COMMUNITY(b, s, e)				\
@@ -25,6 +26,7 @@
 		.padown_offset = LBG_PAD_OWN,		\
 		.padcfglock_offset = LBG_PADCFGLOCK,	\
 		.hostown_offset = LBG_HOSTSW_OWN,	\
+		.is_offset = LBG_GPI_IS,		\
 		.ie_offset = LBG_GPI_IE,		\
 		.gpp_size = 24,				\
 		.pin_base = (s),			\
-- 
2.20.1

