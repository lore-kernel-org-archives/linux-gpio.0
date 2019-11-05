Return-Path: <SRS0=+xOq=Y5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A476C5DF64
	for <linux-gpio@archiver.kernel.org>; Tue,  5 Nov 2019 20:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B776217F5
	for <linux-gpio@archiver.kernel.org>; Tue,  5 Nov 2019 20:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbfKEUgD (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 5 Nov 2019 15:36:03 -0500
Received: from mga04.intel.com ([192.55.52.120]:41970 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729735AbfKEUgD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="205625023"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2019 12:36:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AB7A0D4; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/7] gpiolib: Switch order of valid mask and hw init
Date:   Tue,  5 Nov 2019 22:35:51 +0200
Message-Id: <20191105203557.78562-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

The GPIO irqchip needs to initialize the valid mask
before initializing the IRQ hardware, because sometimes
the latter require the former to be executed first.

Fixes: 9411e3aaa634 ("gpiolib: Initialize the hardware with a callback")
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b306dfa789e9..a13f656c3034 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1411,11 +1411,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	machine_gpiochip_add(chip);
 
-	ret = gpiochip_irqchip_init_hw(chip);
+	ret = gpiochip_irqchip_init_valid_mask(chip);
 	if (ret)
 		goto err_remove_acpi_chip;
 
-	ret = gpiochip_irqchip_init_valid_mask(chip);
+	ret = gpiochip_irqchip_init_hw(chip);
 	if (ret)
 		goto err_remove_acpi_chip;
 
-- 
2.24.0.rc1

