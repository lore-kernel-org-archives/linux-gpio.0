Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021125.outbound.protection.outlook.com [40.107.130.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E66B3EC829;
	Wed,  5 Aug 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933294; cv=fail; b=CrIvNfJ/Nj5cWo/GBtZl6ssXs2kTZgLHsZpNhcxhrvxnE42JtHgITPzdTulhjO88+L0OMpmtTojRBcvfwoSk34j4ZHaDcjMcMf8NpChY3f02i1/fZkYs7KCR8X6QA02fPQn7bBALtjUzE/jEylQ4ujIzqaGCgDAlgVxgHHBd7mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933294; c=relaxed/simple;
	bh=JTSHF6/JbfKXbZYbbsy6kmQjyACIGs2pwkS7g68+VmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PWGex4PVdFFa2OlO4Dd+yFNCnl1s3ikRO8siu05912Ttn7ZfThfRjqmCQFVGA+TMJB8WVb0CKUi23mFcXsz/dCxHzIqnyYag1c3Xwyh1VEAwbTGNF6hd8JFMD4y8QXC3zjio6B0DHH1LPpIuR9oIbihTflj8dfijlOFYXxs3MQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=sUlG3AzY; arc=fail smtp.client-ip=40.107.130.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="sUlG3AzY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4s30OQigjbJRvsh+/S6dLU6lmCmku2SV+vLtV7DX5fxZ206lXXGEg5NH/9olWGHgbTpHYsQ1luGI37kX3te8kzwNb8OfsBkAd06CdKx1HMNVbtS8JKJA2Nvb+CHGCTw3N8/Zn6/chCpb50oNbuLxaL/kGF3/JRGsjn9FK6CsN0/Z4pMRH0fL7qncoEIxdyAA9qrMU4Ote0n+DGCBwrnvG3sQw7sTLTrpP36wnIYkROl8yb7uR/LYOOCDUwcd+BZ+bCbTkHZcZYg6Xm1Em5jnnscrJhqaY+u8CQhK8d9cu7yNA0cat8VaTCHzZkDtjxTrl6nFyPJsp1r6xJR2zV5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z62y/O8beT+usARhO3M4MjzPLwrGaSBe5pzK4FkLyHE=;
 b=PERnxEMgf6XT3jEQ+59htyUKHCqfL4KH1QP1Zi5HMHY93krq8oulDa0Z6tF+WKdB3qLYFnCk1KYP8UEYuMilQ7y72Tb9j26aLZRx/mW3QmJ69kf8IFqwuKs3118FenvNxsjNzoCTFolMzESlJ1GAzg803C/cLx7P1ls6BDRdw1UkLYNi+SDEeFa4GSvhQp6Kne1crkNNEuvMEyD7Jtjf+RSrQWwV9rEKkxEJKtEQyfM5PEcyaEpzd9pqjBHnPA5gt+AP/ZEcNegC9orfNfPJF9aHGPDkpazl4joaUb45PiVZTsWlohH2Jjo1vlpmNIf1E5iH5hhXrebE4IRmz+Kvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z62y/O8beT+usARhO3M4MjzPLwrGaSBe5pzK4FkLyHE=;
 b=sUlG3AzY3kwmpKACi1635SoTEpfXRCA6Y5awItDy3wH/tIK8F2hST7DBMJYyY50wCfP4+0OR0pgEy2xcVfze58/tSS8hZq7ntH4FPtPQqP/izIob4LqrKxw5ZYbo3w3QqQqtT/c4AG+uCWs6QO5XYybst0ypYV2pgsWpZDik08pCxHaDRxEABH7ZYvW9RiCLdgffsfl9G4ldQDmvfFFmVXRzzcUqQFD5V9QD+/SNfCfnl8qBHcGZ5ZmWZ0TiT2Y9Sy0Vyxi1+mceAGQw90ZzpSpJ2rkJWF5iHixrb4VuTHxYKOpNIL7R3Al9Q6YmId24Zi01O0H0QSZmSOGqR9tM3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:39 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:38 +0000
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
Subject: [PATCH v10 09/36] dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio default pins as gpio and pwm
Date: Wed,  5 Aug 2026 15:33:41 +0300
Message-ID: <20260805123408.3767648-10-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 1ec392a0-9470-4279-42d6-08def2edea51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	v7X80MnLK+y1weCXizk3ZuoXfVzkelUdVJxeG7tmymPEAnjLD8F7C+V9D9ioQgZG8E7aZFR+En2XhZzsGov+vAZM73kgn0GVGg3oLB4QblCduYi40zMOa3qyOgn1Bi7XIyIW1dqGvfb+lBK8qgCTaW4XzNr4hsZBNW7n2UxPS924+XGs9jA9ESdQW3g0VHqGQSM65KWnOHJjwt3FfCUzOpot3CgusNsz2Abxj/GjcHTc9nnkqmYO0wT/adXtGz3hojgnobOWqDFGIQCwa7YnSlLhNTVWBdXlv6rWN7Vt/jTadcXdoamupNU5vihFZDQ2BpWE2eZqauNRgFnqR7jViOeCXpJ/s6Cva8V3SPwSlnBBhzmSyIhoT8M+jJWp5MN6KTWteBIVbY1DchTCbO1FVvBLH6Jjv6PxbxuKDsdltT5ToFFIZqARJ3hki3Wx9vdYZvRl48D4+eUKAXLUoHWC/cK4mkjNjJu2SDfIwUHVC8crsaQm0CXoGWM8E2cz2zTpjCF4VZesS/OxefSN7uWuvrHa9CEG/tB2mtlVWRCTZcvEwyqValoJGKuO1S4wHsI5wL8OsAxjGfpNR5f4uhVyiX4L/X3wrroPSUCRBmUrYHTrxOBmkrvRAH9FqJzs5IgitAPRx69hTvhqSSUiWyT74M3f/+A7AUiNnMO3z3b7B9BX5IY2xCc1/VlMCDR1oDtA+p+fUe5qAMbm+HtaT+MVfn6lZ1xtFyQlxEgwXLHd+DN3gtXxSn35HVbl6gWtte/J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6antzrpqcULF8ICV1g1Qe+oCf/Ro4wG1Ik7bn2+Fu0IVKgCEJC3PX/AAoY2?=
 =?us-ascii?Q?OJjhlAvnxamZIwDjnsONkLxrcccGxvJ2DYTvTivIfBEufU4Gd9KexiFIsB2q?=
 =?us-ascii?Q?KNQM8ygGmTodFfwp9Rnxm+nM4ambPWXaTzDDzRWnBweRjtmTKNCCzV6yIoMh?=
 =?us-ascii?Q?7b5lMs4BsY7RPIOUMuorMBmcg1xQE2vFBE1VW2qKmlb+y+s0wInrvlhRR06V?=
 =?us-ascii?Q?fRZmrOzPftRSJ9GBEtkUgDvJUsWxizydLfZ5np96xnwBIZaTSNWyHYgAd4kH?=
 =?us-ascii?Q?thEutNuTvVW6F2dhi95/2kg+IVSUvNMaCqcS7tOJghWnrnsRhGGtgwUFk6Ia?=
 =?us-ascii?Q?w1CMs+mq3y0rZZ4UTbZ7iCpMnoMOJ0CF0jxnH/O5PSXPG5oAyQgY+LpZZ1wr?=
 =?us-ascii?Q?2zJrEkxTA8LC4KzfM3WQdvats1TkEPdESOoRBG3NTXDDp70ql/ES9fn9WeTp?=
 =?us-ascii?Q?Lwy4LRA38FVapca3YnehbujQCRbet68NTK1z+hkSPW7PG6tatejQFoZrgQtM?=
 =?us-ascii?Q?iNedylVzHnsDCHpkFuHNr+Rd9d6hVFHZpf+cd+THm74ECZ0SJ15UYNhekxCO?=
 =?us-ascii?Q?l9wr4jQgLGgJAs/4WW2VOOr/ZI/n8ak54zxLxZN6URShrw+PmICQA/wc7mqz?=
 =?us-ascii?Q?I9VTlF3zKTTErm/QrFhk/A5WEdNvYGfU1K+30GnhplKUBtAMlz9Y7vI6vWa8?=
 =?us-ascii?Q?GYa2qBlKNTh8kDDWyk0XQ0WklJjXLlofB0YU3DGP9bHdPCl4W5KWBgXz9OTO?=
 =?us-ascii?Q?e4GEL0NFVLMDwgokDecka97OuBgFb9eq63E/bqqURG2xeR4Rl+ZGKxjzGiAa?=
 =?us-ascii?Q?uBtWhu0gfiMRDT7aTp1hUYTZRgx7+UwXxYntnRL22tu/ELxbfB3btTc5bC6g?=
 =?us-ascii?Q?xeGh1Mk27BTr7Oyve00l8g6dlpRWn/zLFYeI4fxy6xKbGInDkeD4VETLLKWn?=
 =?us-ascii?Q?m3L1gNhMQazkN8RTtkJg1bkJ2X/ZqzI12JWd1HscTr/bT4ivoT/psDW4n0L0?=
 =?us-ascii?Q?/kHT7/GL/qExGH4OO4/4j3Jv7iUJBxxrpu8UgBZ0jP+ZybOfJz9tURgvEQwR?=
 =?us-ascii?Q?7g5DmVdIcX0IElofCAIWxoGmvm+8ahMDKS1qK0LNC83//m2GcL2Tc/OvBAzS?=
 =?us-ascii?Q?vjIF9LV0lQAZRH1l4AYK9cWkFGe/U7/X56rKqEu/oLHYtUGJxXO606V78liP?=
 =?us-ascii?Q?nMpHYYv203aFYy18yxV5W1gQIlsIbvdv7F+PWTodWePUxAgjH4reZ3QCtZAg?=
 =?us-ascii?Q?97c0y/mKgKEhW1dE+rhDQ1sM1QrfBmpCQZRDnTPeWQExjaof0K9Yvgxa27km?=
 =?us-ascii?Q?+uVrr23qoFcPxsvKyBu0qR3NDospfWFfC5xuIlaWIsY8y6V48Vy2uFhhDGja?=
 =?us-ascii?Q?mMruBXA9JYtBLslzf4a+6Fy28X8k+70x8oI/6fP8uPgvPCxyBuF4XQnqj+02?=
 =?us-ascii?Q?3i81jzE9ndrj3VpsnlU+jFXD6dpg6QqxxEAIXGc8Jnv/jQRQJFNSvmDb4RU7?=
 =?us-ascii?Q?TOGxOrDlkeMHl2stR1AD76+ZxgXUON7iJgFD23dVO2HZkzqxSl/6cR2kFAT2?=
 =?us-ascii?Q?txYvmSYZz2a0XdZywf2VBFRfMbK0LsTJvJvo35QbF0Zz5XxNZwSoz9JFXvLp?=
 =?us-ascii?Q?DTSArnT1QASudz0GYL0fCWk1yfw3Lgo911w+Pt3dJW/cc4Q6TVoaNPUjGOyU?=
 =?us-ascii?Q?sUFot1K8fyo/KpP3sTBAHqMv1u49qf/VqF+LJJ7nJu9R1o3Li+X6V0ox0OJD?=
 =?us-ascii?Q?IQ4PpQuPIeL2e/S4YPfvqds0PPjUQZs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec392a0-9470-4279-42d6-08def2edea51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:38.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGTd0MIINwCg1XLtPLv12IBufdZVidSm0Bz6H8Dr/Tw9CItPVPU6SNGtURF/IvfxQyChmajd3JNFrsiCrAW//Gzv/Rx8UKGRpgPnMRnWX3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

Some AN7583 pins have non-gpio default settings. This patch provides a way
to configure such pins as GPIO or PWM.

Please note that gpio52 pin can't be configured as PWM pin.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index f52802a3ad79d..e2896db7740fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -177,6 +177,16 @@ patternProperties:
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
+                  enum: [gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
+                         gpio45, gpio46, gpio47, gpio48, gpio49, gpio50,
+                         gpio51, gpio52]
           - if:
               properties:
                 function:
@@ -199,7 +209,7 @@ patternProperties:
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
                          gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
-                         gpio48]
+                         gpio48, gpio49, gpio50, gpio51]
           - if:
               properties:
                 function:
-- 
2.53.0

