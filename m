Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010069.outbound.protection.outlook.com [40.93.198.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712C118C933
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 05:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789968516; cv=fail; b=asyyQnqPk0oOtMnJMn8i/UFqE2HULsdLzmBkuDO45THI7hZDp/bYFydADLo6n3qzRUL79MEEJBxxw5WlhKuMI6Q35nJTEY1PcVBgqUcVMtkMGytjcx5EoK4Xgm/PLMVj6RCdjGwRbhxQj4bBge05ikrPpOo6zZhLZzFOpLjdJr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789968516; c=relaxed/simple;
	bh=XCUD8NfwZI7X+g3pPF91IQKH6HUtJ1+8B6OcwaHDLlM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krvBCctR6kHnOu0usu0RQDkTmeo60aieUKr/hb0aUNVkpQ2q9FBFWCnpoaF3xQXGVPPV0fIJlhlsWFQjrwodV7ZIndr2GLCX8umw+fL9a9logrXjB33QIu70wWobZOnMT3pHKTZQHrSMF5Y7x1DilvF78A6bat2PkltCUlf4Xhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Dw9xW1LM; arc=fail smtp.client-ip=40.93.198.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Dw9xW1LM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+AO+oSlbvcw6TyISXo0gkfn8Di1phg85YvppgS449+vYLfUFPNQP5veXhGLfw5ddqoJwEVRZ87w8/gxvzxKlrW4WC7p/VOAZGk6AXme6v5gxTH8GkN0JyZqosBUf/xfO9go2DuFzttymaBIqIhWmbt3RCW3mbTVbdUXrsySSr+IM5uWvH4mz0ZyLcVu7zlomrc+O5aSsrKs+D7manFS5k0uGCNJrVvWOmX28dW1UO8hcRxVAMRWQwahhZNl1jdI/5attB2CJdIwyMegUye/J+NTVOeceKuMmS2Bf2mubcJGsO+aVccIvmHfcUsomTAGehHDPgbwyBxt9uOVQ3cmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpUdtnvG5+UXYqW8UlfKtjJukYdmn+lij6SVkKMSnQg=;
 b=QY3ZmdPNfxDiSqMiSTrerZispswDfXIeBxCI6peFbdc8exSCmcnEkH+FOOXL2hSlD8ykR0bQT/10GQD/gL3boVz9YRxZ8Kn6LpazgbCzXUjTiAZQu0tYkjQY3ZehKQjcVTXBH0WWscMtYDve1Ea8i2amCyGDLMcQzLhFU6s6EWm4obK7G7aUWRQj5iMCMsPeM38hB/wOFUub5/mUcU4+ZIMTrtdsd1ol4gI0d7/JSLzixa4tNysInUNpApa3Tb2+VjhPC+xNlwnhRnxl7od7BvR83rbMXjy+bZCrdJLzysGSIFuA+ZzJ3rZDqmb0IfebaGuVrO2SoQ3U4dXMWyNnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpUdtnvG5+UXYqW8UlfKtjJukYdmn+lij6SVkKMSnQg=;
 b=Dw9xW1LMiaa+hDdQkX3uCEwbxkZZHCdpBcQUQwgdsY4xojjANAdX9Ad0GkNiGhzY4TbAi5IvwJlT8EsdRsGplCAqale4+F5b/oQDkAuHXpxYGyqSQwXTQ3oPDbBRgr/wmymIs0wXSNtm08iRO6hGRb1R7k+9Fpd9zPO/boIYR2s=
Received: from BLAPR03CA0173.namprd03.prod.outlook.com (2603:10b6:208:32f::35)
 by PH8PR12MB8432.namprd12.prod.outlook.com (2603:10b6:510:25b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 05:28:30 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::17) by BLAPR03CA0173.outlook.office365.com
 (2603:10b6:208:32f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 05:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 05:28:29 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 00:28:27 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 3/3] pinctrl: amd: Add support for the Remote GPIO (RGPIO) bank
Date: Mon, 21 Sep 2026 10:57:45 +0530
Message-ID: <20260921052745.1056249-4-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|PH8PR12MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 5babb479-38f9-4a30-2510-08df17a12b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qoHf+E6KjEFwser1EvbjsR1FeY9PbjUYhRZdh8X7CJ5NfXyxsQsvI6xKnoRj0GG7q9CxtEIrRFJForM0P/W6Oe5U7dFwLkFLvB/n8tPJimMMOJC3GeWDwDs13ANLmKfs+d9DfSf2+dfcxozTOcDyD6gHw1PCQgwHKL+5Vkwt0hzxveIodmJyzLi3KZ2q08MXgvnufcUDWZX+2eRUIvOfrfFkoWiha87xFFCVv3viyY/t/dnE+y3eoN5hk+ZROkxIhRZlPQGZl+JyBsDt3AKSIaeyvgyMNpj4Sd7OEu7VylfYSY691l9gjG4ceZBMlQOrXxRYwlKkSrgmeeOShOJWmrA8qSWHUEKTY2XgTZG+sqg7DbJpb94HpwdBFRDUZ1FOfN9zJL4IIA9PfkYJpMGtTL1w84jskW9nLV+Gm+oVJJXPCeCrrlf/M5+Q6QUTbhn+0rk5ys7/bCq3yli68ALTKpxtQFNKV00DwRE8V0EKwbHiQpogWiSCHK3hx1Qp7IEYEXLin5wvP05CnjfEaoFjzwQfGS58KCxXUEsYAwrVrO3416S2gFyir8Di6cdKtaJ7apXzWwNVmnQ9QeBvYEf4F4fy5dngA8CKGsa6ZpR2lUJVmvU3nOeicgzED61jF3ok/Q2hVA8MA5qPYYPS1nDJp8MSf5AQNKIsqypnDjlvT0j6YdAAbPyNQIxv+y6Lkf4vd+ozbQqyogxK7wOgu+DFrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jP2sGyXQDTRXDll+ZHNO4/4eiSoaHtaibzh5Wgn+ZqKT1gL9CfRDyN0ft6epycejVCu0IoFezgoT4DvJcuvp7QE/x29/D6HspVGJOqhzwQyWv0ZGk4q99pz+yAJBeDIo6iyG/b3Z2zvQspPXxJfkUGgXzJtps5B4ha5lU37B65YmMcRmTo80nMzsYwQWe83zBJrAepvwIuqU2/PTAEYZ4IKgDIjprNE4JB+SJQjdZJjpNIuKbRydGyQ3AkdnYLoiXL83dV+AlX/SndtXc5Wd3HAoVVehxwjRnDONuhFjR3/YxB90F3q+Rde0QDCmuhnmFNQtX9jJIQBpFq7BdiQUllqM8P08015NMNU+FCPmPfuDuvCVd0CeJudfJ9pJDmmBnwobt8TlLO3ehT5iTDWDhIpO0XPHx+J5EqlfTYQxXcEPWWfpwm2CZhPw7i2tqnoy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:28:29.6738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5babb479-38f9-4a30-2510-08df17a12b84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8432

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
index 18fce75fe86c..e8b9a8e57149 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -42,6 +42,8 @@ static struct amd_gpio *pinctrl_dev;
 
 static inline void __iomem *amd_gpio_pin_reg(struct amd_gpio *gpio_dev, unsigned int pin)
 {
+	if (gpio_dev->base_rgpio && pin >= AMD_GPIO_RGPIO_PIN_BASE)
+		return gpio_dev->base_rgpio + (pin - AMD_GPIO_RGPIO_PIN_BASE) * 4;
 	return gpio_dev->base + pin * 4;
 }
 
@@ -244,6 +246,10 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
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
@@ -676,6 +682,58 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
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
@@ -747,6 +805,9 @@ static int amd_pinconf_get(struct pinctrl_dev *pctldev,
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
 
+	if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+		return -EOPNOTSUPP;
+
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
@@ -789,6 +850,9 @@ static int amd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	enum pin_config_param param;
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
 
+	if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+		return -EOPNOTSUPP;
+
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
@@ -898,6 +962,9 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 		if (!pd)
 			continue;
 
+		if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+			continue;
+
 		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 
 		pin_reg = readl(amd_gpio_pin_reg(gpio_dev, pin));
@@ -922,6 +989,9 @@ static void amd_gpio_check_pending(void)
 		int pin = desc->pins[i].number;
 		u32 tmp;
 
+		if (pin >= AMD_GPIO_RGPIO_PIN_BASE && !gpio_dev->base_rgpio)
+			continue;
+
 		tmp = readl(amd_gpio_pin_reg(gpio_dev, pin));
 		if (tmp & PIN_IRQ_PENDING)
 			pm_pr_dbg("%s: GPIO %d is active: 0x%x.\n", __func__, pin, tmp);
@@ -1068,7 +1138,8 @@ static int amd_get_groups(struct pinctrl_dev *pctrldev, unsigned int selector,
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctrldev);
 
-	if (!gpio_dev->iomux_base) {
+	if (!gpio_dev->iomux_base &&
+	    pmx_functions[selector].index < AMD_GPIO_RGPIO_PIN_BASE) {
 		dev_err(&gpio_dev->pdev->dev, "iomux function %d group not supported\n", selector);
 		return -EINVAL;
 	}
@@ -1084,6 +1155,34 @@ static int amd_set_mux(struct pinctrl_dev *pctrldev, unsigned int function, unsi
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
@@ -1184,6 +1283,19 @@ static int amd_gpio_probe(struct platform_device *pdev)
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
@@ -1210,14 +1322,17 @@ static int amd_gpio_probe(struct platform_device *pdev)
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

