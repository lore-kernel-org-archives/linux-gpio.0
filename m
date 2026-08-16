Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72156222590;
	Sun, 16 Aug 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893481; cv=none; b=KcgEZtJuprexaWrGvUgBjqmgOWo+XcEvcDexiouNUPbs20gODyhs36CTA+4aCzWAHF0u1qTvlPyxDbnLfaeyvNxndgDKDxCw6vSfYuZRwA+RRaN3m5/KO/rb3m7WmnA73YQNqrFb2t9MJKVCJ4JyxorVRv12Sxye6AUpt8MWg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893481; c=relaxed/simple;
	bh=6uNM4tvDwKsvImUU21GXrCU0ossqp5RNNNCIRSqCg6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lkBpNZ7rCn7DuOMjLqsbOM4wov3MnM7V/9NDslGkU0nO6L5Xy+5AXRDLCkT+ACtCidD1x4QL1khDev3hQLvUEp3LqyNRFbpEaITqyEuLN9QFkLEtjIZpt4LjtZl6K7xrN8jxg1bFD6fIF6iM0Rm/rDKhXbc8bk0eLyDP1KWKXu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=BddymqUe; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="BddymqUe"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHf5S23038971, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893461; bh=qjlRcTiw3zeUkDisMgUTN5QMqzQYl8eBRj/OmeBWzt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC;
	b=BddymqUeJDsgg0z2X6eg8ke+X4KyoCWsqRbH4wIQ79r2ylYc9htZg+iaIMNDGRFyN
	 O8r+t1fynDw91L9Ddfr0kDvdY1ucRg0dXx8yz22+cCdZFofGYeYtGzAQfV3FF4VWGs
	 hTY7ocxu7vO6bIV3e4+dwQJ+VtfY8b1yJHGqqxl+Dq/I9uir3WlGS7ZPorBxJysG6C
	 DNOGeI3jylCTS7Ozq+/Oeovg6wXp7OBiYo6GGD8Bubbef8Tu9dQeuTxjaF1uqFCTEz
	 p7EFOSdXqbZ39ce7fdocr1dLOAi36MN0+7Iax23Ki/NWCsJl03TUP3lROY/toIK5e0
	 gnXnw7Nn3ixQg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHf5S23038971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 23:17:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
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
Date: Sun, 16 Aug 2026 23:17:30 +0800
Subject: [PATCH v3 1/7] gpio: rtd1625: Remove unnecessary blank line
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260816-gpio-cleanup-v3-1-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=860;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=6uNM4tvDwKsvImUU21GXrCU0ossqp5RNNNCIRSqCg6s=;
 b=8PvOXEqFTtxnm6DDTmpgQFN5LIxzW3VvPsjkcotF1V6TdnGuSL+WlIDE12gu6vYTZCkhnSQq6
 yyBDrBYW3CqA99VWn2qdgq3tx718QZvG0xBFPehz/Zl54C0vpMHCHJf
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

Remove an unnecessary blank line in rtd1625_gpio_setup_irq() to clean up
the coding style.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 483e44cf5abc..469d4e94e4c7 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -486,7 +486,6 @@ static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_g
 		return irq;
 
 	num_irqs = (data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK) ? 3 : 2;
-
 	for (unsigned int i = 0; i < num_irqs; i++) {
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0)

-- 
2.50.1

