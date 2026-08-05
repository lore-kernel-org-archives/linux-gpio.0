Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A5546A5F2;
	Wed,  5 Aug 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933320; cv=fail; b=hDXp9vHx6hvYy/nW2/45HYxU/FyOIDLz+uaz+S6MMLWUaNe3XyRZqHOpTGGc/heFmDFwMYGXE1QqzeX7Mvg28TBXDQwEeKYHF3DDf3W4BqDyLikiMLBIxiHpCpSCOIbtnfZ2in6jpUsA0oSigPqLDdTGBrdcoOkosa3itWLpmBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933320; c=relaxed/simple;
	bh=HxYVFwUk96P+br84MtEqrDsFWF1gQ/55aUcD2kinldA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5vWAugUNOf36A6YDyLXCMHx7uyfXOtOXl+m5yGcYu9hqESfqF433POXsbEa1fdCn7FZGUU3OCqNDYWplerb5iW+tVUMH/mtF4O0LSPjS/XeVpJhqEUM+Ml/s8952GS9VKB/f0AMdfNZaUK5iAUdL6zl8XgDQ/xPCPXkDMTfjLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=VSeF3Zob; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="VSeF3Zob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2UG7Epf/2zmlx1qnCNeucmcVllTjzTchuSd3utdMZ61mJffCs11M6KPLYF5+u7UyqjIgmfWxLqvjGQ+o7ItCKST11myp19H7KmxpDpv2KT6W/yBxXx/1SazPbhgCDiCsc+UXQo7OQ+1mfcUMvz8EZ/dw7HL7PFZLx0dr/eMWYyg46o2JKZWOQ9nn/TZLco7AOMrMmQU5N9PrGQQ177NxeZ1hwE+zK6HewXOCfFX+TS0qjMWeMLECL2V+a6BVaLk86W70PrXvcIQS2CooqsHCPnK8U8QJkoEukP8R2H4jXnDURkO81WeFCK48m1hiPmvNvw/QWcBenjvUiIwwLnqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uoyOCatA0fvBNlkxVXhfqGB8SsVbkav2Exs9RSXKxo=;
 b=HYfOxBdT1JNgLxlKECW1Apm/JW+4tqjhmaa9DtyG6M66tHPkXrWsB09MQlvGXq+2kKejdzXK1Yq3qMThm6Bvrq77tetRuEzZfD2wQbNwhOUciL1n3iohifD/eojE2qSG1cQo/vzDA9HczwaosYgVH+wpQawIY+28gsqUKJ/87EmtxlaShpLnBYpeVhhwcDdEsLbOclVB5JIRWyx7Xo7UogFaVQ/y1xwmU7Kl3aCBbfs1u/wicri+Qa3kl4d5UaSJYO14/c2H1jAM16HuhW9vg2EXOSL9WbCTcDFfOX4wi+yBlsvEy5JeSG1mvwPE1XbWL3pqD2hejcMJyakh33aLnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uoyOCatA0fvBNlkxVXhfqGB8SsVbkav2Exs9RSXKxo=;
 b=VSeF3ZobjtLdwB71Fgr93gV6KGcSmNfrHVjyILNxKmxlOhB/eFK8q/KFmTTenXMZJQhAGnunn4liIVkOET3xEXcKZLF9QSfoHNQ7Cpwq7lTbPqdwYNZNoJnzNGgwcgV8MREytC1rFrzlMpXPqP3cdbVEnVmsE/hxfGitl9Ofv5nVYXoyj368EAK9VFDYgzBPARRSLpj7O+MoxICDS2ERoIFqEk8ikXi56u3LqKxSOnNyk4POJIURJWgHHI69kj2/Gy7XBNMo089Rfj8mSuw2RhAqF7PQk68/0qpMAbSjfb3DPEm8HbRcSBsOgqvl1p0mewk8qP2faYfE3JqgAfYLSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:10 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:10 +0000
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
Subject: [PATCH v10 26/36] pinctrl: airoha: an7583: remove an7583 prefix from variable names and definitions
Date: Wed,  5 Aug 2026 15:33:58 +0300
Message-ID: <20260805123408.3767648-27-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 7dadb6bd-d5d8-400e-e81d-08def2edfd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|52116014|366016|38350700014|921020|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r0M+gT2/LveKC8FVqg3hW+1cmSCJBoifeAr8rC5WAknOLDB8jQk4mp7edoPrsP+mt1/UnngHON7id8bq/irI8t3kERVQk70+LAt5XRoQk5SJRcovwB5Uk4MpM1f/kSAcW0ovwNNci7P/oWhkVI7+q3apS+2PEjTrYs4zcLJOb7LMN5WA5grdbgeabEhMuUXZdKl54SCaFd6b3U+1aYtzioCVnalZXEWgpZ8lLi0wA+xrGBvTvC8btxmqsQZhiHXTr3N/kXiowJk8WinaG6Cc2QKYjFaAtyGWFnWFaHKs2lGW151e6dL/gxCzHl8wTgbd1ioYfArUG6t5fqdHpPZy6iVGPh+rC87m71uTXqpSwXuoYQVXF/XWq1iFbignclTnaeAPdvIZcxTSYGjTZELsHdiodWer2Py/eoEHeNC5c037l4vtIDOSRKeNUU8s1k5blaJclaNJcbXABCbeAm/4fuB0iUFNU7nE0hZQU7Lz0nY2ArmQN+/+ZdaybTXYJEIlhWYHYQnaqKmlk6U7/uMRln0mDlIz8UtRzhs3wyT2HbIhc9bfKBrzzWHKp6Ibyu4GXUMTmRudna99cIoN0q6IK3PFZdJkSOdJihDGbwjjumSTVbjfHu7szbNV0agcJ/APBVapIR3Y12ZLraXW8RvsVMVP5S1akC0WTLcBl4IeHDZUyOABGweu3ECH+wzX5JQk8zZOR1O+lHv1hF6lVO0xBeocAhxt0E3jwqbr407C40Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?71Q6mNFy/+Hk92zBkIANRB/5Nc9gpqj0b+y40U7Qs3Ex1VesRcN3xi451FEo?=
 =?us-ascii?Q?zF2CIi7BVRZ0NueXAk8c5glHJpZ29rBIQVEgXp7zbyZlvjJ9X2TLjdH1IFzs?=
 =?us-ascii?Q?MupayofVrKl3CjUGSuEKgT8wKsrXCdBIeRLpZdKkhoYH9CrZt9YosxV5zU9u?=
 =?us-ascii?Q?d467EHkgkDLJ6oj3FK10KxxsYaEOYs0y+zUfBsQqmOp81HiHTH82kJ/WI4VA?=
 =?us-ascii?Q?CcLm16nX8A93PX8DnP/sH2w/2TqdMI4iDoctqJKV9xVNys3hRXTs2xDuQmaW?=
 =?us-ascii?Q?N0lCfQm8L2qlPVqT7EMoMmf8lgdaS22qCbNzppze6VJ5I+8uZHoJrQg1g6Ru?=
 =?us-ascii?Q?3blFb9pbeyx2RC+i/HC2Y71qCTqri66aOmg+l4cYx112cDqQ8Y8w0hd0EcuQ?=
 =?us-ascii?Q?PswBFDV8ZurKevAnxyWs0s2ilxzHgdGPH1I8MHPZbMYKz0pscB49C4GhBqlG?=
 =?us-ascii?Q?DvL5llLKdG62cm2lq/ozPFYTKLy246gzVVFall7aQqzLutlVfR7ztxjn2Wag?=
 =?us-ascii?Q?PHsPVrhqYD9I/2FIYMUJL23psx2KzKM+gdzIVpk6YGW4lpUbtEY7pwvalZJ1?=
 =?us-ascii?Q?9uyMrNnVYv9j4qlJL20rVFAOmCKdQGfeQpbAJk0TNozxaMfrsZHkx+pWnYHf?=
 =?us-ascii?Q?MuiFSEa8YQBYVQoarvFCv856kx/5c5SxxFaoIZ6GaBTYoqSdUCyXOQZiCkkL?=
 =?us-ascii?Q?wGJnS5DBNlMzQqCrJLRDh0Y5KpBWtH/nbfcBG1utyBVxiaAZ6sRcIEIp14dz?=
 =?us-ascii?Q?H++YYRVRilVQPb+SMjeG6PfzisbW/jV/2yHqUAhTQ2vv1MaKnZD3M03Hap4a?=
 =?us-ascii?Q?4EDp42Xcfj6mxWdpgZTVeV9auYW0GHiOqVrGC661TATIxUMYbaykPsPtiK51?=
 =?us-ascii?Q?AnArgiiCQ+mDL07mPeGR39oZmAYpGHcEozBsYMHDftfAV8b35OAUrRCjxy3p?=
 =?us-ascii?Q?HvEgCdjxb9V6rPDRYyT5TPT9162D6v9lqZbrUs0P9M/O3PfdjL/Sl8L7uAL8?=
 =?us-ascii?Q?Aty0liIwIJa2KhmtNdZH81fBsfOQYvvpYHukkv0OXdPebgipfvSZbZHoEez5?=
 =?us-ascii?Q?D3IU4PEBLY7wvYWPQQL9sM9PE2pvsGtc8HGvRsiC8gN/Z4AMgEM3aA+GxNAG?=
 =?us-ascii?Q?Sh1kadnr6kuycHAet/IprBrl4xIe1bdagr4HZpVMIbLUJkh/bLyT7hijI5H3?=
 =?us-ascii?Q?j/aZMM/Ql2G7Tmt3e8xVwpXbi3A1umSnSOtSYAIrZuU0h0Pch11YcSUV25zJ?=
 =?us-ascii?Q?7Y8/lLXG0rSEDTkPnmJ9uuta3he1O9nc8i/TJGO4AbH0N4bkWxb+aWZujvpt?=
 =?us-ascii?Q?2WuTlAnlex4/281QWwQrT+bgm0WdLwAIJ1IR0Xr6S6oMjHmZ8QpIEw0/KYZU?=
 =?us-ascii?Q?eaLmGkP0MRTY1gYdrV4T2IZOE6Jlvx7k78Y6avLT5+nPfI3KutM4nnxH8gcu?=
 =?us-ascii?Q?LH/uudDzcGJhOjFjmEXDa9zu9tAwPQk4jNUs4cWj0GSyyOdx8eT5uOPSXN/+?=
 =?us-ascii?Q?BxzHzGVrlOK/ogQxREzPiiCLXg+bCXY8wLgGMRP2WSbbh72pFV8BQtpnGUHH?=
 =?us-ascii?Q?Q8FvU5eH633bu6j7vpSV4EnM+AqAVGOFFYWA4bigKHOdNwp9S5iZMzDOt7vu?=
 =?us-ascii?Q?R/NgBnWWajPdVHWZM98J2IZsO9LZkmYh/EWLifS5y0Ixkjc8r88lvzwOb6Wa?=
 =?us-ascii?Q?FVpeXhF+E32aG/7Xl5dlIGL0HSxK5pMKuPYEyroNuacXYyBk1uU0w3y/1qjv?=
 =?us-ascii?Q?BGhLa4R2C0qDDXzr++hcFrcTOX1KFpA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dadb6bd-d5d8-400e-e81d-08def2edfd23
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:10.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4+QF1CijvdLx7rFl7cBs94BeDOTNXzIBIx87XVZEr5nU+TfmDxJVx6nLZiLFI0XPU1RHYjVKBXrvbx9KW0vLP1RqmESdRbrgwG/fljX5dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

We have only an7583 specific code in the pinctrl-an7583 kernel module,
so an7583 prefix is not necessary anymore. Remove it.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 616 ++++++++++++------------
 1 file changed, 308 insertions(+), 308 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index bf053767fdb5b..6d195096495fe 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -24,7 +24,7 @@
 #define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(22)
 #define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
 #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
-#define AN7583_GPIO_PCM_SPI_CS2_MODE_MASK	BIT(18)
+#define GPIO_PCM_SPI_CS2_MODE_MASK		BIT(18)
 #define GPIO_PCM_SPI_CS1_MODE_MASK		BIT(17)
 #define GPIO_PCM_SPI_MODE_MASK			BIT(16)
 #define GPIO_PCM2_MODE_MASK			BIT(13)
@@ -38,18 +38,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
-#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
-#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
-#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
-#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
-#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
-#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
-#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
-#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
-#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
-#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
-#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
-#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
+#define MDIO_0_GPIO_MODE_MASK			BIT(26)
+#define MDC_0_GPIO_MODE_MASK			BIT(25)
+#define UART_RXD_GPIO_MODE_MASK			BIT(24)
+#define UART_TXD_GPIO_MODE_MASK			BIT(23)
+#define SPI_MISO_GPIO_MODE_MASK			BIT(22)
+#define SPI_MOSI_GPIO_MODE_MASK			BIT(21)
+#define SPI_CS_GPIO_MODE_MASK			BIT(20)
+#define SPI_CLK_GPIO_MODE_MASK			BIT(19)
+#define I2C1_SDA_GPIO_MODE_MASK			BIT(18)
+#define I2C1_SCL_GPIO_MODE_MASK			BIT(17)
+#define I2C0_SDA_GPIO_MODE_MASK			BIT(16)
+#define I2C0_SCL_GPIO_MODE_MASK			BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define SIPO_RCLK_MODE_MASK			BIT(11)
@@ -93,32 +93,32 @@
 
 /* CONF */
 #define REG_I2C_SDA_E2				0x001c
-#define AN7583_I2C1_SCL_E2_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E2_MASK			BIT(15)
+#define I2C1_SCL_E2_MASK			BIT(16)
+#define I2C1_SDA_E2_MASK			BIT(15)
 #define SPI_MISO_E2_MASK			BIT(14)
 #define SPI_MOSI_E2_MASK			BIT(13)
 #define SPI_CLK_E2_MASK				BIT(12)
 #define SPI_CS0_E2_MASK				BIT(11)
 #define PCIE1_RESET_E2_MASK			BIT(9)
 #define PCIE0_RESET_E2_MASK			BIT(8)
-#define AN7583_MDIO_0_E2_MASK			BIT(5)
-#define AN7583_MDC_0_E2_MASK			BIT(4)
+#define MDIO_0_E2_MASK				BIT(5)
+#define MDC_0_E2_MASK				BIT(4)
 #define UART1_RXD_E2_MASK			BIT(3)
 #define UART1_TXD_E2_MASK			BIT(2)
 #define I2C_SCL_E2_MASK				BIT(1)
 #define I2C_SDA_E2_MASK				BIT(0)
 
 #define REG_I2C_SDA_E4				0x0020
-#define AN7583_I2C1_SCL_E4_MASK			BIT(16)
-#define AN7583_I2C1_SDA_E4_MASK			BIT(15)
+#define I2C1_SCL_E4_MASK			BIT(16)
+#define I2C1_SDA_E4_MASK			BIT(15)
 #define SPI_MISO_E4_MASK			BIT(14)
 #define SPI_MOSI_E4_MASK			BIT(13)
 #define SPI_CLK_E4_MASK				BIT(12)
 #define SPI_CS0_E4_MASK				BIT(11)
 #define PCIE1_RESET_E4_MASK			BIT(9)
 #define PCIE0_RESET_E4_MASK			BIT(8)
-#define AN7583_MDIO_0_E4_MASK			BIT(5)
-#define AN7583_MDC_0_E4_MASK			BIT(4)
+#define MDIO_0_E4_MASK				BIT(5)
+#define MDC_0_E4_MASK				BIT(4)
 #define UART1_RXD_E4_MASK			BIT(3)
 #define UART1_TXD_E4_MASK			BIT(2)
 #define I2C_SCL_E4_MASK				BIT(1)
@@ -130,32 +130,32 @@
 #define REG_GPIO_H_E4				0x0030
 
 #define REG_I2C_SDA_PU				0x0044
-#define AN7583_I2C1_SCL_PU_MASK			BIT(16)
-#define AN7583_I2C1_SDA_PU_MASK			BIT(15)
+#define I2C1_SCL_PU_MASK			BIT(16)
+#define I2C1_SDA_PU_MASK			BIT(15)
 #define SPI_MISO_PU_MASK			BIT(14)
 #define SPI_MOSI_PU_MASK			BIT(13)
 #define SPI_CLK_PU_MASK				BIT(12)
 #define SPI_CS0_PU_MASK				BIT(11)
 #define PCIE1_RESET_PU_MASK			BIT(9)
 #define PCIE0_RESET_PU_MASK			BIT(8)
-#define AN7583_MDIO_0_PU_MASK			BIT(5)
-#define AN7583_MDC_0_PU_MASK			BIT(4)
+#define MDIO_0_PU_MASK				BIT(5)
+#define MDC_0_PU_MASK				BIT(4)
 #define UART1_RXD_PU_MASK			BIT(3)
 #define UART1_TXD_PU_MASK			BIT(2)
 #define I2C_SCL_PU_MASK				BIT(1)
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
-#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
+#define I2C1_SCL_PD_MASK			BIT(16)
+#define I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
 #define SPI_CS0_PD_MASK				BIT(11)
 #define PCIE1_RESET_PD_MASK			BIT(9)
 #define PCIE0_RESET_PD_MASK			BIT(8)
-#define AN7583_MDIO_0_PD_MASK			BIT(5)
-#define AN7583_MDC_0_PD_MASK			BIT(4)
+#define MDIO_0_PD_MASK				BIT(5)
+#define MDC_0_PD_MASK				BIT(4)
 #define UART1_RXD_PD_MASK			BIT(3)
 #define UART1_TXD_PD_MASK			BIT(2)
 #define I2C_SCL_PD_MASK				BIT(1)
@@ -333,7 +333,7 @@
 		.regmap_size = 2,					\
 	}
 
-static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
+static struct pinctrl_pin_desc pinctrl_pins[] = {
 	PINCTRL_PIN(2, "gpio0"),
 	PINCTRL_PIN(3, "gpio1"),
 	PINCTRL_PIN(4, "gpio2"),
@@ -389,178 +389,178 @@ static struct pinctrl_pin_desc an7583_pinctrl_pins[] = {
 	PINCTRL_PIN(54, "mdio_0"),
 };
 
-static const int an7583_pon_pins[] = { 15, 16, 17, 18, 19, 20 };
-static const int an7583_pon_tod_1pps_pins[] = { 32 };
-static const int an7583_gsw_tod_1pps_pins[] = { 32 };
-static const int an7583_sipo_pins[] = { 34, 35 };
-static const int an7583_sipo_rclk_pins[] = { 34, 35, 33 };
-static const int an7583_mdio_pins[] = { 53, 54 };
-static const int an7583_mdio1_pins[] = { 43, 44 };
-static const int an7583_uart2_pins[] = { 34, 35 };
-static const int an7583_uart2_cts_rts_pins[] = { 32, 33 };
-static const int an7583_hsuart_pins[] = { 30, 31 };
-static const int an7583_hsuart_cts_rts_pins[] = { 28, 29 };
-static const int an7583_npu_uart_pins[] = { 7, 8 };
-static const int an7583_uart4_pins[] = { 7, 8 };
-static const int an7583_uart5_pins[] = { 23, 24 };
-static const int an7583_i2c0_pins[] = { 41, 42 };
-static const int an7583_i2c1_pins[] = { 43, 44 };
-static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
-static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
-static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
-static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
-static const int an7583_spi_pins[] = { 45, 46, 47, 48 };
-static const int an7583_spi_quad_pins[] = { 25, 26 };
-static const int an7583_spi_cs1_pins[] = { 27 };
-static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
-static const int an7583_pcm_spi_rst_pins[] = { 14 };
-static const int an7583_pcm_spi_cs1_pins[] = { 24 };
-static const int an7583_emmc_pins[] = {
+static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_tod_1pps_pins[] = { 32 };
+static const int gsw_tod_1pps_pins[] = { 32 };
+static const int sipo_pins[] = { 34, 35 };
+static const int sipo_rclk_pins[] = { 34, 35, 33 };
+static const int mdio_pins[] = { 53, 54 };
+static const int mdio1_pins[] = { 43, 44 };
+static const int uart2_pins[] = { 34, 35 };
+static const int uart2_cts_rts_pins[] = { 32, 33 };
+static const int hsuart_pins[] = { 30, 31 };
+static const int hsuart_cts_rts_pins[] = { 28, 29 };
+static const int npu_uart_pins[] = { 7, 8 };
+static const int uart4_pins[] = { 7, 8 };
+static const int uart5_pins[] = { 23, 24 };
+static const int i2c0_pins[] = { 41, 42 };
+static const int i2c1_pins[] = { 43, 44 };
+static const int jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
+static const int jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
+static const int pcm1_pins[] = { 10, 11, 12, 13, 14 };
+static const int pcm2_pins[] = { 28, 29, 30, 31, 24 };
+static const int spi_pins[] = { 45, 46, 47, 48 };
+static const int spi_quad_pins[] = { 25, 26 };
+static const int spi_cs1_pins[] = { 27 };
+static const int pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
+static const int pcm_spi_rst_pins[] = { 14 };
+static const int pcm_spi_cs1_pins[] = { 24 };
+static const int emmc_pins[] = {
 	7, 8, 9, 22, 23, 24, 25, 26, 45, 46, 47
 };
-static const int an7583_pnand_pins[] = {
+static const int pnand_pins[] = {
 	7, 8, 9, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 45, 46, 47, 48
 };
-static const int an7583_gpio0_pins[] = { 2 };
-static const int an7583_gpio1_pins[] = { 3 };
-static const int an7583_gpio2_pins[] = { 4 };
-static const int an7583_gpio3_pins[] = { 5 };
-static const int an7583_gpio4_pins[] = { 6 };
-static const int an7583_gpio5_pins[] = { 7 };
-static const int an7583_gpio6_pins[] = { 8 };
-static const int an7583_gpio7_pins[] = { 9 };
-static const int an7583_gpio8_pins[] = { 10 };
-static const int an7583_gpio9_pins[] = { 11 };
-static const int an7583_gpio10_pins[] = { 12 };
-static const int an7583_gpio11_pins[] = { 13 };
-static const int an7583_gpio12_pins[] = { 14 };
-static const int an7583_gpio13_pins[] = { 15 };
-static const int an7583_gpio14_pins[] = { 16 };
-static const int an7583_gpio15_pins[] = { 17 };
-static const int an7583_gpio16_pins[] = { 18 };
-static const int an7583_gpio17_pins[] = { 19 };
-static const int an7583_gpio18_pins[] = { 20 };
-static const int an7583_gpio19_pins[] = { 21 };
-static const int an7583_gpio20_pins[] = { 22 };
-static const int an7583_gpio21_pins[] = { 23 };
-static const int an7583_gpio22_pins[] = { 24 };
-static const int an7583_gpio23_pins[] = { 25 };
-static const int an7583_gpio24_pins[] = { 26 };
-static const int an7583_gpio25_pins[] = { 27 };
-static const int an7583_gpio26_pins[] = { 28 };
-static const int an7583_gpio27_pins[] = { 29 };
-static const int an7583_gpio28_pins[] = { 30 };
-static const int an7583_gpio29_pins[] = { 31 };
-static const int an7583_gpio30_pins[] = { 32 };
-static const int an7583_gpio31_pins[] = { 33 };
-static const int an7583_gpio32_pins[] = { 34 };
-static const int an7583_gpio33_pins[] = { 35 };
-static const int an7583_gpio34_pins[] = { 36 };
-static const int an7583_gpio35_pins[] = { 37 };
-static const int an7583_gpio36_pins[] = { 38 };
-static const int an7583_gpio37_pins[] = { 39 };
-static const int an7583_gpio38_pins[] = { 40 };
-static const int an7583_gpio39_pins[] = { 41 };
-static const int an7583_gpio40_pins[] = { 42 };
-static const int an7583_gpio41_pins[] = { 43 };
-static const int an7583_gpio42_pins[] = { 44 };
-static const int an7583_gpio43_pins[] = { 45 };
-static const int an7583_gpio44_pins[] = { 46 };
-static const int an7583_gpio45_pins[] = { 47 };
-static const int an7583_gpio46_pins[] = { 48 };
-static const int an7583_gpio47_pins[] = { 49 };
-static const int an7583_gpio48_pins[] = { 50 };
-static const int an7583_gpio49_pins[] = { 51 };
-static const int an7583_gpio50_pins[] = { 52 };
-static const int an7583_gpio51_pins[] = { 53 };
-static const int an7583_gpio52_pins[] = { 54 };
-static const int an7583_pcie_reset0_pins[] = { 51 };
-static const int an7583_pcie_reset1_pins[] = { 52 };
-
-static const struct pingroup an7583_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP("pon", an7583_pon),
-	PINCTRL_PIN_GROUP("pon_tod_1pps", an7583_pon_tod_1pps),
-	PINCTRL_PIN_GROUP("gsw_tod_1pps", an7583_gsw_tod_1pps),
-	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
-	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
-	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
-	PINCTRL_PIN_GROUP("mdio1", an7583_mdio1),
-	PINCTRL_PIN_GROUP("uart2", an7583_uart2),
-	PINCTRL_PIN_GROUP("uart2_cts_rts", an7583_uart2_cts_rts),
-	PINCTRL_PIN_GROUP("hsuart", an7583_hsuart),
-	PINCTRL_PIN_GROUP("hsuart_cts_rts", an7583_hsuart_cts_rts),
-	PINCTRL_PIN_GROUP("npu_uart", an7583_npu_uart),
-	PINCTRL_PIN_GROUP("uart4", an7583_uart4),
-	PINCTRL_PIN_GROUP("uart5", an7583_uart5),
-	PINCTRL_PIN_GROUP("i2c0", an7583_i2c0),
-	PINCTRL_PIN_GROUP("i2c1", an7583_i2c1),
-	PINCTRL_PIN_GROUP("jtag_udi", an7583_jtag_udi),
-	PINCTRL_PIN_GROUP("jtag_dfd", an7583_jtag_dfd),
-	PINCTRL_PIN_GROUP("pcm1", an7583_pcm1),
-	PINCTRL_PIN_GROUP("pcm2", an7583_pcm2),
-	PINCTRL_PIN_GROUP("spi", an7583_spi),
-	PINCTRL_PIN_GROUP("spi_quad", an7583_spi_quad),
-	PINCTRL_PIN_GROUP("spi_cs1", an7583_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi", an7583_pcm_spi),
-	PINCTRL_PIN_GROUP("pcm_spi_rst", an7583_pcm_spi_rst),
-	PINCTRL_PIN_GROUP("pcm_spi_cs1", an7583_pcm_spi_cs1),
-	PINCTRL_PIN_GROUP("emmc", an7583_emmc),
-	PINCTRL_PIN_GROUP("pnand", an7583_pnand),
-	PINCTRL_PIN_GROUP("gpio0", an7583_gpio0),
-	PINCTRL_PIN_GROUP("gpio1", an7583_gpio1),
-	PINCTRL_PIN_GROUP("gpio2", an7583_gpio2),
-	PINCTRL_PIN_GROUP("gpio3", an7583_gpio3),
-	PINCTRL_PIN_GROUP("gpio4", an7583_gpio4),
-	PINCTRL_PIN_GROUP("gpio5", an7583_gpio5),
-	PINCTRL_PIN_GROUP("gpio6", an7583_gpio6),
-	PINCTRL_PIN_GROUP("gpio7", an7583_gpio7),
-	PINCTRL_PIN_GROUP("gpio8", an7583_gpio8),
-	PINCTRL_PIN_GROUP("gpio9", an7583_gpio9),
-	PINCTRL_PIN_GROUP("gpio10", an7583_gpio10),
-	PINCTRL_PIN_GROUP("gpio11", an7583_gpio11),
-	PINCTRL_PIN_GROUP("gpio12", an7583_gpio12),
-	PINCTRL_PIN_GROUP("gpio13", an7583_gpio13),
-	PINCTRL_PIN_GROUP("gpio14", an7583_gpio14),
-	PINCTRL_PIN_GROUP("gpio15", an7583_gpio15),
-	PINCTRL_PIN_GROUP("gpio16", an7583_gpio16),
-	PINCTRL_PIN_GROUP("gpio17", an7583_gpio17),
-	PINCTRL_PIN_GROUP("gpio18", an7583_gpio18),
-	PINCTRL_PIN_GROUP("gpio19", an7583_gpio19),
-	PINCTRL_PIN_GROUP("gpio20", an7583_gpio20),
-	PINCTRL_PIN_GROUP("gpio21", an7583_gpio21),
-	PINCTRL_PIN_GROUP("gpio22", an7583_gpio22),
-	PINCTRL_PIN_GROUP("gpio23", an7583_gpio23),
-	PINCTRL_PIN_GROUP("gpio24", an7583_gpio24),
-	PINCTRL_PIN_GROUP("gpio25", an7583_gpio25),
-	PINCTRL_PIN_GROUP("gpio26", an7583_gpio26),
-	PINCTRL_PIN_GROUP("gpio27", an7583_gpio27),
-	PINCTRL_PIN_GROUP("gpio28", an7583_gpio28),
-	PINCTRL_PIN_GROUP("gpio29", an7583_gpio29),
-	PINCTRL_PIN_GROUP("gpio30", an7583_gpio30),
-	PINCTRL_PIN_GROUP("gpio31", an7583_gpio31),
-	PINCTRL_PIN_GROUP("gpio32", an7583_gpio32),
-	PINCTRL_PIN_GROUP("gpio33", an7583_gpio33),
-	PINCTRL_PIN_GROUP("gpio34", an7583_gpio34),
-	PINCTRL_PIN_GROUP("gpio35", an7583_gpio35),
-	PINCTRL_PIN_GROUP("gpio36", an7583_gpio36),
-	PINCTRL_PIN_GROUP("gpio37", an7583_gpio37),
-	PINCTRL_PIN_GROUP("gpio38", an7583_gpio38),
-	PINCTRL_PIN_GROUP("gpio39", an7583_gpio39),
-	PINCTRL_PIN_GROUP("gpio40", an7583_gpio40),
-	PINCTRL_PIN_GROUP("gpio41", an7583_gpio41),
-	PINCTRL_PIN_GROUP("gpio42", an7583_gpio42),
-	PINCTRL_PIN_GROUP("gpio43", an7583_gpio43),
-	PINCTRL_PIN_GROUP("gpio44", an7583_gpio44),
-	PINCTRL_PIN_GROUP("gpio45", an7583_gpio45),
-	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
-	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
-	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
-	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
-	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
-	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
-	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
-	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
-	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
+static const int gpio0_pins[] = { 2 };
+static const int gpio1_pins[] = { 3 };
+static const int gpio2_pins[] = { 4 };
+static const int gpio3_pins[] = { 5 };
+static const int gpio4_pins[] = { 6 };
+static const int gpio5_pins[] = { 7 };
+static const int gpio6_pins[] = { 8 };
+static const int gpio7_pins[] = { 9 };
+static const int gpio8_pins[] = { 10 };
+static const int gpio9_pins[] = { 11 };
+static const int gpio10_pins[] = { 12 };
+static const int gpio11_pins[] = { 13 };
+static const int gpio12_pins[] = { 14 };
+static const int gpio13_pins[] = { 15 };
+static const int gpio14_pins[] = { 16 };
+static const int gpio15_pins[] = { 17 };
+static const int gpio16_pins[] = { 18 };
+static const int gpio17_pins[] = { 19 };
+static const int gpio18_pins[] = { 20 };
+static const int gpio19_pins[] = { 21 };
+static const int gpio20_pins[] = { 22 };
+static const int gpio21_pins[] = { 23 };
+static const int gpio22_pins[] = { 24 };
+static const int gpio23_pins[] = { 25 };
+static const int gpio24_pins[] = { 26 };
+static const int gpio25_pins[] = { 27 };
+static const int gpio26_pins[] = { 28 };
+static const int gpio27_pins[] = { 29 };
+static const int gpio28_pins[] = { 30 };
+static const int gpio29_pins[] = { 31 };
+static const int gpio30_pins[] = { 32 };
+static const int gpio31_pins[] = { 33 };
+static const int gpio32_pins[] = { 34 };
+static const int gpio33_pins[] = { 35 };
+static const int gpio34_pins[] = { 36 };
+static const int gpio35_pins[] = { 37 };
+static const int gpio36_pins[] = { 38 };
+static const int gpio37_pins[] = { 39 };
+static const int gpio38_pins[] = { 40 };
+static const int gpio39_pins[] = { 41 };
+static const int gpio40_pins[] = { 42 };
+static const int gpio41_pins[] = { 43 };
+static const int gpio42_pins[] = { 44 };
+static const int gpio43_pins[] = { 45 };
+static const int gpio44_pins[] = { 46 };
+static const int gpio45_pins[] = { 47 };
+static const int gpio46_pins[] = { 48 };
+static const int gpio47_pins[] = { 49 };
+static const int gpio48_pins[] = { 50 };
+static const int gpio49_pins[] = { 51 };
+static const int gpio50_pins[] = { 52 };
+static const int gpio51_pins[] = { 53 };
+static const int gpio52_pins[] = { 54 };
+static const int pcie_reset0_pins[] = { 51 };
+static const int pcie_reset1_pins[] = { 52 };
+
+static const struct pingroup pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", mdio),
+	PINCTRL_PIN_GROUP("mdio1", mdio1),
+	PINCTRL_PIN_GROUP("uart2", uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("npu_uart", npu_uart),
+	PINCTRL_PIN_GROUP("uart4", uart4),
+	PINCTRL_PIN_GROUP("uart5", uart5),
+	PINCTRL_PIN_GROUP("i2c0", i2c0),
+	PINCTRL_PIN_GROUP("i2c1", i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", jtag_dfd),
+	PINCTRL_PIN_GROUP("pcm1", pcm1),
+	PINCTRL_PIN_GROUP("pcm2", pcm2),
+	PINCTRL_PIN_GROUP("spi", spi),
+	PINCTRL_PIN_GROUP("spi_quad", spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("emmc", emmc),
+	PINCTRL_PIN_GROUP("pnand", pnand),
+	PINCTRL_PIN_GROUP("gpio0", gpio0),
+	PINCTRL_PIN_GROUP("gpio1", gpio1),
+	PINCTRL_PIN_GROUP("gpio2", gpio2),
+	PINCTRL_PIN_GROUP("gpio3", gpio3),
+	PINCTRL_PIN_GROUP("gpio4", gpio4),
+	PINCTRL_PIN_GROUP("gpio5", gpio5),
+	PINCTRL_PIN_GROUP("gpio6", gpio6),
+	PINCTRL_PIN_GROUP("gpio7", gpio7),
+	PINCTRL_PIN_GROUP("gpio8", gpio8),
+	PINCTRL_PIN_GROUP("gpio9", gpio9),
+	PINCTRL_PIN_GROUP("gpio10", gpio10),
+	PINCTRL_PIN_GROUP("gpio11", gpio11),
+	PINCTRL_PIN_GROUP("gpio12", gpio12),
+	PINCTRL_PIN_GROUP("gpio13", gpio13),
+	PINCTRL_PIN_GROUP("gpio14", gpio14),
+	PINCTRL_PIN_GROUP("gpio15", gpio15),
+	PINCTRL_PIN_GROUP("gpio16", gpio16),
+	PINCTRL_PIN_GROUP("gpio17", gpio17),
+	PINCTRL_PIN_GROUP("gpio18", gpio18),
+	PINCTRL_PIN_GROUP("gpio19", gpio19),
+	PINCTRL_PIN_GROUP("gpio20", gpio20),
+	PINCTRL_PIN_GROUP("gpio21", gpio21),
+	PINCTRL_PIN_GROUP("gpio22", gpio22),
+	PINCTRL_PIN_GROUP("gpio23", gpio23),
+	PINCTRL_PIN_GROUP("gpio24", gpio24),
+	PINCTRL_PIN_GROUP("gpio25", gpio25),
+	PINCTRL_PIN_GROUP("gpio26", gpio26),
+	PINCTRL_PIN_GROUP("gpio27", gpio27),
+	PINCTRL_PIN_GROUP("gpio28", gpio28),
+	PINCTRL_PIN_GROUP("gpio29", gpio29),
+	PINCTRL_PIN_GROUP("gpio30", gpio30),
+	PINCTRL_PIN_GROUP("gpio31", gpio31),
+	PINCTRL_PIN_GROUP("gpio32", gpio32),
+	PINCTRL_PIN_GROUP("gpio33", gpio33),
+	PINCTRL_PIN_GROUP("gpio34", gpio34),
+	PINCTRL_PIN_GROUP("gpio35", gpio35),
+	PINCTRL_PIN_GROUP("gpio36", gpio36),
+	PINCTRL_PIN_GROUP("gpio37", gpio37),
+	PINCTRL_PIN_GROUP("gpio38", gpio38),
+	PINCTRL_PIN_GROUP("gpio39", gpio39),
+	PINCTRL_PIN_GROUP("gpio40", gpio40),
+	PINCTRL_PIN_GROUP("gpio41", gpio41),
+	PINCTRL_PIN_GROUP("gpio42", gpio42),
+	PINCTRL_PIN_GROUP("gpio43", gpio43),
+	PINCTRL_PIN_GROUP("gpio44", gpio44),
+	PINCTRL_PIN_GROUP("gpio45", gpio45),
+	PINCTRL_PIN_GROUP("gpio46", gpio46),
+	PINCTRL_PIN_GROUP("gpio47", gpio47),
+	PINCTRL_PIN_GROUP("gpio48", gpio48),
+	PINCTRL_PIN_GROUP("gpio49", gpio49),
+	PINCTRL_PIN_GROUP("gpio50", gpio50),
+	PINCTRL_PIN_GROUP("gpio51", gpio51),
+	PINCTRL_PIN_GROUP("gpio52", gpio52),
+	PINCTRL_PIN_GROUP("pcie_reset0", pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
 static const char *const pon_groups[] = { "pon" };
@@ -568,29 +568,29 @@ static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
 static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
-static const char *const an7583_mdio_groups[] = { "mdio" };
+static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
 	"uart4", "uart5"
 };
-static const char *const an7583_i2c_groups[] = { "i2c0", "i2c1" };
+static const char *const i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
 static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
-static const char *const an7583_pcm_spi_groups[] = {
+static const char *const pcm_spi_groups[] = {
 	"pcm_spi", "pcm_spi_rst", "pcm_spi_cs1"
 };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
-static const char *const an7583_gpio_groups[] = {
+static const char *const gpio_groups[] = {
 	"gpio39", "gpio40", "gpio41", "gpio42", "gpio43",
 	"gpio44", "gpio45", "gpio46", "gpio47", "gpio48",
 	"gpio49", "gpio50", "gpio51", "gpio52"
 };
-static const char *const an7583_pcie_reset_groups[] = {
+static const char *const pcie_reset_groups[] = {
 	"pcie_reset0", "pcie_reset1"
 };
-static const char *const an7583_pwm_groups[] = {
+static const char *const pwm_groups[] = {
 	"gpio0",  "gpio1",  "gpio2",  "gpio3",  "gpio4",  "gpio5",
 	"gpio6",  "gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11",
 	"gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
@@ -600,28 +600,28 @@ static const char *const an7583_pwm_groups[] = {
 	"gpio40", "gpio41", "gpio42", "gpio43", "gpio44", "gpio45",
 	"gpio46", "gpio47", "gpio48", "gpio49", "gpio50", "gpio51"
 };
-static const char *const an7583_phy1_led0_groups[] = {
+static const char *const phy1_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy2_led0_groups[] = {
+static const char *const phy2_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy3_led0_groups[] = {
+static const char *const phy3_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy4_led0_groups[] = {
+static const char *const phy4_led0_groups[] = {
 	"gpio1", "gpio2", "gpio3", "gpio4"
 };
-static const char *const an7583_phy1_led1_groups[] = {
+static const char *const phy1_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
-static const char *const an7583_phy2_led1_groups[] = {
+static const char *const phy2_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
-static const char *const an7583_phy3_led1_groups[] = {
+static const char *const phy3_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
-static const char *const an7583_phy4_led1_groups[] = {
+static const char *const phy4_led1_groups[] = {
 	"gpio8", "gpio9", "gpio10", "gpio11"
 };
 
@@ -682,13 +682,13 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
+static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 	{
 		.name = "mdio",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			AN7583_MDC_0_GPIO_MODE_MASK | AN7583_MDIO_0_GPIO_MODE_MASK,
+			MDC_0_GPIO_MODE_MASK | MDIO_0_GPIO_MODE_MASK,
 			0
 		},
 		.regmap_size = 1,
@@ -754,13 +754,13 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_i2c_func_group[] = {
+static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 	{
 		.name = "i2c0",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			AN7583_I2C0_SCL_GPIO_MODE_MASK | AN7583_I2C0_SDA_GPIO_MODE_MASK,
+			I2C0_SCL_GPIO_MODE_MASK | I2C0_SDA_GPIO_MODE_MASK,
 			0
 		},
 		.regmap_size = 1,
@@ -769,7 +769,7 @@ static const struct airoha_pinctrl_func_group an7583_i2c_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			AN7583_I2C1_SCL_GPIO_MODE_MASK | AN7583_I2C1_SDA_GPIO_MODE_MASK,
+			I2C1_SCL_GPIO_MODE_MASK | I2C1_SDA_GPIO_MODE_MASK,
 			0
 		},
 		.regmap_size = 1,
@@ -869,7 +869,7 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_pcm_spi_func_group[] = {
+static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 	{
 		.name = "pcm_spi",
 		.regmap[0] = {
@@ -911,8 +911,8 @@ static const struct airoha_pinctrl_func_group an7583_pcm_spi_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK,
-			AN7583_GPIO_PCM_SPI_CS2_MODE_MASK
+			GPIO_PCM_SPI_CS2_MODE_MASK,
+			GPIO_PCM_SPI_CS2_MODE_MASK
 		},
 		.regmap_size = 1,
 	}, {
@@ -962,37 +962,37 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
 	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
-				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+				I2C0_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
-				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+				I2C0_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
-				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+				I2C1_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
-				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+				I2C1_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
-				AN7583_SPI_CLK_GPIO_MODE_MASK),
+				SPI_CLK_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
-				AN7583_SPI_CS_GPIO_MODE_MASK),
+				SPI_CS_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
-				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+				SPI_MOSI_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
-				AN7583_SPI_MISO_GPIO_MODE_MASK),
+				SPI_MISO_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
-				AN7583_UART_TXD_GPIO_MODE_MASK),
+				UART_TXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
-				AN7583_UART_RXD_GPIO_MODE_MASK),
+				UART_RXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
 				GPIO_PCIE_RESET0_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
 				GPIO_PCIE_RESET1_MASK),
 	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
-				AN7583_MDC_0_GPIO_MODE_MASK),
-	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+				MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", MDIO_0_GPIO_MODE_MASK),
 };
 
-static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
+static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
 		.regmap[0] = {
@@ -1014,7 +1014,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
+static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
@@ -1051,34 +1051,34 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
-				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+				   I2C0_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
-				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+				   I2C0_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
-				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+				   I2C1_SCL_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
-				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+				   I2C1_SDA_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
-				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+				   SPI_CLK_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
-				   AN7583_SPI_CS_GPIO_MODE_MASK),
+				   SPI_CS_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
-				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+				   SPI_MOSI_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
-				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+				   SPI_MISO_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
-				   AN7583_UART_TXD_GPIO_MODE_MASK),
+				   UART_TXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
-				   AN7583_UART_RXD_GPIO_MODE_MASK),
+				   UART_RXD_GPIO_MODE_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
 				   GPIO_PCIE_RESET0_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
 				   GPIO_PCIE_RESET1_MASK),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
-				   AN7583_MDC_0_GPIO_MODE_MASK),
+				   MDC_0_GPIO_MODE_MASK),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1089,7 +1089,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy2_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1100,7 +1100,7 @@ static const struct airoha_pinctrl_func_group an7583_phy2_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy3_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1111,7 +1111,7 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy4_led0_func_group[] = {
+static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
@@ -1122,7 +1122,7 @@ static const struct airoha_pinctrl_func_group an7583_phy4_led0_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1133,7 +1133,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy2_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1144,7 +1144,7 @@ static const struct airoha_pinctrl_func_group an7583_phy2_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1155,7 +1155,7 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
-static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
+static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
@@ -1166,33 +1166,33 @@ static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
+static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
-	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
+	PINCTRL_FUNC_DESC("mdio", mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", an7583_i2c),
+	PINCTRL_FUNC_DESC("i2c", i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
-	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
-	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
-	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
-	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
-	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
-	PINCTRL_FUNC_DESC("phy4_led0", an7583_phy4_led0),
-	PINCTRL_FUNC_DESC("phy1_led1", an7583_phy1_led1),
-	PINCTRL_FUNC_DESC("phy2_led1", an7583_phy2_led1),
-	PINCTRL_FUNC_DESC("phy3_led1", an7583_phy3_led1),
-	PINCTRL_FUNC_DESC("phy4_led1", an7583_phy4_led1),
+	PINCTRL_FUNC_DESC("gpio", gpio),
+	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_PU, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_PU, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_PU, BIT(2)),
@@ -1234,8 +1234,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_PU, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PU, AN7583_I2C1_SCL_PU_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PU, AN7583_I2C1_SDA_PU_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PU, I2C1_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PU, I2C1_SDA_PU_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
@@ -1244,11 +1244,11 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PU, AN7583_MDC_0_PU_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PU, AN7583_MDIO_0_PU_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PU, MDC_0_PU_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PU, MDIO_0_PU_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_PD, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_PD, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_PD, BIT(2)),
@@ -1290,8 +1290,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_PD, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, AN7583_I2C1_SCL_PD_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, AN7583_I2C1_SDA_PD_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_PD, I2C1_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_PD, I2C1_SDA_PD_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
@@ -1300,11 +1300,11 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PD, AN7583_MDC_0_PD_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PD, AN7583_MDIO_0_PD_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_PD, MDC_0_PD_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_PD, MDIO_0_PD_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_E2, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_E2, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_E2, BIT(2)),
@@ -1346,8 +1346,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_E2, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E2, AN7583_I2C1_SCL_E2_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E2, AN7583_I2C1_SDA_E2_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E2, I2C1_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E2, I2C1_SDA_E2_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
@@ -1356,11 +1356,11 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E2, AN7583_MDC_0_E2_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E2, AN7583_MDIO_0_E2_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E2, MDC_0_E2_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E2, MDIO_0_E2_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(2, REG_GPIO_L_E4, BIT(0)),
 	PINCTRL_CONF_DESC(3, REG_GPIO_L_E4, BIT(1)),
 	PINCTRL_CONF_DESC(4, REG_GPIO_L_E4, BIT(2)),
@@ -1402,8 +1402,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(40, REG_GPIO_H_E4, BIT(6)),
 	PINCTRL_CONF_DESC(41, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
 	PINCTRL_CONF_DESC(42, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E4, AN7583_I2C1_SCL_E4_MASK),
-	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E4, AN7583_I2C1_SDA_E4_MASK),
+	PINCTRL_CONF_DESC(43, REG_I2C_SDA_E4, I2C1_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(44, REG_I2C_SDA_E4, I2C1_SDA_E4_MASK),
 	PINCTRL_CONF_DESC(45, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
 	PINCTRL_CONF_DESC(46, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
 	PINCTRL_CONF_DESC(47, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
@@ -1412,50 +1412,50 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(50, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
 	PINCTRL_CONF_DESC(51, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
 	PINCTRL_CONF_DESC(52, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E4, AN7583_MDC_0_E4_MASK),
-	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E4, AN7583_MDIO_0_E4_MASK),
+	PINCTRL_CONF_DESC(53, REG_I2C_SDA_E4, MDC_0_E4_MASK),
+	PINCTRL_CONF_DESC(54, REG_I2C_SDA_E4, MDIO_0_E4_MASK),
 };
 
-static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 	PINCTRL_CONF_DESC(51, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(52, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
 };
 
-static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
+static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
-	.pins = an7583_pinctrl_pins,
-	.num_pins = ARRAY_SIZE(an7583_pinctrl_pins),
-	.grps = an7583_pinctrl_groups,
-	.num_grps = ARRAY_SIZE(an7583_pinctrl_groups),
-	.funcs = an7583_pinctrl_funcs,
-	.num_funcs = ARRAY_SIZE(an7583_pinctrl_funcs),
+	.pins = pinctrl_pins,
+	.num_pins = ARRAY_SIZE(pinctrl_pins),
+	.grps = pinctrl_groups,
+	.num_grps = ARRAY_SIZE(pinctrl_groups),
+	.funcs = pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
-			.confs = an7583_pinctrl_pullup_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pullup_conf),
+			.confs = pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pullup_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
-			.confs = an7583_pinctrl_pulldown_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
+			.confs = pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pulldown_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = an7583_pinctrl_drive_e2_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
+			.confs = pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e2_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
-			.confs = an7583_pinctrl_drive_e4_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e4_conf),
+			.confs = pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e4_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
-			.confs = an7583_pinctrl_pcie_rst_od_conf,
-			.num_confs = ARRAY_SIZE(an7583_pinctrl_pcie_rst_od_conf),
+			.confs = pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pcie_rst_od_conf),
 		},
 	},
 };
 
 static const struct of_device_id airoha_pinctrl_of_match[] = {
-	{ .compatible = "airoha,an7583-pinctrl", .data = &an7583_pinctrl_match_data },
+	{ .compatible = "airoha,an7583-pinctrl", .data = &pinctrl_match_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-- 
2.53.0

