Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3929C56201
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 807F1208CA
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Nov 2020 22:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgKKWUd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Nov 2020 17:20:33 -0500
Received: from mga04.intel.com ([192.55.52.120]:54740 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgKKWUd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:33 -0500
IronPort-SDR: aahn7ZMgYs8bTdkOZo2IPY/yWcZi29YKx/rRW2/1u5uJiHQl59BbkDsoCwO9dKrFJfaHTFeT4L
 DDBswAgJbb6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167643243"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="167643243"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:32 -0800
IronPort-SDR: wWU/QAqiU+U9ZlEzOgAfmm8z8JyYKCzyG0JaCOGbHmMpEu2IByJCJHzBu+4k5NQu2ccpz1JLQa
 53YtRg7mZ+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366096355"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2020 14:20:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DC9B95F5; Thu, 12 Nov 2020 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 12/18] gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
Date:   Thu, 12 Nov 2020 00:20:02 +0200
Message-Id: <20201111222008.39993-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move acpi_gpio_to_gpiod_flags() upper in the code to allow further refactoring.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 66 ++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index b00171d2aaf5..ac1bde0720f2 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -205,6 +205,39 @@ static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
 		acpi_gpiochip_request_irq(acpi_gpio, event);
 }
 
+static enum gpiod_flags
+acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
+{
+	switch (agpio->io_restriction) {
+	case ACPI_IO_RESTRICT_INPUT:
+		return GPIOD_IN;
+	case ACPI_IO_RESTRICT_OUTPUT:
+		/*
+		 * ACPI GPIO resources don't contain an initial value for the
+		 * GPIO. Therefore we deduce that value from the pull field
+		 * instead. If the pin is pulled up we assume default to be
+		 * high, if it is pulled down we assume default to be low,
+		 * otherwise we leave pin untouched.
+		 */
+		switch (agpio->pin_config) {
+		case ACPI_PIN_CONFIG_PULLUP:
+			return GPIOD_OUT_HIGH;
+		case ACPI_PIN_CONFIG_PULLDOWN:
+			return GPIOD_OUT_LOW;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	/*
+	 * Assume that the BIOS has configured the direction and pull
+	 * accordingly.
+	 */
+	return GPIOD_ASIS;
+}
+
 static bool acpi_gpio_in_ignore_list(const char *controller_in, int pin_in)
 {
 	const char *controller, *pin_str;
@@ -530,39 +563,6 @@ static bool acpi_get_driver_gpio_data(struct acpi_device *adev,
 	return false;
 }
 
-static enum gpiod_flags
-acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
-{
-	switch (agpio->io_restriction) {
-	case ACPI_IO_RESTRICT_INPUT:
-		return GPIOD_IN;
-	case ACPI_IO_RESTRICT_OUTPUT:
-		/*
-		 * ACPI GPIO resources don't contain an initial value for the
-		 * GPIO. Therefore we deduce that value from the pull field
-		 * instead. If the pin is pulled up we assume default to be
-		 * high, if it is pulled down we assume default to be low,
-		 * otherwise we leave pin untouched.
-		 */
-		switch (agpio->pin_config) {
-		case ACPI_PIN_CONFIG_PULLUP:
-			return GPIOD_OUT_HIGH;
-		case ACPI_PIN_CONFIG_PULLDOWN:
-			return GPIOD_OUT_LOW;
-		default:
-			break;
-		}
-	default:
-		break;
-	}
-
-	/*
-	 * Assume that the BIOS has configured the direction and pull
-	 * accordingly.
-	 */
-	return GPIOD_ASIS;
-}
-
 static int
 __acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags, enum gpiod_flags update)
 {
-- 
2.28.0

