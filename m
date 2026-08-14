Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DE03DAAAB;
	Fri, 14 Aug 2026 02:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676252; cv=none; b=gkbOJt5Ou1U/T1Jkuu1+i6PCD7vwhDCtBbHEGWPlQzc+4IOHq6SHWZpDS060HPQU0axJ0lh1rrgL7SDbLnC1vZ/3vbY+nZDetaEp3kIbgD34Sv4DcnrwpxZWBB7MgXpt9uL8Tp6D9qd/R3TjJhPG6Y9NyEt4ldPVzQ60z8AC5bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676252; c=relaxed/simple;
	bh=HSV8PgiQ1oKefcviRTiL6fgd7yyBflzimdKTFo+bGXE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2MNmiKlc9uwo3iC082s8X9BklZzTq4d3k+jOYP+EMVHBh4m/4dBaTOu29271eccu8XJhM+PVHNctTMSSEWE99/V50YOhLlPbWeXD1dyANPPrcEVe661k7c9tgAdW6mf8nsqLuq7b2DKnlWb4VpnLR5Tom6rAC3Jcrs6X7hGIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=k87EcII8; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="k87EcII8"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67E2vJhbD894031, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786676239; bh=M3miBEUEUEjdxMx5Dpx2RjbMtTyPGclgWQlhbEgIsP8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=k87EcII8NQNUX/9HkF0YizQ7NOd6nkLf8vHIeBpgSUBGuOh+jftvueqG1yKCrLKoO
	 xM8Z3MtFCIhxJTGt9GVSUOEAE3mB+zMt7t/Aw6+SBhbPOznew5IjHmfU8PyPk92TV3
	 nWQ5qqkqMqis6ZDdb89ydc9qaibdBK5Ly8gyd6bnX9c9fWUrxgbAf0z4+LUAiO7/7e
	 ccpHtrrNe3j+JsO9tJ8nc3yvlpLiJbTuiPKdbs9N6hv7J9KeNAJhigJlVkLe5Aw3Qm
	 F0l/lHcsMXHcUabiJX/EVkV581S6THmUc3nR1tgiV95sH5Tw8NC5nHaM7nW+F7Rx7q
	 5Ppedoz0rAjGA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67E2vJhbD894031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2026 10:57:19 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 14 Aug 2026 10:57:18 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 14 Aug 2026 10:57:18 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>
CC: <andriy.shevchenko@intel.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <tychang@realtek.com>,
	<eleanor.lin@realtek.com>, <stanley_chang@realtek.com>,
	<cy.huang@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v2 4/5] gpio: rtd1625: Replace pr_err_ratelimited() with dev_err_ratelimited()
Date: Fri, 14 Aug 2026 10:56:56 +0800
Message-ID: <20260814025657.1400452-5-eleanor.lin@realtek.com>
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

Using dev_* logging macros is preferred over pr_* in device drivers as it
provides proper device context in the kernel log output.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 8f584287c2e6..613462614210 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -221,6 +221,7 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 {
 	unsigned int (*get_reg_offset)(struct rtd1625_gpio *gpio, unsigned int offset);
 	struct rtd1625_gpio *data = irq_desc_get_handler_data(desc);
+	struct device *dev = regmap_get_device(data->regmap);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_domain *domain = data->domain;
@@ -244,7 +245,8 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 		reg_offset = get_reg_offset(data, i);
 		ret = regmap_read(data->regmap, reg_offset, &val);
 		if (ret) {
-			pr_err_ratelimited("Failed to read IRQ status for GPIO %u: %d\n", i, ret);
+			dev_err_ratelimited(dev, "Failed to read IRQ status for GPIO %u: %d\n",
+					    i, ret);
 			continue;
 		}
 
@@ -261,8 +263,9 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
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
-- 
2.43.0

