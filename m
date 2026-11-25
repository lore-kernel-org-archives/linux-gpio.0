Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795589417;
	b=0CSexHLIu/8ThAMMrHTCSdDh13qtOItHdCZCFA3iVGmeWzEDPmOB/NVXK49zFfYPPGSb
	 jZ18ZOnJ67kphn/NNj2m9yubsi0ImFP00AhxBcfWtgBOqQ1gcjIoHttRxQEkwkQyev2bT
	 WrvHIpRVne4PAooedV25hWRqrf+2Yn+P16dR97lvM595LV8ttuRLXM0WgI2D8NMsgamPU
	 7kqRC2Gqyc+z8UT8/cYjvf01cVKRrA0M0t1dr86o7IqVsJ74pN4iRhQ7Vb9MLillNugJT
	 kfPnOgOF+qgmS+kzhCynv8EJ/GbkZucmZjRnYYA0+vPNDUlMoosu1UX/hXWRkeDDy9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589417;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EqcWIe2Khd+m+f6IwwQVpjPcxJ6mmX/6B97P0wgMpYs=;
	b=1jGZh5eBaEKGgLXgR7jcIr5zSsoijoPd5avKFXCyUapXHTNN3YrNSnV6zXdiuavrO1aI
	 Sf4zMDAZO75ESt8jTyzzDEXpAIhdNN3CvERl7CJAJ9lccCuOaPCD3PUqUX7/IZuImGBLm
	 i8HX1xGJlIAynAJQTLDEdu32BF6tbUqQCN89EHxKCmULhbgag95mOsjtzDHjXCYcGtFj1
	 UbwfiE/eRm0GGygYlnmQEiUU/Vg1vmG/jbnn0K9KMEpkiUuXsK6s3w7KeiZW6FaNtMwZA
	 YdHGNUWyf412cjSadIxAaTqF3NqawfVkCISUVCYN+N2uqmN5kr49PBOviLToMXfkhyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jmLCgURs;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=u08RzOEb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.174
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4315606A692;
	Wed, 25 Nov 2026 06:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4315606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jmLCgURs;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=u08RzOEb
ARC-Seal: i=1; a=rsa-sha256; t=1795589389; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EVnnXcN4FSs11NlDIqOS1M3PtVdftBIsq9MndOtbAMwMo076MacF01bb49MRuclRZq
    IhLVYeRJjsIWlvdbQjuVCOCYzOZGKWTp4Ink4+wym19no0N49r+so3aj6M5aughSeaT8
    /08Bi9eiMm9nZT5d+Qd6sb4DauDMKM67eU5asDn9RZyMijyG/AfghDuynVmw9jvkymgi
    KLbuLJLtR/2/vCmOZOJXYbL1Hr1lAvFXCLbM0L48HoXxnTcp0uET1jtWG9SLHxr+cqPS
    rDcxhYhwvUmzd/AItlYhBMcwyn0IeE7WJ/S3XPmZhJcdqAnw4YhrayqtYDroL6+CnMUZ
    FoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589389;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=EqcWIe2Khd+m+f6IwwQVpjPcxJ6mmX/6B97P0wgMpYs=;
    b=YaW29X0nahATGgCm0N0w2I4+daqEXH+yWgPnYI6jJc8Boemd+fwA8q2ypm077HFb/2
    SVkWkJcWv8/euBy4x9h2qxTsUvT9mXjQTPSbLKUEfSqdAu6rdEQGHvCiYG3V6wjLZ8tY
    Jbi5KCrxdDmzEDSZtcMJT6pDFaYYdZROdUr+r++X1TIJBrqZA5NVz6Oemm095xJ2hdia
    TKAn4+fz9tcH6T2SoA3zsOd6FYeWtOtO6oG//UeweXSzSZIc5I79lZ7yH1kjVcHeLbvT
    hniOmXTG5P233VXI+HkWqsJIjkP+TPT7saFgZmrpJSLwVlRSAhP36A9ytn9T1VUkLxs3
    qIEQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795589389;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=EqcWIe2Khd+m+f6IwwQVpjPcxJ6mmX/6B97P0wgMpYs=;
    b=jmLCgURs2oPVlk5Ik8NsSnUj7keVWp52odShEmoMiWubYlwFi8QFsjvpihvT1y8mD5
    zETGd5iMo3yK91ADPTd6TbK/sOMjTdRQ87TtrzYCzA/6EWpqPlmPJqE0zVqG67jrL9o0
    iB+J04ypU+5JmiFVoPYTYg4DD0DdiceIIUdFWu9/eJl3jEpmCHIBy5xLUb1MDUtwumZp
    kV4irscEdBfEV1IJJ0JoYMVitR/s+pDI8kyXPmsO/10UtPhShKt77PAUsnl/+cy5k1K3
    v9/9r9FMK9tZvXZ9q3268y8DcSDQUW/AmeTX2Yf7Nbkkl27xcCjVS/zjkRM5UExurRrC
    wtmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795589389;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=EqcWIe2Khd+m+f6IwwQVpjPcxJ6mmX/6B97P0wgMpYs=;
    b=u08RzOEbyntIyWEy7Flx2USIRPt7Qp3WgBCnwEWeL5fLVUpLL/pTjTOSUjcoIyIfnn
    NByxnQwEWTCI1ch7uMAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS25oMlMiNMn5e/Npe6SVDIvzG+5uG4p/zkDZq"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AP6nm5px
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 07:49:48 +0100 (CET)
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
Subject: [PATCH v5 4/7] pinctrl: ingenic: Add X2600 register and GPIO IRQ support
Date: Wed, 25 Nov 2026 07:49:40 +0100
Message-ID: <3bc16a8db9bd914856d8c167734ac74d8bc7fd75.1795589383.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795589383.git.hns@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
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
    Changes V5:
    - Separate shadow-register base address calculation from
      SET/CLEAR register selection and consolidate the regmap_write()
      calls in ingenic_shadow_config_pin() and
      ingenic_gpio_shadow_set_bit(), as suggested by Paul Cercueil.
    
    Changes V4:
    - Simplify the GPIO port index used for the legacy global shadow-load register.
      (suggested by Paul Cercueil)

 drivers/pinctrl/pinctrl-ingenic.c | 51 +++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 7f65f3abf05f5..2d494227d9dbb 100644
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
@@ -3544,20 +3549,25 @@ static void ingenic_gpio_set_bit(struct ingenic_gpio_chip *jzgc,
 static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
 		u8 reg, u8 offset, bool set)
 {
-	if (set)
-		reg = REG_SET(reg);
+	u32 reg_base;
+
+	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
+		reg_base = jzgc->reg_base + X2600_GPIO_SHADOW_OFFSET;
 	else
-		reg = REG_CLEAR(reg);
+		reg_base = REG_PZ_BASE(jzgc->jzpc->info->reg_offset);
+
+	reg = set ? REG_SET(reg) : REG_CLEAR(reg);
 
-	regmap_write(jzgc->jzpc->map, REG_PZ_BASE(
-			jzgc->jzpc->info->reg_offset) + reg, BIT(offset));
+	regmap_write(jzgc->jzpc->map, reg_base + reg, BIT(offset));
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
@@ -3852,16 +3862,31 @@ static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, u8 reg, bool set)
 {
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
+	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+	u32 reg_base;
 
-	regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (is_soc_or_above(jzpc, ID_X2600))
+		reg_base = (offt * jzpc->info->reg_offset) + X2600_GPIO_SHADOW_OFFSET;
+	else
+		reg_base = REG_PZ_BASE(jzpc->info->reg_offset);
+
+	reg = set ? REG_SET(reg) : REG_CLEAR(reg);
+
+	regmap_write(jzpc->map, reg_base + reg, BIT(idx));
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

