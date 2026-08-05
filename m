Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021125.outbound.protection.outlook.com [40.107.130.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE4340EBBD;
	Wed,  5 Aug 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933285; cv=fail; b=H6uGlV2Eu9Uia/ZjrkvzfGfKJzEScJ8qb4z3HGYRAQBEeGiMtOMZzIDc6IAohB/MHFu+TVydjJRdB6WuPkD+NcFfsgMZdDwmyH+LagyHh1JrnPLJ1/pPkr0yjB/WQ3OGGW0agpjSr60v14UCT3fDCSxSSRkon+PBnqeL7+Oh3pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933285; c=relaxed/simple;
	bh=bt2sCs2S59VyBr1KWHWu2kV6yVf83iUP5pTj75SOr/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YRwNTocj+7qg6bezQf9z5HlmonELNpvHxPm3FSx1dKcpEdWfJWrZCkQ6i1WcfVWbaJrMjRcKAadwMlCvvBMQ9X0XuJ0iKDxPyaB0SIkXgUec/xDyFmpnigy/S3t8ABWzXNCzYM0KhwxXmVvAhmHUKl+NYxPr3Za79dlmWO5efbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=cQtyeEOf; arc=fail smtp.client-ip=40.107.130.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="cQtyeEOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEJzaDqM/i5aRsIGuquV0SHIfXjKrXFcnaS5QPusw6679t0PW57hoqteczk35OVnFxA0EyUFuIPCRuWmHVmP80/Jx0epTq3hXNicKEGIvidEWNnZaUZkXdNZJD9Jr8EJSo9T5d4KMKwjjw8DAe302vKU5qKggOd8V7IZ9ec5MPQ5S59J24ST8T7MrlaBEPf0Vx8hLLFPZmEtOEd2qThnlGzEnS8SSPBEyAhnbJZKLsxKQTXBRiZhPONpAdInykQtAmDYC4+T/1wvclMtV+PwuhbDOCNF4tTS7mLerZlxg5lIw9kuoyF7zKyfvzvzMvGN2tNme0wkFOJAce0bpWCVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h8jDvueuDWMLAhzDXJvDtsubaKc0SmI89WT4uFyzPU=;
 b=wkr3f5r+Nsx/kbaW8gYvPVPlcAoW6QuN9bCh1vutxK6KkP4vqt/56SW6vhx/ZLvtsJiNvl6qcx7ON7w74i3oRQ73dB+EdlPWjL1Gkevu4rTw2dtYnnqLtFYswoO3ovZynUcbd3RYVZK74ydia9X4tB0xqyT+pISMYB8BBGQlaVGaE8oy+NW23XhI9O8X3qDwnEmZuBl8eKqEnSNUSw6XLaWdonejJxJiiF8SXSkMdyHuY9vOP6qNXAFcDkhTZaYsrBeE7iZOKhfQRfyRPvD0KzlyL+l3iplxGOl7DKrr6mcR5WGfzTldm0aIfrtPJDg7HLHWGUvkHTjhATWCNd9m9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h8jDvueuDWMLAhzDXJvDtsubaKc0SmI89WT4uFyzPU=;
 b=cQtyeEOfker/ZvkC097ufdPDrNP78eoHQvqaaafeTDLuH/hobuXNBkE0hxrvRT/qGKyOuTNlxOXO+nweTDo2W3sjnwmhMwDkoXQMPG8cB1YWYbZ9avjmpt05tJwjaLi+hErVRtESjY5cVRueqhrCuVIPMRxY3tReoCdrs2cPKbnzjaeGk5+rayyD2s2ACz7gZ9bxkE2D+y8dTtuegGUbSIjKkVdP8kpnpWQ06OnVdBTnsAFV/Gj8sVjpB8BCHTW3ctfHliJT7vDeUPy6bV4d8WbviU2AOOGlAOufnbtbX4Je53aWUSl2uGv8s64x9qqEdB3Fw7ZQmFq7JEz1ZeU7cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:33 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:33 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v10 06/36] pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
Date: Wed,  5 Aug 2026 15:33:38 +0300
Message-ID: <20260805123408.3767648-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: cdac96a1-eb4e-4ec4-b797-08def2ede706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	KNrENcaxJHUJAryuREza7Vp4kIDkcQL68Bx7rC4Y4UzkIqRUWRbBYOjvPVqScqkBMrADtTo7Q1+eoXsIUZQ+EJRcWVP7Gk8I8aBbRfmzCh10BXHj9YsOX15d+E2jx+6396Pb4j2IbODthoOVl1hwqEWdRInAHvkLUjz7iI5YldIZLl+xWvHzHgOGI6T6nfTjMkpoF+eVlUP2A7V9GbeOIrgNm8dm6kX2Yl3oiJIf05ZSdHgasqK7TvWkq09Izpo0zB0R6gEMmoyuH+ghuRfUcqYr+/SebPCpJQGy4Qf6QFPvZ+LeE04KvJIeMwbqkDv0d0tKmJCE/jbu/PTni5DmgfJnICqcAteVW9SmVp/9dOdD73YME39VQ4Vg4cTvjXTWwYSuoDkMD3FRQhqTYcWq68QrLUnDtDN3ONE1GfFuDG1DV6r1hRc5GYtPhATlqeKRBi1Dfx9lHTfFTvuz4ftgca8QuCa7ARJpbMtnuaTWj9xptyDHtEwzNSVI15FIJqukh6X/KSFOUjLIS6GQUX51n/AmPOEVM6QuTVlXTzZs6CdAUk7h91xSZqHNmd5FYcghNqDeLRFAd3idNUCx/funfDnR2QB8xQOEvWZ8+VPzsbZWqkxLMFsE5LQ07RU1rFA2Lw8oKsJ9loQkFRPw9aUHkaLmiG4RfgCvSqFQ8AqYohpdlzXdDpufHsnTLnyYNVMNNGS7gpDU39n3IlSNWKI3YOep/+e/Zir5ZxJJwLubmjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nVmSeu8jeiLqv2I9jMOyqcOS1ScytnV4RTUoj5NwCoJC6IiDRdD2Aw9Nrpcc?=
 =?us-ascii?Q?AoeX61gAo+6pL2zOKS83GhedNlr5hQsf08KIsk5Aqi8zxY02dwHJB9UT2eXt?=
 =?us-ascii?Q?EjI4dPjLpRDdfDjfnLYDop2ocRlh80N9oRwxJAuCwzdgRhwatTd+hjo030CQ?=
 =?us-ascii?Q?9oSSeAyRu4HfID+foygBHFYoxbetOWn5HZ3KuEblZ+NRY3XGDKKlfwqQB7HT?=
 =?us-ascii?Q?ZFIJ7z6V/g9WH3sOXkuouneDCcO2kXs57MryNVrCSLY4FT/HBbp0mAKyWRxV?=
 =?us-ascii?Q?zt+mJAVVFp7gH6nbOZgV1q7rFju56THNIZh0nf5iJBPk/tjVGj5u4IdxsH5p?=
 =?us-ascii?Q?tgTQbpabIIFiaa2CzR588japQnnVq6lmKn3kp22wgZDG/C+QY6nznz5YHGV6?=
 =?us-ascii?Q?zQDHjPHyBfYahsFBObIDT3Q20rrdpBLufAq1gj11Ae3Zqnt0Ca8KlsMRSUNk?=
 =?us-ascii?Q?Fyyp06IApao+CtSvulY/ZbCSZ4kRywHAGxqfAJ4xYyFKBkdbP4Ik6oVNxVBw?=
 =?us-ascii?Q?tfihRHBpBXy9G+3PDr37mKgqFsLtsd/Mk0EEaopRYQ2l2ByyMsT8w+lgI4nD?=
 =?us-ascii?Q?L7pXI8uzsxaukD9UgtdjYOIlpbbiAXP81obzVUaujV+znr9pJF6Peavw9gU0?=
 =?us-ascii?Q?WfggDhT4f9lepV0LyvFRhrBig7T54vA1rjniAZDEQyUOpbJnGElQH4ok/RbV?=
 =?us-ascii?Q?ZM/zT2i3wZK17Nh6pvATNvDcnYVjrts75fM4pHKUsv3Q48FNnpiaq5RjDX2U?=
 =?us-ascii?Q?8z1jfmmAPtHmKSjC4s5YHc0AxZIKcP7JcrADmuBaWXFsN0k+XREsgO6Fm0km?=
 =?us-ascii?Q?s1GT200YrPyvUr/qekvAMNoMXDnm8wJfO0YSPELfj/PcvzJ28xCS2N+SEUeD?=
 =?us-ascii?Q?EhmhQXphftfPTCIrH7w77BrCTPD7IEYh7amC1VLhK3qFcQ9giKJVNPMfUxku?=
 =?us-ascii?Q?sorORTPJYQC51fXAevQPgZ66qs1huxrO1gu109xgyKXVmXaUidkR0IAwn7Hn?=
 =?us-ascii?Q?sxKBkVbCtIn+Ms3DsMvR0pdk40ZfHH6DbMXZpIT0/0I+vwAP4iD+Nzneqzqk?=
 =?us-ascii?Q?q+gGgDnNAiH7y5T+nStPU+fNOofEVmCyatZyrHhrczRMk35P68BLij50pth4?=
 =?us-ascii?Q?T7r72+qxVzPK3fOiakiR+Pgbt6yYfwxZ30I5EM1ib1jGMmOmsLzzvnZd1Ww+?=
 =?us-ascii?Q?ezdaBmyhc5rBnb3HZvxV64Z9RETjlwLIuXbYR1ovZcDV7O9npdUyv/HOrtW0?=
 =?us-ascii?Q?6K6szD3KydUqbYGjYZwCgYm5jIGVRc+bx1/strz5nB50bq8e+mIbe6g//zjp?=
 =?us-ascii?Q?5qsmKEcwJYfnJn/eBTn4rMEl1HU2a6mdirwCt61RUyY8AlxmiL0LIe89wEa9?=
 =?us-ascii?Q?sgdoBGdHZNla25cGLeHK1CGDHe1bVNpefgRq2feiGszIRtCSsmUz0jgsEXNC?=
 =?us-ascii?Q?ybSoOcqCbJhvF4YRPtm+Vl9i0kZdMvX4ympkTy4PzVetU3vir25tt2kzSehs?=
 =?us-ascii?Q?+yRH3PFQdNs6NOn8OrV/b0QxBpmtx9K/y/mBrOa8dvsWU9WdzCKaKP5lhZ9G?=
 =?us-ascii?Q?w5wHbtKm7t42/T9AcOGUHQVmIixJJfcasks6LpuFcKqb9amTM+CgMsOXbQkK?=
 =?us-ascii?Q?ZU9lmyAv9Zj09RoEfLsl32uGbv3tULVPvA8F24NzYF1ZI/RC0rYCUXL1l8HU?=
 =?us-ascii?Q?N/4dUnNnlK7mpCAKNs+9GLd+HHvoSjdFosWVC/NJQGmRuYWkedtVoLjPBKB5?=
 =?us-ascii?Q?0eFVZ49qUkvbjkCdZfHsDI+WmtZbyvg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: cdac96a1-eb4e-4ec4-b797-08def2ede706
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:33.2022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZYTidFwlvkMd8uSAcasAhm/stqcq3IpfRXkOt1G2SuRn7xgNpaOItIWTIlSbrgo/+M/k/vr/SXB/+oXZWZIlG0Vq0pSfy5Wp6z+MVoDz1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

In the an7581 case
 * gpio47 and pcie_reset0 shares pin 60,
 * gpio48 and pcie_reset1 shares pin 61,
 * gpio49 and pcie_reset2 shares pin 62.
but current driver treat them as pins 61--63. This is wrong.

Also current an7581 pinmux implementation have following issues:
 * current pcie_reset pin function actually sets corresponding
   pins as gpios.
 * there is no proper way to set pcie_reset pins as gpios.
 * there is no way to set pcie_reset pins as pwm.

This patch fixes above issues.

WARNING:
There is a contradiction in the Airoha documentation. AN7581 programming
guide claims:
 - gpio44 and pcie_reset0 shares the same pin
 - gpio45 and pcie_reset1 shares the same pin
 - gpio46 and pcie_reset2 shares the same pin
While AN7581 datasheet claims:
 - gpio47 and pcie_reset0 shares the same pin
 - gpio48 and pcie_reset1 shares the same pin
 - gpio49 and pcie_reset2 shares the same pin
The datasheet should be considered as a more reliable source.
Thanks to Benjamin Larsson for clarification.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 122 +++++++++++++++++++-----
 1 file changed, 97 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d743d7fdcf0cd..0b54e029c8741 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -470,9 +470,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(57, "gpio44"),
 	PINCTRL_PIN(58, "gpio45"),
 	PINCTRL_PIN(59, "gpio46"),
-	PINCTRL_PIN(61, "pcie_reset0"),
-	PINCTRL_PIN(62, "pcie_reset1"),
-	PINCTRL_PIN(63, "pcie_reset2"),
+	PINCTRL_PIN(60, "pcie_reset0"),
+	PINCTRL_PIN(61, "pcie_reset1"),
+	PINCTRL_PIN(62, "pcie_reset2"),
 };
 
 static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
@@ -555,9 +555,12 @@ static const int en7581_gpio43_pins[] = { 56 };
 static const int en7581_gpio44_pins[] = { 57 };
 static const int en7581_gpio45_pins[] = { 58 };
 static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 61 };
-static const int en7581_pcie_reset1_pins[] = { 62 };
-static const int en7581_pcie_reset2_pins[] = { 63 };
+static const int en7581_gpio47_pins[] = { 60 };
+static const int en7581_gpio48_pins[] = { 61 };
+static const int en7581_gpio49_pins[] = { 62 };
+static const int en7581_pcie_reset0_pins[] = { 60 };
+static const int en7581_pcie_reset1_pins[] = { 61 };
+static const int en7581_pcie_reset2_pins[] = { 62 };
 
 static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", en7581_pon),
@@ -640,6 +643,9 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
 	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
 	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
 	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
 	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
@@ -883,6 +889,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -907,7 +914,8 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46" };
+					  "gpio46", "gpio47",
+					  "gpio48", "gpio49" };
 static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio2", "gpio3",
 						 "gpio4", "gpio5",
@@ -1406,6 +1414,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1413,7 +1460,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1422,7 +1469,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1431,7 +1478,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1484,6 +1531,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 		.regmap_size = 1,			\
 	}						\
 
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1528,6 +1593,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
 };
 
 static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
@@ -1804,6 +1875,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
@@ -1897,9 +1969,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PU, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PU, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PU, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
@@ -2014,9 +2086,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PD, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PD, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PD, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
@@ -2131,9 +2203,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E2, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E2, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E2, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
@@ -2248,9 +2320,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E4, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E4, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E4, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
@@ -2310,9 +2382,9 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
-	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(60, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
-- 
2.53.0

