Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557712;
	b=RPoN6ToJhMVUazwEZJObA6q2J16iG86tdhokSqlZJZwVABKliIyDjYMNvQ+i9v4ZZRi4
	 NJp4By+UOLcGpSCnfn5awTbWAo+3TKQp+5CpvGG1cY1OADwmF8f36kuphdYgsx5NRb78v
	 LszoHtVaBpkjnX/AeAtncZcrt6rbR7w5UtZCyrjzNKi0nNU9Rzr7IDoVGCLcBh1gwqJ5g
	 ApdOQi8ABkYGYCnAEcPtH7X+moiXXGCb2mFNJ76YTDhG92bEPCRCqNKMgiGgv63ToASc2
	 r7YWvHE3AE4wpquNLA/EUeAFRTFcjsUiT39ZKU/u+GZqpM/Uo6xYINH0aWsHnmY83vA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557712;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=QA8vDkiOk1D3PFore0ajHzBYJYF+CT81PP30LTjkMPA=;
	b=5gaHzTtz72VoC5JWz0yHUsM6vbCW2rCOPgXHeXKspW/lB0GuCNBREDZtPEdpNG8kT4uF
	 kMJ7PoAw4yUJ7+f/txuYt24yihOxlgBya4QQIMYiOjAK2F9tXAaImHFi2PAa2D+Dpxk9p
	 j4vVojh9LtNgWKoHqlrl2JjH/x4f8aErRcYOcRnQi6TR7SP3NpXFWJH6E0mupYujyYKNg
	 snjpg/Aa6+IhBPckQghGOtRccfJRe6vKvnofMaiZf0xxEPKUMnKkc37lFMTdxV4JYhU1d
	 M3op7FL4iTuNMbCGW5MbLrL+h9EDYgSz2+zuK9+DHtI4Wbr0qGsBKSG0LvKBC2g/Q7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RBioeU9y;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=RsvHULg8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47126606A323;
	Fri, 13 Nov 2026 08:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47126606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RBioeU9y;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=RsvHULg8
ARC-Seal: i=1; a=rsa-sha256; t=1794557700; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OjCmpwpzYtDh6uK0KzhWdXPvNx1uOrAKICOgP/Xs0AjR2yImJaFYvY8tS+erLJiePK
    qm81uiQgzbf9/aba6vG9/8cHEjOStEG63alYdJ6M4dWnW6pOAMUt/RymJmrV1/t/z7Na
    6fIjGjjNabaBWras9VYKUubYmCM/3WA+rIVuvZ13lvYDLFngu0OKKB0wV53NvwnrEMyX
    lO+eHQuecwRe9hw1cv9Z37NM8au5rbEjYRlVE/S9G0nXtDgYJhmgDUlqx297Hat4g537
    j2VO4eKTmfNI/KHkN85TjrVGZi6AmPPyA33UZPQFO9Kd3oH0HPpM2PqtGooM2j4m/eEz
    T5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794557700;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QA8vDkiOk1D3PFore0ajHzBYJYF+CT81PP30LTjkMPA=;
    b=dIDe3Gp6b7notrs+tzNVPhRNT+NBh3YnIIygF5nnxtTNS0hdoASEnwy8Em23dPboDw
    mKZ24pLhJ039aNptC54mNnAc6JDJh8aYm++wpiF2WuKpuhRL330EzBZWISkaH7PA5iHQ
    hKIYj5TRx/C4nsWfBe4ImZ11Aa8j780eXgXEW43ZjtkG0H5PKfESCoUGueAe+oYdbqSZ
    Gbuj8hKfcxc+xQQziyBEHWLZP5xwVNfVP5Sodxs1bptUoZmhyb9CkxUQNeRfP364VWrE
    69+SlxZMQUcsAbRNST6Iu1whnjFzXv+yqGzsYa+NzGj1nCcg07Jmk/9IdLac6a/fUs2H
    gjUw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794557700;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QA8vDkiOk1D3PFore0ajHzBYJYF+CT81PP30LTjkMPA=;
    b=RBioeU9yeWSbitfAjI65TCeOwoTJ7huJbjKAujSX0C4uaGxn4qrUKo0QBiQNMqrIhl
    IxKR/ZKHwQbPchotA+0/IzF0aoRarClfU9TzgYQ4vRRvgePEPo2vjqlGQ2nFIjvsjoB/
    yxpCq1SrYNKynIRZvsVULKna+cdhiUBOprSZHngvICUNywPvkvxkBcXdTX6tGfCoabQT
    bmIyShqrMq4OUAKO8wpEzEUxj+Idwro1q5hr48w5/sgvP6+/Og7R5Z17PrgaUIcK0Fkt
    5fFZfK/iqmoQOPQ21/70QajF3nF+wxv/3hlFB91PI+0ycZbOQNkrLJMrEfKSPe3xnITt
    qZhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794557700;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QA8vDkiOk1D3PFore0ajHzBYJYF+CT81PP30LTjkMPA=;
    b=RsvHULg8q2toJtEgNaxsDQ3hByruZ4y4pB09r9AjRDMS8kA2ci7jwTF9rn1oBd1BmX
    McRK95ZySJ3kBowlAmCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2ZoHmMiNHYIZPrro6QPZGBqKLoYar6phQmxG"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AD8F0FGC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 13 Nov 2026 09:15:00 +0100 (CET)
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
Subject: [PATCH 2/3] pinctrl: ingenic: Add X2600 register and GPIO IRQ support
Date: Fri, 13 Nov 2026 09:14:57 +0100
Message-ID: <1c495c7ac851aff2a798c82acf33bbb33da37953.1794557697.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794557697.git.hns@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
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

Add the X2600 SoC ID and adapt the GPIO register access functions
to its register layout.

Unlike earlier Ingenic SoCs, the X2600 uses a register bank
spacing of 0x1000 and provides separate shadow registers and
load registers for each GPIO port. It also uses a dedicated
register for clearing GPIO interrupt flags.

Update the GPIO interrupt configuration to account for hardware
dual-edge detection on X1600, X2000 and X2600. These SoCs require
PAT1 to be set when dual-edge detection is enabled, while X1000
and X1830 continue to use software emulation.

The corrected interrupt configuration has been tested on X1600,
X2000, and X2600, including GPIO dual-edge interrupts by a
gpio-button.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 71 +++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a62532c49fb60..90c734c74d267 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -70,6 +70,10 @@
 #define X2000_GPIO_SR				0xd0
 #define X2000_GPIO_SMT				0xe0
 
+#define X2600_GPIO_FLAG_CLR			0x58	/* write only */
+#define X2600_GPIO_SHADOW_OFFSET		0x800
+#define X2600_GPIO_PAGLD			(X2600_GPIO_SHADOW_OFFSET + 0xf0)
+
 #define REG_SET(x)					((x) + 0x4)
 #define REG_CLEAR(x)				((x) + 0x8)
 
@@ -114,6 +118,7 @@ enum jz_version {
 	ID_X1830,
 	ID_X2000,
 	ID_X2100,
+	ID_X2600,
 };
 
 struct ingenic_chip_info {
@@ -164,7 +169,8 @@ static const unsigned long enabled_socs =
 	IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
 	IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
 	IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
-	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
+	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100 |
+	IS_ENABLED(CONFIG_MACH_X2600) << ID_X2600;
 
 static bool
 is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum jz_version version)
@@ -3545,15 +3551,21 @@ static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
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
@@ -3618,6 +3630,12 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		break;
 	}
 
+	if (type == IRQ_TYPE_EDGE_BOTH &&
+	    (is_soc_or_above(jzgc->jzpc, ID_X2000) ||
+	     (is_soc_or_above(jzgc->jzpc, ID_X1600) &&
+	      !is_soc_or_above(jzgc->jzpc, ID_X1830))))
+		val2 = true;
+
 	if (is_soc_or_above(jzgc->jzpc, ID_JZ4770)) {
 		reg1 = JZ4770_GPIO_PAT1;
 		reg2 = JZ4770_GPIO_PAT0;
@@ -3640,6 +3658,9 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
 		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
 		ingenic_gpio_shadow_set_bit_load(jzgc);
+
+		if (is_soc_or_above(jzgc->jzpc, ID_X1600) && !is_soc_or_above(jzgc->jzpc, ID_X1830))
+			ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
 	} else {
 		ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
 		ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
@@ -3714,7 +3735,8 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 	bool high;
 
 	if ((irqd_get_trigger_type(irqd) == IRQ_TYPE_EDGE_BOTH) &&
-	    !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
+	    (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
+	    (is_soc_or_above(jzgc->jzpc, ID_X1830) && !is_soc_or_above(jzgc->jzpc, ID_X2000)))) {
 		/*
 		 * Switch to an interrupt for the opposite edge to the one that
 		 * triggered the interrupt being ACKed.
@@ -3726,7 +3748,9 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 			irq_set_type(jzgc, irq, IRQ_TYPE_LEVEL_HIGH);
 	}
 
-	if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
+	if (is_soc_or_above(jzgc->jzpc, ID_X2600))
+		regmap_write(jzgc->jzpc->map, jzgc->reg_base + X2600_GPIO_FLAG_CLR, BIT(irq));
+	else if (is_soc_or_above(jzgc->jzpc, ID_JZ4770))
 		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
 	else if (is_soc_or_above(jzgc->jzpc, ID_JZ4740))
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
@@ -3754,7 +3778,9 @@ static int ingenic_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 		irq_set_handler_locked(irqd, handle_bad_irq);
 	}
 
-	if ((type == IRQ_TYPE_EDGE_BOTH) && !is_soc_or_above(jzgc->jzpc, ID_X2000)) {
+	if (type == IRQ_TYPE_EDGE_BOTH &&
+	    (!is_soc_or_above(jzgc->jzpc, ID_X1600) ||
+	    (is_soc_or_above(jzgc->jzpc, ID_X1830) && !is_soc_or_above(jzgc->jzpc, ID_X2000)))) {
 		/*
 		 * The hardware does not support interrupts on both edges. The
 		 * best we can do is to set up a single-edge interrupt and then
@@ -3849,16 +3875,35 @@ static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, u8 reg, bool set)
 {
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
+	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 
-	regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (set)
+		reg = REG_SET(reg);
+	else
+		reg = REG_CLEAR(reg);
+
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

