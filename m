Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E06471CE8;
	Wed,  5 Aug 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933322; cv=fail; b=lCuxTOxMcEf7yVCNzowrpeIXGAviIzCNlv0QioQwUQCKxFYt0tRwRMSGRMHw9JOH9NLK3GxNvR44MLoLG9F14geEMnRl3ikR2YGZT15EKe9hud97cma0ZEZ9hBFNXwO+2a/RlV2lut28Ugi3feUetAqBeOpW4y+aSpb49iTigrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933322; c=relaxed/simple;
	bh=lURN2B5Oy7XhPvdBQi7Dw1pfVH7turW7nZIseMxZJAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ICkjljlArg6Ufksq3/r1Zs6mDk3X8U8q1V9VZQVipJswNqh4szJYvgDebQUxmqZKfWJL7Oau5IPr1G1t2EwD6uCl0H8SJ8CbErY64PkTXr20HkINxQZ8V+tG8KaaTADWh7IyU4ww8npKdMZSJWg32I2QdgTPDPm+K5qm2NKdPL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=3b2UQtmO; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="3b2UQtmO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcU3zPAFKT13VIpX5gW5ZEgQbOTAjfz1ViZovEj6kq0Ja5UBG4y8c3Aik9NR8U8wjlJ2O6bvRpQYHEs9tNs3qXCaSf099SvfQyHCMWBTJHQ9P5C+LpKQWoHkPxwlxJndaOD5sZhmjG/RrkxbEj+BNtfsBAxdhqd5b2YFq3tyPpscf7tSSeNuGxIc/N5EAxFv2Zq+mhpUFQh4ZtGztyW2JtkyZIMJP2nTGqGRlLpmq6ixycvKhw1FIHxQ2xqumqzSgcjFqbS36Ld4YMTVlkPuu92+WR+YcTpmGuiVzQ4MmmQ0jvuW4BWCadU1MdFMrCy4tIy5HrnA9WnOiErzywkADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPu8nG2S+0l1LQFPC5oQh7DjRyx2N3Ll+tWsylc8nWk=;
 b=FKu9/eyjfzIFnyzFasw3uGjd/+v115GyFuWvvELdk0tZSs8cz1F/1RCU0GBjDC39hYMsfPHmVhRz4XIrXzGCuHw9ueYxjl867grHTnfqH39pnF+Qv0LD3Rz4GMZcug1P+heMBQ+5AxBVFm99OkU0XqaCr879MVLLtutJGoBTsPN6NS0r3TVKFMWv/tGeAsCBvznEaPnXSyPSchIRd9NpTlk21OMTjl/oM23rgG5wM3/r8razgWzrrtXpl6iMeTxtnxkpSJ5XJE8I0I3USyYt8tMl5+SAZam26IAxO6OsJSJe2V6QFAMMC4rZRMWhZ9z1/19yzTVjxbCTH2jd1rXbsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPu8nG2S+0l1LQFPC5oQh7DjRyx2N3Ll+tWsylc8nWk=;
 b=3b2UQtmON8QqpBTIwCHxr1sCpOmL9AD/gUSWL336Ghke2rRTdRDIxwuqgsQx+TKMA6ZocY9FHbMvZut+3LuuMLrAp1zpDvKlPNznhS7sTkQuBfN2ebt1cFaujlQ7n5UU0m8GDGei4ia7MzQBGSsj1lG3mHErENcJ6ul9sgRVXhc1cu41qO48DCrht0msk/GbLq7WTn7wLD43BZUOWej89D/yZQIy8ARjQvaiDDAiGKoaHrjIfe48ij7pnJguq4X6sZCFkZyb2Q1dLe2oLykQxaNSWjOmmh0WBVQKQ5gaO0/aP3YvwJjXufzzaHd9HDv6VhkKp134DZLnCSg6VTBT+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:12 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:12 +0000
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
Subject: [PATCH v10 27/36] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Wed,  5 Aug 2026 15:33:59 +0300
Message-ID: <20260805123408.3767648-28-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: dce2b652-476d-41eb-8d69-08def2edfe3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	VO3POxZN7eE3e/UbI6Uz9ls8TIB/irkM60mNe9Ar9m/xcBLbJnFzg+4eD0Q1LBudBFZVyC/iujuiqzfDyyNtLASBsuLdcYTx1GAXZEJ/rAByBZ7iqTN9QqSGfFSkIoMZqr7CFROGRjhHgiDC2SsA488zdsUch3qBAidienLjifv+74NtFSaczAr3p31klklHaHiCLsMgSFvaTwPgGlY2mTEYxuHpAYUEgkgjXYa1kyk7OcqwPU/EE0oZYnfukb+taoeQUAYy30mHG5A9D/UtlU0+JHb9nNOzUpneH6CQ9sqA0rgoi0UUOQCkUIsuLzRCEUVDaAG6NIUA97DfjJjryBm2xwzx6dV4yBNb6dz02YNEV/ghc0HgsLcRZkRfGgXozJzdlrE3m6CsnKGzxDvcuQHJiFwZLXzIC/eiXkP19Cu8Hg5pqffPOv9I7/iUVpkriYGaO23JhBlZoDlIw2fn0bNbd2/zvlbWJSgdfUiRFsikBJoLnwBk/EMKBTGZQEgHGwSlGcEw8WWmQEAISMbnMHndEAgWEmch55ccz6/k8mdLhf/YWHFZ7/d7dLX0E5wKAn/JvJR4gGkJoMLTwvS8ku6r/2WwRUox23FEslfcUAruIeGSlej+8AAY1zqabZKsFyMdsCnEIE50YIIs690f3BkSLXdgR0IoO9LgjD8sziD/famEnWNZj007Ugfy65LKiswx02Qrjbci8BB423TmYMVhFV8G2gwEeysf9kuHt88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WLW9rjiVSdwFxtADjlgqUm5cbLUH4lvRE1hhsOz/DclZOsrb+y3k04dxbSKR?=
 =?us-ascii?Q?IMd94BsbaaAIKnjIKO85WY15igsAKEK2EbM90ugAuxfS93wGKwiWcOCnUnJg?=
 =?us-ascii?Q?1PxwN1AnKCSNDvnxVhEGgjVj64UeKMnDfDhBgV7FFAlDNUv9cMpI7gcYHDjV?=
 =?us-ascii?Q?sQGo4ihZKZTOmyPtryLqZNqNqQBK1BdRso+A7JJeOyJZDBvU2NVx0dOIvOIr?=
 =?us-ascii?Q?ay6YFRnEkz5Y5aM2nZN3YWlslScnMWvZAd0bGzg48G6+zulOlYVVgVPkJ3q8?=
 =?us-ascii?Q?uoZ89qC1X9aZjONiROsrxVi5UowNwOSkWkt9F2XhnD9QOQXn9N65tl1fNfXX?=
 =?us-ascii?Q?9qYLneaFMDz2xdXfOTLK5adcELW0o90Jq97Z0Nl9aP/awBqVHB+LiGzVGmEI?=
 =?us-ascii?Q?1H6tTC5hJxRHBPw/9+3g05c+wvpI1YtSC2pq/q9VJKBddOaKMEskffQATSda?=
 =?us-ascii?Q?9XC3V6tNAMGKqhQFRZsUQkyWnz6YUorR8Acwa3a961gTFzAyDrBq8YzYVuag?=
 =?us-ascii?Q?Io5uv8eXqi8p545lnnoyd7Kt9fSwFd+F1dqcRBn7XrGjtKGsJaM9DYs3b/qA?=
 =?us-ascii?Q?FYB33SgDissctg35pgvqAL9/N0JUa5kSbUbeJi3dnM2hI/3yRWWdxbH4ytwR?=
 =?us-ascii?Q?tEpNwF5mE0NblDeAa02Y9yXIiXT09pWZMT2u8evsGvTattaXSlbN1evHMzhH?=
 =?us-ascii?Q?RD4HlBMWNJCVy+4Oq5noBoU5FkrmhWzlx2FBnLlQjHjEyqA2bRMiQTHFF5/a?=
 =?us-ascii?Q?9W/DYHwzwxTtSB9yMIS+NYyIch76Hy5t7Z85oucbkThiuZTS929nuwqDU+hE?=
 =?us-ascii?Q?Zp4eM/ikhtGRK2057Q8HMAvnAneEFgbORykXRiVSjNmVFFecsOR/KNvKZSJQ?=
 =?us-ascii?Q?2RT9gevga4/kzFdwaARCOycrj68LTt47EcZUkgLqDXsXdXS2bHndvtsM7tLA?=
 =?us-ascii?Q?y6tAbKBzOjS9wBM+uS0inQzKLEMT3KMvAjWNct78FMQ7H0fT/VbuN6j3ikzQ?=
 =?us-ascii?Q?7UJPLC8emjoGXXG7B52wOK8aQJPpqlqY0jRO0vwJAqOVZycwcG7OjxjjkbmT?=
 =?us-ascii?Q?c7bRmGmaNiP7iCgSdFePLNm88g0/5JuClk0uBvQzzhjGKgLChEHct5Fg46Qw?=
 =?us-ascii?Q?q0MLKX4lPaHaGPtQWiL8rZQPM9VTtl+NeywZbfOcxcjk41g0zlmRh9d+4vFp?=
 =?us-ascii?Q?bOOgp1miE6ggb5+oDxQZVnvGqAUtyU7y/8txjTC+EJTJXPJgECad4iWttVyY?=
 =?us-ascii?Q?akeCrtSYgO1FKy3cM60iOX5786SzUXUYtpGHmm+QaRwGWjhkEp41FvcRloSo?=
 =?us-ascii?Q?uVZH+0rvNiFInf3s5mzHiM36f+Sga9My6aNT/CJrNTyHRzXxDNbWbFo9yvct?=
 =?us-ascii?Q?3uXw4MtNGVvp86AIcEdY4n9+V4I/PiTAaEQJV4AeRZdlvl5JpN2+sgnlXmMx?=
 =?us-ascii?Q?KaG0fR8XY/cfSmgSjCKmaz2aNgss6z21nSBRIe1KoTjJvEJGSxPXTRedvsbk?=
 =?us-ascii?Q?3+XX1IFbQ/DhETd2SxakyDO5gqYS5ZvTs3qItFdnyruw9/tP1ck1NgO/rKtS?=
 =?us-ascii?Q?P8p/wJ+ARt8rFPioJwqmnjoZC5V1ADvUmT9LDzbChwRuptEZlRLYVrRCS/+Q?=
 =?us-ascii?Q?bmNcHR+eKwGPUSrpelrZHTcVxqq/Do+7/KG4FfLcwXUOREzSFG1fhqNqgVvJ?=
 =?us-ascii?Q?7RFkYAqIqls3H3RAmVSM0SWdh7FUF2JsCy+bhGEqw1FcGrqBk5H8sBUKwg+c?=
 =?us-ascii?Q?0snuQhmGZU9WIWnk1L3Iup73Ahi5hS4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dce2b652-476d-41eb-8d69-08def2edfe3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:12.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeBalYK1fajQp9PM7Ca9AiqbJVwYwuOiht5BK6Wk9gzeO/SfP5B4LIZqHClAmfmDEzsry3jPNSMH8zXuZTrCPzZMBwUEOrbv6y9TQp9BmhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

In the an7581 case the register at 0x1FA20214 is called
RG_GPIO_2ND_I2C_MODE. The same register in the an7583 case is called
RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 6d195096495fe..44efccce78c55 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -8,7 +8,7 @@
 #include "airoha-common.h"
 
 /* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define REG_SW_TOD_1PPS_MODE			0x0214
 #define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
 #define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
 #define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
@@ -302,7 +302,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -320,7 +320,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -643,7 +643,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -652,7 +652,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
-- 
2.53.0

