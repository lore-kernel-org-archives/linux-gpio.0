Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987709;
	b=YPjSH59DtlNeHcKjsEmenzzBbmXdF8oRDpIM3uXEEOjJfmrUB53lsygNs9RRm+hnpZks
	 0R4Aq1ak2Agfgj11Ws4oBE+5GIfVWQZQMgcS3nyDRucQ+274rKIbm3sE4O7CwtQKfWTLf
	 1Ns65Y8PousPxEPZmScOPL6y8+Skorp3Ll+wXj3LVW1IbpcFjGWg1VzTbFf2SYi8w6U5+
	 dg8qDlzoAomVu9mvOf0yWrohBFF50fwm1RNEy1VA0mGkht+UfcpEHiiGpuDMWxaWRbGss
	 626Wae9y8SPwQJbHQSfXBjVNmPAYbp467ImwWrhjNkj7PML4ri+ffgLBbguT97nY09g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987709;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=cx0h6P4eSZEMJlu8wdQOhAp42YWc1sSb+F3BkHlnJEM=;
	b=YKRlVBRiX3gRVaq6cQCX5tj+eKA/zhry7u1P6RL3RujBy8MOSmwcYHPiNJaYjxIACm91
	 XLPTQAcZaEZXl4Y3vTZ7NQhuvFHKITJMx+PQnYIAeBnmpDczC9siVccfbLNMnjT04G1ur
	 eT+lwdkY6yHeo6kng5lviebHnLefVAMReafx+ZITvaASkzruYdIBpYQ924heCOJUf+bNT
	 WjkgTASI7klzF394lKBBWozBl7GlYZLmY4itLRdk4wWLKt0cwwMPFGV36kbb8+6an+heX
	 /u6nNaS+fpQKBdHZDHgtLoJYxGJeZg4hELN0WckcoVLKQoXbb6isrInv372NFNSOKEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ovLTFZOH;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CVsXwi7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60791606A31C;
	Wed, 18 Nov 2026 07:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60791606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ovLTFZOH;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CVsXwi7g
ARC-Seal: i=1; a=rsa-sha256; t=1794987704; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oF574erElDvYo+XV5akTSKOcTKK2teDlnx8LgpNFETwcbcKfCc9eBr206ETIMZC4Gy
    91Ndt1WRZLuF60eNuK4WSogNujPmMBds+hR8mSgVpK57PPJGWOl9F+mFqq/gL7/pJXO9
    5DrHgQnZZZ73wZ49ry6967OkttKi8VJVA0O0nb5kr51onqxq/8Dvr6GC37H9O+Dn2Qj4
    cIdRNIHVeFklRLJ6e09om18k1bWpmvEipmAj6xVVTk4CKmTOGYiKWkchN96uHw9PyA2n
    FxaGxI8li3YOvxvJnjWflqv6iQvKKXyc0KQFAmH9Gm0tFi9L+RBoGHr7bN668c/Fq5MV
    1Lyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987704;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=cx0h6P4eSZEMJlu8wdQOhAp42YWc1sSb+F3BkHlnJEM=;
    b=e7iISQelqiCJWN0f3VY8AK63Vu2hpbri0VANbTtTjICEjJ+sh1sVzHE4voezgbgNc1
    J0I1D/v51K8aHZnHJNiNy/mX4S2SyTcTbh7psnAe+yAwVgUZHjdlD1zVnhV3FuGrIuYD
    x5cF1U5SiNPLfNtWsewPmcoDuxqZmypDvql+CHvxuoAnMEIl1a3lSjB9JOnBed4Cwpse
    eiKq5kWWrprkyL/cEIYV8NTiiyIoCK93GCIsoXU5HgIaIc65hrEhim5+wTLPHN63c2zm
    0pzSJHLWKTFTm7BmrLOhO9NUuaOJbzTHFWA0r2irOaBk6l7QCAGSJ39srtHNIxA+vYQY
    DLSA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794987704;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=cx0h6P4eSZEMJlu8wdQOhAp42YWc1sSb+F3BkHlnJEM=;
    b=ovLTFZOHtI22ZrxbE8XoaL2qm3qbDbHZurpLlF4hKJjVm5N4GOUF8omAIzKSeXAkpc
    vEpRBc6DU/zXXFJKVgy2o6kow/ZXE733KZQ3VOBQCztxeST4Kqx1biVt1ELMCgLO2g2q
    r4G48Rd+16EAqHQIit9bewp2cQdrYBMmROYXw7OGBDfqy57UbrMPh6Co0Anictd4S9aO
    3R1VGe3jFe/WvHPIFiJKBY5tMIrZNbQk+mPcbenp1sk+7/2kc32+nbRj4ufwDDV8jtR0
    USF6H2757jaYaI+iAADjXHCOUBmJB4DctBAzx4HG1lkQp2VV/w0YErvZ/kVhvRX57rN7
    I5Mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794987704;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=cx0h6P4eSZEMJlu8wdQOhAp42YWc1sSb+F3BkHlnJEM=;
    b=CVsXwi7gl8n6Un3oxgSDgU9kuQVym1NpOEaKjBxCLWOuJEiwEIgdFitJUrNvnh/C27
    onq84Nl44KK91695zoCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2Jpcm8iNZLZ2IBizV+3wFb55dglUeZzcEX9J"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AI7fiaVa
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Nov 2026 08:41:44 +0100 (CET)
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
Subject: [PATCH v3 4/7] pinctrl: ingenic: Add X2600 register and GPIO IRQ support
Date: Wed, 18 Nov 2026 08:41:38 +0100
Message-ID: <ccaaca07b0b6764ce65ad746bfeb9efd362c3bde.1794987700.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794987700.git.hns@goldelico.com>
References: <cover.1794987700.git.hns@goldelico.com>
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
index dc5d38c16e18d..4f1b096a3ac8e 100644
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
@@ -3856,16 +3867,35 @@ static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
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

