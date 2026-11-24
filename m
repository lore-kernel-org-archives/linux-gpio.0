Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557106;
	b=cTpOMDZje3+CaRp7giwHs2dyxjf2auQQFK13Wpdgza8QIdYnfKKWbFjb43Cjnnyq//fs
	 yyz4BTKoFIA6GZxqjjbFMGlmKAbp60DjMiLFAgPsOHuxy9SX1wgEZdbcIMV2aeS5KxsaN
	 h9z/CScPUF2PPJ5K88aqPDGqztpxEGDwnptgmP0y6AKne2fDRnKytfecp3YwLlzcHqYYO
	 4qo+KrgFuqYrC/lmQmi/qJ8zcFqU7C0Br7bVC9qnBvbW7Pg80MTh1z+xaV6Vwe9NR8uLO
	 xCM478NqeYcIxbRmkJD6xrjwVq2+AB2O8xZlYuJW/2YLDDWQ3sjBdfk3MCqZc4YRbGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
	b=mOwTWFk6TFvL5PIjUq71x1jdynai5ltFj+JDDNEyvqzQX0WweE29Q/JxF9TOOwPvKW2N
	 AZuQb9W68RonzXI5BwnEVrz9fS7rzByv3JAiCBQR1zPePcZHUkqt8uXhyGJkPn7nvUFUf
	 Tj8/Y4Q8Zt6QGil9MG2jSz1z72Ot/mUbzZ9ZL4sdM8jREJVMN8ikE3LWVWvA6yyHJN1Rj
	 sESMSjCEGWIZ5/OckgHOKPwFTeO/9ZhS8Sgy+QAJXTGlZcHoYIqwdhu9oO6EtYlNxLmWs
	 aXHrepur6POmGMSMmZp/HQMBD/E85jybtXEHY0H6IoJI1ablQbya7PaodK8w0cp6NzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RyBkGFcZ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F87606A339
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 21:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F87606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RyBkGFcZ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso62501165e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557104; x=1796161904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=RyBkGFcZgIYHKcwtjpp6I+WRtugULCXa24w6olfSxQU+kNRVD+rCne1DdHEzZoiN17
         CRtq6VNn3Fw7gk+PnItFwKispgw+kdecmEAHoG4/14jZfa2eBZklUDP3PuBP8RCeKf2O
         OFOqA4OEX6wE6Dl1TtqKY1tlkppEqu8WFrWTxBQmhP64dTPUpJ5BD3OCS350oPu53EjU
         0bRjI7U7p3rlzeci1UMRRp9MebOeS/eOCW7OZfsik5h+eluTJEqOaoOvNEUsqOkzOB5S
         JFsCfm2hjpkmdNtRpRxUvKpwDbbayovf9BDNvoHQ/vJiT13vfutdrGIAv6ZrBWsee+aj
         H7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557104; x=1796161904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=cAKyX4noxoR9ftNJZFZhfwrjNkx0LCT2erk0ig0ni33mLVBca50u6uwyInaMMMJXzG
         olibKrxBDC397K4sqagTJ6oVPr67bALabnsjCo8u1i9hSTEkDi0R4Lr21ylfeyqRyqi5
         AJJC0C4o4B4nl88t+mhu/okePcKlY0OCbA810pLr3vvLoKjDPx0X4PJz8YOYVyR+CPyN
         NsuWZ9oQnavdoRJuvxkboKNtEX1ok+1+eV2yotG29plccTw47ipa5UXd+TBHzm88HPSF
         oUhrSNHGo6vKf5ZMuItPA4ZYpJIWy2YSU85HCNzFSg5LhwKjm0odVyyNb1fZac31iLVk
         4Tpw==
X-Forwarded-Encrypted: i=1; AL+hErE94WNL/9KQFhRzLPXqU2BgeAPof+v0Z7Ps4HT9nxBd2QQpxaOJidAsCzgi2sSMQz0JchWNjLwI3KdQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Wt0gW3wwWLoTKZA9mHHitec5PM/jLY6wmTeCRcXSm6VVnwwG
	9dH6VojRfuC40dNzaZGk0Kn6f1L+jp4dJqqI+vntDD9EF5cD74OwaP4p
X-Gm-Gg: AZFdTZd874/hD5Ndqwye3nvRgyqjuJKPDKj99oaE2wdpmxjfFAdnExkyPdKe98H8NtI
	z8wfFhLdnzesGlqD/f/P+DKereJiR+8rXzwOJEDIj5KoUtitJKK5VG1BgnWoSFCN/7GX+kUSBvr
	JKwJEqVkW/HCvGcXOf29p6YJJwhadBI1cKC9YGyS5YJkD8SFsEPrm6vX+iVfygfUZ78oI7ApB/e
	SI0z9K35kP/14GjGKlu2qHLoTH+XusgKgNGb/OyXONwL+Fwig3MP0NL4DlNlhrCmDVP330LNstF
	JYIaXSTZIAvZ8kF5dsShrNmnQOPibJJ3wjedZ3iQ1hl0JxQhzIaR/qgl62brmtWiZt+Kgv9oYbg
	koHH5R+iGIy/iucGiL4dvgpgWcFue9sMUnWwGjffajaCbiz3TZxLVCtcQpLIoxvUfdS5aG7t6Uq
	Wm7Kp/+U00KwrM1ZZfdOvP49SKaQ7M7Mr4SBvWfVEwNBsLHT5Meg/jvw9+DRSxsGgTnZM/zJAEd
	PTgcwJy0E7dvZpfAmEo2AoYC4rJ4b6jFbAi7QJwb3NwXAVyNonOwsMqJ0Tr6rgeXhrVvuGPXMkw
	gESDYNL2j14Aj18YrJmoGh0oAah4/biyCRdpDO7p9g==
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr318267825e9.0.1795557103878;
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
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
Subject: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:46 +0000
Message-ID: <20261124215048.42074-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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
index 001bd42afa3e..f71a229926f5 100644
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
index 8bcd566593ae..1577897a0299 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -209,7 +209,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -222,16 +222,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
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
index 7c2f29e75519..09ebf67767c0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -257,12 +257,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
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
2.52.1

