Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B2397921;
	Sun, 16 Aug 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893481; cv=none; b=cvPeB2ObU30o1PCdUmKTNlAHvBFEQspI5K8ke4NpVgirfDo57tDEa6GHiLfvo0hHWzi80y/BucEoZ+NXd8ZXQyA45ms9GKjbf437m6YcqV27WsCYaCfRvEQ9+I/oLC2bV10PEFB1CHtaQnSZKD6V/0CyDJTRC4qvPIxJKp9I620=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893481; c=relaxed/simple;
	bh=8f8KUioz/ivPISRwkDEP6fGpO20vqIcsebe/+NqW5lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gaSxgYK1WlaRjV7wqzXja1LIwY2Ppxork4dedUyKnVrm7xW16gSDfeAnKBUxgd9q6sD+d1tH/yrFzDicfh9ETbQiVxrsyqYLPJFXMjk68r70N68rDtYoTJI70RQ1ZZQUU025uOe4nK4toz5oMq3S9ZWyPzAcRCcaIloPqB2Epck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=dbzfym16; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="dbzfym16"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHg0J23038976, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893462; bh=+s6uAyeXyiG+3LAeeskHw6WeJiTrp/x3Hex5TLX+PLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC;
	b=dbzfym16prNh/G02kSXrtXEf9CPeEX080BHn4y6xaGcpbHLnYrkyB+wsFCNZXhlZt
	 THh+BTP8082wH4iqShC8TgDJkOLjKzD3RTOhnEmXq7fjhUbRj1NraBGw5Lk7qb1MA2
	 8n/hozy8blqHoMldI/cU1qVIdjdXwXolUqNDUVkcH9GYqO/3+1fOt999VUa0hGEoNT
	 X81sxyMEP+SXbM8wO4/TxINYH35gAZzSIk1q+lkABgB1+wLsFdGDH4ZIS3ZsKbg6LX
	 XhLL+swUfY6VzPVSKUDVsiTF5wBAOUY/mgqLyX3FHO/HZs+wC+zBCzPOSmuV4PwgW2
	 dRNgAQqN1JkTQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHg0J23038976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 23:17:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:42 +0800
Received: from [127.0.1.1] (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Sun, 16 Aug 2026 23:17:42 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
Date: Sun, 16 Aug 2026 23:17:32 +0800
Subject: [PATCH v3 3/7] gpio: rtd1625: Fix variable type for regmap_read()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260816-gpio-cleanup-v3-3-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=877;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=8f8KUioz/ivPISRwkDEP6fGpO20vqIcsebe/+NqW5lg=;
 b=a20DImAiGsC52DZ2EJ4CH4Szxbyaa0Fb0u7aUdlOe7RI1E0WxdvKUfaAWXTSblFhddcyUlcwS
 F5hQlMnjQReBZZ4zQMio8XyLv/tV42xZLRPa5AJks/b29uEu51E462f
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

Change the type of 'val' from int to unsigned int. This properly matches
the expected parameter type of regmap_read().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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
2.50.1

