Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021125.outbound.protection.outlook.com [40.107.130.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96932F290B;
	Wed,  5 Aug 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933280; cv=fail; b=Hb2pCj6YETvCHDBCZs7vx/7yVx0umrMW/o/TeQxlPSAnHGc2mYUaORUDcpHZA+/CDFYTFtZizT8z4fXUPQDP8YNEQVjOGKQee3l6g2GDlpbzrgJ6IIfgA8hmo28qCihTi6g2VCMqkbvCLkg5MnlKAk8v/apRW6qStxWhbdXHwts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933280; c=relaxed/simple;
	bh=plzH7KgbgSLELmTktEMKa4KIg+7YiDTlJTQFDbxbzqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sNlF7THYNB8pC9ht0LwVmmH786PjfSz7RwPRfandEM0YKSxh0Xx5P/SkhLRYrjnFXrHqOBn87c6ML67MDX4sQwrZNurS7h6ruw2xEEUKQyS5eAVKF76mRr8EsUyb9s0xCI5hZBS43dm9VGGFoEcWwd1B7oL0ZRTaBe0QoMhogFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=eJjLevku; arc=fail smtp.client-ip=40.107.130.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="eJjLevku"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5mUUxkDBbhdVPTkoWO5gZO23UhTGGB+O3fKdmybtvBuXUsBbxy43sIQQ140Y4uZlR+XPbAszS9hJdTEYHQw5c61Qs7yhUiMWz+Rsk2lh/ZK7TsUOMH2C4tQRYLUD3hgKVrIKd2yeynWHXIyr305LVe0/oIkzCe1+k304TYMbbgiUn2BnqfVx+MqIdHAMzKBIwirDJIBq/lc1OV/hAltxXt9I5155KUXMgWJ0s5ESulKJl9v/zxVVbc/+R65VN1S/znOikKVj30EXwKG0NKjusk529ONUAkUCu6TS/4JN4eW+sXxatpOxP2o1MVlU1dBRnkmo/sYSdszcKSINJ1MVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=i+NXMRrf0s++GM21tKxd382U3tBW5tZ9Rp50UbMqqbVJolrJ3bSB/ZfDNpdR784BAiiSdT2E7ddR6imuPm+bZpbaE4e1dbUAiKkS2oCFLqwSA6yZg01Ghzfyky4EnSd6NXYhNdUG4H/W63f8+9N5/+biv5PDsZQJinwZLl0JwmUCgg5zGvQXFKaxEIho5w2bZ1q9//QW5vUQ1yfLJfxfq8wFIqeiFWLd3sUqYDw5qk9HcNkHasGJSKZ/jjuxaBP1D8dHw8n/13UTC6006umkre/jcMy3N7nQaMb3AJ395txLkSDGeJ6kRw0LWzL4LZfKZE817B6Muzo3sw+t0W0nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=eJjLevkulk72+YI8U9cUKMAW+sxAYmA3w9RgN7TZhKdNLbR9ND6JRV3SOrH9e5RYn9nFXylyPJm7SGh/pGJRg/6DdepjDoaaDnUEipN2NKPqAkDsyhbr/VpEmPwJS544Xh8h4u4LsezxVF4S8uQG78ryo5Fj/cbLIsOoeGNR+V6HdflubrvpMZrBqjXx58wvkZsqP3TI0jAOlqSf7aNZtFLVhUdSdBzPwRyeNSysfr1CC4XHLJLur9co5HYCUJzMfQhXy7/uXTiv4/vTx02b0BqQVGrKR945uo6jaeer9a9hidUQkU8JpYsgcZIKXmntXfO2RCK8IwKmBoxjuMZB3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:31 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:31 +0000
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
Subject: [PATCH v10 05/36] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Wed,  5 Aug 2026 15:33:37 +0300
Message-ID: <20260805123408.3767648-6-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 2fb71c2e-32d4-480c-8e06-08def2ede5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	x6dz7SFedyRatuAGRQfrK4+Ucc+bi5UDM4nrJZ4U1B+hPo441Xzb8gv9YSiLcfuY1kU5vDAQGsliNTVbF7m+MFGzfByYPfsRPrjkuP6WuqNk7DtV8dwsIzp9NComkZJY1S/BWOhwh9TGSM6h4dNgCs4iMV+Z/3vhDdWw8xxJgDlo3lJsrh7wD4ed2ZvGkswEfKkpWMVBFbTiKO+tkqR5wAn9S2dPbrZXTD3P18UOofcRqHBzkYkJkiYiHqTWZEMG9f67swhCuwtFcCw9T8sjb5CjyHM5RAtBgPG0yFQfueXnZd4jCHOeizN8HMtGL+20Vp+I2fjGdRSK4ezmuSSK9nzBjLQqszpZU4Epd0l8P4U4ZDnTQV0PNvj/36CpYW2ySHsyg+YAxC25jsDr8IUqwNFBwSWfSLfi0ajuV33sOAB7YpF5eaYXNovrPrE6ZjhIS3bgMKD4Oj8pI4vkNxbY0koBeJCA6AFEfwRGtUpdl1OU8gzPgh9SuUJexpPp4YqmfpRXQGe5ulXTB1TyXgJPKlmL7DtMDGrXfwndrB10LFnYM0JKgYb7nFkq79j6Pppov0TrCjEml5fIt4jjTn7u3plmdZTH4ueXz/ASZeX5khfqYuLzXnhzmh7CsZT10XC8CLXEkrmYuQDn5Sj1x0K8+3Dfghi9duiieHcn4EGA8yZFQxdwiQXqVcHuNlHAa6GRJEztOZvzpB27xm1M4dEtohQw4MgtxjqDr/s/EgWYREc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dzgWRP7UrRjpmPk1yTVjK4zMOhwSqG5Kb2lDHGaWyZjYuT8/kgLKm1+cKhn+?=
 =?us-ascii?Q?hUbmEAvP4oYyxwFnDYqsjMx+EEOe69ggvWzNpT32S6XtP7WP11+6qeVo1r2I?=
 =?us-ascii?Q?Xv5wg0dAoqp05t2ZPmNer5Ugxy5dbDR2EICRCjcqHZnXkpKnCyIq+A7ZNWw5?=
 =?us-ascii?Q?frLlASHl9YGGM2FYPxEZ+tmlb9MvrYz2LARiMr/hJz4xqsU0f8WXvnttvP/D?=
 =?us-ascii?Q?Qho0Oed504DmP35VOQeRLTjF4VdaEVBgYP6uUCDjFE8iFMUDMBFPxYT/n5oV?=
 =?us-ascii?Q?WwIM1FIuN9hx6hYYAI9fD6f1FjcsxeB8mDVVlpYdEm+NXmasMQoaVxnCkg+3?=
 =?us-ascii?Q?W1rDylHErfVpQerVLcohLGWzV7PqRkOOYF3DFnzf5gjognjgDLTDG9H4OcjE?=
 =?us-ascii?Q?UpT4ZhZ12DHr76N1MlbOpnqhVg6ERmyVqKoEGKOjtylY9eypYQRE7dgcLhGg?=
 =?us-ascii?Q?LjNI+kvCCJ5dRnsMLV4cVEIPEdCPcuHCVtHQUxg3fIpZPeelGafhJsX3hnpc?=
 =?us-ascii?Q?ftfZRme1+12kxle/eICNJhZOzjs7LGWaUAlYenRvEuaL/s5b6eA3tXkgDZpm?=
 =?us-ascii?Q?1F/ujoWM8LNuh4g1oeZTpEZmU5eIlvWBYEP+3EPpmU1Vrfuvz16KYlktspGK?=
 =?us-ascii?Q?HOJwq8CUjAoNBr6QrgdbQnf1Su0/3oLpqUlWwXsypN4KGpzY3gVO0+5oavNU?=
 =?us-ascii?Q?zPLa/zd/QR/2UN5r1Choad3fSPXTM20gpw0MGoDvcwbhTE/+/Nx3zurllnug?=
 =?us-ascii?Q?WLFKU4VTNa3PokO5DDIVJPUmCZFQ/dTSZb7wioxpbjYeMCTixh+iyWp7zLT2?=
 =?us-ascii?Q?tFQQyhZhtFCqmb/7meFtBC2mTpNjK86qdfYMOn4V6gZpx1jEpYrXaoa5GY20?=
 =?us-ascii?Q?8A+Gj5hkykiJqadSjVpJK5tsaiZuGOgdFnYSIlNoCVHKVJe56pyqB8EGy+wR?=
 =?us-ascii?Q?5yD3yVF/2S99W9WxPcRepbeZp9byxhiMnhp9RVN6NE/NfZMY7UdvG2Qu66t8?=
 =?us-ascii?Q?GRdAtYlFktslnvczY2yRmPdSSMrSDsZgdHQzMO/VUfNBRvP+Y19FumuwFi5I?=
 =?us-ascii?Q?Zh/WxzpsLzRFZBNzzidnmadSLI+f80TaAMmrOR3/3R+oFlZ1VhwdYOYkqOfS?=
 =?us-ascii?Q?0zDyOfeUjYKRVkjUtmgvqyanezKJWnUrlalpmkm1f8wkNLnuGS8p7eOm7Uci?=
 =?us-ascii?Q?psRKy25bKB14UOFSyt107O4T8P0Rxd1/B80Hu5Cd/lNAiZN2KIMJXTcZdAkm?=
 =?us-ascii?Q?uXcIntntmpMGEo8UdWfTskKUr7GYpHDtA5XIk3+rP0uqM3Og5osz9oE4IXoB?=
 =?us-ascii?Q?nLnyZ4/BHXu9t91X8tSOZbCHfjbSLXB2EJEyI0nR4L7CDg7X2FrWZ2iAkwpS?=
 =?us-ascii?Q?OkoDeabghdmBtT9+bg28ejl8Dl19z13Ytm28WjmDPLQYVHb9Hdmug+Sz+pxG?=
 =?us-ascii?Q?5UYyLqI8y7u+6bg9V7NBNucfvwe+fTPWcDULYI2eNie3QgmKI1J6UYdSn2iB?=
 =?us-ascii?Q?gATbLFBgCdaaUmCDHckB3q6u+ypwgVu70JY+/JhBKgzb1XTo9RDJIK3lKD6F?=
 =?us-ascii?Q?r3MVXIFNH2lN/Us5hEkoa3p5IHsESaY8pHxd1RZkspMhuLv/TNF1Yh98u1yW?=
 =?us-ascii?Q?sAcH6iFiL6MiZRigiY7RTMOR6l2P+L+D7xlolaj36RsuDkg95tuVutGm1H6b?=
 =?us-ascii?Q?TfDXT62iz6RU/0QYj46Yk43DFMhQyo5iyL1MethilPTWnJFdE+zf3yIXwKcp?=
 =?us-ascii?Q?CWo05YJoZ/kp0NvLrYHh8onP3Ckys1Y=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb71c2e-32d4-480c-8e06-08def2ede5e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:31.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsd37DPFfIwDp17cRFLdtH/XpGmegai7SwQ/eWKSYGCmtAvzwloWlDAjTSWsWr9U4e3GPPeDNcdwqVnJUTYV5pVrfSBmkdnzd7dG6F4hR+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 36d14103798b1..d743d7fdcf0cd 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -185,8 +185,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0

