Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013011.outbound.protection.outlook.com [40.107.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C38EEC3
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789968511; cv=fail; b=ZpY8h4NN8t8Er0ZKAKl1lclKAHnjcwp0z/K70OUks4YHDbB7zkIQ1ij6oSY/x5RmPL+ML8dvAVPjO4oTO/s6ylTA/CvKwW8YL4PT6CRcr6RGtLc/5OPT3Jraj4p+ZljP5Edrr/JmxKu/GrsixK/ryFNyDF189EfJJ3+/fq5fp0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789968511; c=relaxed/simple;
	bh=8c4pBA+/V3UIYVKcH8b0ZsSm4pAjCKMKwRoMbaye5ho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtxVcNAVEN2Ec0X60RGIh+kp7St19fe3K5mmnbZwBlUaTyiseAw2VaiYWi/I/wcBn4O9XAGnfkEChqbBFKTj0ZIlP8Ag5ytaJA1ZwfwRRj1VtO4TnKgKGOqOcIm0J5xC6PP2VMrr1cgkSFEwBF1YMK65l1/tr9+nQMNS3kGhj7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eu+K0RwU; arc=fail smtp.client-ip=40.107.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eu+K0RwU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1+PYfBBfyPd4AcGw8zcSqQuyRj5IGSPC9RqvKCxqmdDaEAZWY4MOVnxWhhrQj3RMKWfGfiWy7fTkXUASAiF0WPX5FUlVtJKx+qFdmEUhs2ENJ6wZ4AGwP5YkJ8981M/R6Bdh3udDlJ5DpyxkIMug7BYdbS4FThQqvAi22GPrZVrjS7B5+z1KwSOnay5cSWjrSI7XhL/w2FAMDuusCOer+fQwvknEQV3gOl89vyBKg5H1vU8v9GvDIeCCqoxtDlJYDPZ2bT3ayLnyPJp+EEVV8gikIh7FPk89HBy8BlSwtgZQjHUIWFreHbCfjxgctuz+evHKYc3ekc4GIiIVo6PKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCar5xcu+i5oaYuxtrhc0pJTJU/BNGDPTLc/6aFOXDA=;
 b=Bo25uebYmjbFEVwFu6MRmdPnxpdFvVBrXI5wemDo0n0kU358yvTWFcwshu1VfDXGWJqjUpcTfZifOslyMcBHCjqDdJL8z26HyhBx/FyF73KyJrcarIDzCia5hXU7PwwHKxcgyzxw9Gpbw4tBXUOIv6ntBSZuUnD3FutCzreE1D0tdurRx/sLM5HPqDzUdLp2PDwdAwqBAe8ohJ8S6lFFG5v3nqq9mD1HJSH2zWa3Jjd7tVRKYmu1zCBBm0nOAIVKI7A0W+WQQsIdJjigIXxKtifyoq8BUJJwEce5S1mhgNilyicwWHSB6eQMaNK2IAb3oCUMJfZLM/ene2A4J5QOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCar5xcu+i5oaYuxtrhc0pJTJU/BNGDPTLc/6aFOXDA=;
 b=eu+K0RwU0WnJdx061PNN0MWs641a8mofxuZOQtYOt/4q2jcMGiqr5wsVUfNNyytf+EKRANQSoOEnF8rHhLndiHBPvWDgCvuv6c0nclk6BjILiEcMY3S+X5+/T8lws3QjoS7PsN1DKy74e+y3nnX356HDqPbgSe0hfSQVfgg/oqU=
Received: from MN0P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::8)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 05:28:25 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::30) by MN0P223CA0017.outlook.office365.com
 (2603:10b6:208:52b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.14 via Frontend Transport; Mon,
 21 Sep 2026 05:28:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 05:28:24 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 00:28:22 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 1/3] pinctrl: amd: Centralize per-pin register access
Date: Mon, 21 Sep 2026 10:57:43 +0530
Message-ID: <20260921052745.1056249-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
References: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: da1ccf01-500d-4d2a-c866-08df17a128b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|11063799006|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ympDxFfg3P3zlY/6al4f9R7aO8cmLqtjF0a3B3d8gwx+PaoxQpXNUz+VLABpTkTSjiVgpXXkhSprSL/AYc10IH4g0EZBlKLyafn95ile/WphvNF6zNL/uPbqqCCGRnd8QojDwfPFsxRC1rJeycoehmPyepWrUGf6RnXTFFF/Gpp4BLJ0gbrQRlpyo4ZPlj10Yg9/0B0YEEzgm17TOCGSj/HaFCZvgUPfXvoMGKoWPoHxw+a5/vio9MtCOW6mpheFFUp09nn/yWt4iHsXGj9c6whO002Kv90q8XxQs0U2vuBANUwxRv/Br4mKvukl0DrbFnpiKGlOLYfYmpCa4/JUPGNBp5cG9GOzbhLy9+1tmiRi1lf/TOXbwcLT3lJOnKwleevBPDyOfGD/nTixJynQc8pSUBkSsSarXJropBS2URjSVxLsm3aJ1EJ4L3bR1AIumaludQezIqWAsCec6siYaz9m98XBFnc8JV1TpyUQNCE8pE4RAeEW2gpUbkAlE8k6L2Oy59/yhRFGSD4I/6MnfpipiIMkM5ecpwC3gldo7J7N3Hm87bNH28G7Zxo/b8TC6kO8BL1oDBXz66lqYcxe4rrMOAFLF105SYZx+yfKc1FbUOZJJRxjAXfl7zn6c5zZoidgzSptpj4+Nb+PJFZXL5/N2c0EWlB2IxnbPibd2gEPMKJUdim8fi6+U+BC6x6MkDXSA2BUgZT1TYiH7FGRBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CMXua6T0lA89JOo/7pwmjT9383FNUjSxeqm4YaLlRuc9zOwmSQ2TvMBtMUUaAFgJ0mqAO2BT9EAuYouo84MCfqFQ/byyx9Ge/dj+6mnq/WimkokaXvpjEBCgf0FyjJUJ6EwCVl8cdGojDIsJKcgqXIupSzooKQ6dWCJO7LyIb7YzFHPjP7esLPNzgorLQ+qgnkdDMB3U093/ylB0CmrSrPXNFQBkUtK7dA3Tm6DDrzaALd/gueul3G1cuut1H9NlffKUCS7tc2Z8SpbUPtJ119UVcLjTnfXrNeUIEvhY2TKXuUYsI8XRxg3rwfYax+SuZyzkdysUC6n2rgZJDD7lsF2N9cBYQYafDifRkLpMnyPJWh8XmZ8dHJuMKt1Q0hMfVtOPGJTRNyTZhmFvfAdyNrrMyeH1GaS2yjjr4Tto4yA/T2nYEzyb86RGRV+7qIzr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:28:24.9393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1ccf01-500d-4d2a-c866-08df17a128b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206

Add a helper to translate a pin into its per-pin register address and
use it at every per-pin access, so a second GPIO bank added later can
be addressed from a single place. No functional change.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 85 ++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 65728b590999..543733c2aae0 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -40,6 +40,11 @@
 static struct amd_gpio *pinctrl_dev;
 #endif
 
+static inline void __iomem *amd_gpio_pin_reg(struct amd_gpio *gpio_dev, unsigned int pin)
+{
+	return gpio_dev->base + pin * 4;
+}
+
 static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	unsigned long flags;
@@ -47,7 +52,7 @@ static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	if (pin_reg & BIT(OUTPUT_ENABLE_OFF))
@@ -63,9 +68,9 @@ static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	pin_reg &= ~BIT(OUTPUT_ENABLE_OFF);
-	writel(pin_reg, gpio_dev->base + offset * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return 0;
@@ -79,13 +84,13 @@ static int amd_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	pin_reg |= BIT(OUTPUT_ENABLE_OFF);
 	if (value)
 		pin_reg |= BIT(OUTPUT_VALUE_OFF);
 	else
 		pin_reg &= ~BIT(OUTPUT_VALUE_OFF);
-	writel(pin_reg, gpio_dev->base + offset * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return 0;
@@ -98,7 +103,7 @@ static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return !!(pin_reg & BIT(PIN_STS_OFF));
@@ -112,12 +117,12 @@ static int amd_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	if (value)
 		pin_reg |= BIT(OUTPUT_VALUE_OFF);
 	else
 		pin_reg &= ~BIT(OUTPUT_VALUE_OFF);
-	writel(pin_reg, gpio_dev->base + offset * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return 0;
@@ -137,7 +142,7 @@ static int amd_gpio_set_debounce(struct amd_gpio *gpio_dev, unsigned int offset,
 			debounce = 0;
 	}
 
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 
 	if (debounce) {
 		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
@@ -186,7 +191,7 @@ static int amd_gpio_set_debounce(struct amd_gpio *gpio_dev, unsigned int offset,
 		pin_reg &= ~DB_TMR_OUT_MASK;
 		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 	}
-	writel(pin_reg, gpio_dev->base + offset * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, offset));
 
 	return ret;
 }
@@ -248,7 +253,7 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 		for (; i < pin_num; i++) {
 			seq_printf(s, "#%d\t", i);
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-			pin_reg = readl(gpio_dev->base + i * 4);
+			pin_reg = readl(amd_gpio_pin_reg(gpio_dev, i));
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 			if (pin_reg & BIT(INTERRUPT_ENABLE_OFF)) {
@@ -387,10 +392,10 @@ static void amd_gpio_irq_enable(struct irq_data *d)
 	gpiochip_enable_irq(gc, hwirq);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 	pin_reg |= BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -403,10 +408,10 @@ static void amd_gpio_irq_disable(struct irq_data *d)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 	pin_reg &= ~BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	gpiochip_disable_irq(gc, hwirq);
@@ -421,9 +426,9 @@ static void amd_gpio_irq_mask(struct irq_data *d)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 	pin_reg &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -436,9 +441,9 @@ static void amd_gpio_irq_unmask(struct irq_data *d)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -456,14 +461,14 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 		   hwirq, str_enable_disable(on));
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 
 	if (on)
 		pin_reg |= wake_mask;
 	else
 		pin_reg &= ~wake_mask;
 
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	if (on)
@@ -502,7 +507,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -568,11 +573,11 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	pin_reg_irq_en = pin_reg;
 	pin_reg_irq_en |= mask;
 	pin_reg_irq_en &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg_irq_en, gpio_dev->base + hwirq * 4);
-	if (readl_poll_timeout_atomic(gpio_dev->base + hwirq * 4, reg,
+	writel(pin_reg_irq_en, amd_gpio_pin_reg(gpio_dev, hwirq));
+	if (readl_poll_timeout_atomic(amd_gpio_pin_reg(gpio_dev, hwirq), reg,
 				      (reg & mask) == mask, 1, 1000))
 		ret = -ETIMEDOUT;
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return ret;
@@ -615,7 +620,6 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 	struct gpio_chip *gc = &gpio_dev->gc;
 	unsigned int i, irqnr;
 	unsigned long flags;
-	u32 __iomem *regs;
 	bool ret = false;
 	u32  regval;
 	u64 status, mask;
@@ -629,15 +633,14 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 
 	/* Bit 0-45 contain the relevant status bits */
 	status &= (1ULL << 46) - 1;
-	regs = gpio_dev->base;
-	for (mask = 1, irqnr = 0; status; mask <<= 1, regs += 4, irqnr += 4) {
+	for (mask = 1, irqnr = 0; status; mask <<= 1, irqnr += 4) {
 		if (!(status & mask))
 			continue;
 		status &= ~mask;
 
 		/* Each status bit covers four pins */
 		for (i = 0; i < 4; i++) {
-			regval = readl(regs + i);
+			regval = readl(amd_gpio_pin_reg(gpio_dev, irqnr + i));
 
 			if (regval & PIN_IRQ_PENDING)
 				pm_pr_dbg("GPIO %d is active: 0x%x",
@@ -660,7 +663,7 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			 * avoid a system hang caused by an interrupt storm.
 			 */
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-			regval = readl(regs + i);
+			regval = readl(amd_gpio_pin_reg(gpio_dev, irqnr + i));
 			if (!gpiochip_line_is_irq(gc, irqnr + i)) {
 				regval &= ~BIT(INTERRUPT_MASK_OFF);
 				dev_dbg(&gpio_dev->pdev->dev,
@@ -669,7 +672,7 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			} else {
 				ret = true;
 			}
-			writel(regval, regs + i);
+			writel(regval, amd_gpio_pin_reg(gpio_dev, irqnr + i));
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 		}
 	}
@@ -745,7 +748,7 @@ static int amd_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + pin*4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	switch (param) {
 	case PIN_CONFIG_INPUT_DEBOUNCE:
@@ -790,7 +793,7 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
-		pin_reg = readl(gpio_dev->base + pin*4);
+		pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 
 		switch (param) {
 		case PIN_CONFIG_INPUT_DEBOUNCE:
@@ -820,7 +823,7 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			ret = -ENOTSUPP;
 		}
 
-		writel(pin_reg, gpio_dev->base + pin*4);
+		writel(pin_reg, amd_gpio_pin_reg(gpio_dev, pin));
 	}
 out_unlock:
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
@@ -897,9 +900,9 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 
 		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 
-		pin_reg = readl(gpio_dev->base + pin * 4);
+		pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 		pin_reg &= ~mask;
-		writel(pin_reg, gpio_dev->base + pin * 4);
+		writel(pin_reg, amd_gpio_pin_reg(gpio_dev, pin));
 
 		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	}
@@ -919,7 +922,7 @@ static void amd_gpio_check_pending(void)
 		int pin = desc->pins[i].number;
 		u32 tmp;
 
-		tmp = readl(gpio_dev->base + pin * 4);
+		tmp = readl(amd_gpio_pin_reg(gpio_dev, pin));
 		if (tmp & PIN_IRQ_PENDING)
 			pm_pr_dbg("%s: GPIO %d is active: 0x%x.\n", __func__, pin, tmp);
 	}
@@ -977,12 +980,12 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
 			continue;
 
 		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin * 4) & ~PIN_IRQ_PENDING;
+		gpio_dev->saved_regs[i] = readl(amd_gpio_pin_reg(gpio_dev, pin)) & ~PIN_IRQ_PENDING;
 
 		/* mask any interrupts not intended to be a wake source */
 		if (!(gpio_dev->saved_regs[i] & wake_mask)) {
 			writel(gpio_dev->saved_regs[i] & ~BIT(INTERRUPT_MASK_OFF),
-			       gpio_dev->base + pin * 4);
+			       amd_gpio_pin_reg(gpio_dev, pin));
 			pm_pr_dbg("Disabling GPIO #%d interrupt for %s.\n",
 				  pin, is_suspend ? "suspend" : "hibernate");
 		}
@@ -1031,8 +1034,8 @@ static int amd_gpio_resume(struct device *dev)
 			continue;
 
 		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-		gpio_dev->saved_regs[i] |= readl(gpio_dev->base + pin * 4) & PIN_IRQ_PENDING;
-		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin * 4);
+		gpio_dev->saved_regs[i] |= readl(amd_gpio_pin_reg(gpio_dev, pin)) & PIN_IRQ_PENDING;
+		writel(gpio_dev->saved_regs[i], amd_gpio_pin_reg(gpio_dev, pin));
 		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	}
 
-- 
2.34.1

