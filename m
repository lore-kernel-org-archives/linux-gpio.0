Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2F6C7EE2E
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Jun 2023 07:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbjFHHUK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Jun 2023 03:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234882AbjFHHUI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 03:20:08 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5601137;
        Thu,  8 Jun 2023 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686208807; x=1717744807;
  h=from:to:cc:subject:date:message-id;
  bh=43hfCbSgER7CQhQ5txGvCkEKcIYRVV1HtZSSBPP4Fxk=;
  b=OEoTkwesXzeeCvGaqEz7QA/kS/yqkUlqQno9fr+1CirMx0AFzB63xQ5A
   bWzQCcQPTJNWlvRocXjmUe4YdDsllup+7MPyuSNFgSFHDExnLYw1pRxLZ
   vFMjt+mefeIVC2BAaZjX4ZFLC4Wz3uwLAQ+mAxuPv39pagwkTsiMCY43k
   0LhEZtARctKzt+y3aD9T8mi78t5QblmQjued5XmMlFeRgvxviwJeOfrQq
   63pGjzgpD71tbf8ju3CPSd2McuTD/v6Q/ML9+97Hl+D6yaWeeXrAThkQB
   TgL2MvbrHxN91rFNCLfekZ8aHTm5XB1J5TIG3lRKs+1wpvBtlGpdx7qQZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346849007"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="346849007"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 00:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713005665"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="713005665"
Received: from inesxmail01.iind.intel.com ([10.223.154.20])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 00:20:05 -0700
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
        by inesxmail01.iind.intel.com (Postfix) with ESMTP id 0CC491A9F7;
        Thu,  8 Jun 2023 12:50:05 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
        id 05839176; Thu,  8 Jun 2023 12:50:05 +0530 (IST)
From:   Raag Jadav <raag.jadav@intel.com>
To:     linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, pandith.n@intel.com,
        Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/2] Minor optimizations for Cherryview pinctrl
Date:   Thu,  8 Jun 2023 12:49:01 +0530
Message-Id: <20230608071903.19170-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series implements minor optimizations for Cherryview pinctrl driver.

The numbers are as tested with gcc 7.5.0 and may vary with newer versions.

Raag Jadav (2):
  pinctrl: cherryview: simplify exit path of set_mux hook
  pinctrl: cherryview: simplify exit path of gpio_request_enable hook

 drivers/pinctrl/intel/pinctrl-cherryview.c | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.17.1

