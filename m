Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588844BB5BD
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553243; cv=fail; b=k/UmisATB/L+kd7b0zpJHbhxaau2J27KjOWOMoueY3Aqi7+D/C7gpvr6zFcfYMRra2nv6UyR/5Rsrycsnb+cQ+6qkeL7hgnKSKINFdaheOO3AHU2JeK9IEq6YPVlKBwlEj7GyRjixPfsZsr5YjxY15SUfN4eTQm6LOc1M1UzEPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553243; c=relaxed/simple;
	bh=svd16p7+0ezEotBm6pH5RYY3PqGKx0EPYv51aP04KlM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZNWEGrg6TTs6yDkq/1FSqBOyRtlcFlEipO3ixIkTZ4bNff9/yzu29ljt60s+OF8K9cLxjhh3ixtrF/cMUZR6S9IbgClwW+l5ePFK4yC6cTXe0buK/23P3PJxhe1EP68Nv8fVAAzDuxawSGuXzbGY3F1M53MeoGBxQoo44zdJKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VDzqP+yU; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VDzqP+yU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pc0MU6wVCZFCKd6ZZN65Go8on9jKh6t/Ek+MITZyKq1ZB0I3tqYWQcdkNva0e2mhSG2PPgQxBr3uLEtLH2aPwOdmHumFMT2YZbs6aA1kFm/dvsm7t6ohDMbRKublpGxl8ataw2rZUY99yWtTzdXt3aUQMLecmVy0vBB2ziuPFggBEhZugavjbaYh6Ti7K2ca3tPnFRFYImnDUykcNA6D6DNLnOLUauq/Mm68B+wYi3V3yBNij9cTyX8c2EojUZoIhSnnW8vMxrVZgdBtbKjSYgeX2zZZMb2D2WjR1vMpASeEnVK/y6mgpqlu638FQsNTfnNypTVwSvsYpmGZ+BUZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diu4/LMfy3innOLLkJMlDZ1yG03ET9BMwiJUJulZ/b8=;
 b=UNuKBDJCPKXDi6TVvgLJZgfnQrbMlS2gJ/odwOabcHokNpfiMyFiJiHL4XMiDSEQUrt/JKzIvzSqKGPsTMeEM+CJemEFVd3dgBCJiQASyzVrnD0HX5UfP1dKaH7e1uhb2WibT+YClRPOenv51K7yuDSt0qaj3ES9oTwod4md1kAiUyN5i/PpO2poEIo4laSpLYdVULX3uxWbRAeGzmixJWCABjeWImutF/7m2sHXzPaluXp+mGEcibrBSWT2eOX3Xfn1OwHOewY8pRbuaAxzqpr3KOm9ykMhJ7Qc75YfUGLQLiCb67gE+f4U5hg/va5HG+XT9nvD3C1udbDqEk+HhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diu4/LMfy3innOLLkJMlDZ1yG03ET9BMwiJUJulZ/b8=;
 b=VDzqP+yUOCscYdb1gHYA/s0V3I6Crr9DEPB7IKkOJ8/BhcP+2QOPyXtRpeXVrkd9OVuVyhwRdX/6oG+CHdd4XLpewCzFyDi225zLiu+E5Nu598jMT30pBmex5lzRhUqEYbSA3WmJWalnIUwlBtm9Avg7dm9XmmUchvzxXKTYSKQ=
Received: from SJ0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:a03:3a0::35)
 by DS4PR12MB534619.namprd12.prod.outlook.com (2603:10b6:8:50a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 10:06:59 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::c) by SJ0PR03CA0270.outlook.office365.com
 (2603:10b6:a03:3a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Wed, 16
 Sep 2026 10:06:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 10:06:59 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 05:06:57 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/3] pinctrl: amd: Centralize per-pin register access
Date: Wed, 16 Sep 2026 15:36:28 +0530
Message-ID: <20260916100630.37849-2-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DS4PR12MB534619:EE_
X-MS-Office365-Filtering-Correlation-Id: 5234445a-6428-4c88-ab4c-08df13da3f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	O7MQ0oF88uzkfZUuabLDVAGyOsBqbtgrn5jO0gXaCvYfG5Qcnm1tB5YfAxsL8JIpoVVcbC0T+g4jlRJLuCCX/s0JeWDH8IQ+KjfuRZxsezX483NFfR8VdwdFeH5jZZjoMaXFvJZkPgIERBFn5m5n6bwpMMzsqeuA20njw6P2J40XPTgN0w6FdGXKs2nQOlX3hCJXjiu/uotkC3jc+SNo3BtH0XJRq32Rx5kKkfUTnzE6z9iuBmVmL4hmxnAabckfczKeHuzqFil9PBTGrUt2pjw8jhnGviKPAWJ6GefoZBNLPsSp5wjzOHsHUoh6CCPRKQl7TyU9ofJkFHQvLNepoxIbWZ7Ez1E0OZOyeBPXPQijJM1FyZke+LIvApw6Sv4xVMDvsRnmbpOeuCgAjJKPTfUV8a/Lp6zfrTsxdn99Dtt5KMt1yiAQzmCrVxX6k48hEdw/lXEYSL1NnNC1/Zf11DiDpQ0sb17ALJRBSThyQPY11reUan6eXzaJ6+2j676sA2Fu2sfGRbDzCBaGtcvHV0cE/HgeRx0AAXhpxypbnGk0P0xpx4W8PEGTR3Jop2G3ZeypVtMhJ5ALOYuOSyR7mj3vdOTuv5QV2ldZE8ilGYlbUq9xhFKullS9Wc+kkAePgJIrEjHO4h/+NdXgFjNVk+GpxRJ0xn3JPB0RnMwwsx6VqfuzTEyzaOPf7eOCvDXp9JVXYWwsd/AJdc6p5IdeWQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CgK4c9/BpM2iIYGOZy4EtXQQuGaubCdalrm2muGuu3twFgrglDKjqpnav5BW/AG6dbBd6C9l+ct0vuVynsWH07UD7IFZInM/1xMeHNNwJETmRRNnohyLkIZWLHFiO3vBf4V+JZmrlYMqwpT4WT25XFrySMqqAI3D3nnsIIxAlKaqFlxPFlouH688tZ2/j/EAI40bchaLT7Kc7WROjf2gftKVdQAL7WkiB1KeroUnWBsI0x9HnwrqaZwLW3weJGaDGA36sATJIw5Sm1xHbYdqbvN1q8Rz7ggaSrCfOEry5B5D5odPBW8rfGG8ymEuCQ3lXT40bqWLamNH69ItQAw3tkAyeM3erDx2J1Dy42eFCxnNys9ru03IZjZpj1HwrtBl0b7pT38fGM3p5G2jTjmoXutIze/+gtP5mbsziZgrDytVbXcXztoUnrBM1htbdUMk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:06:59.4533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5234445a-6428-4c88-ab4c-08df13da3f46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB534619

Add a helper to translate a pin into its per-pin register address and
use it at every per-pin access, so a second GPIO bank added later can
be addressed from a single place. No functional change.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 85 ++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 15a398bb3be2..7befc81c0938 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -39,6 +39,11 @@
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
@@ -46,7 +51,7 @@ static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	if (pin_reg & BIT(OUTPUT_ENABLE_OFF))
@@ -62,9 +67,9 @@ static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	pin_reg &= ~BIT(OUTPUT_ENABLE_OFF);
-	writel(pin_reg, gpio_dev->base + offset * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return 0;
@@ -78,13 +83,13 @@ static int amd_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
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
@@ -97,7 +102,7 @@ static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return !!(pin_reg & BIT(PIN_STS_OFF));
@@ -111,12 +116,12 @@ static int amd_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
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
@@ -136,7 +141,7 @@ static int amd_gpio_set_debounce(struct amd_gpio *gpio_dev, unsigned int offset,
 			debounce = 0;
 	}
 
-	pin_reg = readl(gpio_dev->base + offset * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, offset));
 
 	if (debounce) {
 		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
@@ -185,7 +190,7 @@ static int amd_gpio_set_debounce(struct amd_gpio *gpio_dev, unsigned int offset,
 		pin_reg &= ~DB_TMR_OUT_MASK;
 		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 	}
-	writel(pin_reg, gpio_dev->base + offset * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, offset));
 
 	return ret;
 }
@@ -247,7 +252,7 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 		for (; i < pin_num; i++) {
 			seq_printf(s, "#%d\t", i);
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-			pin_reg = readl(gpio_dev->base + i * 4);
+			pin_reg = readl(amd_gpio_pin_reg(gpio_dev, i));
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 			if (pin_reg & BIT(INTERRUPT_ENABLE_OFF)) {
@@ -386,10 +391,10 @@ static void amd_gpio_irq_enable(struct irq_data *d)
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
 
@@ -402,10 +407,10 @@ static void amd_gpio_irq_disable(struct irq_data *d)
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
@@ -420,9 +425,9 @@ static void amd_gpio_irq_mask(struct irq_data *d)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 	pin_reg &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -435,9 +440,9 @@ static void amd_gpio_irq_unmask(struct irq_data *d)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 }
 
@@ -455,14 +460,14 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
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
@@ -501,7 +506,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + hwirq * 4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, hwirq));
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -567,10 +572,10 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	pin_reg_irq_en = pin_reg;
 	pin_reg_irq_en |= mask;
 	pin_reg_irq_en &= ~BIT(INTERRUPT_MASK_OFF);
-	writel(pin_reg_irq_en, gpio_dev->base + hwirq * 4);
-	while ((readl(gpio_dev->base + hwirq * 4) & mask) != mask)
+	writel(pin_reg_irq_en, amd_gpio_pin_reg(gpio_dev, hwirq));
+	while ((readl(amd_gpio_pin_reg(gpio_dev, hwirq)) & mask) != mask)
 		continue;
-	writel(pin_reg, gpio_dev->base + hwirq * 4);
+	writel(pin_reg, amd_gpio_pin_reg(gpio_dev, hwirq));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 	return ret;
@@ -613,7 +618,6 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 	struct gpio_chip *gc = &gpio_dev->gc;
 	unsigned int i, irqnr;
 	unsigned long flags;
-	u32 __iomem *regs;
 	bool ret = false;
 	u32  regval;
 	u64 status, mask;
@@ -627,15 +631,14 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 
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
@@ -658,7 +661,7 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			 * avoid a system hang caused by an interrupt storm.
 			 */
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-			regval = readl(regs + i);
+			regval = readl(amd_gpio_pin_reg(gpio_dev, irqnr + i));
 			if (!gpiochip_line_is_irq(gc, irqnr + i)) {
 				regval &= ~BIT(INTERRUPT_MASK_OFF);
 				dev_dbg(&gpio_dev->pdev->dev,
@@ -667,7 +670,7 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			} else {
 				ret = true;
 			}
-			writel(regval, regs + i);
+			writel(regval, amd_gpio_pin_reg(gpio_dev, irqnr + i));
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 		}
 	}
@@ -743,7 +746,7 @@ static int amd_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	pin_reg = readl(gpio_dev->base + pin*4);
+	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	switch (param) {
 	case PIN_CONFIG_INPUT_DEBOUNCE:
@@ -788,7 +791,7 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
-		pin_reg = readl(gpio_dev->base + pin*4);
+		pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 
 		switch (param) {
 		case PIN_CONFIG_INPUT_DEBOUNCE:
@@ -818,7 +821,7 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			ret = -ENOTSUPP;
 		}
 
-		writel(pin_reg, gpio_dev->base + pin*4);
+		writel(pin_reg, amd_gpio_pin_reg(gpio_dev, pin));
 	}
 out_unlock:
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
@@ -895,9 +898,9 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 
 		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 
-		pin_reg = readl(gpio_dev->base + pin * 4);
+		pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 		pin_reg &= ~mask;
-		writel(pin_reg, gpio_dev->base + pin * 4);
+		writel(pin_reg, amd_gpio_pin_reg(gpio_dev, pin));
 
 		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	}
@@ -917,7 +920,7 @@ static void amd_gpio_check_pending(void)
 		int pin = desc->pins[i].number;
 		u32 tmp;
 
-		tmp = readl(gpio_dev->base + pin * 4);
+		tmp = readl(amd_gpio_pin_reg(gpio_dev, pin));
 		if (tmp & PIN_IRQ_PENDING)
 			pm_pr_dbg("%s: GPIO %d is active: 0x%x.\n", __func__, pin, tmp);
 	}
@@ -975,12 +978,12 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
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
@@ -1029,8 +1032,8 @@ static int amd_gpio_resume(struct device *dev)
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

