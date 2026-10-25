Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938268;
	b=27Vo0qJpHNST0FwTB1R2WaTwB686g+Th493VOfvOqF1El/TWKG5NbcpaLRe+kE2BfDo7
	 e/RpUtIXDbjq2f3CektOckVMyLIaxMieeOzpn4fgaKmoLJKvjsIDC2ElFXuBXL+VeHcZu
	 jgEPFI9+ERCPdo50Pp9C5P7vV4UCM/3wGTlKpkee1Ra+F3p2dEihj7ASccn8bdGPWMSdE
	 EXicoj33/7LMkRiswjIqPasN2Hlie7mKskAEGsevcPRxZRtv/pAxXGHkqkYnARMW9dISy
	 kLrMLyue8iJCv/Lc7dBiydDnJcf3jw5321YOnwimfMMsACxIRgOv+6h+ckcJvYlLC9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
	b=ugsYxbPraMEhZcGl+eT9diGsn+Bp21sCa9jAh6P+1jvPLV/oe2Tu9J29YrDhGFcwH0Qk
	 ClwY0VK5QSR87hK3haZ45P/QUWtYNoiUkZnlWcbUmbDQP46TJOY+/zCvi2APyrTgy5zZ7
	 AXiBpo+ZribfDXWPeMRrOSRuTErsITccwmPBqJZnv3XYWNLT/uQC2x7uS72yLVRsxn7eg
	 KkTYPcz+6X8Q7GJ56vKlZ9gUdodWykqups4+kEFnV6f3+ydYxPs2RZ7V85aSz5yMDAjvi
	 mDzNjPDb6NZUZ3HD1tgfvucu1691yGHiOKx0UreOqAZU0MvlPBQubmKoDGRPxskiSbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Epi+zHdY;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4686606A31B
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 14:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4686606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Epi+zHdY
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25104385e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938266; x=1793543066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=Epi+zHdY9uj5Qh4GmbLn0c9fG1qLVwmMUJekFur6AVybVXQVMo2vkfpiotMjNeCVNy
         uEQTmmGcnyNjpmO9kgXtrDSoh//Au/VIroZxIhPfd9mBXmVK1WXFmx4YppPKlBArakAC
         F0aGVWzGKySrvqzRDZT0OiqA8ohorStD05hnqtlHCuP5LVEkL6sO2HuflsKm7+zXe4oZ
         xOJOVi5g20kNBerWoG6+BHmVJNFsN+Li98bki5uVncwKUWvmFHBeH2tEqCXbGYxippzr
         B4gUcUX0J8ON0NR9z/5f1vd5CfN0gK7iXS9Axp+6XdzNj4zBi9lD//SGjCjUv3jlYDkj
         Y9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938266; x=1793543066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3bCZ0k1sUsBiKGvs8pv4VBiJQLDQGO1508w92UyGOo=;
        b=CJS0+2oSPk1GfSBhnKXCEp3skD+a0NAZT+TZ9Lt2L3TUZWY1vmTbZdYCf0kSpoBFJ0
         KeeQSDgY0brSyarPW2tjWUUFBV9RINdkqD6tDLK268VtVsoUjSiJ+6/bcOqLYA46Cf+t
         wynP58VLNMZjHKqaDS6KoPnX5ta+q7L1+HKtsK4SiWtqLUrqS5d7aNYl8xHpwT9fxSPl
         QaxBmTn1kc69YBOMdhJE4FQwBn5ZornZg+e3m5ev3sHpV8vVjLWqZxVbh98doh0uplyX
         QdqRSvsRHOpQ5iX4PrCPZq4QNFyobhzH/OqMkoYayYHobpqkGmtiZbMAVKiFybVfBZh8
         0mvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrm3w7/kb5nNxjSfBspkN84KUaLnd6wsA+rrQFnyrztZbG9h7zPkrWNJ9AuD+ueyw1opBKQCgaOvLC@vger.kernel.org
X-Gm-Message-State: AFq9FYI5u10TZDvznhKLBBzkuIADxgiB84Hs4d10kWnQ9uHtOOIzW8aK
	+kIdnE7H0Th74oLrdZAKUSO3ai7AtNS7BMXNog3tjxhJLSBkBnRoOUfa
X-Gm-Gg: AYBFou3Dy2fQCLx98fcBcgm8QHAYq3tvBZA4awNic0b22MWM6V98LTTwFgUmycPGlSB
	PSsIJyoTnPCRAJaHJdMoy1NU5smKHZzWhNVrErADlLMPooYOcFVbu+/SM2Ogd6Xjr5S222g5VK3
	lbI2ty/LmgYasy0qI78S/Z/ERUWhYNgPf93tj90jxam0BpeJTo1ZlaSe5LuVSv4v/d9Q2mLnbhH
	3gQJXl5aWsq2Y7gk+R6gFu74QMq95LOieORF9OONOaCoC2tjoQ/PiJ4rnDUiBpl+PBtjzxiTqEi
	RxOGOr3p1MSGzU8p8Y3mQrCJKQCZE1YlKexPp/p4H5jmPaeFk0yz6bRP0SESKch2mGWDPJIGP4t
	n8RSQ9eAUc9K2ojjxYpUfdj3zWWMVf2vpGU37NPqw0MEGDz8W6wjeR/4gZGbYFRGK6F5mEs+BEh
	fjes/MriGl3sYLh9HxoNGHna2Mt4ngvvDX4BYt7RwkEHrYd0FPRkNEq3m97eKiCSepUJ4VkPljh
	P/67TgnXw8bjEqUWy6HVZPPO8VqH4XU9nH0avY39+HNS4aVclv0vr4Im9K8MEEtBZL/ANJqxkNa
	hE4W45aouRKaCQ==
X-Received: by 2002:a05:600c:5307:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a35acc41a6mr66595165e9.35.1792938265782;
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:25 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:10 +0000
Message-ID: <20261025142412.112216-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
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

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. Apply the map to the A733 register
layout too, which so far ignored it. This also fixes PK on both, which
was numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 801f62abc93d..940942bf6f95 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index d09467ed437a..57a1e5e48f35 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -248,12 +248,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
+
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
-	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
-- 
2.52.0

