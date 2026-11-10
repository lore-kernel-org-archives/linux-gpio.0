Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303841;
	b=NOI6H13bWLlG9dpZIAAAiV5ylUxgbY1Cx2G3FcGbTPXtr2G/oqaTID0+Y1tiON48cLvS
	 A//VEQzdGEeCOJ1iI62NRnEJwCSeU6e1JCE31wmonq2PWMaeUI783Gljkcss8uhIXeeDF
	 BHoPiPxJWR0wApclOXxpZ9RADfHXW4U3ioFE/BZVEZR/0SgpFP8+nPkKPxLx2IZbAv1J9
	 f5Hd1Lql6vzY4lrzbqpUPfDQ4NPIfSq9B5d+plUJpd+gA3KLz6EJCQdgcDwe8oqvwDzYT
	 uV8T6nddBNZI+eh5FsKonn+ZN7k/Jdi2O/em1W9+CgTBL4kHVNHkco5jrnVOW0mYkew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303841;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=9ojeOFQTewitkk1KF6nxl5kpIdyWpjPuvgiIz0vXrr4=;
	b=MFm6HE2dJ6XudihbusqDC42NvJCpZ1YKxOvqBByWXMaiW1CLJMrOHT6EvPcMsqNqSkx8
	 19p874B0aw28nRw20ELpopJ/r608TshJOYne6wYylWFV8ecN9Px3KnGharaiB9IHcZNy0
	 5yBePDxBCMsWn34NxsO5JF7kgsHfYBuE5hYDbc3e7XrkiC8hj/xu8dtvfAJ81ATU9DlN4
	 t1nnJAP+qplyZEoz8ZJmNDHFX9aZbQVmGCnrPjPkwZiPvPjqbbAANgHO1n5+J10h1Ig6U
	 h4ngFSWqmXHPYvtyLQhngAzjpFVST8qKV9u/RhOQzCwe0XoGu+1tpbljdXo4bVxKKcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZmmGZ8uo;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306D606C652;
	Tue, 10 Nov 2026 09:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6306D606C652
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZmmGZ8uo
X-UUID: 3a0cc470dceb11f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9ojeOFQTewitkk1KF6nxl5kpIdyWpjPuvgiIz0vXrr4=;
	b=ZmmGZ8uozTJ1ANE6dQ2J+Q+6c9FcXPkrq0L+z3wNrk1dr8yAqpxUZ7JCRUAmgqaFzLqS06rpgvAI6E+gE41J/yMomN5KGZe1145lMq5MLPcmk3huRwV8EjZQNVt5RRpa49TdtyZDFVNoWtbkMA44IcnhLL5utB+T2qhHbK3mFJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:14f2c649-d9df-4b46-951e-befe92a72aee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:344392eb-7d0c-4db4-a7e5-d44f18b7500b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3a0cc470dceb11f1b1788b6acf885367-20261110
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1516883358; Tue, 10 Nov 2026 17:43:47 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:46 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:46 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 02/12] pinctrl: airoha: configure pin muxes on GPIO requests
Date: Tue, 10 Nov 2026 17:43:29 +0800
Message-ID: <20261110094339.749110-3-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
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
Content-Type: text/plain
X-MTK: N

GPIO requests currently leave the pin mux unchanged, relying on the
pins already being configured for GPIO operation. A pin configured
for an alternate function by the bootloader can therefore remain
disconnected from the GPIO controller despite being requested as a GPIO.

Add a GPIO request callback that selects the matching single-pin group
from a GPIO-category function. Reuse the group configuration used by
explicit GPIO pinctrl states and resolve pins using pinctrl pin numbers
to support GPIO ranges with a nonzero pin base.

Shared mux bits can affect pins outside the requested group. Add
SoC-selectable checks against GPIO owners and claimed mux groups,
rejecting incompatible register settings with -EBUSY. Serialize these
checks and mux register updates, and propagate register update errors.

Extend function-group configurations to up to three register updates
for GPIO and peripheral mux sequences. Enable GPIO request handling and
conflict checks through SoC match data, leaving GPIO request behavior
unchanged until a SoC opts in.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/airoha-common.h  |  15 +-
 drivers/pinctrl/airoha/pinctrl-airoha.c | 256 ++++++++++++++++++++----
 2 files changed, 234 insertions(+), 37 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 16f7abcdfb832..dbfb33a00b717 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -49,6 +49,14 @@
 		.group_size = ARRAY_SIZE(table##_func_group),		\
 	}
 
+#define PINCTRL_GPIO_FUNC_DESC(id, table)					\
+	{								\
+		.desc = PINCTRL_GPIO_PINFUNCTION(id, table##_groups,	\
+					 ARRAY_SIZE(table##_groups)),	\
+		.groups = table##_func_group,				\
+		.group_size = ARRAY_SIZE(table##_func_group),		\
+	}
+
 #define PINCTRL_CONF_DESC(p, offset, mask)				\
 	{								\
 		.pin = p,						\
@@ -73,7 +81,7 @@ struct airoha_pinctrl_func_group {
 		u32 offset;
 		u32 mask;
 		u32 val;
-	} regmap[2];
+	} regmap[3];
 	int regmap_size;
 };
 
@@ -115,6 +123,10 @@ enum airoha_pinctrl_confs_type {
 };
 
 struct airoha_pinctrl {
+	/* Serialize shared mux validation and register updates. */
+	struct mutex mux_lock;
+	bool check_mux_conflicts;
+
 	struct pinctrl_dev *ctrl;
 
 	struct pinctrl_desc desc;
@@ -131,6 +143,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	bool check_mux_conflicts;
 	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 8dd0881bba4ad..25562e51ebbdc 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -400,57 +400,236 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 }
 
 /* pinmux callbacks */
-static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
-				 unsigned int selector,
-				 unsigned int group)
+static const struct airoha_pinctrl_func_group *
+airoha_pinmux_get_func_group(struct pinctrl_dev *pctldev,
+			    unsigned int selector, unsigned int group)
 {
-	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	const struct airoha_pinctrl_func *func;
 	const struct function_desc *desc;
+	const struct airoha_pinctrl_func *func;
 	struct group_desc *grp;
 	int i;
 
-	desc = pinmux_generic_get_function(pctrl_dev, selector);
-	if (!desc)
-		return -EINVAL;
+	desc = pinmux_generic_get_function(pctldev, selector);
+	grp = pinctrl_generic_get_group(pctldev, group);
+	if (!desc || !grp)
+		return NULL;
 
-	grp = pinctrl_generic_get_group(pctrl_dev, group);
-	if (!grp)
-		return -EINVAL;
+	func = desc->data;
+	for (i = 0; i < func->group_size; i++)
+		if (!strcmp(func->groups[i].name, grp->grp.name))
+			return &func->groups[i];
 
-	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func->name, grp->grp.name);
+	return NULL;
+}
 
-	func = desc->data;
-	for (i = 0; i < func->group_size; i++) {
-		const struct airoha_pinctrl_func_group *group;
-		int j;
+/* Shared mux bits can affect pads outside the requested pin group. */
+static bool
+airoha_pinmux_groups_conflict(const struct airoha_pinctrl_func_group *a,
+			     const struct airoha_pinctrl_func_group *b)
+{
+	int i, j;
+
+	for (i = 0; i < a->regmap_size; i++) {
+		for (j = 0; j < b->regmap_size; j++) {
+			u32 mask;
 
-		group = &func->groups[i];
-		if (strcmp(group->name, grp->grp.name))
+			if ((a->regmap[i].mux == AIROHA_FUNC_MUX) !=
+			    (b->regmap[j].mux == AIROHA_FUNC_MUX) ||
+			    a->regmap[i].offset != b->regmap[j].offset)
+				continue;
+
+			mask = a->regmap[i].mask & b->regmap[j].mask;
+			if (mask & (a->regmap[i].val ^ b->regmap[j].val))
+				return true;
+		}
+	}
+
+	return false;
+}
+
+/* Use pinctrl pin numbers, including GPIO ranges with nonzero pin_base. */
+static const struct airoha_pinctrl_func_group *
+airoha_pinmux_get_gpio_group(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	unsigned int selector, count;
+
+	count = pinmux_generic_get_function_count(pctldev);
+	for (selector = 0; selector < count; selector++) {
+		const struct airoha_pinctrl_func *func;
+		const struct function_desc *desc;
+		int i;
+
+		if (!pinmux_generic_function_is_gpio(pctldev, selector))
+			continue;
+		desc = pinmux_generic_get_function(pctldev, selector);
+		if (!desc)
 			continue;
 
-		for (j = 0; j < group->regmap_size; j++) {
-			switch (group->regmap[j].mux) {
-			case AIROHA_FUNC_PWM_EXT_MUX:
-			case AIROHA_FUNC_PWM_MUX:
-				regmap_update_bits(pinctrl->regmap,
-						   group->regmap[j].offset,
-						   group->regmap[j].mask,
-						   group->regmap[j].val);
-				break;
-			default:
-				regmap_update_bits(pinctrl->chip_scu,
-						   group->regmap[j].offset,
-						   group->regmap[j].mask,
-						   group->regmap[j].val);
-				break;
-			}
+		func = desc->data;
+		for (i = 0; i < func->group_size; i++) {
+			struct group_desc *grp;
+			int group;
+
+			group = pinctrl_get_group_selector(pctldev,
+						   func->groups[i].name);
+			if (group < 0)
+				continue;
+			grp = pinctrl_generic_get_group(pctldev, group);
+			if (grp && grp->grp.npins == 1 &&
+			    grp->grp.pins[0] == pin)
+				return &func->groups[i];
 		}
+	}
+
+	return NULL;
+}
+
+static int
+airoha_pinmux_check_conflicts(struct pinctrl_dev *pctldev,
+			     const struct airoha_pinctrl_func_group *group)
+{
+	unsigned int i;
+
+	for (i = 0; i < pctldev->desc->npins; i++) {
+		const struct airoha_pinctrl_func_group *active;
+		struct pinctrl_setting_mux setting;
+		unsigned int number = pctldev->desc->pins[i].number;
+		struct pin_desc *pin;
+		bool claimed, gpio_owned;
+
+		pin = pin_desc_get(pctldev, number);
+		if (!pin)
+			continue;
+
+		scoped_guard(mutex, &pin->mux_lock) {
+			claimed = pin->mux_usecount && pin->mux_setting;
+			gpio_owned = !!pin->gpio_owner;
+			if (claimed)
+				setting = *pin->mux_setting;
+		}
+
+		/* GPIO requests need no explicit DTS pinctrl state. */
+		if (gpio_owned) {
+			active = airoha_pinmux_get_gpio_group(pctldev, number);
+			if (!active)
+				return -EOPNOTSUPP;
+			if (airoha_pinmux_groups_conflict(group, active))
+				goto conflict;
+		}
+
+		if (!claimed)
+			continue;
+		active = airoha_pinmux_get_func_group(pctldev, setting.func,
+						    setting.group);
+		if (!active)
+			return -EINVAL;
+		if (!airoha_pinmux_groups_conflict(group, active))
+			continue;
+
+conflict:
+		dev_err(pctldev->dev,
+			"group %s conflicts with shared mux bits of group %s\n",
+			group->name, active->name);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+/* Caller holds mux_lock across validation and the register updates. */
+static int
+airoha_pinmux_apply_group(struct airoha_pinctrl *pinctrl,
+			 const struct airoha_pinctrl_func_group *config)
+{
+	int i, err;
+
+	for (i = 0; i < config->regmap_size; i++) {
+		struct regmap *map;
+
+		if (!config->regmap[i].mask)
+			continue;
+		map = config->regmap[i].mux == AIROHA_FUNC_MUX ?
+		      pinctrl->chip_scu : pinctrl->regmap;
+		err = regmap_update_bits(map, config->regmap[i].offset,
+					 config->regmap[i].mask,
+					 config->regmap[i].val);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int
+airoha_gpio_request_enable(struct pinctrl_dev *pctldev,
+			   struct pinctrl_gpio_range *range, unsigned int pin)
+{
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct airoha_pinctrl_func_group *config;
+	int err;
+
+	/* Other SoCs retain their existing request behavior. */
+	if (!pinctrl->check_mux_conflicts)
 		return 0;
+	if (!range)
+		return -EINVAL;
+
+	config = airoha_pinmux_get_gpio_group(pctldev, pin);
+	if (!config)
+		return dev_err_probe(pctldev->dev, -EOPNOTSUPP,
+				     "no verified GPIO mux for pin %u\n", pin);
+
+	guard(mutex)(&pinctrl->mux_lock);
+	err = airoha_pinmux_check_conflicts(pctldev, config);
+	if (err)
+		return err;
+
+	dev_dbg(pctldev->dev, "request GPIO mux group %s pin %u\n",
+		config->name, pin);
+	return airoha_pinmux_apply_group(pinctrl, config);
+}
+
+static int airoha_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			       unsigned int selector, unsigned int group)
+{
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct airoha_pinctrl_func_group *config;
+	int i, err;
+
+	config = airoha_pinmux_get_func_group(pctldev, selector, group);
+	if (!config)
+		return -EINVAL;
+
+	guard(mutex)(&pinctrl->mux_lock);
+	if (pinctrl->check_mux_conflicts) {
+		struct group_desc *grp;
+
+		/* The core permits GPIO-category muxes alongside GPIO owners. */
+		grp = pinctrl_generic_get_group(pctldev, group);
+		if (!pinmux_generic_function_is_gpio(pctldev, selector)) {
+			for (i = 0; i < grp->grp.npins; i++) {
+				struct pin_desc *pin;
+
+				pin = pin_desc_get(pctldev, grp->grp.pins[i]);
+				if (!pin)
+					return -EINVAL;
+				scoped_guard(mutex, &pin->mux_lock) {
+					if (pin->gpio_owner)
+						return -EBUSY;
+				}
+			}
+		}
+
+		err = airoha_pinmux_check_conflicts(pctldev, config);
+		if (err)
+			return err;
 	}
 
-	return -EINVAL;
+	dev_dbg(pctldev->dev, "enable function %s group %s\n",
+		pinmux_generic_get_function_name(pctldev, selector),
+		config->name);
+
+	return airoha_pinmux_apply_group(pinctrl, config);
 }
 
 static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
@@ -468,6 +647,8 @@ static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
 }
 
 static const struct pinmux_ops airoha_pmxops = {
+	.gpio_request_enable = airoha_gpio_request_enable,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
@@ -823,6 +1004,9 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 
 	pinctrl->chip_scu = map;
 
+	mutex_init(&pinctrl->mux_lock);
+	pinctrl->check_mux_conflicts = data->check_mux_conflicts;
+
 	/* Init pinctrl desc struct */
 	pinctrl->desc.name = data->pinctrl_name;
 	pinctrl->desc.owner = data->pinctrl_owner;
-- 
2.43.0

