Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647A53D6CB0;
	Fri, 14 Aug 2026 02:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676247; cv=none; b=cdMltMbkNiDhmxG0QhlUQNVFOfvm5e673UJIiLbXNdQ0IcxwHLngp2yJrE6Md2aTzGqJtyhpkqS2qilAuuixjAxsKBdOk+xHbMprmYKDkonHoBo3glmPOj31P71Vm2lnrWuENRxIIluXTBORlQt+EfAQFaeOCsC0zQTVqRCwPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676247; c=relaxed/simple;
	bh=ULNzr8JZlag34ZCsVzUaWubbGqzU3RXU0kZshlrnSX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OaHUTbynLL4l5O+9YG7xwSoVtK/7H/FLeB8J6YwOMJNAozuPXZ5FbqufYWhyCdMnKotX5hGHJ6lKvRn9t+Bs39IPYPlnrhjWVXjv/au9zywVEFoS+dTMM2uGr9XkaLRPCgXJGHxKLmEUcgSi8bYISK74+3MnDrhbeaaNAZG6q5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=lN48c4fI; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="lN48c4fI"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67E2vHbL5894016, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786676238; bh=yF0/PB2aOoKNY+HsbfBVT1fSxjTp55eJLHc/DoTgsn8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=lN48c4fI3VyldwGtVLja2vdd5LMFkaR+MKpZSfcxp1hvlHahDiJguCGkeUfd40KKy
	 zkeq3dDV+OzjnH7VWyqSI8+R9YbV3GU6FfZH1wX7XdJ3JgLbZlr2ZyfiKk6Ql1k4SG
	 BXqdDWPO43s/vwiCChOyI1ELava69E38lF9MI5F1zXFNVOk45AIi7PqCqGXxlB8Sgr
	 XLpAQYonI3uC5IgMdEpNkgibSNbrx0sfj5XA0XPu0EgcfHAsjzE85mFLiUbEb/AoOX
	 7WEObikdATM7fuA4WnLKzXE9E9eFMJ+tDuGqmDCMX7LebExvnXGIptFDoPRXp82mGs
	 T7rZIiumCob6A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67E2vHbL5894016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2026 10:57:17 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 14 Aug 2026 10:57:14 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 14 Aug 2026 10:57:14 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>
CC: <andriy.shevchenko@intel.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <tychang@realtek.com>,
	<eleanor.lin@realtek.com>, <stanley_chang@realtek.com>,
	<cy.huang@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v2 3/5] gpio: rtd1625: Narrow variable scope in loops
Date: Fri, 14 Aug 2026 10:56:55 +0800
Message-ID: <20260814025657.1400452-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814025657.1400452-1-eleanor.lin@realtek.com>
References: <20260814025657.1400452-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Declare 'i' inside the for-loop header and 'hwirq' within the inner block
where it's used to reduce variable visibility.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 0308d7a052e7..8f584287c2e6 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -224,8 +224,7 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_domain *domain = data->domain;
-	unsigned int reg_offset, i, j, val;
-	irq_hw_number_t hwirq;
+	unsigned int reg_offset, j, val;
 	unsigned long status;
 	u32 irq_type;
 	int ret;
@@ -241,7 +240,7 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	for (i = 0; i < data->info->num_gpios; i += 32) {
+	for (unsigned int i = 0; i < data->info->num_gpios; i += 32) {
 		reg_offset = get_reg_offset(data, i);
 		ret = regmap_read(data->regmap, reg_offset, &val);
 		if (ret) {
@@ -267,7 +266,8 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 		}
 
 		for_each_set_bit(j, &status, 32) {
-			hwirq = i + j;
+			irq_hw_number_t hwirq = i + j;
+
 			irq_type = irq_get_trigger_type(irq_find_mapping(domain, hwirq));
 
 			/*
-- 
2.43.0

