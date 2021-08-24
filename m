Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6360C432BE
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Aug 2021 16:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC81161357
	for <linux-gpio@archiver.kernel.org>; Tue, 24 Aug 2021 16:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhHXQs7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 24 Aug 2021 12:48:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:10207 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229896AbhHXQs6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:48:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550663"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550663"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036701"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:11 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 03/20] arch: x86: Add ART support function to tsc code
Date:   Tue, 24 Aug 2021 22:17:44 +0530
Message-Id: <20210824164801.28896-4-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

Add a function to 'read' the ART(Always Running Timer) value using
TSC(Time Stamp Capture) conversion.

The Intel PMC Timed I/O driver requires the current ART value to
test for rollover.

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Co-developed-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 01a300a9700b..a50b0102e5c1 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -28,6 +28,7 @@ static inline cycles_t get_cycles(void)
 	return rdtsc();
 }
 
+extern u64 read_art_time(void);
 extern struct system_counterval_t convert_art_to_tsc(u64 art);
 extern struct system_counterval_t convert_art_ns_to_tsc(u64 art_ns);
 
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 2e076a459a0c..bbab6cf1a73b 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1230,6 +1230,26 @@ int unsynchronized_tsc(void)
 	return 0;
 }
 
+/*
+ * Converts the current TSC to the current ART value using conversion
+ * factors discovered by detect_art()
+ */
+u64 read_art_time(void)
+{
+	u64 tsc, tmp, res, rem;
+
+	tsc = read_tsc(NULL) - art_to_tsc_offset;
+	rem = do_div(tsc, art_to_tsc_numerator);
+
+	res = tsc * art_to_tsc_denominator;
+	tmp = rem * art_to_tsc_denominator;
+
+	do_div(tmp, art_to_tsc_numerator);
+
+	return res + tmp;
+}
+EXPORT_SYMBOL(read_art_time);
+
 /*
  * Convert ART to TSC given numerator/denominator found in detect_art()
  */
-- 
2.17.1

