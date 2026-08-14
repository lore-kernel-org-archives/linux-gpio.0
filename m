Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A93DA7F8;
	Fri, 14 Aug 2026 02:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676246; cv=none; b=VHHisVNMMzD3iycsvAdEwEcXwnyDUnpPvgXR0jcVOYF+aYElPxGBq6IAwc+APdozoHM+2fFZtSm/8/2kyWGWnyEcqd3ju7wqDCDPtbJUje8OOV65YQqZ7ho7bG1RP8VGQ7t9zeJCkOVxkLuqAM2ShF7ta0bkz1XmKoIc0V5X+28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676246; c=relaxed/simple;
	bh=dgzu/IExoAxy2S5o/3+xKb06CS6MmUr/pF7gKPvptGE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMy7kza/FPBqH2m9hZMIA0fYr91+V4Ouw9pb4LKyuJiNz3IATS1s4RmmYuE4icrXX0i/L2Va48XXno/TTuu/ISLuhOCGH5VUQsCZk01nKjtGPE9vnqgvyQH2lqgutXCXbQREvg2QLkJvrwHglXwZBAqu8EVpa2AKLJg+AS/A58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=RoABg03T; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="RoABg03T"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67E2vHbK5894016, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786676237; bh=ixiAV63sHm/+ayZS6AdE9M1dxthGhJ5p4KAKuCYQb5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=RoABg03Tf9xrnxWGAtulJQ6P84zX9i2GCGj0kxYnYTOWGV5cqbR1ufZpD6n6u4n6K
	 xLNBs+B97ga2zz04WL/JEtbjlYx1d2jrIssfA+FTfa+gY6KuBb7KjzTmOO2DSxwLsx
	 uhbUFkTkIhJizm/9+pZs3pludQWDRM+kCRQVtX5m3EbwJl0SJuhQQ2z03p2DpDSR2y
	 KXDyt+Dt3LdET8nZdiPmMMrYmYi/HPM1VU9SQ8M/8Tj+dNqrDlPRy67OGrh1UYD6ZC
	 WXxqMUCHcQwKmf7bURtHC5lPghTB3OMjxUY78xOAJaGstx9Ir/tIpRubYZsB/Zwhmm
	 EOj8q4461bCEw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67E2vHbK5894016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2026 10:57:17 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 14 Aug 2026 10:57:13 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 14 Aug 2026 10:57:13 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>
CC: <andriy.shevchenko@intel.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <tychang@realtek.com>,
	<eleanor.lin@realtek.com>, <stanley_chang@realtek.com>,
	<cy.huang@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v2 2/5] gpio: rtd1625: Fix variable type for regmap_read()
Date: Fri, 14 Aug 2026 10:56:54 +0800
Message-ID: <20260814025657.1400452-3-eleanor.lin@realtek.com>
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

Change the type of 'val' from int to unsigned int. This properly matches
the expected parameter type of regmap_read().

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 910004c423df..0308d7a052e7 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -110,7 +110,8 @@ static int rtd1625_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_ope
 	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio);
 	/* Each GPIO has its own dedicated 32-bit register */
 	*reg = base + offset * 4;
-	int val, ret;
+	unsigned int val;
+	int ret;
 
 	switch (op) {
 	case GPIO_REGMAP_SET_OP:
-- 
2.43.0

