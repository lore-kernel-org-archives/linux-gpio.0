Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F642B75D;
	Thu,  6 Aug 2026 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054005; cv=fail; b=Hp20lnR2glum+oyx0LTGsJTf4oFLiTwfRCyuIy1FkGB1wEAL5+TkZcgSOLyMj0Dt0Eg2DH9zxsxQdvTsRt6SgOx8f7iDXAfs+fFdE/wjLDwsA8W7IWN6F0Gy+ipyJF9uIpFZ+l1ccterL9DLyP3YzVR0iDvKDjAbpMz6rdAMX04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054005; c=relaxed/simple;
	bh=2CmGyEfw5kbE63Anq8FUL92yMjOw00OMsGRsR+5yGbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtnTWwH8HjMev5+NOzI48ibDoqZ2dODF/EGf6f/BGrDFDQ9N7oOAsAFxm5yUbXzyyoJSyeWRaMe/omBnLCBd0SatieCDa+8qXrh4qANUQQxhGKcq8RK5csfb+q2qmW657E05kX4mv8x5CnhPNiMOVqyqff5emKT/ZvnfXpib6cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=QQu9bwJ4; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="QQu9bwJ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8dUWW+hvSkZwY/C0JaG4acafDN38OF6vUhgFUFcNG4t3j+7zMgVPzYfo7G41dERoO96LcQOpNqrZuD2NZL0hYrKhpfVwB9wZrMI/3PqardUKLV5PgfHnjW1viot3rVv0PK0V5m7aRGIpApu3PyVtxHxSJAmMQ0GoGSRRWsw23qQlhplYYQCzvI3ODvIrhRHYkFHwCk4BnBS+h7E6sILlWbxDpV9W/AHn1v9/I3wpPuvjFe4s0IpwhEYYCiZs1GV9tOYVeGRrl6snMqgkjmnyCUA19CHOu+ZeyfnZO1DMuc004MzoCeN4VBwyTbuvUaVaV3IU5lArozvnDdQB4DpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IHtikg4UT4jq4M5d7LArtshPtLTy4yM7YKyDgPnVIU=;
 b=y8h58hbMEKTGt92jLpxMaTi5MnNdOg5z2NgVbHEecOt44tNOZkFwnv7yTKdLJHdq/QY+ryYB8GdHwIrpMRxktsoiAMNf0cFfbBZmdG9qlCXmH3cvV4NZaUMBormjfferT1DtD5iMHjpHpqRtDLRpyzjMoA1kt9h7UeM0Di3zC5z76Os4seayWgpRvU5YM19uqy0mUb8Sdf1y6i7rBnKqoYzfUOQHpcF23FVk85IHYUM4jw3L0QxHuujpPV1Bb4/MmUzgfibIAqVCL7NS0ASBaNZE3uJyIc3o4scdM/xEJI7QyHoHxd49gOSmRMIBH47BZylpQmxppBNJuUfR0NEzMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IHtikg4UT4jq4M5d7LArtshPtLTy4yM7YKyDgPnVIU=;
 b=QQu9bwJ4xEvobLvjERJAMjqgj2ciNFNG/m3ZtZz+hEosUbokb8WWbypZ1SdOXXztLY0UStfNzhO75V46X89zxPnnphopQIxl7XrlNhHoff4t72J6IgDkHPaY8MLJLRfJMLuXq+nNMtqdTDQja2w/7NNW1xl27Pnkp2hpwhdvbx8dql/mLsUXbItCJBBceDNKw1XszPI4jQ47dCJAnwx/t4vakXuee6NQW0+NzbU/SRqqqukmGSrpBLxhn1wdRM6zClexIoiwOCtDDSf9vEVJ6NDmLd/d9i9M4NaOY9LYJY7GNsAleGK/r2yKR/tXDNPd5DEw6IT3+CquMhr7CbwzVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:35 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:35 +0000
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
Subject: [PATCH v11 06/37] dt-bindings: pinctrl: airoha: en7581: allow configuration of pcie_reset pins as gpio or pwm
Date: Fri,  7 Aug 2026 01:05:44 +0300
Message-ID: <20260806220615.4078303-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 3817b21c-ce90-42ba-a8e9-08def406fb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	vveJ1j/jm+Yhx0N6yUj3pXY+OgoTXoXtrxwzYPFVUuWRz4hry8wGTIqJnQffbxVnE71hcQdA1EiFGBwRSj1Zk1JaJkTnHTLtKP7ccWBEL5GqTxQ0xe8aMOTeuc+bAn5zo/InxxXiE3OBsTqf/Zt0PYK3rVSeGqPKYN7VmwUuicic2aIz1O0vAPF8bT6ZYF929HhQGH1eVxK4OiUuii+HOWxngzkrmAY/JA/wHoxPkIMSYgTXUFUpKXI5eMVf9tmE755rPQnZztCNRWQ70TbQCxM80OnjQ0Fagn/VCPwQGbnQutoXPTXEXpVfoxtrQup2n0UIcpaxvOOsshCfYp0amB35mxMCJqfrcrQ0NfAmSLXoQJTQemn2pO+qhTIdOPtyvq3KpjiGDfvUY4Mr9ShNWDQM9C20+Qy4ZV9mxiAjkjngs4TfklRyLrZH4tq2UjE8cRcJ/cBCvafd1PjPA4A37AdwkUGB3V+RDL3MjJEdZEmwTLoMYo5SMs4qEKhnmAprQuUWohX21wYd7CUDvQT1JVPKRX8fVPRIDUW/QGJNPabdhHVG+01SxLAMkMRb26dIcsdHriF3ykUL5niCetzU/LYx4qz21O8M2gd38cLW6ZBHS7jIQ8htjjlUFGtykEfZ16gru4gsArEneHiRtFB3sTq+cFbJR2yhWcY1btSdJ4gMXjJgIAA5j3qpqg+dKcRnGSG7rEM2DFgQBWT0Sg7Ne6FG+c9yPy1SVM42FfSBeyYCY02bwpEm4QeVBFO2s4LO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y1kg6RP3KtlCQ32PEtdVsAc1xl15qr5J14dUsMpQhYftyGmRNKArySB6WrVb?=
 =?us-ascii?Q?SNUzd2CFKXasJMeK4whuFWHkKo44wnC6hEWA39F+pmuFZDnAXroGl51+NoUo?=
 =?us-ascii?Q?n/HOiwnLwz8egp8UINMcN1eUUOTLxKCabHZT29RI05iAahQreyDEiAuAWF/I?=
 =?us-ascii?Q?8buG+qYHVke4Iz2zsODmBLuOloc/Pvrwh/LjCcRQC4oEKIfqv7jotfUVhbwU?=
 =?us-ascii?Q?hX2z5RB/HdDz/gg7GNkajHuOVtCyXKx+iwbcMK46ty2i4TO9HSBoI7ToJ5RE?=
 =?us-ascii?Q?aF+Uflb5e+FEL7hx7tlGvvITTQT6YeH+6JFF9BvS1MKYYhyHj2y14B1Kvd18?=
 =?us-ascii?Q?DDLpeCT8+BUOiPtYcUEdlOSlWXCbrh0R9NOMmoxpr0yG4eUqzmZaFBaHadpy?=
 =?us-ascii?Q?FAR9yqjdRxu2hoQkrypWodHeTbsvLDgc1b1TvwL/83TLy5GBe2g1LbUn65jh?=
 =?us-ascii?Q?u5kffIEIW5fKojCIgKEHuphk0/7wGCSpO0SFMh8nlz5OPgNwpR6Li9b9Y1Yf?=
 =?us-ascii?Q?TwHDksRPLaHm7v84i7wvo/o6MjM8KXFm1cyJaoUwvu4fGkmQ+PM/HI3HB/3I?=
 =?us-ascii?Q?G9AmAcTphumQPQqbOfWFPq7JS5dfV2iWhA+fsysqOBUG4zXDBu2KTKkMOmx8?=
 =?us-ascii?Q?lnyEqiMwE9MJzZB0YQnJyOP4dxyuebFN1Qxkqx+JpxbGAemr+EnMeOsLprG5?=
 =?us-ascii?Q?W7s6rLdC6msiGbPlm5M/HwKRnoKsLvtjtJep3lQev9/8q1sjIQsX2JVxA1Xo?=
 =?us-ascii?Q?gWflWNVits8uQuUfOcSkrXj/IKZH3wd6dx2NXdTKTzTkrdN7LJoTvDaVBRe2?=
 =?us-ascii?Q?DF99x6TeE2FJlh833iZbiF6UjN9ooVEekhXgcCOmKdJiIvxGnlFma76oZ5Rk?=
 =?us-ascii?Q?shEaqD9dSS5G9UjUF//Ft4au+9IKRe79iiRZxgNJ/9DeUzFgIBR24tuTE917?=
 =?us-ascii?Q?fztRve/lRVydPcr0ZTAYjFCvSG+Z6D1Qhsq3kqGg6xj/2AxmSHEtGq+/Jzy9?=
 =?us-ascii?Q?lH2qkJE9a4o1DxJ/r8HHXNhNVcSaxxxTfNcWFdoApAzPanFvj6APNiMtiZME?=
 =?us-ascii?Q?0mIzn02MYUyl7L0m5G+n+wFfAvdPK+6zUQS9Hx5CrZOFQOFzHuyR5bL9RjxG?=
 =?us-ascii?Q?2oMjQ1x5uWVZisoldz/zH+oVEAfMC/Je6jAksEILMO50Sa8j7fx2qTIKlK2C?=
 =?us-ascii?Q?BRfykDmHsb4FR1THqywjSz8XR7ZgykFa3a+RaoJwUmMINrxIfKi4Z+CjP9Ix?=
 =?us-ascii?Q?bKSj780P7vD3/tA97n1Y/oQmtIOTTk4LBvDkxBrZwaIvITUnDgkILM69mhJY?=
 =?us-ascii?Q?EvwiaX7F1hZoSBDM4U9UA/izUZ0tzTCkxXhn+feJSuvU1bCd+92OdhE+rIbS?=
 =?us-ascii?Q?Zr3u1NQv00dI4LPZJRT1ccBmyZVd/v1IU/5cQAFa0eBJr/zl/rV/LKPh5l5X?=
 =?us-ascii?Q?7IfsI4SB0DmrySU+ONrqwBWJ6IkInLKgxs/6PxfYE6K92+iRucl9NQMYJxyF?=
 =?us-ascii?Q?9KaG/RczUx5JB1kaMMdmZXVoI6TQ/AeW3KrnJap/Z0xuy2ZveVKbOR5viZqD?=
 =?us-ascii?Q?aCyMgd7FG4PcNXJZrpwhtshSj8TnbMNI5WtXOxikZvG8W3XYiurOxLk5FKkh?=
 =?us-ascii?Q?RArcSTDgGd15S7gGYluyhw3cy/eOmECGaKHJ5D/lgGbR7BXFIyAJltb4Xscw?=
 =?us-ascii?Q?iqc3rV0d4rkqx6heVEONDbBS5b7iIKGjG7NZ1rtieFKi3CfrqTQuvL0sTDL6?=
 =?us-ascii?Q?LnZ/6bBpcP/lL6bj8Zv7WDtO0NdlbL8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3817b21c-ce90-42ba-a8e9-08def406fb3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:35.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ih7ECEoG5wupk1ZyUYJfIPlpGjf2VBG5FXSo2U4XS7R99HDMMgO1KTwqMT9OKP9EAgstcJSaabaGIQxisW3Ookklltn0AHATWa+phmm9QZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

In the an7581 case
 * gpio47 and pcie_reset0 shares the same pin,
 * gpio48 and pcie_reset1 shares the same pin,
 * gpio49 and pcie_reset2 shares the same pin.

Let's define a way to configure these pins as gpio or pwm.
Also add gpio-range property in the dts example.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml   | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0c5a7eb6d563e..0cf1826c691fc 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, i2s, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -187,6 +187,14 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio47, gpio48, gpio49]
           - if:
               properties:
                 function:
@@ -208,7 +216,8 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48, gpio49]
           - if:
               properties:
                 function:
@@ -347,6 +356,8 @@ examples:
       interrupt-controller;
       #interrupt-cells = <2>;
 
+      gpio-ranges = <&pinctrl 0 13 50>;
+
       pcie1-rst-pins {
         conf {
           pins = "pcie_reset1";
-- 
2.53.0

