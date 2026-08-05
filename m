Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA2473C7A;
	Wed,  5 Aug 2026 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933331; cv=fail; b=HiXisioIHxmNpe9za5nfOQutAJNxli4qJV2VU5ogtOmjlfBmcVnk9z6ZRNgVTgFPFC4w7QWF9PzQSCVEozDDHcfn1xAg01kVfhxsvlVgqQ+R49IBKwKD2hZNeJewBpMcXASP/MS9dVqH07Nm/fFXyUrOh0lQfA9ftIA+8T3peJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933331; c=relaxed/simple;
	bh=PpWwAV6qrt8eCCWVE/ZbEORjoXBPL+affWdovmaHNOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gzBoLePM7Pw9jDrJ0pbS6fPde3Z2fBcSZIBTDFBudHR9x4Af2OY0OdbuDYThTYUmV0F68xEPXkJl+RskjhDgu2ggGHVM2gzPUYLwIl1wGsyfprxDS2kLgFaMVyGE/xQCmPxFlnkQHCcWxHAri48A3vTOY6Xh+PSJZPVWhYJhXMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=50eUqoMt; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="50eUqoMt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVm/5i3IQicr0KftO/32w9nvET9hpnEPSpkOTpi+gnSwaDNOnHXxPGN4ZB/1KCgAnUs9TG15LJQ7yyi1I8lJxW+o0yX+us/wiE1RlYL7JrfK8BIxoA37Dh6VVEmfITU+otmYj0XDEN0PWHn0Xe1LvYTZf1H6CvDU5UUeqFuPf1dLe/ATkHleLGdRyVmIo8hIc60W7/Z8eP20WGbKlyg0Ostz7yKQkOmz9bNgiWCLVseYAKKfw9STSoWEJz5eGV6j0kMqSuMP/PxKsVnGTutErc/Xik8PvP4X1wB4F0jopETIVbXgMIWxUfQgpLC1lqP4nkuJbwHHhjV+GPOysdz7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBv+gELBJaRjdkYSzHUjrSDMwX7kfOBm2SPdCKkU09M=;
 b=umRoQ0uUqzxx7cpNOj1/VyeyIsuM+xW2XdHuG7YRfZeCbu57hwwKeSzds7VPERlr/f2JJ51jtJRIMvlTILIYgyr+42Bq/Ik2r9WK9PVqprQSQC8vLDZRTKa5yYwUhXHTt0lx4uX30QnIaGU8A/0J1NOC+Grg1XmyS9QP5ONY019wJw70s2kC0KtzSwmHIr+VmXQhUmvv+/y3iQIPaVWxVJANc7ht08DhaurydMOAD9BW8/qDW7biCxLOXefJfchD9SQlAwL+1Safw9sofcDntUOM6FOwlFvB9uFG6jnhuxCreA8BURqXK1LbKhDRLVTAbOO4c71kOrVHKLn1gODJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBv+gELBJaRjdkYSzHUjrSDMwX7kfOBm2SPdCKkU09M=;
 b=50eUqoMtZt15AXIvsL3D0MuIqD50xTTsLJjXAORuYQYwT27OC7AvgDZ1FTcOhn0PfIeWoHCvwSU5ur83XGAwVz95WrlQllBr7eArJalNDiZUIAqpXAs8pWmDT0truj/zGIDQYJcyTp7cnJOyamHhrY6OC4CKjrUVQ+ma0OFH982U+yhfgweuAFSzq5tDDknGnb/DREXVm/YRfLH4rh2ArzGvSzZwtyHitpoRs+XuQCOXgtfmwAme8KZiDw61GKHpnHKhBVaJTAk5Rzh/w+QCR9KU1+gGrrBuUidLYyzijDWTkK84rzbKeMoYPlNNh+unsAid2kBk2Kunk8xWz4ZsrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:20 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:20 +0000
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
Subject: [PATCH v10 31/36] dt-bindings: pinctrl: airoha: an7583: add missed features
Date: Wed,  5 Aug 2026 15:34:03 +0300
Message-ID: <20260805123408.3767648-32-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 116e1a21-c8f0-4e7f-e1b6-08def2ee02f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	3JoEky2RWveNBHcqaz3L3DNL/nlCtTaiRVJ2EsseBVpB9zA+k2JJdgFRStHsukGrPVdDJcNp0//mr20nbFsTcDIIP9ZgvTsWSH69rpHOdAgwAdwCs7Ow1SXz5X8xRVKRXljOsakKmMB0LHjN3jmYMBp+8iQEkvvYDPEtL5vdoCuvvcw4y0Eu3uePnq7XLza+f8npEy3rEnm+VwXgSuh8fDWwUfvrK19wV+vG6S36FQB6Y2wGyHkMxeAgxs3ROkq0r25VrRnQ7yAyWXDFdn3isPXWdm/QoVwjFN8W8Vb9mNwdze6O7tTnIkiJFXaFCK+/HE9L3P0UIuKdEj5CdwA1wCn8S9C8+F/zu3SzWoudugrLXR/nYJGWulB3kmSsObGIqvPm4BMeuemayHNr8YYJyyjLNzx2NnblM+1hJ2ssWTdCgEqkkHeyD63Cr5kQ4O/EuAG3/cdB/HAn6ujIIqD/wGfWO5gKI2hMChtxqLhrLfhmZHdtZes85s+fb4XnrUnO1uOcIK6DmjWo8k2ivwkBJmCE6AsqOo4lwDLLacm50u0Xc9n8kGG2THHzmUW/aseuLikcdP0ADoEUHsSmSEKtrJ9LOdgU4GQBQpKQYh+jZ/7Drr1XZhszc+Q38Vkt0wzpbZNiUGD8r7BfkAblZv8xcT+nWqSUrRgsoQriQRaMCPgTAqiWA0RL1Iiw4DY8XjDOj7gE67d4+8qjuFO5Knv8XpGc34hFz9A5ImEukuzekgeb9k8RpeEmt1zpmJnyHa42
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zSKtrI/Or0nsPCeeJAvIVWFZr3EhKgXG6fCRl9SjYx4s9BiKWJ4fwpTY+xNg?=
 =?us-ascii?Q?1TRHblnWcoWT4RYSCE8d0PnrkZOyQxVf4/wTIxk9FfQVAlalvcD5cDV0XyTM?=
 =?us-ascii?Q?JI3ZDeuyqk3cTbSUlNij1q54KQ8OMPy4BduPrUXWTeADQOtgXO6CY+bSOxlz?=
 =?us-ascii?Q?yXhWD7zSOsdqflsQSr/EdcxfH1DPvEtZgYdfZaWXbA2j3nlwVf2dnErEP759?=
 =?us-ascii?Q?oRml83A74KWjUudtGNuxZuioY1j+WJechFCsdfIz2rkU/fOUmLAH1oZAnclq?=
 =?us-ascii?Q?0MBOlbUJ4lNc5S5nUuqD8M4tJKpPSdKfH1chw1vw2/gxa8EfFDU82Gh7cdcy?=
 =?us-ascii?Q?+QRaE3KaRUquxmKFEifo+w2Cq7zIz6KweTYa7EDHmxXiwwxTLIQcn29BWPTC?=
 =?us-ascii?Q?B8wmlZDM0MvkW7oI9nGIZFIu2NqFBgIezmKJ/bjrsKIqgcklh6RTZ5Ng+DEG?=
 =?us-ascii?Q?gnfYm8TMbjzUkNOBsmYOfWz6g5kvXOL+oaXXzD4SJZp5OthwDXrbW4dm6KAW?=
 =?us-ascii?Q?3vCkuQDwBnK9e2cI56qnxpEabboaZVtGwaPJPRjj6k0CQXfg2MbKp0OGBbXO?=
 =?us-ascii?Q?RX8ZhVK9NeO+VmvHCmkUV1bM3ZCl8pzoHQ8rtwTf7VrZ7Mm2Zf+6EUlWEOUA?=
 =?us-ascii?Q?jHSU3a5uU92KdfLtm6nx2iEOCdIo4FRgSqR/QpmLOk1hJx/2cHLGvMzEm9RT?=
 =?us-ascii?Q?XypAcVYSQzhS8+aXJl3OBWElGA3whjXmEbxNEsyashNMZLY/A307MqrTv2f1?=
 =?us-ascii?Q?bENIrU3oJZbTodSP27hx0aoNsV30ntC6588LqoSWjrYp6n9ffpvlwVX4oYRH?=
 =?us-ascii?Q?HubDUxQjIO+BH3srW1u3eD1Oz/cbXZJMTO0+WK+sqhBfJMFEuj8BNtWIFuPT?=
 =?us-ascii?Q?lJr48m/CfkQUUEauTimYsPj/YMPw/VLk8Wi5HzIlbe7zN0v4qFNOQR+Ygc0K?=
 =?us-ascii?Q?0TwtO5P2kw0X7Uz4as1E4LysRttNA1xwoBgsOZq+nHHKqi0cASxWyDqpxcJ0?=
 =?us-ascii?Q?P+ARtKyiRr7MIAdUUaZP62+M5gjbrN4+PIaK17QnUrLNPTjLq6UYhJySBdAm?=
 =?us-ascii?Q?im+bjYE1Oz7/6J5ToX6nv/jTnxJLdizQkPK3hpiaYXwIqipc/8JSfc0CgqpC?=
 =?us-ascii?Q?h3QZpSWf79GmbLJIUq3c5wm4NIp2UWr2CThdgmV4/E2H5z9PV8s4lrOblv0u?=
 =?us-ascii?Q?vCpC+FGOyvjgseYW8UUWYsnCXVXBt0nTY5qadqyWk0ByE8BvLc7sc7LHA5OF?=
 =?us-ascii?Q?yHx7SgehxVjQM4mVzGAhbf4Ny/yOe9H+pmThME8eb7uFjAXURZhxZf2Jw2rG?=
 =?us-ascii?Q?Q3BBw9+pf7CcNL4YJVneHRZbg8iQHkBzZ9dxswGglrK82dE6GawXZcEPhzkE?=
 =?us-ascii?Q?wuFZ0Imfb4She49ANbMX1KuoiG9EH5yDw3nlZHfYiwfcVgdDzj+rzEvCAE/V?=
 =?us-ascii?Q?ufGDtpyrol+ji0P8rG1PWYHgJoxq8jtsaBtW0isfrzUqFRhi76ZlnVCFfLdw?=
 =?us-ascii?Q?iHnDUSAqekEhyGNPK1iVas247UiTWT5tme/Rs+ZuWwt6mJ4y/Q35FEYt/YCa?=
 =?us-ascii?Q?KxBFmox1U1BMwuNo55fSjLiVIO0qSrZ9tXIgu4Jeupbn4S6SXhfUpkgJj9Aw?=
 =?us-ascii?Q?MaaNx/wncToZyyQLDGtS0OcBLvNLxf2w2Ivkl22ndtNiOTeYIt3qznSYisJW?=
 =?us-ascii?Q?qMn39jA+1GkpeI4kYgL5mjPx2gtFzCbB+6VBIg8Ag+u3CnPCU/CrEA82Bx1r?=
 =?us-ascii?Q?1HTYMrym81hfqoRXIL2oju2LT+tJ8rU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 116e1a21-c8f0-4e7f-e1b6-08def2ee02f3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:20.0867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHJ7H3p98L1GxI1TySM2BwC1ET3hilLxXHQ78qOTNtXcF2pSHdz1S6H+qf8GbN2a/9BkRJOd5U36QI63HAWmHNyJ8UlAd3pTcwt9FqwawLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

Changes:
* add i2c0 pin-group support for i2c pin-function
* add npu_uart pin-group support for uart pin-function
* add pon_alt pin-group support for pon pin-function
* add support for olt pin group/function

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml  | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index e2896db7740fd..4609cc76babe6 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+            enum: [pon, olt, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -81,7 +81,15 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pon]
+                  enum: [pon, pon_alt]
+          - if:
+              properties:
+                function:
+                  const: olt
+            then:
+              properties:
+                groups:
+                  enum: [olt]
           - if:
               properties:
                 function:
@@ -115,7 +123,7 @@ patternProperties:
                 groups:
                   items:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
-                           uart4, uart5]
+                           uart4, uart5, npu_uart]
                   maxItems: 2
           - if:
               properties:
@@ -124,7 +132,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [i2c1]
+                  enum: [i2c0, i2c1]
           - if:
               properties:
                 function:
-- 
2.53.0

