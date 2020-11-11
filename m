Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D68C388F9
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:06:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 649DF208B3
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgKKWGZ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Nov 2020 17:06:25 -0500
Received: from mga04.intel.com ([192.55.52.120]:53545 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgKKWGZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:25 -0500
IronPort-SDR: wqvsGmZrmgFxuaWsdntqSIpj8hmgifoYM9LqYlrMrxVXXHgtCw/P++Tf5ZrPsTQIzS8jJnz11N
 tKbMpm5lO6FQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167641927"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="167641927"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:24 -0800
IronPort-SDR: tFNROCKKh686d9LpS41505xfnBi5to8XkpJWQJFfBhb4rOF1DF4xwTqU4gP4pCOlPcukiouzWW
 M1O2ERmDmceQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="356817233"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 11 Nov 2020 14:06:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0B4D474E; Thu, 12 Nov 2020 00:06:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 16/18] gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
Date:   Thu, 12 Nov 2020 00:05:57 +0200
Message-Id: <20201111220559.39680-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
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

