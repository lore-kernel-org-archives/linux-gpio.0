Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFFF33E348;
	Sun, 16 Aug 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893481; cv=none; b=XzzzZw1u6DLM9yT4b1oeMSZhjicB3pKRCOEcBJKWK4hK6UVWt39ec75HXwkFWRdcpA5XymLr13kiBvLTnkwgxXGSTcxH/gG6yvPAA/pDuqiMH6t0h79Tkgw3joZKNr2pCV5EwokamCYXODIGdF+2f4rdtWr/Mvlv3GJP1N9cpiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893481; c=relaxed/simple;
	bh=Kf85mG55zBSZTgAAaGAk1OzIoeumdb+rz1C45KcXAJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i94acbFpc/ZAZYAQjEDwtEEO0AqITMHpAkSUKUNBbX5DGl7OJzXvEVyHGRzFtH2ipIibcvKGAxwnweWp0EXs6Eyo8skRnUGcWL07GH0kmL86+VSC3n5CQuQLg+Wh0YsdnMlpGOXja6TZwobGKbBk016ZEo4EwZWlg/6Dv7mHyus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=bRFRIsZ3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="bRFRIsZ3"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHgaqE3038978, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893462; bh=xGCa7qXkLR7naZVJyFstGp+kY6DayQ1A0zOiO7VlqdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC;
	b=bRFRIsZ3wZEZCeeDgINRCWGNx5kr+zB08q+w79yP9Sav1/JYs8bkqakfpBrgeEe5F
	 uq7k0QUC/cno2nOZfXUUOk/b3rJTM0Cnx1KKTNFGwaIK6oRp7O/6zjh3lKvZrzPhBf
	 objrqF/d4mVAAh/iAF3l+GmV09JxJH0SjFq73QFMJLbnNnsaTzHY3eLIQWZlSiCiCD
	 N17WvoZ7yGZtb/227ANGm4zGPesAvDRYAfS7SCpDyUO58W7esZS+P8CeY/227VPfwV
	 G2VLItHn/A4F+4Xm5sfWISx0RK5LFwu1eF+31hMWejz8BtZu3jAqUu9j9A1l00R2O1
	 Ybe5jMxLMqZCQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHgaqE3038978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 23:17:42 +0800
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
Date: Sun, 16 Aug 2026 23:17:33 +0800
Subject: [PATCH v3 4/7] gpio: rtd1625: Narrow 'i' variable scope in loop
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260816-gpio-cleanup-v3-4-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=1273;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=Kf85mG55zBSZTgAAaGAk1OzIoeumdb+rz1C45KcXAJQ=;
 b=E/V5h4FNVP9PAHJBbeXMzWTsJWAVIriUMv6sGHFYytOHzCrDHWp9HFWjnd4MGr6nDrNNQPT7R
 J2fJNB9n8RYCr4VbUI9apYF1YiYCQddQhTIXTVJ3TRGUs5f7VCKNmZ9
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

Declare 'i' inside the for-loop header to reduce variable visibility.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/gpio/gpio-rtd1625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index 0308d7a052e7..2652bc6cb523 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -224,7 +224,7 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_domain *domain = data->domain;
-	unsigned int reg_offset, i, j, val;
+	unsigned int reg_offset, j, val;
 	irq_hw_number_t hwirq;
 	unsigned long status;
 	u32 irq_type;
@@ -241,7 +241,7 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	for (i = 0; i < data->info->num_gpios; i += 32) {
+	for (unsigned int i = 0; i < data->info->num_gpios; i += 32) {
 		reg_offset = get_reg_offset(data, i);
 		ret = regmap_read(data->regmap, reg_offset, &val);
 		if (ret) {

-- 
2.50.1

