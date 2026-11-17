Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940190;
	b=UezIqA1VLYKJQMqmtdcM+2PZeYJ7XDaFf8QqE/6P3n/APdOSLSs7QYyDtnshvj6Jxlnk
	 NPomKiwpOTa3XS7odvzVMLmIZ8rMYBjTBXCJkyaL9KGyjj0Fi/lSriwnUd1acc8EJ9in+
	 6gTzOxLhcsz7Y+ItCCsUUJ2YveApoKxPt5voUEP2KgIZcVlc8WGvWAeJoOukNWOdWy9YF
	 memDepp2tnpl7uIKp90LVnt2X00W1CDoBSoaSDB6BxiSz5sWV58ymZgNxcpBZSS04P92o
	 TY+McnYmr155to88ZfcAP/XtAUQLyKEqQ7gO93NeLrSH33QX7bISGy/qayynTh+TmVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940190;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=YLH5d6R7Oyi+JeSw4wl2Z4r1d32c64tAGVKCCHfqrcY=;
	b=Z8VHkBM1kPnSyawSo8ZVDPrbmqnoKv2e6feFvl94H475518QbVVCLLNvTGXnn0WMff1e
	 bzRHun2rXW8aPaEl/R+kfhLUC9G+Y2Cd9yeVOrEMsg6WjKo1WD/Uxwx/HV0Ykx8hchUCV
	 okLlx7f0kLColqan8TMHmCWJLQIhkvHo36vcpRJsRMhJlF3efbj0q9MKWUgmgLuJY/m9L
	 Wr6d7wgcDy5+f4OXVYNcPu8AAvSO5r4VTSmcuNwhn2ApbNAxkEh3D4AM6+rnLnGyXLfNK
	 bS+/2jGWy+XSFFmOz0T4k/VVGlTkvSU+3zN//lmPaaoJBKnQpPuxU01V+JdL7H/H30g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i7cuNnhx;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ueIa99Gy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE519606A338;
	Tue, 17 Nov 2026 18:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE519606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i7cuNnhx;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ueIa99Gy
ARC-Seal: i=1; a=rsa-sha256; t=1794940174; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jXrBUQXb8nlXMOV/uYIjILFS/03S7V9XncIopGMES9w89jlsk9E72EIID8PZ3N+Ifq
    fkUzH+uIjwQGHI9mFSwR8WU1b9AYUXMysqt7TybC1MAYGNHo06vEhtaVziNfh/olOZqi
    uU2u6p8ExEevi7L7iiYsSWy99WkpIaOhwelPcT7U/MEHsLQe+G+x0f+iJJ+Zk0WxLsK1
    OIh9Jr6vwyGvwHKhVfjdcRUfpP0vlrEqw1HQsZio7ZfYFrU7fTJo6dDGnPkI9l861T4X
    3oO5amkGAdnKilakaj2apcxeXnEcmPdgOg38bIL9TDoWvFDxGZAnd8JulkVyhGHzV4gw
    OPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940174;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YLH5d6R7Oyi+JeSw4wl2Z4r1d32c64tAGVKCCHfqrcY=;
    b=BywPKDZS14E7Pn4RfO5it44YlbT3iLD6ZXX55xgjlxT9Uu0c87D+UXsTi2vmWgGUy0
    ioMSVsKtmQlsMiw0M8dXBDvuOyiw6JSG3NaqX7vNl/x/f61rTFRYjr21r3LGduUcWfNv
    n7CVezDbDMPgeNJEAQ5ld4i2Umkzn5ga7Ka/K9pVJ1zAZSZrfzwyxGxoKf3kytzvoFWv
    2BH4M8DHovA+8oYD0ajVNZBEC2AIOlppkBykSjQKBjI+v4FQQJnPBzq2LGKNeJs1asAI
    bes1OY2ZSm3Ix8H4sraqFDk+GW1nGys0TqkGajEGAq46cByU45GfAPYpq+Y3NBO0L7xM
    2oPA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794940174;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YLH5d6R7Oyi+JeSw4wl2Z4r1d32c64tAGVKCCHfqrcY=;
    b=i7cuNnhxI3NnM11jF77FY4MTpZYreMEMhpN8DMEgq1aq/IHF9E3+Dz0cIibGMmrL2L
    sABJPyePFCZQr+n7pEUoG75pnwyzSiU/oPSFZNVt9TdpiJl7YCDN+9Czw1mwZ+zU02IE
    ZzdodabwbABnenEXVgTnDBmNitelDhiTYyCJQOkZfpykGmiAUPZmBp9a9YOBtBHqx3pm
    UbS7dD97RquuA7fm7U35Z+32kWYPhXGgGrFjpJ+joJ9Jk3iMyelbG7K0KtDXbpEy79/G
    oMr7ZrRLO9ss/3tpeMql8GzUPUSxkjD2Zpg0dvve24W578ggV95RVTUFdYY0Z9dM099O
    9cIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794940174;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YLH5d6R7Oyi+JeSw4wl2Z4r1d32c64tAGVKCCHfqrcY=;
    b=ueIa99GyXNMj8NjabeP+KM8nfHPdAuKrtgBDswnKiqVJfTsg2IYP0CY5gPA2WIKXtC
    3c3X2LxlZoUXhN5wscBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ppelMiNKoEY92nD9kO01+3QZuyyF4VcrvHZ"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AHITYYbR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 19:29:34 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 4/7] pinctrl: ingenic: Add X2600 register and GPIO IRQ support
Date: Tue, 17 Nov 2026 19:29:25 +0100
Message-ID: <919cb7c3be727b2d7742a1aafd22bed784260563.1794940167.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794940166.git.hns@goldelico.com>
References: <cover.1794940166.git.hns@goldelico.com>
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
Content-Type: text/plain; charset="us-ascii"

Support the X2600 GPIO register layout with a 0x1000 bank stride,
per-port shadow registers and load registers. The GPIO interrupt
acknowledgement uses the existing JZ4770 flag-clear register path.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 50 ++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 51a4b1839f42b..f23aeba92396b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -70,6 +70,9 @@
 #define X2000_GPIO_SR				0xd0
 #define X2000_GPIO_SMT				0xe0
 
+#define X2600_GPIO_SHADOW_OFFSET		0x800
+#define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET + 0xf0)
+
 #define REG_SET(x)					((x) + 0x4)
 #define REG_CLEAR(x)				((x) + 0x8)
 
@@ -114,6 +117,7 @@ enum jz_version {
 	ID_X1600,
 	ID_X2000,
 	ID_X2100,
+	ID_X2600,
 };
 
 struct ingenic_chip_info {
@@ -164,7 +168,8 @@ static const unsigned long enabled_socs =
 	IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
 	IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
 	IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
-	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
+	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
+	IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
 
 static bool
 is_soc(const struct ingenic_pinctrl *jzpc, enum jz_version version)
@@ -3549,15 +3554,21 @@ static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
 	else
 		reg = REG_CLEAR(reg);
 
-	regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
-			jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
+	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
+		regmap_write(jzgc->jzpc->map, jzgc->reg_base + X2600_GPIO_SHADOW_OFFSET + reg,
+			     BIT(offset));
+	else
+		regmap_write(jzgc->jzpc->map, REG_PZ_BASE(jzgc->jzpc->info->reg_offset) + reg,
+			     BIT(offset));
 }
 
 static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_chip *jzgc)
 {
-	regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(
-			jzgc->jzpc->info->reg_offset),
-			jzgc->gc.base / PINS_PER_GPIO_CHIP);
+	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
+		regmap_write(jzgc->jzpc->map, jzgc->reg_base + X2600_GPIO_PAGLD, 1);
+	else
+		regmap_write(jzgc->jzpc->map, REG_PZ_GID2LD(jzgc->jzpc->info->reg_offset),
+			     jzgc->gc.base / PINS_PER_GPIO_CHIP);
 }
 
 static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
@@ -3861,16 +3872,35 @@ static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, u8 reg, bool set)
 {
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
+	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+
+	if (set)
+		reg = REG_SET(reg);
+	else
+		reg = REG_CLEAR(reg);
 
-	regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (is_soc_or_above(jzpc, ID_X2600)) {
+		u32 target_reg = (offt * jzpc->info->reg_offset) + X2600_GPIO_SHADOW_OFFSET + reg;
+
+		regmap_write(jzpc->map, target_reg, BIT(idx));
+	} else {
+		regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) + reg, BIT(idx));
+	}
 }
 
 static inline void ingenic_shadow_config_pin_load(struct ingenic_pinctrl *jzpc,
 		unsigned int pin)
 {
-	regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
-			pin / PINS_PER_GPIO_CHIP);
+	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+
+	if (is_soc_or_above(jzpc, ID_X2600)) {
+		u32 target_load_reg = (offt * jzpc->info->reg_offset) + X2600_GPIO_PAGLD;
+
+		regmap_write(jzpc->map, target_load_reg, 1);
+	} else {
+		regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
+			     pin / PINS_PER_GPIO_CHIP);
+	}
 }
 
 static inline void jz4730_config_pin_function(struct ingenic_pinctrl *jzpc,
-- 
2.56.0

