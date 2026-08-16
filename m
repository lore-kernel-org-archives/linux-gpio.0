Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834135C181;
	Sun, 16 Aug 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893482; cv=none; b=AJqCuX7EqqpaGULuthgl2Y/77aN4SR6X7AkFPfNqEcZHO8DOovhVxb3svJfN6tBeArzOTr7U6+QpJOZuXVret5Q402POLgptRDso2v+FW5tWF7vwdzqND1eYl/DprqVqXJNf71fsT934DZeQAHFIMtNYAu7SKU1VAoVdGPJRtU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893482; c=relaxed/simple;
	bh=GdzAoEDQT++fTcAyIoeCk+dgcwEerEutGc6WGC1MjdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SQGd6rvYI22xQc3xMszrHftEzcKFoYHAK4T53wrR405JBEWsESlfleu5HLeQcEjromdXGXnjH8+H/yFIP64LUqHrA8mYG6JgIVkeEIYmZoeeHQTul4xA2sDjZ00MpmDQc4Ai7XPQ2obH0G1/s8UKQkY04O72bxHd/rQBLLVfwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=NqhuIrsX; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="NqhuIrsX"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHforE3038973, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893462; bh=obYzfZ7GjUYXMI83OcE5jBqMpkRGViodkqPVR8SGJos=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC;
	b=NqhuIrsXSFJR87ALEXHmOSwnkwkDEbbOA6hZbl7ecMVSNCqn+WfWyceu7X04opgBv
	 UliUNJ5AEx0iixscZ/vJxzeufK95QK8rW4+FB6tYVEO/IR5fzZ/AuoXpBiEE0imPjS
	 Yy4U+wOUEXnMzRXqcr6oU6YQ25J6omxIktU9YkDabV35a7gAJ9FV8ZuhZIru0XtKw7
	 NOqepIRRI+9rEqbRiOmnZg0BvGGCwtA8ntQdfS7QKLmUJrCHE4PFPZmxQysZR7a1tI
	 nkccYUd7I8aSvlxIgHC27ten+LI3lepdNuVv5FxFW4b3/9l7s8MtsYsZK9AaUTN4ae
	 MUN2HoPgAdKzQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHforE3038973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 23:17:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
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
Date: Sun, 16 Aug 2026 23:17:31 +0800
Subject: [PATCH v3 2/7] gpio: rtd1625: Drop unneeded initializations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260816-gpio-cleanup-v3-2-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=1091;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=GdzAoEDQT++fTcAyIoeCk+dgcwEerEutGc6WGC1MjdE=;
 b=/b3FooVjQfUwHqG63JOWpL63ZbmL7pmVubpo41bXJ5lnxT1W5bDX01iHFQXhK8iZgJQqq5pwv
 7Sckd9D5WksBmhIAG3BRjcSCO5ZpOkZpjCyjLGnBuOu9gWSxxDMUjWq
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

Drop unneeded assignments. While at it, place correctly the comment to be
just above the referenced code.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 469d4e94e4c7..910004c423df 100644
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

-- 
2.50.1

