Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3E429CE0;
	Thu,  6 Aug 2026 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053999; cv=fail; b=V3Qt5VdpYY/qEhcTQJBYFN52O283kUNnlOvKddQ4CiwQDm8Um0ndxgHoY7aXLh8E/L/7Pz2fJNpf2zUuDdulQr1F/mMpIKRWh6m1A4ziFx0qv5czSAsPKacoPC+jkE8lYzcQ+otavubm+OClCNwgpQCKtj+AMei2UgEHPtmBi7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053999; c=relaxed/simple;
	bh=+Un6wmkesaLrBNw1dxcs333w5WTejT5lb19+KaeL8CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ljHZ4FUuR0p1YOkmgjFvd5Jc/snNz7eR9oCQ726VjIBsDyhPkDYYkAmA7mSGZzWge8KnVNcSK/+qQJmItKwTYz7I5OOmVghzKsUYDlwTKO3UHfHz9VVOsu2vqlNCs3w+p6GTJJrePYG9Jytpa5PoGIwB5HZGNWRLQ8x+qndCBdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=urUwiK4Z; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="urUwiK4Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrEx5yHb+5mJorT6Zw4IJwFYiCEnbf1Qb53iHWaDIXjELkXvLuR5+gKIRWtekC2tI2t8peVSEKMWvcrYEBSGg94/W9WOhgr/648rY1HxKtom/7nbc1iAQEWeyV0slQIXa7ZLvCj/91VB2SZjno8wW4AoAdbnca/WXt6dT19XtfwEb51zhuaJAuaqA8Q8mG1zHPs8ch3+2jaiFXBZqVSqsBYmjNVa28oLIGK5ASBm2VqF58H/cLKoJI+nKW5uOaVCkbtAtpVcOeO7vYmTwmvcxVlTK9nNmVdZGUSQYa2hzp97Rq/514v2OvjoNz3wKZJFMGtIOjGULwursRhR7uJzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=uK9yEGijX2Cjs0aiNUlLeqoynxcUdLI0QbhAvS3P3anwxtcLjj171Y2nesSTEZYvo+Quq8uOlO3wehfi4wvoDSqrlrN7VsThChcVps9nIfdKIaUPu89hX0fqdd1/MhK6CXhp9nlJjHg0ZWX9RUwBuEPInz7zI8m2wy/ckT3qVO/zTAPzJRqSgoTz5/Ov4L40RaOJPQNbmVWJmg7FbXrxY7cqyVowdv4G1Nb0IcORWNScDakopa/WrqMnXj4iP4txTyxao9RJwVVanJmb4ZUrYjsM8kq9REK8YpYV8T39+n0/Tq7CMNBl1MTKjbUES4yaosSTGz197pl1Zj+ykVSEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=urUwiK4Z12UjRZx8Gzy4s4Tc9lvoXIwxh84+HymOy4JO1t/YL85u5BGCSpVAyB5DaZeRBFU4BphpAsQwgrTuEeUpIsp0o+gPT6A8YIIbeU5HdWaeM4mTzRFZ9vXQd22P5wp+LxarjUpG+UOcnP4d1FKFtpna4fA7ZgyqDuQewLDOcbg/IjRXZFP9i++c1UjYCzZJAhtkJfRtGybJybCQgjchdEHIzcJWdTZSS4rSTv21FpBqzzem3S09whC7oKbvrvgljwty6v62or28hF7CCdqvE0xTJhXUuGKHM7flOFT3Q3+E9jHB5AIaLk1odY5fkf+7tNZ3gO0NIW0Bz+qwww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:32 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:32 +0000
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
Subject: [PATCH v11 04/37] pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
Date: Fri,  7 Aug 2026 01:05:42 +0300
Message-ID: <20260806220615.4078303-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e90adac-a275-457a-5cb8-08def406f910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	QFfiwz/ZCaxD4rD3gzzKVHGsJ8uLb4thwZ815hsw2+PG2mHf0bYXzEgswBKOqLm9LNY0672INzmci9T7hk+zIcUCUZ52A9D3DlrgFYHDJhyh8AWgGjBit1Hk4Gm8DDMucb4CzSI0Ti+KtvZMYcXcmhKl4rBuckQAE20oQr50nnBELU+EcX3KX98PGH9rXnhcB26YmuyFWZBk+/XXX0dcZrLI6Ejf0n5Fj4egbDwL/vf6V5JHWyQ/0u06S1h1VzrDnz2uHJGuSTQcHQmiIGQrPtu1asDar7qgWDUKrhGP3iM7BhyHIomdvA1KN6wTRcdfsnLXXSnxh5n5hBwrWkBdpzbsxjMaz8a8vrqoky5vPCfftz/K9omD6GlgzQt3oA1EMSs8rrKQXdWQvu0nikpsHFxl9SGMSA+Y+CaMxyDNNcAHNmUrPbhyoOjccka2JV7JPdE8wvb5IenJzSfqM7rmUceDtgj7NnUb1+vrWT61BHYKAKRMblCVWJp9p6GKJ5Wg40k/6LgTBs85SMorbd1SSOwP06jc6azj4Upp9zjqucU7W9tZkJOnDaJqMDuIXIuMn1OicrkBQP6UxFkbndU+0oLd9nNzOs0l5K2U7GUgWTwg5mzjwp4YlscunK6NLibZh3rzFubL2s/IXRnOGmql3/3rELN+uwK3MPnQXpsNpdZqiitz86W0vcsEqWYOAaLdrCzypmw61N3Doy6Y0ablINRCC9YUjhBPBqFPeYxgceFm61owuzbvJbcfUVnU7IIf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qWNTWBjo/5r+lSMashRKgkQmugE3VezRFu4bgrXQriasqvf5r7Hq2GE7EuBl?=
 =?us-ascii?Q?stfHpxds+QqwMSrwijPkN3IyyvPh2YbX5hwInfOUD7HYvRJMhGdmsOhvbWEG?=
 =?us-ascii?Q?4Be3ajbWgnQe2NU/S786og7FDZ142ECNHRkl+C+NfpxYjHgBC3h4m9cxKEH2?=
 =?us-ascii?Q?xWPiUcoWrIHpv/nM2yOUNo7jxgQVS8uHeNWQ7zDr4qadEL1i9P7w+taMVx4I?=
 =?us-ascii?Q?622uSlphQXP4uqAMCcLx7DX0t941tn687AL8EdQld9XjHwJ2UFzmSxfTbP+R?=
 =?us-ascii?Q?wBMW6GS1AgBjQkRJ829ZYwaquE/8j8s2ZDDxgWvZB4HvPfEbU47UBSjoex1d?=
 =?us-ascii?Q?XAlM2y7pgrMsn+qMbe/CyP/TKMz8CJK8Cvq9ntgswu30FebKJdokLy2aRloL?=
 =?us-ascii?Q?MLi9lNgnkSVCtBEFLhLk1oF0l2JurSCsoLKzQPYyYqrUPOU2AbVrTdBsTHWE?=
 =?us-ascii?Q?+Oo1vMnHlUrH2kxDDruf2jGGtBQspdw5fNvtf581lk846ectkFKNTVsYRTQC?=
 =?us-ascii?Q?YSEyMbsi7WlqGV/BLEp2ZIriuH0tUf121rdNZ6w2jKAmUHRMUJjOEvnHELH2?=
 =?us-ascii?Q?BNe7qGt5DiXOSVGtObvh99+4O+wBhy3FKwS8k+atv/Swu96SwhCMbUxg5KSh?=
 =?us-ascii?Q?KBELvoilIBIxSI4Dih5pOuGCs+gWWddvGRXV2fFQS0gxmChKp8G97Yz+dCaN?=
 =?us-ascii?Q?FdvB+goXhiX4xyEOUt9QzGg3xqmV9YJgZmZ4WThUAYHYc+WVQwFk5atOqZX/?=
 =?us-ascii?Q?K+RaBJsyNmZm0PCSi+tmcYZWKssGcEhJYkgSFN3JndHOA/ifTc0kZMaVEVvN?=
 =?us-ascii?Q?9RjqunKwLghUo5slQnLXuu25MwE04FnCrs0xylOecjG4Hv+rTFcsOTDJkCNo?=
 =?us-ascii?Q?nKzt8l5/F3sPUf0e/jN62xJ/zxSqLANH9w7r+itt5N/Uz2BTtnrpkWnWt0tn?=
 =?us-ascii?Q?3BDWrMbq/JFWEom1Wj6TwtHfe8+EylTpkRl+dCMXNlYuwxSlYcl+et7ztFts?=
 =?us-ascii?Q?aEjVWPBWQMzCLBEkelEoqcV9y9N8NqS0TWeghFJawzZ944lEu47XPSLWPfE+?=
 =?us-ascii?Q?avXrjp4PxYw2YMD+X5+utjQN57GojM7Y5MP7WmlDKg9QZUSbFlHgK4InbSn0?=
 =?us-ascii?Q?J6R2zkLTPcanNZnlCircBb2+YgRdCyBmQAbtTWABMz0RBxa97aIRW7hIYldb?=
 =?us-ascii?Q?9puqEmMbHJvNvDgwlzjwR3m7q/9l8YHgXgML4FU4GKDkbrlS01ZH0LvYhAJC?=
 =?us-ascii?Q?+3Na/uvZCmA1sklOFSd94ZpxJfZaIDxHmNKoUG27rjh/esKCXI+iiq+UoNPe?=
 =?us-ascii?Q?i6032L9e+a20McTDriz6nJ5ieZZ3lDrfaU+BheF7qLtGrEVy4B1RFJoKGaGy?=
 =?us-ascii?Q?GYC60cIJKF/JagtvrGAc073C+uox+KCpPuauhozjG1FJ1IWPbxbuiMfUymii?=
 =?us-ascii?Q?+QDpyU2juW5RwnFhZ3VeCprFYLabNVjr+fm+lvwCQWRxFSdmf/8B5Xz2qjpf?=
 =?us-ascii?Q?Dtjj30rrzB6gpRi7FFJtMtf8iBqNQvuiReUYesVApwxgOblG7dOX8iwyVkmx?=
 =?us-ascii?Q?RMg2kbgcrmCqfRvyAEVWWNg4hzHuEbUXYspoLj2snuq4bJ6TeKtkBt3tZL3V?=
 =?us-ascii?Q?o6w6Aq5W9Jech8XeqNXLG9RAei/BVgwXW9/PYtWy7WqMO2A3YkT+t6Nrj0fA?=
 =?us-ascii?Q?aABJFFEHo8zhNbIXWn8a37J43sIdFwFQ4RCfBBb/yyhz03o3CD4ljVNNwmdG?=
 =?us-ascii?Q?TOhG9mWTDKv6nezTjIl9J+TMZJ422/M=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e90adac-a275-457a-5cb8-08def406f910
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:31.9941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHZJFksr6MpGl1B3ydF9wVJDDp4yO/FfgJKvHAkw7cPNeSrgKAiNx1MXj18n3dXSdkTns3FlCQU3dxv/j2B9hLw+P+z1gHfRBniNZx9MoUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

Pinconfs of i2c_sda/i2c_scl pins are swapped, this needs to be fixed.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e8c018620f1e9..36d14103798b1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1844,8 +1844,8 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
@@ -1961,8 +1961,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
@@ -2078,8 +2078,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
@@ -2195,8 +2195,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
-- 
2.53.0

