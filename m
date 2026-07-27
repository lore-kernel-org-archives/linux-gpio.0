Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F53DDDCA;
	Mon, 27 Jul 2026 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138171; cv=fail; b=oGCkMXnoJ4+pa9ZCBVPh1z83hFl1a4/04UChP0D/H2mR4j5UiTPmrPWLXd+v2xQWEUj1XwStBCE600M3tnom4wzsgKPU6DSVZNByStkNC8nUe6PCf1ObMGvye4UKW31YH3kKQPQqmS2okSADyuTZs5EKjUo3fmFxCEu8ZOURnso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138171; c=relaxed/simple;
	bh=bR4JDejIg5MWKoW044r4s+UfdTPM98npgM6mzR4F3C0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fhHqZGPs4YGAIvpNM27PfKqPboHnWjvJh/wFToZvXaGtXAT9AK6KIbNVeopjtA/sY4muhy+nn81bwnOD1ukwK+xymCUeAkZIHOmTLCK2IaInQP0UBNZIF1TAtxU7ib6KPz55/m7MwMiSlUX4TvJpBzsTE444pZkJwDyASe7x6gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=nQMvBD5E; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="nQMvBD5E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZL3IEnDJak5ivjBDFezrydBcaSYj2NRsYKGM0WQ2YkB387TPwsBvwyscfTXd40hxVtjQaQNjgcUCio+Uuf9P7obaZNBgBgyl45PCrV06ebYHDapSmdC18TUGVystLv6/Q0G0ghhzd6xZjEQBzhRRPhFPg8yhqtS/O8jvxGHeXzdXkFZunCwobA00f6WgEDxe6f907hXu6RWj/uey3rzSeEd9PmbG9S2eOIAlCS4h03jkHC80tg+rtbIz+xovrtEYSUykT0/v6sVo0CX89WdLzml24Vo1KeuXXfYvYd3Jifl/n3k2cvqJd+8LFQjYhDA+oBU36nqGdOzWgDXIg98qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXUQqRfRgEv8OZlgAWTacNdZ7iIT329UkmX331ftvuI=;
 b=yROSO7kfV77aI2w7gkMHlI9Meicf4TzXGNmSmAP/H9/JPZjzEBDMj12V5rfgKcKtk4ABs4aO01MX5mXKTSDWc4wy5Okf7f4vXFcESPLfbzWTiKqIDBOJrMMjREnMeqTeR7S2R/3nglZwN3artsVj1NotNl8F6p0ZU5H3IcILWvVKdkuhaJp4ZuBaoKiocBbReBXlsyx/8t2HH8EYbXIWsoF5qUT0OWPVG57ogg8XTFiS+5wJP4eelmnMemyg0uBunZETvZhrYj3QUvWqVsZody1s/k/Fr80spUTIb8aNVtXenuTwza8dT/ZGealfc6f5V4BVMdjhIdg270Nbu/iySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXUQqRfRgEv8OZlgAWTacNdZ7iIT329UkmX331ftvuI=;
 b=nQMvBD5EWa41fzVxnRfeDphTEPb5sq4OdZ2x5BsnT7m3jtUBJSPmhySsbcizUe6LPZov5Ykb1Nt738ydRZV+uegh1EhRYjcB4p1Gd+g43BC6tDGhJyl8eGcMv2bXX81hQhT8kcJPeikO/rBbAA+H9K38L/AWVItCPStXlSOsOdaj4Au6+x1j7rof/Ak78cCFUyfWix9EGhaoRjUcjGfkhX+981wzS4q3bnZ8nxnynt9TP61j2Pn36l9dNKnwlycD41ZQ+swS1jKV6rUEV6oMpKfZqKllT9gX+uFpBbz8pVxCxwKNuzBsaorvUSDgKdreIvMDpcqYT0qBmQulOVcxXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:43 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:43 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 00/34] pinctrl: airoha: split on shared and SoC drivers, add more SoCs
Date: Mon, 27 Jul 2026 10:42:00 +0300
Message-ID: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 81157f5b-6ce6-4135-574c-08deebb2a4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|6133799003|18002099003|3023799007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	6nmqL/EKtN22YFC96t04DZw7KZKyZHSZQzJLC/pcLSWpcchfa1BMhMct7Ka9O0puV+H4RCdhXCDXwJESYn7iOo8yEtHRN3Aar0bLnB+8v6q/stXlYiY1zLxtb141092/i1ieCmpb733mSWe2500Ew58PgluIsf2WYqBs5djBOxHSpOrRHkixStVBndZf9RHfIqG7W7QxUAeuxWGNIj9znyiJhEnOw4mFTCLlEa5rcJ3L7jkmFtDWRf+WYxFMPNiUkwv29WgZvv3fihN09fxe2bZ1mRGk9AIOr4E59xT19I/k3K4HFP8XMR6VVjn16Tzb67VEnvJXMWJUe+fa0xdnu8YA52sbYtvs3cB7r47V9CIC6TIqcyirezdyABVDacAp9DmLbIOIr1Qsm2MAQLHMtpF0iMJ+U3yPJplEi5V52+HSPACfPD+gjpUo4pPHEmdE/FHa+xF5jz9ThpIckgr2zfbC+vG8izWUQ5hU4UGRiRKhP+Z9L9mR6Cmjk+v3SCEms9NUKJefF5dwEVaLIprOdRN7HumyeLwNHHF+nId8u6HgBs18qtVFBF7ALAB04ZVe0czwllZTcJ2VId9GS+8piAzi7grV0vFZ8GBGdwdCWIL+fpOToG2hcWjcGdtnxuCCB/Tqo0tNzKwi8qlYqcawncJh268TzUAIy77q9+vAtSddsIGt3hADhKnl9G54noQH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YAK7GvXAUmRPWK3OPH6zDjc534beqjI0EnPCQnjFB1DM/wcsXVP0VKNGTnr/?=
 =?us-ascii?Q?xwZaXldMu2atbA6P1+Pcjm+qHhClIvihSkP0GMNnz835keDyKoPDQTG8Ofvw?=
 =?us-ascii?Q?C+8Z2zAneebjZHyhbBEmO6cJ4gAiSOcsoAmDHWjE4JtZaN5GSDqNIGc61Mpd?=
 =?us-ascii?Q?H+m32guj7eY/0OHaJG5da3AaMHv0iiH0f7D8iv7dvqaXemCUGOkasP5dhpuD?=
 =?us-ascii?Q?orjvJuBtK6JM49TZGDwfWwjteKTiXZDLSAtJCQhsVPNfwkMhy3ia/K56gRvb?=
 =?us-ascii?Q?W/y8hSPUVzKZmyAeJy5NCPzhBvX3udEtUmiLFyr8P9NSqDCKa0LqsqJ1Hno+?=
 =?us-ascii?Q?IpikQGQ6Py17f5E6CPnaObcz9o4++Fn/S017UJ24Tb5VcTRTSchotQhsBrp5?=
 =?us-ascii?Q?3aP4awrjfpGjlclw/nTH147hf0b/iVOT2W0DUQpvJZ9EKI/KC8ulkX8/mYuo?=
 =?us-ascii?Q?6AT5Ygtsw1IVI2Cua1xfBj4fjAA0/4iOlxFYM4Xn43tV3o6mfZOWoa/8IZqu?=
 =?us-ascii?Q?xZztV+FIPGwdUuvvWTKU/m2VVk0rgUDhTgFXGNWzKNtINac3fhSipzwi9Ilv?=
 =?us-ascii?Q?vru8nUrPnS7wLpdldsorV3jOEwTb/+NHmmzcLxp92P8Fan9o3f7zrE0lkGvm?=
 =?us-ascii?Q?u9Icc0V7GIXh5NHWiuCM4HJvu7WUS7ARPySW+PO/NWau41x3RMaIGbC7QUT3?=
 =?us-ascii?Q?5hr/yvJZDfCNicd4Ld9SoWZbG36UrxU5MoI+yqvTCEG/pMTLH70ORODAtoez?=
 =?us-ascii?Q?yVLCeHngJ5kBhfuws2G4YHLnS45fT3bRb9UsjUc37TnkyYe5K5QLdt+OHAwi?=
 =?us-ascii?Q?k0tO0wYSWMiielC+vDAJ6VYuZ18cYQpIfl+iDekrCRbsIOHsRDJb9WPSPsKx?=
 =?us-ascii?Q?0O1udMT2OSspKyLr8lRCOeNA4eUW5TWk8KisJm7rlpInor1wipKT3wIKcuLR?=
 =?us-ascii?Q?+R1s5mZyl18GAJ3Cc9nkkVI4hgpqELluUVEF79VD47v+teYSbFw2cflfvYFZ?=
 =?us-ascii?Q?rCm2GV7InM3KLojILHdfSIixMI4uVTXo2lYDCmF1yA899g4QroVa7uo6KKvH?=
 =?us-ascii?Q?/jApBZomm37EcxvZGEUixPNxGm5fug85TTufYFhZNZCrd6szly/q1hCRNPjD?=
 =?us-ascii?Q?jtxKW9zlO9QwZGMZl3il1amPefW++ULn1shNxeZZZCPuowXbnsldDRAza4D5?=
 =?us-ascii?Q?q7mNDNVFa0aAUZSuQSjKDkgOYXQEZGrlmKPRVn6KNixzE0kq0HAgLIWl7MzG?=
 =?us-ascii?Q?VKSy5FYR6knahOotWGIE5MiawKOX6OQ2KACSHiXn2UC7NMPtfYBOvKjjv7Pe?=
 =?us-ascii?Q?DNCE32ssz5egdyPqaFxx0qAZ0qnlmgY7FSw+uNUOD6q+3Uent5MqaFb6lvCY?=
 =?us-ascii?Q?ly1Hol1mL+QMISlP+c613MTjMTl0WbWB6WV/NoDaTaSmwMTspeHcrYQAbbOV?=
 =?us-ascii?Q?DdRRk8ljz2BKPcc+4D15Fiua2xW7gRY4uExbO/VrWqzVaCiBOMppEkaKYXDh?=
 =?us-ascii?Q?cyABhCvTD3wHr0xHgXGU4FD35ldzqPBcaUR6ZZki2YRxCG7Vo9D6scLxSarV?=
 =?us-ascii?Q?bCY/CnxLEzCEYlrDxBFOqMKcjeOOGYhxtUG9WoRO1nXrxEAV3JUaSExNaIth?=
 =?us-ascii?Q?d9TlOieReGnDLHTwrHqmh8Us6XsHxe175TJP8Ua/6ZDEFcJmNP+sZYRGBD5+?=
 =?us-ascii?Q?tE9HA3YbXcEZok+yyM1OmPj+KiRuQKeD8a+PToWW//WKvGSSUFMyONpBNdE4?=
 =?us-ascii?Q?x10UdOqU0L210VWESeK7T9NRMUVNrxo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 81157f5b-6ce6-4135-574c-08deebb2a4a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:43.5889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+AHw5y5qhPRWDxr/xInS9ADhZntW5IYHmhG7+TxpiwpvlYzb8Q2XTmNKw5iMWgsVdlDFvo9AqAGAUOHhIxWvAHWEYk5CGYRqybo7ygPNq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

This patchset
 * fixes more airoha pinctrl issues
 * split combined driver on common code and several SoC specific drivers
 * improves an7583 pinctrl support
 * adds support of en7523 SoC
 * adds support of an7563 SoC

The driver split changes are based on Matheus Sampaio Queiroga work.

Changes v2:
 * more issues of airoha pinctrl driver was fixed
 * SoC specific register addresses, bitfields, macroses were
   removed from common header and placed to SoC specific file
 * fixed address of LAN LED mappings registers for en7523 SoC
 * improves support of an7583 pinctrl

Changes v3:
 * improve searching of chip scu regmap necessary for drivers
   operations

Changes v4:
 * an7583: add support of OLT pin function
 * an7581: do a proper fix of pcie_reset pins mux/conf.

Changes v5:
 * improve description of an7583 i2c pinmux fix
 * rename an7583 registers to match its an7583 names
 * add support of an7563 SoC

Changes v6:
 * fix some of the issues found by
   https://sashiko.dev/#/patchset/20260622113046.3619139-1-mikhail.kshevetskiy%40iopsys.eu
 * update device tree binding
 * add bindings for en7523 and an7563

Changes v7:
 * a lot of IRQ support fixes, now there is chances that IRQ code is
   really working
 * device tree bindings moved to the separate patches
 * fix some of the issues found by
   https://sashiko.dev/#/patchset/20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu

Mikhail Kshevetskiy (34):
  dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function
    name
  dt-bindings: pinctrl: airoha: en7581: fix pwm pin-groups
  dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
  pinctrl: airoha: an7581: fix misprint in bitfield name
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7583: there are no muxes to enable i2c buses
  dt-bindings: pinctrl: airoha: an7583: remove i2c pin function
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  dt-bindings: pinctrl: airoha: en7581: allow configuration of
    pcie_reset pins as gpio or pwm
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio
    default pins as gpio and pwm
  pinctrl: airoha: add missed get_direction() function for gpio_chip
  pinctrl: airoha: add set_direction() helper for gpio_chip
  pinctrl: airoha: fix potential kenel panic in IRQ handling code
  pinctrl: airoha: fix IRQ mask/unmask code
  pinctrl: airoha: add missed IRQ resource helpers
  pinctrl: airoha: fix edge-triggered interrupts handling
  pinctrl: airoha: remove not needed irq_type[] array
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: rename registers to match its an7583 names
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  dt-bindings: pinctrl: airoha: an7583: add npu_uart pin group
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  dt-bindings: pinctrl: airoha: an7583: add pon_alt pin group
  pinctrl: airoha: an7583: add support for olt pinmux
  dt-bindings: pinctrl: airoha: an7583: add olt function/group
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first
  dt-bindings: pinctrl: airoha: add support of en7523 pin controller
  pinctrl: airoha: add support of an7563 SoC
  dt-bindings: pinctrl: airoha: add support of an7563 pin controller

 .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++
 .../pinctrl/airoha,an7583-pinctrl.yaml        |   65 +-
 .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 +++
 .../pinctrl/airoha,en7581-pinctrl.yaml        |   15 +-
 drivers/pinctrl/airoha/Kconfig                |   42 +-
 drivers/pinctrl/airoha/Makefile               |    7 +
 drivers/pinctrl/airoha/airoha-common.h        |  169 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 2608 +----------------
 drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 1487 ++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 1497 ++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 1125 +++++++
 12 files changed, 6369 insertions(+), 2484 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0

