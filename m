Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ABA25771;
	Wed, 12 Aug 2026 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786504781; cv=none; b=o6GTq4BQ6J7N/dtBtiyp4uk1h9+JTQiafm5mxrtKTCmmcoqAXaMQ+Evx6qrUNEYkmJBygJaoqlSV9RN7nVyoYT17EyNWPOtF3sA9g1JHiCOlKCFeP/GMFIFtxHg4/C6mQ+bkkSSu3wlzi5n14/lqSCWjBSs/Ppzv82GmAQb3ylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786504781; c=relaxed/simple;
	bh=J00b98ZzL/8jJcNfV9lP7JNdV2JvRhT1fiI+Vt7J3Tc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hrPat7VKwRtKow6nJScSU3riVJVI8O94uLmqcyuS0BI+0bFvFj9mbv96KW8RdyZWY1Brg1dk7c+TtrPCQICKJycTdxlkXIfhMlQ0yI19uXi+/UD4whHH6vYbpowvuLzjPym/C/WPiRzwqOnt+juf6cfMPnV+64RVRr+yGRYQ4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=FPBHjYK4; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="FPBHjYK4"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C3JTuB43261559, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786504769; bh=znukxb/8PogKuAAu6gpcwbZQEngyRGjXaORonaIzUEQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=FPBHjYK4PzWPVBCFh4rnX7YmWIgbcZ72tSbnX1JoaeeZgydDSYUDig1Ee8u4uNSHq
	 VgocEaRou1bY6+nWmuoyJ5ZgC06hg+K5ckg01qXcNuhyF8mD7URHfaLOqiJxIzjGpm
	 RHfAjsvukIGYalvfQcQxeDya2rXockDjtag2bkW+l/WJQQgzdF4uoA+DqXvdIgo5oO
	 tZxMoZYved8CMxTKqagTZI2TGGwhF6gi3fYoUllsm60hPTxSWafs7z3pMCZidDjkn/
	 hqdByFyQitrqK+912Q14tyU5hUojrBHoM3ukp0zlcvVa1KjsGQYx2nQjc0Xol9N36K
	 djx6HfiV4uDXA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C3JTuB43261559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 11:19:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 11:19:29 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 11:19:29 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<tychang@realtek.com>, <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH] gpio: rtd1625: minor cleanups and log improvements
Date: Wed, 12 Aug 2026 11:19:29 +0800
Message-ID: <20260812031929.3598364-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add minor cleanups based on Andy's feedback:
- Store 'dev' in driver data to use dev_err_ratelimited().
- Drop redundant 'ret' initialization and the line break.
- Narrow the scope of local variables 'i' and 'hwirq'.
- Use IRQ_TYPE_DEFAULT.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 483e44cf5abc..c9ff33245ea2 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -79,6 +79,7 @@ struct rtd1625_gpio_info {
 };
 
 struct rtd1625_gpio {
+	struct device *dev;
 	struct gpio_regmap *gpio_reg;
 	const struct rtd1625_gpio_info *info;
 	struct regmap *regmap;
@@ -109,7 +110,7 @@ static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_ope
 {
 	/* Each GPIO has its own dedicated 32-bit register */
 	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio);
-	int val = 0, ret = 0;
+	int val = 0, ret;
 	*reg = base + offset * 4;
 
 	switch (op) {
@@ -223,8 +224,8 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_domain *domain = data->domain;
-	unsigned int reg_offset, i, j, val;
-	irq_hw_number_t hwirq;
+	unsigned int reg_offset, j, val;
+	struct device *dev = data->dev;
 	unsigned long status;
 	u32 irq_type;
 	int ret;
@@ -240,11 +241,12 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	for (i = 0; i < data->info->num_gpios; i += 32) {
+	for (unsigned int i = 0; i < data->info->num_gpios; i += 32) {
 		reg_offset = get_reg_offset(data, i);
 		ret = regmap_read(data->regmap, reg_offset, &val);
 		if (ret) {
-			pr_err_ratelimited("Failed to read IRQ status for GPIO %u: %d\n", i, ret);
+			dev_err_ratelimited(dev, "Failed to read IRQ status for GPIO %u: %d\n",
+					    i, ret);
 			continue;
 		}
 
@@ -261,12 +263,13 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 		if (irq != data->irqs[RTD1625_IRQ_LEVEL]) {
 			ret = regmap_write(data->regmap, reg_offset, status);
 			if (ret)
-				pr_err_ratelimited("Failed to clear edge IRQ for GPIO %u: %d\n",
-						   i, ret);
+				dev_err_ratelimited(dev,
+						    "Failed to clear edge IRQ for GPIO %u: %d\n",
+						    i, ret);
 		}
 
 		for_each_set_bit(j, &status, 32) {
-			hwirq = i + j;
+			irq_hw_number_t hwirq = i + j;
 			irq_type = irq_get_trigger_type(irq_find_mapping(domain, hwirq));
 
 			/*
@@ -486,7 +489,6 @@ static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_g
 		return irq;
 
 	num_irqs = (data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK) ? 3 : 2;
-
 	for (unsigned int i = 0; i < num_irqs; i++) {
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0)
@@ -544,6 +546,8 @@ static int rtd1625_gpio_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->dev = dev;
+
 	data->info = device_get_match_data(dev);
 	if (!data->info)
 		return -ENODATA;
@@ -612,8 +616,7 @@ static const struct rtd1625_gpio_info rtd1625_iso_gpio_info = {
 
 static const struct rtd1625_gpio_info rtd1625_isom_gpio_info = {
 	.num_gpios        = 4,
-	.irq_type_support = IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_LOW |
-			    IRQ_TYPE_LEVEL_HIGH,
+	.irq_type_support = IRQ_TYPE_DEFAULT,
 	.base_offset      = 0x20,
 	.gpa_offset       = 0x00,
 	.gpda_offset      = 0x04,
-- 
2.43.0

