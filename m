Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D54B540C
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553249; cv=fail; b=cdeZd1Hqpjh/1F7anFq01JpmP8+g7iimoF+XMIoz1N6keo/QgvIjrK5MRI2llsbTh6cZtTSQhTLHA6CGKFW5Sb6O0nPjWwHW20YlAdzPzd1eXuv4cm8B91vTeSAWyGrORNzrc2mz6FJoY3tqlZvGRKrtsrNekyN6g3n6MpRcUGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553249; c=relaxed/simple;
	bh=5VJRUnuKGdlgXzb5Su8DES5pry5hq2xN6s0hwqW45l4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHjaERvo1n/J90ccz139CQ1pPYqRAB6CTmO6uNZ3VumnZxlAUs0MXYF7HwQ9xQ8+Dnr0j377HjMLB3deKTEDkJUaeJusrifbzsfz6cZm4DYNrw4dKVw3VgcupdWkQAq9redcEs/CBKSrl8P6zIOo2XuyYEkLDTXY5fIc9MSAYeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aKECAMGj; arc=fail smtp.client-ip=52.101.43.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aKECAMGj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENrrkNBqrwRXe3w9IaUhB3ALl25ODuNAVnQEjCFoQjJw/3TTtJUsYwdw7Y/4UzXvr7szWGAS5FNYCbzEJ4qfW2xEotHTAJnGFOIqXlST9+v3mWaW+9rW7PqOnYYJGPVt8XL7zDNhW8a1e9vvIuKxbDTReDR9+we9rUME0ldF8Scjg+sH/vIy4iqufB3f0Ph+ioMr3BA8qBWypzmWX1x92cQO7XUJ0Rwi7Usnw/Ip9AznUIkVbZzSPgfFTzyFQxt9nhP3XhIKel5MqHJzloqhIDENQJYaPA48CPAVQDMkP2VQOCTGKyEuoFefWm6YH2e93nZAEK894DjkOH1Ea470TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQAkxqRdguuSyUdrnBK2bopHhhmoAMUn9COMyGt0TyI=;
 b=bZ2la3Pwu1HbO0VaoFsHsSi0IcPBgGzEt58Sq/lUvwgU6Jn4I0zYjk4H3Nkjh9u3DxSpDOPFbSVjuAZfQesrZiZhzrsHBXaisDhPWGLxrsLr4M9ntZ8htnYtRVVFhwwIlkpKsIeHpeHn4eMt7tdcL5VotNfYrQ2jE5ryWAN3t/IO9McAy8hHhvG0mN63j3LNLz/XRyHqq5z07epsvc0WIjZIeaVDL4gk56hUmiIKIB+6eeFwO/y9geZ64zwVNuMPJsULK5oZY/EhtBR5wYC9S7JJco5thQQbWYJltBGPWFs5XKdINaqqxfroijMxHnSHUE9X8Kwrdx3By5UFGYtqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQAkxqRdguuSyUdrnBK2bopHhhmoAMUn9COMyGt0TyI=;
 b=aKECAMGj1+6A91ah6d9nsQk4qOjrGE9TNtbGUjrdczGBs23/iSG5qwJ0Nec/CIC9w8PSjAcIE4+GgxdGTgp8Oj2lj+kxjj4366M5aUvcp09FSewNO3igRo1zmHKzt51r+ZrEtAnQUU0ifAbxvaa0mr88dKCX9XP26inY9O5uhf4=
Received: from CY5PR20CA0008.namprd20.prod.outlook.com (2603:10b6:930:3::14)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 10:07:04 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::9f) by CY5PR20CA0008.outlook.office365.com
 (2603:10b6:930:3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 10:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 10:07:04 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 05:07:01 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/3] pinctrl: amd: Add support for the Remote GPIO (RGPIO) bank
Date: Wed, 16 Sep 2026 15:36:30 +0530
Message-ID: <20260916100630.37849-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916100630.37849-1-Basavaraj.Natikar@amd.com>
References: <20260916100630.37849-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1644b6-dea3-49d6-9c81-08df13da4216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aAuF6xrrIsZL08YSGd3QuLC1IJ+3XUGX7iX5dXdUDMh3eqx2cMo0SCKDGYRymq/NYtdoI0kLd1pvg4adWsBJ+jT2YgMC8kDXcS4A/Q+a41bjDn4RCB06iQSELjwWidu4DuW3KOM8FOH9O/tcrokR37xK0YEyVq0E9H0fgS6UpGBCJB2TdunAT0cWaD5iVdeurvogvibVukJjCJ5ArOGPBpAxU/7Kbp8w+IqywbtDVo3Ic4kpYGYE3/4vqru1HHVJVE7whWaXTcL1T8I7cqSUxs1BlDmwk/s81VnAljC+Knz8wCVLVyJNG4/e2HbSoy7J+PH7gQDhL+M47baB4ks+bfqbw41heeRVa5fdplNQEhL8eoDcXqsGNbdRcCOK5Yd7xsOSGPT/J8jnCC/QPnOGfybs6AYZ0hFJZAHVTI7EsvR1IniasdLMR8GabMZAbj/WA1nxYRBbEl4wSSAU1y0dpVon+kyDoXjEHC6zISbjqKhSmG5cXUwR6vvdlHbx1MAppOdJSYapgbEM7d3va7hqoUZzcLsnRxI86PKAgUi/xcoI3sl08+05zPY6PaRNkWL283o9E09O6TvG0f/kpIX8tjn7VUt33cSUb+CGMDfLoy0rztXg65b+UlzSj5hwJ+KVfGcYZBiIZhUuAapTT5TpvDidnpacqcJQbLKFF6BR1sywrJRklSyxrd01OlKGT41ZmkL8omb3V8sIS284tWw8eA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OCmkQ2T0fgilGN1MwW0QrCCYXWn1wttCWrry6CqNpQqaxd8/HaCXeKR0k0HQ86iyoruHjhzurnjMTld1WaJe7d3fSI4qnnxIXDANKZSBX+/K+gXMrbeBJjNGsiHEDZnCr/qBfNUJ5KYUkjwhSkyqlwz3OR1/KwGZnBb/hBabBkdjiliGBeU3RffkXFbaTfWDebiiW2chlbEuLhkcO69jEagR+VRa9dUjCA4CdMiroxyGqnu+hVogpJybk0bgb2wrpEPQUQxK8pagLNNyK8fpzMFxVNZhgn2uPnBz7bZ4fRJcCMHTmp5O+Ox+jRIDmIMEDGC4SuMIKo68tkJ5vTC8HUr/hOr2vwlnpqsoeL3aBMdHG2JPIMEh31SjNPZmfblDvfLV6yBXvm2xaZlOZFS5kdyicM3Dqr0ImbpmyhedpOu4OTRwsx46jIFgbXkNaQfk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:07:04.1729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1644b6-dea3-49d6-9c81-08df13da4216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062

Some AMD platforms expose a second GPIO bank, Remote GPIO (RGPIO),
covering pins 256-271 through a separate register region advertised by
name. Add support for these pins, including their interrupts, when the
region is advertised and the main bank spans the expected number of
registers, so they are usable like the main bank pins. The RGPIO pins
stay inactive on platforms that do not expose the region.

Co-developed-by: Matt DeVillier <Matt.Devillier@amd.com>
Signed-off-by: Matt DeVillier <Matt.Devillier@amd.com>
Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 121 ++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-amd.h | 174 ++++++++++++++++++++++++++++++++++
 2 files changed, 292 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 8bab4af0a7a3..53ddcaaab414 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -41,6 +41,8 @@ static struct amd_gpio *pinctrl_dev;
 
 static inline void __iomem *amd_gpio_pin_reg(struct amd_gpio *gpio_dev, unsigned int pin)
 {
+	if (gpio_dev->base_rgpio && pin >= AMD_GPIO_RGPIO_PIN_BASE)
+		return gpio_dev->base_rgpio + (pin - AMD_GPIO_RGPIO_PIN_BASE) * 4;
 	return gpio_dev->base + pin * 4;
 }
 
@@ -243,6 +245,10 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 			i = 192;
 			pin_num = AMD_GPIO_PINS_BANK3 + i;
 			break;
+		case 4:
+			i = AMD_GPIO_RGPIO_PIN_BASE;
+			pin_num = AMD_GPIO_PINS_BANK4 + i;
+			break;
 		default:
 			/* Illegal bank number, ignore */
 			continue;
@@ -674,6 +680,58 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 		}
 	}
+
+	/*
+	 * Unlike WAKE_INT_STATUS_REG0/1, where each status bit covers four
+	 * pins, the RGPIO status register uses one bit per pin. As with the
+	 * main bank status registers, a bit is cleared by acknowledging the
+	 * pending interrupt on its pin below (clearing PIN_IRQ_PENDING); no
+	 * separate write to the RGPIO status register is required.
+	 */
+	if (gpio_dev->base_rgpio) {
+		u32 status_rgpio;
+
+		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+		status_rgpio = readl(gpio_dev->base_rgpio + WAKE_INT_STATUS_REG_RGPIO);
+		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+		status_rgpio &= GENMASK(AMD_GPIO_PINS_BANK4 - 1, 0);
+
+		for (i = 0; i < AMD_GPIO_PINS_BANK4; i++) {
+			unsigned int pin = AMD_GPIO_RGPIO_PIN_BASE + i;
+
+			if (!(status_rgpio & BIT(i)))
+				continue;
+
+			regval = readl(amd_gpio_pin_reg(gpio_dev, pin));
+
+			if (regval & PIN_IRQ_PENDING)
+				pm_pr_dbg("GPIO %d is active: 0x%x", pin, regval);
+
+			/* caused wake on resume context for shared IRQ */
+			if (irq < 0 && (regval & BIT(WAKE_STS_OFF)))
+				return true;
+
+			if (!(regval & PIN_IRQ_PENDING) ||
+			    !(regval & BIT(INTERRUPT_MASK_OFF)))
+				continue;
+			generic_handle_domain_irq_safe(gc->irq.domain, pin);
+
+			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+			regval = readl(amd_gpio_pin_reg(gpio_dev, pin));
+			if (!gpiochip_line_is_irq(gc, pin)) {
+				regval &= ~BIT(INTERRUPT_MASK_OFF);
+				dev_dbg(&gpio_dev->pdev->dev,
+					"Disabling spurious GPIO IRQ %d\n",
+					pin);
+			} else {
+				ret = true;
+			}
+			writel(regval, amd_gpio_pin_reg(gpio_dev, pin));
+			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+		}
+	}
+
 	/* did not cause wake on resume context for shared IRQ */
 	if (irq < 0)
 		return false;
@@ -745,6 +803,9 @@ static int amd_pinconf_get(struct pinctrl_dev *pctldev,
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
 
+	if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+		return -EOPNOTSUPP;
+
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
@@ -787,6 +848,9 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	enum pin_config_param param;
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
 
+	if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+		return -EOPNOTSUPP;
+
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
@@ -896,6 +960,9 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 		if (!pd)
 			continue;
 
+		if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+			continue;
+
 		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 
 		pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
@@ -920,6 +987,9 @@ static void amd_gpio_check_pending(void)
 		int pin = desc->pins[i].number;
 		u32 tmp;
 
+		if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+			continue;
+
 		tmp = readl(amd_gpio_pin_reg(gpio_dev, pin));
 		if (tmp & PIN_IRQ_PENDING)
 			pm_pr_dbg("%s: GPIO %d is active: 0x%x.\n", __func__, pin, tmp);
@@ -1066,7 +1136,8 @@ static int amd_get_groups(struct pinctrl_dev *pctrldev, unsigned int selector,
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctrldev);
 
-	if (!gpio_dev->iomux_base) {
+	if (!gpio_dev->iomux_base &&
+	    pmx_functions[selector].index < AMD_GPIO_RGPIO_PIN_BASE) {
 		dev_err(&gpio_dev->pdev->dev, "iomux function %d group not supported\n", selector);
 		return -EINVAL;
 	}
@@ -1082,6 +1153,34 @@ static int amd_set_mux(struct pinctrl_dev *pctrldev, unsigned int function, unsi
 	struct device *dev = &gpio_dev->pdev->dev;
 	struct pin_desc *pd;
 	int ind, index;
+	unsigned int pin = gpio_dev->groups[group].pins[0];
+
+	if (pin >= AMD_GPIO_RGPIO_PIN_BASE) {
+		if (!gpio_dev->base_rgpio)
+			return -EINVAL;
+
+		for (index = 0; index < NSELECTS; index++)
+			if (!strcmp(gpio_dev->groups[group].name,
+				    pmx_functions[function].groups[index]))
+				break;
+		if (index >= NSELECTS)
+			return -EINVAL;
+
+		writeb(index, gpio_dev->base_rgpio + AMD_GPIO_RGPIO_MUX_OFFSET +
+			      (pin - AMD_GPIO_RGPIO_PIN_BASE));
+
+		if (index != (readb(gpio_dev->base_rgpio + AMD_GPIO_RGPIO_MUX_OFFSET +
+				    (pin - AMD_GPIO_RGPIO_PIN_BASE)) & FUNCTION_MASK)) {
+			dev_err(dev, "RGPIO_GPIO %u mux not present or supported\n", pin);
+			return -EINVAL;
+		}
+
+		for (ind = 0; ind < gpio_dev->groups[group].npins; ind++) {
+			pd = pin_desc_get(gpio_dev->pctrl, gpio_dev->groups[group].pins[ind]);
+			pd->mux_owner = gpio_dev->groups[group].name;
+		}
+		return 0;
+	}
 
 	if (!gpio_dev->iomux_base)
 		return -EINVAL;
@@ -1182,6 +1281,19 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio_dev->base);
 	}
 
+	gpio_dev->base_rgpio = amd_get_named_res(&pdev->dev, pdev, "rgpio",
+						 WAKE_INT_STATUS_REG_RGPIO + sizeof(u32));
+	/*
+	 * RGPIO pins are numbered from AMD_GPIO_RGPIO_PIN_BASE, so the main
+	 * bank must span exactly that many register slots for the RGPIO pin
+	 * numbering to line up. Disable RGPIO if the main bank is a different
+	 * size.
+	 */
+	if (gpio_dev->base_rgpio && resource_size(res) / 4 != AMD_GPIO_RGPIO_PIN_BASE) {
+		dev_err(&pdev->dev, "unexpected GPIO bank size, disabling RGPIO\n");
+		gpio_dev->base_rgpio = NULL;
+	}
+
 	gpio_dev->irq = platform_get_irq(pdev, 0);
 	if (gpio_dev->irq < 0)
 		return gpio_dev->irq;
@@ -1208,14 +1320,17 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->gc.owner			= THIS_MODULE;
 	gpio_dev->gc.parent			= &pdev->dev;
 	gpio_dev->gc.ngpio			= resource_size(res) / 4;
-
 	gpio_dev->hwbank_num = gpio_dev->gc.ngpio / 64;
+	if (gpio_dev->base_rgpio) {
+		gpio_dev->gc.ngpio += AMD_GPIO_PINS_BANK4;
+		gpio_dev->hwbank_num++;
+	}
 	gpio_dev->groups = kerncz_groups;
 	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
 
 	amd_pinctrl_desc.name = dev_name(&pdev->dev);
 	gpio_dev->iomux_base = amd_get_named_res(&pdev->dev, pdev, "iomux", 0);
-	if (!gpio_dev->iomux_base)
+	if (!gpio_dev->iomux_base && !gpio_dev->base_rgpio)
 		amd_pinctrl_desc.pmxops = NULL;
 	gpio_dev->pctrl = devm_pinctrl_register(&pdev->dev, &amd_pinctrl_desc,
 						gpio_dev);
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 3a1e5bffaf6e..c602c4b648bd 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -15,6 +15,18 @@
 #define AMD_GPIO_PINS_BANK1     64
 #define AMD_GPIO_PINS_BANK2     56
 #define AMD_GPIO_PINS_BANK3     32
+#define AMD_GPIO_PINS_BANK4     16
+
+/*
+ * Remote GPIO (RGPIO) is a second GPIO bank on some AMD platforms. Firmware
+ * advertises its register region as an optional resource named "rgpio" (via
+ * the pinctrl-resource-names _DSD property). Relative to that region's base,
+ * RGPIO pin AMD_GPIO_RGPIO_PIN_BASE + n uses a per-pin control register at
+ * n * 4, a pinmux selector byte at AMD_GPIO_RGPIO_MUX_OFFSET + n, and one
+ * interrupt status bit (bit n) in WAKE_INT_STATUS_REG_RGPIO.
+ */
+#define AMD_GPIO_RGPIO_PIN_BASE 256
+#define AMD_GPIO_RGPIO_MUX_OFFSET 0xC0
 
 #define WAKE_INT_MASTER_REG 0xfc
 #define INTERNAL_GPIO0_DEBOUNCE (1 << 15)
@@ -22,6 +34,7 @@
 
 #define WAKE_INT_STATUS_REG0 0x2f8
 #define WAKE_INT_STATUS_REG1 0x2fc
+#define WAKE_INT_STATUS_REG_RGPIO 0x0F4
 
 #define DB_TMR_OUT_OFF			0
 #define DB_TMR_OUT_UNIT_OFF		4
@@ -94,6 +107,7 @@ struct amd_function {
 struct amd_gpio {
 	raw_spinlock_t          lock;
 	void __iomem            *base;
+	void __iomem            *base_rgpio;
 	void __iomem            *iomux_base;
 
 	const struct pingroup *groups;
@@ -292,6 +306,22 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(181, "GPIO_181"),
 	PINCTRL_PIN(182, "GPIO_182"),
 	PINCTRL_PIN(183, "GPIO_183"),
+	PINCTRL_PIN(256, "GPIO_256"),
+	PINCTRL_PIN(257, "GPIO_257"),
+	PINCTRL_PIN(258, "GPIO_258"),
+	PINCTRL_PIN(259, "GPIO_259"),
+	PINCTRL_PIN(260, "GPIO_260"),
+	PINCTRL_PIN(261, "GPIO_261"),
+	PINCTRL_PIN(262, "GPIO_262"),
+	PINCTRL_PIN(263, "GPIO_263"),
+	PINCTRL_PIN(264, "GPIO_264"),
+	PINCTRL_PIN(265, "GPIO_265"),
+	PINCTRL_PIN(266, "GPIO_266"),
+	PINCTRL_PIN(267, "GPIO_267"),
+	PINCTRL_PIN(268, "GPIO_268"),
+	PINCTRL_PIN(269, "GPIO_269"),
+	PINCTRL_PIN(270, "GPIO_270"),
+	PINCTRL_PIN(271, "GPIO_271"),
 };
 
 #define AMD_PINS(...) (const unsigned int []){__VA_ARGS__}
@@ -873,6 +903,70 @@ enum amd_functions {
 	IMX_F1_GPIO144,
 	IMX_F2_GPIO144,
 	IMX_F3_GPIO144,
+	IMX_F0_GPIO256,
+	IMX_F1_GPIO256,
+	IMX_F2_GPIO256,
+	IMX_F3_GPIO256,
+	IMX_F0_GPIO257,
+	IMX_F1_GPIO257,
+	IMX_F2_GPIO257,
+	IMX_F3_GPIO257,
+	IMX_F0_GPIO258,
+	IMX_F1_GPIO258,
+	IMX_F2_GPIO258,
+	IMX_F3_GPIO258,
+	IMX_F0_GPIO259,
+	IMX_F1_GPIO259,
+	IMX_F2_GPIO259,
+	IMX_F3_GPIO259,
+	IMX_F0_GPIO260,
+	IMX_F1_GPIO260,
+	IMX_F2_GPIO260,
+	IMX_F3_GPIO260,
+	IMX_F0_GPIO261,
+	IMX_F1_GPIO261,
+	IMX_F2_GPIO261,
+	IMX_F3_GPIO261,
+	IMX_F0_GPIO262,
+	IMX_F1_GPIO262,
+	IMX_F2_GPIO262,
+	IMX_F3_GPIO262,
+	IMX_F0_GPIO263,
+	IMX_F1_GPIO263,
+	IMX_F2_GPIO263,
+	IMX_F3_GPIO263,
+	IMX_F0_GPIO264,
+	IMX_F1_GPIO264,
+	IMX_F2_GPIO264,
+	IMX_F3_GPIO264,
+	IMX_F0_GPIO265,
+	IMX_F1_GPIO265,
+	IMX_F2_GPIO265,
+	IMX_F3_GPIO265,
+	IMX_F0_GPIO266,
+	IMX_F1_GPIO266,
+	IMX_F2_GPIO266,
+	IMX_F3_GPIO266,
+	IMX_F0_GPIO267,
+	IMX_F1_GPIO267,
+	IMX_F2_GPIO267,
+	IMX_F3_GPIO267,
+	IMX_F0_GPIO268,
+	IMX_F1_GPIO268,
+	IMX_F2_GPIO268,
+	IMX_F3_GPIO268,
+	IMX_F0_GPIO269,
+	IMX_F1_GPIO269,
+	IMX_F2_GPIO269,
+	IMX_F3_GPIO269,
+	IMX_F0_GPIO270,
+	IMX_F1_GPIO270,
+	IMX_F2_GPIO270,
+	IMX_F3_GPIO270,
+	IMX_F0_GPIO271,
+	IMX_F1_GPIO271,
+	IMX_F2_GPIO271,
+	IMX_F3_GPIO271,
 };
 
 #define AMD_PINCTRL_FUNC_GRP(_number, _func)						\
@@ -1456,6 +1550,70 @@ static const struct pingroup kerncz_groups[] = {
 	AMD_PINCTRL_FUNC_GRP(144, 1),
 	AMD_PINCTRL_FUNC_GRP(144, 2),
 	AMD_PINCTRL_FUNC_GRP(144, 3),
+	AMD_PINCTRL_FUNC_GRP(256, 0),
+	AMD_PINCTRL_FUNC_GRP(256, 1),
+	AMD_PINCTRL_FUNC_GRP(256, 2),
+	AMD_PINCTRL_FUNC_GRP(256, 3),
+	AMD_PINCTRL_FUNC_GRP(257, 0),
+	AMD_PINCTRL_FUNC_GRP(257, 1),
+	AMD_PINCTRL_FUNC_GRP(257, 2),
+	AMD_PINCTRL_FUNC_GRP(257, 3),
+	AMD_PINCTRL_FUNC_GRP(258, 0),
+	AMD_PINCTRL_FUNC_GRP(258, 1),
+	AMD_PINCTRL_FUNC_GRP(258, 2),
+	AMD_PINCTRL_FUNC_GRP(258, 3),
+	AMD_PINCTRL_FUNC_GRP(259, 0),
+	AMD_PINCTRL_FUNC_GRP(259, 1),
+	AMD_PINCTRL_FUNC_GRP(259, 2),
+	AMD_PINCTRL_FUNC_GRP(259, 3),
+	AMD_PINCTRL_FUNC_GRP(260, 0),
+	AMD_PINCTRL_FUNC_GRP(260, 1),
+	AMD_PINCTRL_FUNC_GRP(260, 2),
+	AMD_PINCTRL_FUNC_GRP(260, 3),
+	AMD_PINCTRL_FUNC_GRP(261, 0),
+	AMD_PINCTRL_FUNC_GRP(261, 1),
+	AMD_PINCTRL_FUNC_GRP(261, 2),
+	AMD_PINCTRL_FUNC_GRP(261, 3),
+	AMD_PINCTRL_FUNC_GRP(262, 0),
+	AMD_PINCTRL_FUNC_GRP(262, 1),
+	AMD_PINCTRL_FUNC_GRP(262, 2),
+	AMD_PINCTRL_FUNC_GRP(262, 3),
+	AMD_PINCTRL_FUNC_GRP(263, 0),
+	AMD_PINCTRL_FUNC_GRP(263, 1),
+	AMD_PINCTRL_FUNC_GRP(263, 2),
+	AMD_PINCTRL_FUNC_GRP(263, 3),
+	AMD_PINCTRL_FUNC_GRP(264, 0),
+	AMD_PINCTRL_FUNC_GRP(264, 1),
+	AMD_PINCTRL_FUNC_GRP(264, 2),
+	AMD_PINCTRL_FUNC_GRP(264, 3),
+	AMD_PINCTRL_FUNC_GRP(265, 0),
+	AMD_PINCTRL_FUNC_GRP(265, 1),
+	AMD_PINCTRL_FUNC_GRP(265, 2),
+	AMD_PINCTRL_FUNC_GRP(265, 3),
+	AMD_PINCTRL_FUNC_GRP(266, 0),
+	AMD_PINCTRL_FUNC_GRP(266, 1),
+	AMD_PINCTRL_FUNC_GRP(266, 2),
+	AMD_PINCTRL_FUNC_GRP(266, 3),
+	AMD_PINCTRL_FUNC_GRP(267, 0),
+	AMD_PINCTRL_FUNC_GRP(267, 1),
+	AMD_PINCTRL_FUNC_GRP(267, 2),
+	AMD_PINCTRL_FUNC_GRP(267, 3),
+	AMD_PINCTRL_FUNC_GRP(268, 0),
+	AMD_PINCTRL_FUNC_GRP(268, 1),
+	AMD_PINCTRL_FUNC_GRP(268, 2),
+	AMD_PINCTRL_FUNC_GRP(268, 3),
+	AMD_PINCTRL_FUNC_GRP(269, 0),
+	AMD_PINCTRL_FUNC_GRP(269, 1),
+	AMD_PINCTRL_FUNC_GRP(269, 2),
+	AMD_PINCTRL_FUNC_GRP(269, 3),
+	AMD_PINCTRL_FUNC_GRP(270, 0),
+	AMD_PINCTRL_FUNC_GRP(270, 1),
+	AMD_PINCTRL_FUNC_GRP(270, 2),
+	AMD_PINCTRL_FUNC_GRP(270, 3),
+	AMD_PINCTRL_FUNC_GRP(271, 0),
+	AMD_PINCTRL_FUNC_GRP(271, 1),
+	AMD_PINCTRL_FUNC_GRP(271, 2),
+	AMD_PINCTRL_FUNC_GRP(271, 3),
 
 	PINCTRL_PINGROUP("i2c0", AMD_PINS(145, 146), 2),
 	PINCTRL_PINGROUP("i2c1", AMD_PINS(147, 148), 2),
@@ -1620,6 +1778,22 @@ static const struct amd_function pmx_functions[] = {
 	AMD_PMUX_FUNC(142),
 	AMD_PMUX_FUNC(143),
 	AMD_PMUX_FUNC(144),
+	AMD_PMUX_FUNC(256),
+	AMD_PMUX_FUNC(257),
+	AMD_PMUX_FUNC(258),
+	AMD_PMUX_FUNC(259),
+	AMD_PMUX_FUNC(260),
+	AMD_PMUX_FUNC(261),
+	AMD_PMUX_FUNC(262),
+	AMD_PMUX_FUNC(263),
+	AMD_PMUX_FUNC(264),
+	AMD_PMUX_FUNC(265),
+	AMD_PMUX_FUNC(266),
+	AMD_PMUX_FUNC(267),
+	AMD_PMUX_FUNC(268),
+	AMD_PMUX_FUNC(269),
+	AMD_PMUX_FUNC(270),
+	AMD_PMUX_FUNC(271),
 };
 
 #endif
-- 
2.34.1

