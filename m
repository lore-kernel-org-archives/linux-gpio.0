Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAF6C2B9F4
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Jun 2021 08:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71C7A6141C
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Jun 2021 08:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFYIkD (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 25 Jun 2021 04:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhFYIkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 04:40:02 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D902BC061574
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 01:37:41 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1lwhLG-00BKL9-16; Fri, 25 Jun 2021 10:37:38 +0200
From:   Johannes Berg <johannes@sipsolutions.net>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Baryshkov <dbaryshkov@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, linux-um@lists.infradead.org,
        Johannes Berg <johannes.berg@intel.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] drivers: gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP
Date:   Fri, 25 Jun 2021 10:37:34 +0200
Message-Id: <20210625103734.2f29630be607.Ied890c9ca650517103410e399ef509796653f5d3@changeid>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Johannes Berg <johannes.berg@intel.com>

Both of these drivers use ioport_map(), so they need to
depend on HAS_IOPORT_MAP. Otherwise, they cannot be built
even with COMPILE_TEST on architectures without an ioport
implementation, such as ARCH=um.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/gpio/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1dd0ec6727fd..3c69b785cb79 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1383,6 +1383,7 @@ config GPIO_TPS68470
 config GPIO_TQMX86
 	tristate "TQ-Systems QTMX86 GPIO"
 	depends on MFD_TQMX86 || COMPILE_TEST
+	depends on HAS_IOPORT_MAP
 	select GPIOLIB_IRQCHIP
 	help
 	  This driver supports GPIO on the TQMX86 IO controller.
@@ -1450,6 +1451,7 @@ menu "PCI GPIO expanders"
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
 	depends on X86 || COMPILE_TEST
+	depends on HAS_IOPORT_MAP
 	help
 	  The AMD 8111 south bridge contains 32 GPIO pins which can be used.
 
-- 
2.31.1

