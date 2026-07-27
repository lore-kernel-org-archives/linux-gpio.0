Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965C431A37;
	Mon, 27 Jul 2026 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174126; cv=fail; b=iHS/Gso5jNDu2CIwGGKoZbN60BUq2Xolk2PLcwzUvppyQ04MJWsL+D62BWyA1P/YyuOh+TGrcxGBay/zjthNrebTF8+nPmH/cPYjNuSGrh+Ujp/wV3FxBPxbmh0Ih9SywzLLI3Dq0nvlfSLPDyP04J9ONmuSiqgDXcx7ePBzTNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174126; c=relaxed/simple;
	bh=CPqa5Flq4YSUKNxJ+fNjK5LJYb4DmCve4TEegcQVS/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fmBqaSpysoFtwOaSDNLxNdXGEGXthnjG59TYwAGgDg0DMtMokvpPAqIfDb+SneswVAHZlIaD59T9PuIgsPpWDDhg1uLfCptBeWhmS75OCSUa3DA/ADJylEwQhybye71sSNWmJxuDMq1QD6RPB7xG3fkic0C2QBou20regWyDt+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=KH0mo3xz; arc=fail smtp.client-ip=52.101.70.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="KH0mo3xz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O992fAvBf/JhK9e370ZXcyCJnGW43cy3hh2DiLx1Io8FK6PET0/L8Xt0dJLLw7sgOIw5qdKqY5VPlXWdB7sXQKI2wcudZkXjrI3XkV5M3P4ijK+uryRZjNhCwytWLmWCcib2YOVJj0JYRPkCDV4+EcvJKyjlgi5e5eemSGO6VQLiSFhdoHC8ipmPGl2p3Uj9WEuWXUbWOFqBH7oyAXN7GzzrfmWBQB8tM24og6xn3Wst2sUZUqeh+ADqiACv36xyODZNJPJHg7eic2E4P/oJTHstTsNMT7DbYjeN2T71gmDKC+nRhmVBBZOdxcFk9fL3GS+Uejc18Jsvr+6nT6vS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc5epo8y5BGYQSvfjoz3cp8k7mtph2Gu5AdvUAeoTLo=;
 b=cae6/iU61MsJSMHUB77d5ufJdV29fsIj5hF3W+hz2h232nnXG1EKRRyEnN1FTK4LWkxnLaMUk5tceQFm+TIBkI69M/ePa/eJzyhfxjEwBEGbEr2SfW0JhQf+F0qIXNnNBZx+s37n53UbmOyV/kZ1Ygeav2A3uVCP5t5Z7VQCcT8A71uZjwhu/U0V+xNhcOeDCfHsPnOkTSAgjuHwRqaheX67wS86RNJPKwJrsBi6TlwAx7eVDxBtl1GChnAEFkPD93jMIEixlTfmpO6o8wEZRpE3YF/NU0L6ZqANnqLH/Cow3fDI9N4nzf4/ga91EvrJ+6XFWMi3zEGMaHTQgGycaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc5epo8y5BGYQSvfjoz3cp8k7mtph2Gu5AdvUAeoTLo=;
 b=KH0mo3xzRq9giaAlXIEJghATKWmg4K0ZlhmEVU10Z0+j5LWmE5+0oReJntNLdml9Y+NmYqHqCSznDaAxWCRUDI9HYUorGZCZ8zBMMYWTQdZ+pNI4dZRfrnvC07Z2gucMTiCixUuRAqFN3L0w0wp0uTtrcEFDeDrwU382k6bBMya1rBNsFra01tTiv37Im1+fQCuQNmCyHgZgwf/pBMt8VImQt4QLSsgpdlOPvnm0wJGJJfmyLhlw3iIQ/bauGkVKYBVnr61jYAafXbdfRpLOf/ttwh69fYMNkJpI1HhqRQjBL9IuZ/emZbs7Lx191m/EbIPvnWOcPIpybRR5Aq6gxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS1PR08MB7537.eurprd08.prod.outlook.com (2603:10a6:20b:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:41:54 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:41:54 +0000
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
Subject: [PATCH v8 00/35] pinctrl: airoha: split on shared and SoC drivers, add more SoCs
Date: Mon, 27 Jul 2026 20:41:06 +0300
Message-ID: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS1PR08MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8edb29-07ea-40f7-69a5-08deec065925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|38350700014|921020|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	ahRApYcRXfOK3Dr/dV/3tAt7mXVcdkuK4IwVuZcPJWWsNHQPuUM2ax2NDh56kxcJlvt6wOS4rxlKUaXY2gGGcWpTRzODR0Q+KtIIMMF0BV8SBq1iQjObyqOca1qLWhOrITa38VYmsR74zqb3Wap8H3Jhbm3XUo4TSwPNKRCT9izVVhFLRY+Hlbze7YCIFSGPxecRJbJm2RbnGdwRSi/ccvSZ8tZ5hJxTdyqGndkTD1dSaSp/hRZ8YZnCdDHyF3j1gJN/q1vMvFE5SYp8wK5Z509ofvNsRWQCl/2SC0QiWD4tSkMlTB91prKJSuyrSHaCxc0aZxOhhOGeXSO0IAoAxLglPpQVt9xytAxzC2HAnQk8AxVB0PEKNCg+auzBEktBIkkRn4NN0BzBJ3BBFUAajppaf3XyCd5hOGKYc65xLX+OVYltpX4TBsw9KM3ONEQWwZ+BZdDwqmCizplX88f2wH7BhLVVKFl6e6v5ijEZUF7JldnO71UzRc6mX99v4A4rH56ATFcObxOFpcmCyDrB01ueVXIGaYU+B22mvKmstaKbHu+t/XYlQYzi4giXdQoAc7z/DmeIDM1TC+xahfHZIgmuPP2XOQ73DDHO01TrTZT1nKP3OdlhVbAFw2qSsljifYrlKHjMR5qKW9x9unHYKb5I4FMiQ7hNDPGCogaT+UA9fM6x7sP0tbaf+uF2m/zA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ALHqAsNo6Djzwf+y9NA7dQn4OCKKNFXKtz14ldP1bsNmY2iW/rPIjBzVSmhM?=
 =?us-ascii?Q?5ndf1Z6YB5gOge7+c8LifKfn2ZoEeqw/KIZfCxshJq/RLLUiDLYy8xdZ2VAS?=
 =?us-ascii?Q?bh0q+kqI1nTNk0yxI33u07s+s9n2P9jx81/eW+IYkeuzic64e9jUpIXBdFaY?=
 =?us-ascii?Q?5C3M3BXpKgBdE9n7vz+679zpFSVWrI2f8belE5xewwDBdJK9pluEu67vWw5+?=
 =?us-ascii?Q?tnzXhIug+fh5q3k+8oIfzlhgmOb1W1oWNIuMWjml7RvQ8uFNI1v8Sc2hrdoT?=
 =?us-ascii?Q?EG9FQIuGE6yzv+hZmBOacHByblYpji2TxdB2TjTeOI9+w8orISbRjgrEjO58?=
 =?us-ascii?Q?el7l+RmKmR9SptATjWbJCiyRm6yaq+IfCnjcoJ9P6gAEdHx+zZMvlxEFrWjL?=
 =?us-ascii?Q?iyKLRHh4xwyAfHnuVIl/TkLzDLmZW+7wWVo+vsBIsqOzwmmlm1MoERp6yIoe?=
 =?us-ascii?Q?eSQIeABolvT1szfDQWJ2pvKeeB8pSaAkG4+s3MsUPysDH8HxAO5+WZTHK9VS?=
 =?us-ascii?Q?fg9Aku+QpNM4HBMm+JydNISdkpbRgj542X+TaQe4zc/6nmvhRHEPuRqBVf+S?=
 =?us-ascii?Q?ApyC1Tn0T6UjVWHYp6L0FdB8ceDpntZ4JtueNeiquijHzp7gf0XdEHOqT3+d?=
 =?us-ascii?Q?zjF8Y/lUmgfRdJmSQsakoeURhZ4eUaOwX4M0UFBO3+vDfAZdBzewLlYz64Mx?=
 =?us-ascii?Q?7Vh8m5dtsTVYVi5x3uPhoSd9hZqmrNf73pKlyam+xGLHcxFiIwPU52ZA4ams?=
 =?us-ascii?Q?wgK1VhJ83PKBOstte/X3XUg8AvcZ+JDqFBI23t921NeMwN5iW8b+rFT/6BGy?=
 =?us-ascii?Q?UNy3JmsuNT1AXN5ci1af/JjpymXA9KiFwZgUobx7FBysik08X9gtQHhCfW5d?=
 =?us-ascii?Q?d1431+XjBqAtyAKH4FTyuYjh4t9NFwcWbrxdpu1LYSZdWLneCXE0tYbUVW8N?=
 =?us-ascii?Q?WHShcgvSLaCeBVh2ATjaAgIsW2y5EGL/bVgLHn1Ec4XsEZdzTe7MtZTQPRFD?=
 =?us-ascii?Q?SINYas6fOu2XnvpTjZ+InmrtRCQK62jhbtO7uDNzPlmTvd4bN4UpoBH7U4fg?=
 =?us-ascii?Q?+Z2WVBXn1dCf1Ogywc7f6rLpCUJuePs+FosYQkFX9/gEhSyTaH4kmv1BD+UE?=
 =?us-ascii?Q?oV0kkR92Br4qxbiWSH0Bqu9ycKrpot7c2ao5RlrLL0x1pInZXilrsjaQosZS?=
 =?us-ascii?Q?1AyK1eBJUWp/ZzRzE5xs/hYuG9wT1v1ZGFbR4/PtfreMLqyLUBbWV787pQbn?=
 =?us-ascii?Q?tLln1QsiVdmLm7ijVs4d/XkTr79Bfeg7KwBJNSjrClr+DsBaWdKDvESy0h6M?=
 =?us-ascii?Q?b3FGLLu4a9INPDN3nQanrKXG+zwPNPHCtjxBe0n5zGvrHIPFTHEkC5qt+a5k?=
 =?us-ascii?Q?Er3hSZzjIRrw+3uKbKvcstuiDGbeorypxB3jb1IrqINI38HJv9Dun9r/pXFq?=
 =?us-ascii?Q?cH6EiPZ02h0svM+aTDDOdGQ5LAVG9P7ADKLYSAKTosn9N1hQOiJpLs3LkVh+?=
 =?us-ascii?Q?pyVkjslsP9PRjY0xGYn1rcUTfoBcHT3pLlvEFBGI3gIuybyFWvU9lQSqlMSY?=
 =?us-ascii?Q?acBFHyWlpzjjQ7yopi4ufkO8Z81y1AgG+mZSWZSOgljiUESpJOCIC59MiqqY?=
 =?us-ascii?Q?MCpVndQoPhS5S3KBRai4Mvj+EFrVebH5ViaPEJW4RCH53LWlbWi1XPIhKu7t?=
 =?us-ascii?Q?sTI9VzY/G5AznibD/Tp7kWO8gemgxT/hu7h78zqDcDnb//SphYMDRh+Uqks4?=
 =?us-ascii?Q?43NaFr2ZXYVTSTAFo4qkEtcAKaoH3tw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8edb29-07ea-40f7-69a5-08deec065925
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:41:54.4644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltU4xBM+g56jDwMQ1SDvh7spKWx2tKFuWJYQfSPfewEFcmORdttqK7rhH6+zMSpIvcAUikbEAuCbixe3KVS11qlVVcNTvLFqjvf6GEtlvp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7537

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

Changes v8:
 * an7581: fix pinconf of i2c_scl/i2c_sda pins
 * ignoge high bit in set_direction/get_direction helpers
 * minor patch modification
 * fix some issue found by
   https://sashiko.dev/#/patchset/20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu
 * add more 'Fixes: commit' lines
 * add Acked-by Lorenzo Bianconi where it was approved

Mikhail Kshevetskiy (35):
  dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function
    name
  dt-bindings: pinctrl: airoha: en7581: fix pwm pin-groups
  dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
  pinctrl: airoha: fix mdio bitfield names
  pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
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
  pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ
    handling code
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
 drivers/pinctrl/airoha/airoha-common.h        |  149 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 2572 +----------------
 drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 1487 ++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 1497 ++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 1125 +++++++
 12 files changed, 6338 insertions(+), 2459 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0

