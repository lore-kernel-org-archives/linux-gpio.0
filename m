Return-Path: <SRS0=N38l=EM=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC5AC2D0A3
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 19:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68260206FA
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 19:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgKFTXN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 6 Nov 2020 14:23:13 -0500
Received: from mga14.intel.com ([192.55.52.115]:17627 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727356AbgKFTXM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:12 -0500
IronPort-SDR: sexo2MoU06wnHCROotsFss9a5cGqiaSh3NykUYf7xuM9EcPCKu8KCUlW9wxfVJq/PuSDLYDvTm
 GQxazFiMreWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="168807656"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="168807656"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:12 -0800
IronPort-SDR: 1TswDZZRxrYlwgoS+xAvc1arr68b4AVY8ujznSLcELngqFytrAaW1joBQP/MtlGvctxIPJV6js
 85oZJFioD0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="321694112"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2020 11:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E01F0580; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 9/9] gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
Date:   Fri,  6 Nov 2020 21:23:04 +0200
Message-Id: <20201106192304.49179-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make Intel GPIO tree official for GPIO ACPI work.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..53236b2ea0af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7483,6 +7483,7 @@ M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
 F:	drivers/gpio/gpiolib-acpi.c
 F:	drivers/gpio/gpiolib-acpi.h
-- 
2.28.0

