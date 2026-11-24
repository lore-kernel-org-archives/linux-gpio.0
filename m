Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513277;
	b=x3ZAXu2oweqze+vx2tAAjSV6Ad9tpmA2znnAZj4FciLIwwWz5o5SeAakBh4NdfyK1dJI
	 TYr27pNZJ5PKQE+j+lWTgxLXG7+59sIRBzicWuMJlLEJbZegFGyNKnmjYBoceQnj9N05T
	 gb49D1bhigs0IgWzu655Sv7S86D30UJ3wlhwMOVYhSRz+llM1OHsSZshCzewodVnba1Ky
	 z/YxdP80sn7KHlrQaLbwWmtJvan+kF66jZ79IItnOsUdbw+zxLy/V+S5q0onrbV4xXtWu
	 ogpt0Ao9UZYZjSNylOlqI34LfA65ltpAzYAvGDIAY02FIgGMvnInNoafU2OmMWL+1yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513277;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9bcEZ4e/7ni52kWsELoQjyQIotM+LGhCx2OzH0/KNHs=;
	b=RZM7r52n3SeCv8Z4t6fR3EMMNkQl4IejaH7Kd09q7yxakuTkhBeCGbPucI4CjzwiBYsx
	 my0dz+LOpL7t2WCxTAKyzntoQWhiGb51xdmG2piI/k02HZnXLTairmivKugxRi6op4rIt
	 6okaGai9dYR96k9VydNLdam3BZUBk74NSiukx+cqp21EXGVWfyDsbNRlJ6YeBppz9s3rp
	 n88jTYebDwr8VqAObnLeIdUutaDtR5RcCC9l05gGmQKitDKLkPadzHkI2lBdpYjQilE9n
	 UO2nDYUN+j0+0D69cwYbePyc8LUfKzxj5DkJ7cgcfKEf7pV5Y+TtwoLjo6cJdD1f51w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF0606A33B;
	Tue, 24 Nov 2026 09:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AF0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVn1M-007e57-2Z;
	Tue, 24 Nov 2026 10:41:04 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v4 2/9] pinctrl: airoha: add per pin mode field mux
Date: Tue, 24 Nov 2026 10:40:52 +0100
Message-Id: <20261124094059.3882014-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124094059.3882014-1-john@phrozen.org>
References: <20261124094059.3882014-1-john@phrozen.org>
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

Newer Airoha SoCs select the function of a pin through a mode field in
a dedicated IOMUX block instead of through function specific bits in
the chip SCU. The AN7589 has a 4 bit field per pin, eight pins per 32
bit register. A group can then need one register write per pin, and
the two entry regmap[] of a function group cannot carry that.

Let a function group supply a pin_modes[] array, parallel to the pins
of the group. When it is set, set_mux writes each mode into the IOMUX
regmap and then applies the regmap[] entries of the group, so a group
can combine its pin modes with a register write in the GPIO block.

A SoC with an IOMUX describes it in its match data with struct
airoha_pinctrl_iomux, which holds the width of the mode field. Probe
then takes the regmap from the airoha,iomux phandle.

No functional change for the existing SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/pinctrl/airoha/airoha-common.h  | 14 ++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 48 +++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 850e733db15a..7a0cb8924e71 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -49,6 +49,12 @@
 		.group_size = ARRAY_SIZE(table##_func_group),		\
 	}
 
+#define PINCTRL_MODE_FUNC_GROUP(id, table)				\
+	{								\
+		.name = id,						\
+		.pin_modes = table##_modes,				\
+	}
+
 #define PINCTRL_CONF_DESC(p, offset, mask)				\
 	{								\
 		.pin = p,						\
@@ -75,6 +81,7 @@ struct airoha_pinctrl_func_group {
 		u32 val;
 	} regmap[2];
 	int regmap_size;
+	const u8 *pin_modes;
 };
 
 struct airoha_pinctrl_func {
@@ -102,6 +109,10 @@ struct airoha_gpiochip_regs {
 
 extern const struct airoha_gpiochip_regs airoha_gpiochip_regs_64;
 
+struct airoha_pinctrl_iomux {
+	u8 mode_bits;
+};
+
 struct airoha_pinctrl_confs_info {
 	const struct airoha_pinctrl_conf *confs;
 	unsigned int num_confs;
@@ -126,6 +137,8 @@ struct airoha_pinctrl {
 	const struct airoha_pinctrl_confs_info *confs_info;
 
 	struct regmap *chip_scu;
+	struct regmap *iomux;
+	const struct airoha_pinctrl_iomux *iomux_info;
 	struct regmap *regmap;
 
 	struct gpio_chip gpiochip;
@@ -135,6 +148,7 @@ struct airoha_pinctrl {
 
 struct airoha_pinctrl_match_data {
 	const char *chip_scu_compatible;
+	const struct airoha_pinctrl_iomux *iomux_info;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct airoha_gpiochip_regs *gpio_regs;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 5ae29e80da69..615b48a056c4 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -401,6 +401,35 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 }
 
 /* pinmux callbacks */
+static int airoha_pinmux_set_pin_mode(struct airoha_pinctrl *pinctrl,
+				      unsigned int pin, u8 mode)
+{
+	unsigned int mode_bits = pinctrl->iomux_info->mode_bits;
+	unsigned int modes_per_reg = sizeof(u32) * BITS_PER_BYTE / mode_bits;
+	unsigned int shift = (pin % modes_per_reg) * mode_bits;
+	unsigned int reg = (pin / modes_per_reg) * sizeof(u32);
+
+	return regmap_update_bits(pinctrl->iomux, reg,
+				  GENMASK(mode_bits - 1, 0) << shift,
+				  mode << shift);
+}
+
+static int airoha_pinmux_set_pin_modes(struct airoha_pinctrl *pinctrl,
+				       const struct group_desc *grp,
+				       const u8 *modes)
+{
+	int i, err;
+
+	for (i = 0; i < grp->grp.npins; i++) {
+		err = airoha_pinmux_set_pin_mode(pinctrl, grp->grp.pins[i],
+						 modes[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 				 unsigned int selector,
 				 unsigned int group)
@@ -431,6 +460,15 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		if (strcmp(group->name, grp->grp.name))
 			continue;
 
+		if (group->pin_modes) {
+			int err;
+
+			err = airoha_pinmux_set_pin_modes(pinctrl, grp,
+							  group->pin_modes);
+			if (err)
+				return err;
+		}
+
 		for (j = 0; j < group->regmap_size; j++) {
 			switch (group->regmap[j].mux) {
 			case AIROHA_FUNC_PWM_EXT_MUX:
@@ -824,6 +862,16 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 
 	pinctrl->chip_scu = map;
 
+	if (data->iomux_info) {
+		map = syscon_regmap_lookup_by_phandle(dev->of_node,
+						      "airoha,iomux");
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+
+		pinctrl->iomux = map;
+		pinctrl->iomux_info = data->iomux_info;
+	}
+
 	/* Init pinctrl desc struct */
 	pinctrl->desc.name = data->pinctrl_name;
 	pinctrl->desc.owner = data->pinctrl_owner;
-- 
2.34.1

