Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96113DA5AB;
	Fri, 14 Aug 2026 02:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676242; cv=none; b=aC9W1I+5OrlFzC0TRxi52Ok/qKSLOdENkYRzEtGNw6DDbbA0nDQLz7Pe8bw5Apw3S7fKYg5bzYE3eHA3ftS2nL+Nuo9kpzSRxrqe9nlPgqDztRBSlIeEXgIpFuFIgiep/T8YOpjtapKtYxLs/5hJi6/Oq6/pRze40YrHD+XxEMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676242; c=relaxed/simple;
	bh=C9yTzpEYGtImS3AkRGNg0Vf99cSsZhRIwU5XWvRM8Cc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MFULsj6YmmxdFZLX9DucYiV8uEukaWDULKZVYA1w1pqgRsvgWUluHA8gb0XfUMLXK/k/TaIizupxNyZLoi2Dnn6qlWw5lFZSxeVevSgHikxipPpvfXw4+5u03tsyo35n9TTPghIC5lnmm6c3VE0Ped6F4WxahUeeb4XIwdlM1No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=tI/K9dTk; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="tI/K9dTk"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67E2vDMO1894003, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786676233; bh=14a69RfFYx7F6p0X2iS8xmTtP/E/XE2lTGCkOProcuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=tI/K9dTkSmZAEOymQW7ztEWIqtG4RhPz8Ce7Vyo7Q5LAXn1uJJXaaeLrUU9vam/Tq
	 VIYjioL8OmtbBX3XbKEUzDTgWBhusA/pJIQW3kQv9yAk+T8yiSoetEIfJudVFnELTi
	 eJ74xkhuXxhnrMLr3bLTHb6SHLGQ/rGGjjunTFWVS2hI+Jc1ejJCF/expxYOTxHfg/
	 IxBzbMcObvWOuUZMjoCEfg1RgdK94q0k+q/uffqHu01ITmy+Qjwe7V+se3R2GnJpIo
	 weWDRZ9CzsvtvCix4+9rC3KMjEqev4IWXjIy0TfksxHX/nNSZKJ9D4TmwpdaTeEf46
	 LvZL90t0UTLiA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67E2vDMO1894003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2026 10:57:13 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 14 Aug 2026 10:57:02 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 14 Aug 2026 10:57:02 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>
CC: <andriy.shevchenko@intel.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <tychang@realtek.com>,
	<eleanor.lin@realtek.com>, <stanley_chang@realtek.com>,
	<cy.huang@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v2 1/5] gpio: rtd1625: Minor coding style cleanups
Date: Fri, 14 Aug 2026 10:56:53 +0800
Message-ID: <20260814025657.1400452-2-eleanor.lin@realtek.com>
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

Address a few coding style issues:
- Drop redundant initialization.
- Remove an unnecessary blank line in rtd1625_gpio_setup_irq().
- And move the comment closer to the related code for better context.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 483e44cf5abc..910004c423df 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -107,10 +107,10 @@ static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_ope
 				  unsigned int base, unsigned int offset, unsigned int *reg,
 				  unsigned int *mask)
 {
-	/* Each GPIO has its own dedicated 32-bit register */
 	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio);
-	int val = 0, ret = 0;
+	/* Each GPIO has its own dedicated 32-bit register */
 	*reg = base + offset * 4;
+	int val, ret;
 
 	switch (op) {
 	case GPIO_REGMAP_SET_OP:
@@ -486,7 +486,6 @@ static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_g
 		return irq;
 
 	num_irqs = (data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK) ? 3 : 2;
-
 	for (unsigned int i = 0; i < num_irqs; i++) {
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0)
-- 
2.43.0

