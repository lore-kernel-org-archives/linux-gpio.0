Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797C40149E;
	Fri,  5 Jun 2026 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641504; cv=none; b=mQ5sqAUaeY2XmlW3rHJ5aVtdDHWWMcGlIj2hxDY02GXafLJHDj2Seg4hrNz/ljBLbEGoWiKJr3mPdKqTtnMkltS/xbW2Vezb3AF2cLnsqfum4LpisRK3p8DvpFSH8odIhegHpI5Z/VvYV7DTKfSQIlTow8+0e8YDVSHhmFexO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641504; c=relaxed/simple;
	bh=xAY5hWssBNCtFpjMIDeqYTF6QWlBQlC7/Ebm8kSZ1yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=MQ6l3yHm35Ly0GQq/APSHCTHMhqqxQaltrLU/UcpoJ6FM/desjoMPCi5WAi1F0Cmbau+sHunn9GvwSOpx2fmKkSsRfrkOYX05g8E7o+e9W6O/u9ov/pZe1oYTEBrsAoQJClQGwirOuf0XZOf9CilDGiJ0Cv/ianO8c6s8qcJSao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 5 Jun
 2026 14:38:14 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 5 Jun 2026 14:38:14 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 5 Jun 2026 14:38:09 +0800
Subject: [PATCH] pinctrl: aspeed: Fix GPIO mux value for ADC-capable balls
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIANBuImoC/x2MQQqAMAzAviI9W+hEO/Ar4kG0akGmbCLC2N8tH
 hNIMiSJKgn6KkOUR5OewcDVFcz7FDZBXYyhoYaJqcNLw3zHA1d90TO3rXhamRxYcUUx/d+GsZQ
 P58mYBl0AAAA=
X-Change-ID: 20260605-pinctrl-fix-76644e70f601
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, Bartosz Golaszewski
	<brgl@kernel.org>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780641494; l=1866;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=xAY5hWssBNCtFpjMIDeqYTF6QWlBQlC7/Ebm8kSZ1yc=;
 b=mxo5eczYf2oAK1TjLECaN853onZlWHApLvxA+tAckQEh7Sqd68Q2RI0IgpUItFJDSeZ/1tVPB
 d8SQ5ruU3AJD7i8VCiIgymYG9bjKmhGFfVmrQnZfiLchmDzw7IPzX0S
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

aspeed_g7_soc1_gpio_request_enable() unconditionally writes mux
function 0 to route the requested pin to GPIO. This is wrong for the
ADC-capable balls W17 through AB19 (ADC0-ADC15), where function 0
selects the ADC input and function 1 selects GPIO. Requesting one of
those GPIOs therefore muxed the ball to ADC instead.

Write mux value 1 for balls W17 through AB19 so the GPIO function is
actually selected.

Fixes: 4af4eb66aac3 ("pinctrl: aspeed: Add AST2700 SoC1 support")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
index a1ef52ad5c75..50027d69c342 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
@@ -691,12 +691,21 @@ static int aspeed_g7_soc1_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct aspeed_g7_soc1_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct aspeed_g7_field field;
+	unsigned int val = 0;
 	int ret = -ENOTSUPP;
 
 	if (pin <= AC24) {
+		/*
+		 * Balls W17 through AB19 are the ADC-capable pins: mux
+		 * function 0 selects the ADC input and function 1 selects
+		 * GPIO, unlike all other pins where function 0 is GPIO.
+		 */
+		if (pin >= W17 && pin <= AB19)
+			val = 1;
 		field = aspeed_g7_soc1_pinmux_field_from_pin(pin);
 		ret = regmap_update_bits(pctl->regmap, field.reg,
-					 field.mask << field.shift, 0);
+					 field.mask << field.shift,
+					 val << field.shift);
 	}
 
 	return ret;

---
base-commit: 57ae58c5506ade17df728d676a0c73c705f21f57
change-id: 20260605-pinctrl-fix-76644e70f601

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

