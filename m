Return-Path: <SRS0=IJzy=Z7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BC1C04E30
	for <linux-gpio@archiver.kernel.org>; Mon,  9 Dec 2019 13:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A742B207FF
	for <linux-gpio@archiver.kernel.org>; Mon,  9 Dec 2019 13:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfLINJd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 9 Dec 2019 08:09:33 -0500
Received: from mga04.intel.com ([192.55.52.120]:15272 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727495AbfLINJc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="237744351"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2019 05:09:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B06038A5; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 12/24] pinctrl: lynxpoint: Extract lp_gpio_acpi_use() for future use
Date:   Mon,  9 Dec 2019 15:09:14 +0200
Message-Id: <20191209130926.86483-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We may need this function for other features in the pin control driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 3c8241ed8bc2..d40360728140 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -98,18 +98,28 @@ static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned int offset,
 	return lg->regs + reg + reg_offset;
 }
 
+static bool lp_gpio_acpi_use(struct lp_gpio *lg, unsigned int pin)
+{
+	void __iomem *acpi_use;
+
+	acpi_use = lp_gpio_reg(&lg->chip, pin, LP_ACPI_OWNED);
+	if (!acpi_use)
+		return true;
+
+	return !(ioread32(acpi_use) & BIT(pin % 32));
+}
+
 static int lp_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
-	void __iomem *acpi_use = lp_gpio_reg(chip, offset, LP_ACPI_OWNED);
 	u32 value;
 
 	pm_runtime_get(lg->dev); /* should we put if failed */
 
 	/* Fail if BIOS reserved pin for ACPI use */
-	if (!(ioread32(acpi_use) & BIT(offset % 32))) {
+	if (lp_gpio_acpi_use(lg, offset)) {
 		dev_err(lg->dev, "gpio %d reserved for ACPI\n", offset);
 		return -EBUSY;
 	}
-- 
2.24.0

