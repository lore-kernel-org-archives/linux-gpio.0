Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B223E342;
	Sun, 16 Aug 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893482; cv=none; b=oV028ZzLbTIhPbA4dGtIaIO+xmsHAgZt2qo62twEq0TxdBeqRJ+lWR6MxWtFSNJjQzkoZFUbuUwKCZinw7SJxRSeXb8MDtj+q8e5sEfqW0yLI9gdFsJc4IQGC8tjoDSfsMufI6LM8LTTt9nZ3C7IHY65XsLiQICmfULFipHFFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893482; c=relaxed/simple;
	bh=jeqobHTxQwBG3If35Er3lBvimevNN5/CdTOwWaHTfgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a3u6FSSLlU3rYXLbou1qSZkU0q1vP9ofebqtHOYW4F+s20sSPYjNfRBo4JhQmUus4CoVr6ByibfFxOt8WUo8DVLDRCWYnk3qnkHPwUn5wi9OauHKUW8ha1WB8QxmHfs5GZL+OpunA98vLMuxMl+xj8A8HqjRkGU9dt/IOWD7TDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=icX1uXQR; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="icX1uXQR"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHgtlE3038982, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893462; bh=h5XB1Zz8P4Po9paFlccxkrt7thBhCAzdcx6ge4Pf1CQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC;
	b=icX1uXQRd1nQ9R8ZdNbeAIvKHDLpv49TlEA8Pof2Pws9FuB9vlE9VTnUxCAd6ZzZZ
	 1QRPnBExke5vcEdEhHHRmMjV+H0acD+LcSnNGHPABT6QJv+VsIIYIxBRBBmitc2s1A
	 70/bCeTK+5ovdkHbaLW3vclIpN1BZ7ERIK8D6irehAuUOLjYBN2SXOIwO7OLtRPJpB
	 1k9j4UQokRDPal6jgZOi6vEbNTYgOpOHw48NsxHZnGli8TYMYq6tZOdmrAVFnzh/3q
	 4I21UD8FEsLQ2GarrKo036wv8TahIhbzPjNAlZu0iZRB6wuby0YaFzby6RNruHMoyv
	 WAkVcxxFt2UUQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHgtlE3038982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 23:17:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 16 Aug 2026 23:17:42 +0800
Received: from [127.0.1.1] (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Sun, 16 Aug 2026 23:17:42 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
Date: Sun, 16 Aug 2026 23:17:36 +0800
Subject: [PATCH v3 7/7] gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260816-gpio-cleanup-v3-7-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=1064;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=jeqobHTxQwBG3If35Er3lBvimevNN5/CdTOwWaHTfgo=;
 b=xW9kCyXvaysYzKWM2996iJhZYX+8ioSbBd6XwAFpY9aiJrI4ZCEITl0BqprwYflWeo7JQ6GSc
 YiIcIEQ5QdLChtAmd+qe+cTJkgPGIEvoveUWVCm6D+kPdD/0maj3WgU
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

Use the standard IRQ_TYPE_DEFAULT macro instead of explicitly listing all
supported edge and level IRQ type flags.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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
2.50.1

