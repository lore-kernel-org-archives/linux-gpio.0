Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E78FC43334
	for <linux-gpio@archiver.kernel.org>; Mon, 20 Jun 2022 11:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239977AbiFTLos (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 20 Jun 2022 07:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241991AbiFTLoq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 07:44:46 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFB9FE4;
        Mon, 20 Jun 2022 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655725485; x=1687261485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UdN0g13qcTNPn5ZNJ6qrKqpCS6O6eQthWK04gSFXGyY=;
  b=IOYPyG6aOJn7vnDbuf1e6HWn5Zx8zX2X8A+0Ig5m9z5HJYijTD4ssn9S
   y5KUJHH9pna+m30HE1+9B9asDDCOpzqWAxz6daQOKhYyyTGrM2jn8Lmc6
   8Acbz4RHLeiAX/37hLqCC4RKnC2940vveK/HdAfZP6NAyGcLgxQxMxEZd
   vLOop9LUgGqyX8ahI+dIBriv2VZzCBMwt5euFdEYF0JjMVuH6RNa7DKNv
   BK9sPc8GtEeUiCT6NkZ4AyKQCVklP/vUKfiWto+L9lRlIQiIkmvQ4M/pM
   eZHwd5kLzYVcGTxvqiPpoizd8UNk1tS1Tn1TNxwdI91rxHsy3OOAUyT1d
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280604256"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280604256"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 04:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="584582457"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 20 Jun 2022 04:44:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F075759B; Mon, 20 Jun 2022 14:44:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 7/7] pinctrl: intel: Drop no more used members of struct intel_pingroup
Date:   Mon, 20 Jun 2022 14:44:39 +0300
Message-Id: <20220620114439.31491-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620114439.31491-1-andriy.shevchenko@linux.intel.com>
References: <20220620114439.31491-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are no more used members in the struct intel_pingroup, drop them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 69ff0598263c..65628423bf63 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -24,17 +24,11 @@ struct device;
 
 /**
  * struct intel_pingroup - Description about group of pins
- * @name: Name of the groups
- * @pins: All pins in this group
- * @npins: Number of pins in this groups
  * @grp: Generic data of the pin group (name and pins)
  * @mode: Native mode in which the group is muxed out @pins. Used if @modes is %NULL.
  * @modes: If not %NULL this will hold mode for each pin in @pins
  */
 struct intel_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	size_t npins;
 	struct pingroup grp;
 	unsigned short mode;
 	const unsigned int *modes;
@@ -159,9 +153,6 @@ struct intel_community {
  */
 #define PIN_GROUP(n, p, m)								\
 	{										\
-		.name = (n),					\
-		.pins = (p),					\
-		.npins = ARRAY_SIZE((p)),			\
 		.grp = PINCTRL_PINGROUP((n), (p), ARRAY_SIZE((p))),			\
 		.mode = __builtin_choose_expr(__builtin_constant_p((m)), (m), 0),	\
 		.modes = __builtin_choose_expr(__builtin_constant_p((m)), NULL, (m)),	\
-- 
2.35.1

