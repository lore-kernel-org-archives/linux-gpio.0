Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592573B19B3;
	Sun, 16 Aug 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893482; cv=none; b=Cpp3dPFMVrH3V+GLoVBVPN+4o0qrNorWvaEF6k4MBKX/n7sSBsEQoAz87hJ0iobz3JK826Wk2mAZInnREqfimKfNYzO7DHpaZUctXoO/XEnmZvOiK5W7QX27+Fv4Iy3KorZjs28YkG0gzODsjSDHapqijDnh+Sb3rYanUcsocRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893482; c=relaxed/simple;
	bh=OfHePp2Le6SS16a8nGjimfr+NVm8vMKPGVYyQY2U6wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cNj2si7FGCtLvgur85GQNHxD4CqxZoyzc4eMe4m2PwW9THZVgT0oqdocW9QF7SipomHKZ4xLjvqsB6lVL8FzVYPvIsRuFzulTGuWw11yT9YzA3yum0DMCL4Xz0nIRLHB5V+K2OQF6KKJcKwAE4uuHuYvp0Wp/Yp9MoqGy1EeXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Ns055zsZ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Ns055zsZ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67GFHgtjE3038982, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786893462; bh=/u3dQ9O2iFSGFVN9KFIF09e0vkOWImbUbULg03n07C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC;
	b=Ns055zsZzilGOWpG8RIoilskMgUozwpyuDXL9MWhVlvJzMmBOLK2mmor36p0ma/Fk
	 nmv5RUibP7pt6JyIiE+y8fm1rFSqlT4bbY4jtlBqn0GSAZG9djL9cf6/VfgTxx5Q0r
	 oOcxT9XAJeSxEK9KgfqeRk78Wn9DnisZ/gJJmXlZuq/vwLjgDCxg8vDgY27a6nkgrS
	 UkATLcDWnOk02MJrNeHzxfBMZrigTLNXFPb1XoEXE55abdk86YDgmBQ/DK68hAO3i3
	 gjdRfS5meSdkfR6qKaRMaE0d3q/VIHcTIMoAiD31p2OMMJvAVU/hTJwBAQtgi/ULss
	 hn44zqZJ65lDQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67GFHgtjE3038982
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
Date: Sun, 16 Aug 2026 23:17:35 +0800
Subject: [PATCH v3 6/7] gpio: rtd1625: Replace pr_err_ratelimited() with
 dev_err_ratelimited()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260816-gpio-cleanup-v3-6-f298cdd65fca@realtek.com>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
In-Reply-To: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, James Tai
	<james.tai@realtek.com>, Tzuyi Chang <tychang@realtek.com>, CY Huang
	<cy.huang@realtek.com>, Stanley Chang <stanley_chang@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786893461; l=1957;
 i=eleanor.lin@realtek.com; s=20260815; h=from:subject:message-id;
 bh=OfHePp2Le6SS16a8nGjimfr+NVm8vMKPGVYyQY2U6wU=;
 b=Tf9fbKHSvDhcXmHyop5fk40d/xznIJhEnP4rzLuymk5H3HsC4K8IS+6JuVYebHFncFS0CA5TP
 Di3BLUR9lheBfl9q0zPEVmJY/13ahQalRQ8ypIs0jPFTqedZEmNziu5
X-Developer-Key: i=eleanor.lin@realtek.com; a=ed25519;
 pk=BrWV6/OS+PyXJgzExw5/cR0hiQtaxRmD7afOAe91lws=

Using dev_* logging macros is preferred over pr_* in device drivers as it
provides proper device context in the kernel log output.

Link: https://lore.kernel.org/lkml/anUcSPcJjJkLh0Z-@ashevche-desk.local/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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
2.50.1

