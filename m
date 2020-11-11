Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCF3C388F9
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26BFE208CA
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgKKWUd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Nov 2020 17:20:33 -0500
Received: from mga04.intel.com ([192.55.52.120]:54741 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727012AbgKKWUd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:33 -0500
IronPort-SDR: DQIeoo9/Xm1YmJf6gU5IduErGepHSLTvj5pFfAjafId59TquSmXyFWuzWz4KCm9i8ZIfmqdkdj
 Ioga5aGnUMCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167643244"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="167643244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:32 -0800
IronPort-SDR: hhX+cVRujRPPwdFoStW4HQMSs3eR1HfvYe1ANa6BPJoHbxqLAguh2uKCxmlJ5CNW0aZlwIXFXc
 STaCGk55dv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366394694"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Nov 2020 14:20:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F29D7654; Thu, 12 Nov 2020 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 14/18] gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
Date:   Thu, 12 Nov 2020 00:20:04 +0200
Message-Id: <20201111222008.39993-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GpioInt() implies input configuration of the pin. Add this to
the acpi_gpio_to_gpiod_flags() and make usable for GpioInt().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index b47d5e8edaeb..644067cc0f81 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -208,6 +208,10 @@ static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
 static enum gpiod_flags
 acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int polarity)
 {
+	/* GpioInt() implies input configuration */
+	if (agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT)
+		return GPIOD_IN;
+
 	switch (agpio->io_restriction) {
 	case ACPI_IO_RESTRICT_INPUT:
 		return GPIOD_IN;
@@ -681,13 +685,13 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		 * - ACPI_ACTIVE_HIGH == GPIO_ACTIVE_HIGH
 		 */
 		if (lookup->info.gpioint) {
-			lookup->info.flags = GPIOD_IN;
 			lookup->info.polarity = agpio->polarity;
 			lookup->info.triggering = agpio->triggering;
 		} else {
 			lookup->info.polarity = lookup->active_low;
-			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio, lookup->info.polarity);
 		}
+
+		lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio, lookup->info.polarity);
 	}
 
 	return 1;
-- 
2.28.0

