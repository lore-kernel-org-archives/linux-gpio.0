Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F063D9DB1;
	Fri, 14 Aug 2026 02:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676252; cv=none; b=Bnb0Vs4ngLUBzUhwtNkQMeEkxT0gAzm/vCU7G/wNW/gIf0ZF3N9bTehR2lSbKLBchjGJXu8U0e7SSmUVqRH3ZceaNihZP3cVClFuEnLXhlgkwP7/7LyaOGSSZClGRSnodL6uLP84sgdy9ebovrg8eaGEBfB5WBBEaoAH6LNNBIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676252; c=relaxed/simple;
	bh=2LmGUBF6DsBukv50eyGBMl2A7rD+bwayqx+1CXekkaU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqG/OfQB4Gqihyu05WnK164sBiq5mhIpOryiWZ+FwmEthoYobkRukOjXcek0rL+QYI2DeF8jgOpFvUgijnNl8+vYdDgQhuv+qPAxwQFXZlrqEG/TAg+Ei2+HM8jl08AURUoSeX7PQExqVM/Rf4ZO9dSC6FUoODldMwhUxPKVytE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=vlBb3xmE; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="vlBb3xmE"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67E2vJTV1894033, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786676239; bh=tmzRykcW8tTFBDvtr+C1r5+YlVjapwgyMDFcz7Kdwsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=vlBb3xmEvyqU6pkUBnmbpAAFLLr7vAGkaFpI6pnfWjGg334EXBhhqwr8et1FCdlfq
	 sNJ74ynNHg3+x9/p8t1Hydn/zXK+KmANqwWNAWBHCltO1q/8jQC3Z4mg2GSNBG/Bwa
	 Ctsji80dg94UDPSpUZRCMBUHX4bdBF9O+fAK4Z+z4l08DtDWUaq+njZnwccK3BdrS5
	 mZIty2fDUOEf6np6Cl2gXEjGl0QZobQptx2C/CSfMka6VX8Dwa9tAFW2ZEK899B3O7
	 r0Wna0KSgQW9Uh5QGk0i/wkNXxd/L1mtB4ag0NIaD7JBGGoNn8XWjcLLLgrqFODWwP
	 DYCTtb+NMEskw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67E2vJTV1894033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Aug 2026 10:57:19 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 14 Aug 2026 10:57:19 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 14 Aug 2026 10:57:19 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>
CC: <andriy.shevchenko@intel.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <tychang@realtek.com>,
	<eleanor.lin@realtek.com>, <stanley_chang@realtek.com>,
	<cy.huang@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v2 5/5] gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro
Date: Fri, 14 Aug 2026 10:56:57 +0800
Message-ID: <20260814025657.1400452-6-eleanor.lin@realtek.com>
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

Use the standard IRQ_TYPE_DEFAULT macro instead of explicitly listing all
supported edge and level IRQ type flags.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 613462614210..bebd1b8ede48 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -615,8 +615,7 @@ static const struct rtd1625_gpio_info rtd1625_iso_gpio_info = {
 
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

