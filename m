Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100FB46C4AC;
	Tue,  4 Aug 2026 16:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859474; cv=fail; b=I1HIGu0cUsPhs0hOev06x5PZYAxj0lc7VvwcqebCVf3iOq0Hu8w20I2UxIiRsGMj4S9iKoTUL8UT8DdcYQod2VxXvW9seqLQJpdTuq3suHtQ4Wn6bwWnnVFqL6X9wdGeEXrb7KDtdrHxQgU348Uyl08++eVd5wQBHQx/YxfUQBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859474; c=relaxed/simple;
	bh=5wIL/T8P/zRZ6l3W1HXpX/Djk0u3Mn6iVoeSeqQdhdA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nFFedsEIYihR2MhU1MPef9qUbI1857A2vfCtAOLNHurxp0XO3VYTwBVOiBVuPxOkcGtiFaweEd4A7tPRy5/O3WoMUT7v6Wf4F2kz2zxDsKtww0sMAaWPjQqwUgkFQG5QEWgWwPiYRx7mdVKaZDGZsdZu1hXjeAAmHocDhuBIa4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=lw+/N0ts; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="lw+/N0ts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuSVB0uct98HOoowCw+wKEbyXe1H3cAPm/ZYT4k9mQqpVFjk+TLymbRKj6RC86m79cpptUkZvv1bCiF+25ys7g2a+poMFFsDhLfNL+xvFQ5vz+UKltzo2qjDb9Nf/W7TqK8PiYU8+6s9/nAUnHsZvaZsbhnXWhSA19Xce1KFNyzrsiUmcEVLGUFo8m8HoRcJLk3aMiFYb4vYbBzY5dwe8G0ioenj3gtaxZ4a7eMWpkmmR6Odi0p0Ipc8o2qVfB7iJcPxbRJe1XkaJW2lTiw+koFyYOLDMRdSYovh5Y6hfeOzdPUJZva5EB7Lmj++koaGF/dTgdA+ZAyxpMfKGovZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYaNCiQoF4urfa0f6mlOK89FWKeRMLlipdj88oKjBPs=;
 b=kMiVxxSrSFomT/jGOH2VFx5juKC8a1KEGnk4jDYmrvrwxSa74tqvWODLQW05o+tXK+9I/5/6rHwjeGHueP2wkeH6BAzoVNM2+8a6m0gfbiWU9uQ8Ygf1ozyQyRd6Ic+Rp0v2Dh/4PchznQcC4Sb505fCbNmcmHGNiQoNri6ugLv2W5ZxaDLwOXy2TItcK8mhBx/PBg+1z47eEYaLbG/PIjCkx3uJIv9sni0x7cu3KYJEbAP2M9qcf426+G84XI7opUqdiZJ92ld9HOENE7H3rnX+g9fdOP+JIVVpnk3LtINSyB3QnkhZK13VzNjL2V4jbwU3s9B0AH0U0efcOJJQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYaNCiQoF4urfa0f6mlOK89FWKeRMLlipdj88oKjBPs=;
 b=lw+/N0tsNhXEnY3cIiHrrFb9SkDEoP0Iw5ZSh9ysnTJzSgpsgAA1sPOVrPLorHsTPWJk7njeK/bRY/UYWNSpipgKhmbxY6TXNrQflSlVaBnjDBdr9WqskxwwrE54EWdUxl+x5Y03zeHDaC0mEFixFyY9IPI5kYtfDbb8CT+/+2eKEmB842ybYW6KqK3J4MOjNv99p7yPbPOUpZRMuQRp9v9VNPBTb1SYSWuLOajXPiYYM98/kyERokHnd+C1bJUGkwkMZ/Mb5XLi5TqCDJjtT7G6lr2qfB4Si8XKOeSeKooxDVV9PjEs/YQpQMzikafAW9pSgeTiVQ41TOk1YFwOFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:28 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:28 +0000
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
Subject: [PATCH v9 00/36] pinctrl: airoha: split on shared and SoC drivers, add more SoCs
Date: Tue,  4 Aug 2026 19:03:43 +0300
Message-ID: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d32afc-a521-4ce0-3e18-08def2420fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|6133799003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	9GBdW3RHPp5OaSVRG/be/yMPYGKRPOYURCpqfgX6VkgbAahYoqpmBX2o2OUbPrKDkvcCng2lTBWZkOTGAml4agBxk03wBlittEPTaWN+prg+Ojni0+V7w428NVqAPHPXYVcgV6lASVaqME6rBcp4QWjE9iHq7sD3TaNlJ39GmOxCXoSEU6YAw3u2XZD6AzQKAxeU5eoTWpZYDuLBs2rLS7QsuEh2i9CjsAE+AHBvcNCsNiGOgD/SO7rjklV0gu+171waBbmbPp6M8QycUv6t+5wYBho4WSCQh4CgrZ9vq588UtdR+zT5jIlIxHDGRja/4Jsqc4OMFbeYsjkP5kBkKN/zuLbU+sP0pSFsaJ7RDfLZxlG2n8LXy8wjG7Ub17oG75pcld9+QabH+PalDBS2mWx+iBl9LWtQIE7X0S6qBovUE0H0u1yQ0PIGyBXn/A4cy3Dy1nz1+73soE1IFpjsg6+N9b6UbBdJOlC64G0u0VrEQvhfLiZyxUryRjwhsdNhSTPhceVe5eYcY6BgLZ/+bzbUIGm6znkifWS3Ob/Y/hf+Dg1ycUd9xJXJb36nLeCh3lKJUkTuSYBh6ixHVf1wKo6YbTSsgtUOkomUIYK8yPzyuLSFNoyWqCq+BbTuJSmnUDkjGgA8+fDP0yrrDOLnBFCpDaYAYF3GVuOmrNa45Ovoe1Z1c+37aJrO33M7Om90
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(6133799003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F7gLWR9fRkZQoqmiSYCJFFV66e1sSE8b/hS8D2MYfJhEdbT5YlR8a41cBtMT?=
 =?us-ascii?Q?omTFJYQ3+4xdP/asqY7HLSOluWA+5py+esCl+6TnYCGEM/YKA/AjjD0bcq0n?=
 =?us-ascii?Q?YV8YAqRBvWCwir+nEKSjZg8BmkugeyqA7+XsYRDGshjqLBYjqvReo9ISNuOt?=
 =?us-ascii?Q?7hJF2HRmJ1zRds1nEWTrSQvONgk5hw/y/KWKzAkBPzcWYzbJ0G0mScE8DNVu?=
 =?us-ascii?Q?Mw8HtqzmurRU9V3et6dF4sBu+weWKzMb/Ia7E/2iSdSpqLaQMD2Od5FlAacm?=
 =?us-ascii?Q?Uw+ysast3aDSJck0WpQ1stMHWc+iGfH5FbRlXoUPRKSF/B5sz3tNt+SdTEay?=
 =?us-ascii?Q?4ZUOHWGSdgoMjKcVqylrv3DvbeVVagxbKDD3aDxa/yRPmVRCWxawfFEidUOb?=
 =?us-ascii?Q?bxt/OUalGWenP3CkSkvG3xunF3IgyZC1AqhGUdXk3trVqwHFh+jwhBJTDIFB?=
 =?us-ascii?Q?Ewnxm2yENts3U02BvZTiL5Et4NpCD0EMnVYFx6Le8bHvhScFODZCLk1Dhu0Y?=
 =?us-ascii?Q?pUgqCiYQR9tigSQ+Cbf2uQpkkldpA326MuVva+Tpm2Wns3CQeRDktu3mANZp?=
 =?us-ascii?Q?/orGe7fdv5nf/Cef0r/Uc1smMskRfu88QP9d3MNa0cZWXEMdpQP4aEQAAKwf?=
 =?us-ascii?Q?IjznOLNPsIErtN99j7zlwHKqWvOIGaaMKC/CT5wY4h86zZndFu49HEsuevD+?=
 =?us-ascii?Q?q9XexNYB3fiBBphGHCjZS9zpoGsOlt58bkW5sfP9DlLRDatV5tgvJJKxswhT?=
 =?us-ascii?Q?4OXPQhCi6QN3VcGuWYUxKBVyy2RfO0MnFH2ccTi7uA/5mUXYG6vuhfxVpVjq?=
 =?us-ascii?Q?B8Vrki6RCt/RzfaPzc7LEdnmVEGm80BFhYCunh1DEvIzp0hRB9JNqbbTTZP/?=
 =?us-ascii?Q?12vMTqshNVFYbAkC0ascoSddK3fP1T41NU6vVbqvm2LuHA6c2d1Os6XBgoUF?=
 =?us-ascii?Q?XlY0XfHVHBdRvJvrjYUCG2lIX6hL3L6kR5nyqe9npYPL4hDn6zmsp9OYfAO4?=
 =?us-ascii?Q?wV85X7FxVq5ncC4fsgI3ICo0PXCk/AyAo3IJhnxlzyPNAYFbgZXkK75Tpn9d?=
 =?us-ascii?Q?5AOchhc5/xI2xgKj8cbBemxgTLup9YlqArRjgQGG3p8/YU1C+lIjX7nijpKE?=
 =?us-ascii?Q?udfL7pzdmcATk+ouOj2/keu0YOSbxefSZ5MCd80DpdGxgRpkw8wwIO2JMZOc?=
 =?us-ascii?Q?7j56yp4BzjtpuM8RxbHoeL81wPNnDMippFs5M45OJR8vikgXJbuJyb3Dvbla?=
 =?us-ascii?Q?cr6gNUGqUWRfZPtNtIQOSH0KQJZ7Jm1be8jd38408s/DGvJ0FWxhjFbXrhpa?=
 =?us-ascii?Q?w1FzosLfkWJjs3hK1clFJ1l7JjK0Hi3xEcEPAqeijygikSGY+MVAFejWxCPP?=
 =?us-ascii?Q?m1JTzHLge/3TD7aAS67L9MKJb0rYHFHtqWhxQcN6+SmuVWklYF/kcpHMf60s?=
 =?us-ascii?Q?GDWSRrtTzY/ey+PH3X0ZgO1Q+mqVWaThuINQnYb3JwAcIgJlJ1LA1gt2U2H6?=
 =?us-ascii?Q?syE2/x2A6CPKIvYnxhMEnP5FqygNF0gDFpsAFTKOAUd3kK5MhKdsQRxDAkSY?=
 =?us-ascii?Q?q2mPSnKvda0a20Mky0XXmS1VXs9JgpUDPsMuDMCyrqRmnZ2ucYcDj/KwqN6v?=
 =?us-ascii?Q?jwxOHOQylWnvPOVCaD0InJByb7DALygZ7R2JHro/z+GGCXYz1ktgKCXOs2cV?=
 =?us-ascii?Q?dlWctqDNJjLRY3cv9n0C718H/bfpotIp1NOl6Bizj68ydDK5BeRxdwIEGU6u?=
 =?us-ascii?Q?4NZ7iBmx85W6O1+pesa9s+IE8kup69A=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d32afc-a521-4ce0-3e18-08def2420fb4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:28.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZF15wUs77FEgt0+l4CzWcDHfF1c1mR03OPPO9zTR8fgQjia6KQLOC24I6X6XkbBTvEmfTyrFF24piuSNxs8OgVW5d0kXE/Q3HTOCPw/R8sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

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
 * ignore high bit in set_direction/get_direction helpers
 * minor patch modification
 * fix some issue found by
   https://sashiko.dev/#/patchset/20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu
 * add more 'Fixes: commit' lines
 * add Acked-by Lorenzo Bianconi where it was approved

Changes v9:
 * fix some issue found by
   https://sashiko.dev/#/message/20260727174141.664933-5-mikhail.kshevetskiy%40iopsys.eu
 * take into account openwrt changes created by Daniel Schwierzeck
 * improve binding patches

Daniel Schwierzeck (3):
  pinctrl: airoha: fix I2C1 pin mux config for AN7581
  pinctrl: airoha: fix I2C pin mux config for AN7583
  pinctrl: airoha: fix AN7583 MDIO pin mux config

Mikhail Kshevetskiy (33):
  dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function
    name
  dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
  pinctrl: airoha: fix mdio bitfield names
  pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  dt-bindings: pinctrl: airoha: en7581: allow configuration of
    pcie_reset pins as gpio or pwm
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio
    default pins as gpio and pwm
  pinctrl: airoha: an7583: fix spi group pins
  pinctrl: airoha: add missed get_direction() function for gpio_chip
  pinctrl: airoha: add set_direction() helper for gpio_chip
  pinctrl: airoha: minor improvements
  pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ
    handling code
  pinctrl: airoha: add missed IRQ resource helpers
  pinctrl: airoha: fix IRQ mask/unmask code
  pinctrl: airoha: fix edge-triggered interrupts handling
  pinctrl: airoha: remove not needed irq_type[] array
  pinctrl: airoha: statically allocate gpio regs structure
  pinctrl: airoha: move common definitions to the separate header
  pinctrl: airoha: split driver on shared code and SoC specific drivers
  pinctrl: airoha: an7581: remove en7581 prefix from variable names
  pinctrl: airoha: an7583: remove an7583 prefix from variable names and
    definitions
  pinctrl: airoha: an7583: rename registers to match its an7583 names
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  pinctrl: airoha: an7583: add support for olt pinmux
  dt-bindings: pinctrl: airoha: an7583: add missed features
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first
  dt-bindings: pinctrl: airoha: add support of en7523 pin controller
  pinctrl: airoha: add support of an7563 SoC
  dt-bindings: pinctrl: airoha: add support of an7563 pin controller

 .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++
 .../pinctrl/airoha,an7583-pinctrl.yaml        |   59 +-
 .../pinctrl/airoha,en7523-pinctrl.yaml        |  379 +++
 .../pinctrl/airoha,en7581-pinctrl.yaml        |   15 +-
 drivers/pinctrl/airoha/Kconfig                |   42 +-
 drivers/pinctrl/airoha/Makefile               |    7 +
 drivers/pinctrl/airoha/airoha-common.h        |  147 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 2645 ++---------------
 drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 1487 +++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 1517 ++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 1157 +++++++
 12 files changed, 6440 insertions(+), 2478 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0

