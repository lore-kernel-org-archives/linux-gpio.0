Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022750;
	b=eXo6SLNeLTK+K6Na9r2fdT9pDh88lJGul+kqfH0TRMHPP+t/bYa6S0aYO9ikBdXOoWAv
	 aqWKqCji2qW+kNuTBhhLG5O2zhaWjK8oxx34Q5xGFzLGIbxeqVacsEHSA1L22YveuaEOf
	 cPm7SmEjX0AY69Jcc5MwGKwaKwxK/n9tUq+jhLbisFC3WqYLmb/ou9qe5IK/8SJbCLaUe
	 /IZ/zlSFI7dkAqDOVZen3fZfSYH07WOMHILhqBPYoS+tI/ddTv+Xn4AGxVLbwvrohhxyS
	 6IH2J1e9zqqSu1o8DGgWd7xV4WgdfqfF51pEEZUDX3Sprn2pHLzg3zZpc0k6j3SNp2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022750;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=MYvI0B0AFWkihxav/JeCGDvAQMA75yeS8e5SiMbrzBQ=;
	b=r9W3+GMlpVR9TeVHRA016kjIXaSJf4fBHtyTGXb5vQUx1+Zof6QH/7J96USv7hgc7drN
	 rSwQqtyKVlTa72XwQgEL4oKNou5VEAdOEJ4hNlqgib0h/YojkBLx2Hn3WxU/Df3Q9Wc4I
	 oN30FA7pGkuUtDc3tqNnVpB0hen6NJXlTPn1V1Dz8T9+mgnM+JAi1G/sAE8QOize3lC13
	 OfzraStYPK8teX9LTutKZMw7aIMBkg/d8ruCFZISAzFV2+IsqBOQGAhTr9cZVl8jgtlAK
	 jBMVmvnFVybVBpb6hzEnqGzZSwZgl/dQvJ9M2RowcgB8zVQ01F+tadJ9BUVbOKl/5uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=G1MnETu+;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Ca851AO6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FEB606B5C6;
	Wed, 18 Nov 2026 17:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FEB606B5C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=G1MnETu+;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Ca851AO6
ARC-Seal: i=1; a=rsa-sha256; t=1795022741; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IXFslFJGSw8uleKCJRavp+7s5A+FA5WxsFFZnRWSzPbasIJO6lTgahKZm4P4aE7Phb
    LwieVxr3LIpWBsV9Yt6UzPRQOZvDNFPsBobetkMj0iR9lgCR5zAVSp9QwG3oWsyVqGMi
    NR8DHR8Xhy3yjS6utG+9GuRCobPrDd5VT8CGbrvurEZPn+CYRYkWy4nFRpIBWK+Y4o60
    9aDGXDYkdvGwFZ8FgyECThYJAU9e9CT0hgS1JjorDoM6o+qpprO4G/4BCoCuDTZ2sOQ6
    4qv9L+tXGcv/L+BtHRZyOda+uan2+iygUGEptRyzBvr23sU5RijXJG8Xi0ad1eykC8F1
    7xZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022741;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=MYvI0B0AFWkihxav/JeCGDvAQMA75yeS8e5SiMbrzBQ=;
    b=crU13TMjA85qrj2ntpL5/mFbfH+Z1fWGeH+WBsGikRLg0weY1RDXjcm+hdxaWa2MUk
    6pBHmDLKgezVtI1aWjgiJsJzZ2lxN8Qs8vK2mSGlmfgp0vAJPLcE7cZMCgxgc7doz3Wl
    UBZptoJ/OdfJ8D7JA+9tl+boblMSsMqF/mW//cB0DHzzosJE1DDVspeMvM801k/nhcVx
    j1SWfLfvMr2wQbuqYsB2jDEku6UOIZ3xBJ809SXgs9Ytw4JZCvCVg0vPC03pwDue0vXu
    SdXq4vQmVmlf30g7V4JshqPLl5idfJJlskUDudXMvQs62g+LuzqVUdF+3DvP59Fpnvea
    jLIQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795022741;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=MYvI0B0AFWkihxav/JeCGDvAQMA75yeS8e5SiMbrzBQ=;
    b=G1MnETu+wKGb+E6G11mfXeYmbo2+5BgNciJXigV1KR/zOwVFstsv0QOQCZgyWqWIh8
    DbvQajA+Tll3V3JrUOlrVL5NsPGwA3HJF0zlg3deHYxl3b7LZIV1opBs4A6b+PUiGHAf
    vpHokJATtFoAoj8SJXoeHVyEiYrAnuPOIUE0XRlmn7Cnfv4wo7DfQZG7Vn+b3lcokqVr
    FZ9wZR5IvUXs3Wi81kSF3SF4xaYh11Gf6fr2Mg6Y7scIbL5aDs3mHPq2AmRn5aosqiPB
    rR1/vHXG7d1msWpdD2oCaL3d85irwICjV3MvThIh5M8Q7lpVb7XtnFSB0kr2wh8fyNhQ
    dFpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795022741;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=MYvI0B0AFWkihxav/JeCGDvAQMA75yeS8e5SiMbrzBQ=;
    b=Ca851AO6ase+M78IF9QZcZElm6cK+Cz8zfEVO4tD+N0Gf9m9M1T+GGrAxnfk4mNwDW
    Jvapn1FsJbw1XBgWZEBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AIHPediX
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 18:25:40 +0100 (CET)
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
Subject: [PATCH v4 4/7] pinctrl: ingenic: Add X2600 register and GPIO IRQ support
Date: Wed, 18 Nov 2026 18:25:34 +0100
Message-ID: <57c9892c8e1c34308c18ef07bc007dc9506d6e04.1795022736.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795022736.git.hns@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
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

Notes:
    Changes V4:
    - Simplify the GPIO port index used for the legacy global shadow-load register.
      (suggested by Paul Cercueil)

 drivers/pinctrl/pinctrl-ingenic.c | 49 ++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 7f65f3abf05f5..981789e468ac5 100644
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
@@ -3852,16 +3863,34 @@ static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
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
+		regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset), offt);
+	}
 }
 
 static inline void jz4730_config_pin_function(struct ingenic_pinctrl *jzpc,
-- 
2.56.0

