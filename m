Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690203;
	b=LmqiTUxz/JpYqFukPAe7fJ0p54/ImInSef/hMfZdx2IoCkegzLMekcRKTkIDxDlmDfxG
	 LQnfUN0QLf2hIUNdCzKIFjh0LDYMy/2W7/f5/vEU1QnOzQxA3LyIKXxcBe0VzU3QbgrBW
	 ZGnbqARmay7y4RK8Pjo0RYI3PTzLRJQcJhrm678e1+qaL9CT/mgdqBnub3RCYSjH8ElgK
	 QSIRZddxtjdoK0Eq5m9wtpxXn+O0msqRSHpbr3Jp4BYD4mUnnYdwXnkoAvA1KZUZmKapt
	 dj4wLXYaTtfvWZYZYf+tvkBMNemy6oTiIqEl4gB16e+ABY/2JdYutnJsBpR8r5cjVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690203;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jMsdtwCbV5v0zb6ZC86ZF2reRzr1NvmCVm7BDIN6O6s=;
	b=ivn7vf25koVah1IJag9GfRo/BEsubguL7wfY1c7ctN2YYTqXsU2g6eF6+CPuCQdO7Ciq
	 9L+X+j+09FW6/JiXBhNSaC2WoHEWDDPBDrTYTnv5CFdmMq+fDvn5wSaj8gzgFgjfuW6HB
	 xLr1t95NwEkQSuzi8XyRC9awS+FA27HFSqzyRL2Fp9QH30E7HZt7EICafo0Tl8BpoFtNx
	 2rAeQrrBYBLU39uJATtFzqRx2FZVpSmbPHrCn0A0t7z5iDwaWuNTDM0WOkcuO+oN6Oki5
	 ONxKHpTNLzJx1JGQr/a/K+agOhQ638QVy7SfShvARZwgQd+5e1NrCSklUpTpXSZJz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=F2R2bmyu;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9A606A323;
	Thu, 26 Nov 2026 10:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B9A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=F2R2bmyu
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 43655403EF;
	Thu, 26 Nov 2026 21:49:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795690194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jMsdtwCbV5v0zb6ZC86ZF2reRzr1NvmCVm7BDIN6O6s=;
	b=F2R2bmyugO9Wik6VrsqtltgrnjxLDfBrWB/7KeEYHci7kKRs960fMakOamSRLjTb+YRp7F
	o8UKPVpts3PBiISm9oiH8ehslTKZIHOxEqJmCZtoRMkD9fTonvyW3gPp8pm2GN9hUNeyoW
	j3YTDZVaUPqPZf4n+2yJjZ1xW+bNfXJwkwlE+L6Dh6Ya5MpknNmF0ICebUeU921rt5lvxw
	QlX6i8l0aLluiTF3sirVhu1UlADxVtQit9bXYTwl8H5DKp7Vr24W/WCWPi/ZfAb4X5NkoJ
	vfHy+E48UgO5W9o/ylVVHtl86g3D5sGBd7847oLJ7zjvbcCFun3RFDwa08ViPA==
X-GPT-Reason: legitimate_personal_technical_content: The email
	is a standard Linux kernel patch submission containing a functional
	code diff regarding pinctrl driver refactoring. The sender
	(alastair@d-silva.org) matches the intended recipient domain
	(alastair@d-silva.org), the subject line follows standard developer
	conventions ([PATCH]), and there are no indicators of marketing,
	phishing, or urgency.
From: Alastair D'Silva <alastair@d-silva.org>
To: Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] pinctrl: sunxi: Drop unused parameter from sunxi_grp_config_reg()
Date: Thu, 26 Nov 2026 21:49:54 +1100
Message-ID: <20261126104954.441427-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sunxi_grp_config_reg() takes a pctl parameter that is never used.
Drop it to match the original signature.

Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf4ec4665e2b..d30a562315aa 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		else
 			val = 0xD; /* 3.3V */
 
-		reg = readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
+		reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
 		reg &= ~IO_BIAS_MASK;
-		writel(reg | val, pctl->membase +
-		       sunxi_grp_config_reg(pctl, pin));
+		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
 		return 0;
 	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
 		inverted = true;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..3060cef3705d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
 	return irq_num * IRQ_STATUS_IRQ_BITS;
 }
 
-static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pctl,
-				       u16 pin)
+static inline u32 sunxi_grp_config_reg(u16 pin)
 {
 	u8 bank = pin / PINS_PER_BANK;
 
-- 
2.53.0

