Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020103.outbound.protection.outlook.com [52.101.69.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8E62F290B;
	Wed,  5 Aug 2026 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933268; cv=fail; b=UPcEjS67EL5O4hRU4Nge256BkqeBYiQ0j918x5i9874nD0q13PXwairB38DmWc7IVNBmW37pVxptNMuZd+kyv7sJgAGqzeN0RbvsXv3WOX7R+1WXhoKGN14RcUfVJjfwECTcn8zywuEa+Le349tHPI+3v2R+a1bx65tspDOgwzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933268; c=relaxed/simple;
	bh=L35KDYlo207ZtgDNvLQGx3Ez0ZuNn56/JjBIi1hAySw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UTveZ9GVB3snKgB3g8naywbVHp/4MWK39giPJYepyigiy5uYSWYZGQPC1c72GAi5lsd2wtIfDchK9uGcFUfE4UnpQkNK2+HkG1ctWM1lAbBIMRsEaoZJOosukoPCZMZ5LOV/92wugDs6h3bI3C9Uxc8T1O2W61A47+OOK9/iD/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=HnMDuyQ5; arc=fail smtp.client-ip=52.101.69.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="HnMDuyQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyIS4oo7EveapGHM1kNjBkgR11ZWQJ8FSIBypzoqzUCMI3qluy0YjNprQQhbFZG2LQchAlYIzc8GUHm7rR7CcyUnvWJDnEEWMtMQIlG1R1dYNtMnjKiKyYdjk0eWNPWt5kwnVA2+2cLDFOlR6Xps5VD8I1Yc0CGMibq+GZbrhfHJL7L2QKNQHUUifOk5/TyvuWuigf8ztOOtlJaH1Nf7dqKgljcXT6mIE983wLOi8EOhx9ZP6P+sgYzuGrjK3Kh2P+1Z1HMSsJfcxUnALnmVnNPqtHBUvNW28YUe+T6t2sWdNde/oWV7xhv35+R3ETzpSBzQFlIsJ1a/nhQxEm2tNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy28MP/ucktjPMZa52XCOJOaixlAbqElTFXgi9Aa9kU=;
 b=JPCkHXi0kkvO9tENfG40Niz6JD0jvV8fvSvGvpjbR3LSNCN8pV5sx7ihADpbDGMw4fdhIdhlPlR5vfSp6OJBJRb3RKLR/KrYBdgv29g0h2+0xgW9Oo3AMdcm5ghwZIomKQekSMlP5XUpGTFPHHAzXkvJydiWzniZZOzqN4o8RE3dCQvReiAEmLXwlgCQ/OjVGxJQphUsdKDQDf0ovgk6oJjtSdABBxY74f3R3z/pSGRSkCpy21hHkQ5GjJjYZpymSFTaRY/q6S7kf1Xw6KOg4bzVwNdwTbIiDrgiA0DIw8bHW25eZE966o6r3HkPyvaD38cDH1QldL4/Uewi34rcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy28MP/ucktjPMZa52XCOJOaixlAbqElTFXgi9Aa9kU=;
 b=HnMDuyQ5DWu96x+8DvHgsuvDGG5/Fag79vdQ83VS+21W52KkX2lm8mQXUbtNLM8hNbjL1c/9FhYUIQ0Emzljbww4iC9fIMBjlCKpvH0LuKJ7ncU6UQIFcOVViwvnrQXvWvDRAfOaxF91+3uGLJqyK0hyj5xWMcmQcwj/6hw0OX8TrXQPwvXjFSLmmabD859m56nHKfl4CwPiFTRZ4dEb+wVOowDrPZtGTHOwm11/JbMIYyETD7R0AZ/AdnTau3rljPwDJWHIjbPqWUNq1p4uIVNlwnoIqeGW+JvishMrzchDl91fajme7Djpmne8bMxRpdSjBoWUIdSHnhTpdsJYdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA6PR08MB10830.eurprd08.prod.outlook.com (2603:10a6:102:3d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:21 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:21 +0000
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
Subject: [PATCH v10 00/36] pinctrl: airoha: split on shared and SoC drivers, add more SoCs
Date: Wed,  5 Aug 2026 15:33:32 +0300
Message-ID: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA6PR08MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: 9072b220-9769-4cf1-2d1b-08def2eddff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|921020|38350700014|3023799007|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R1YOXs3cvqFt6Ve0VSzP6vZg9rMzfPeTJLT2nKUOKsfHDHO1BKI42zUUy3LhN00Ejwa5dT4XKvHlndoo+m/TLrx0SiWYsurxIbOasQmfs5eXp/RG+8GGX+q0mF7fra8cjinSSXBmJxk6c2GzPoR+4PqWrF5mGfLQZYYwodc1mA4cYOCenHISXE2AhgVxSXIZPromNMezG9JrL78Dl44qh2nir7QJBg6QwvvyeQORc+ojPIt25XGr2fJg4IcNv+YYtlPtwzvtY0wzSaJ80hHj3xy1GzN5ck8Gd4NnqhY8iOCpgFhF2X3iiImlby2HPT7ciogImA4u/Nz6qZa2A1hqFZPmYqHRvCAFdHLSy+KkSBZbG9R97BDlr70SNPSC1htJJt7o4htM09RmOkaYb7nX7GP4r19+caCb/4ALHFHGBgx15VgsNQ0s2ILe5i7A7FYoRkgMhejaiigW7oDyLoCsm3iN5/N7dQU+rD1KQ5wF8GREFnj7aG6kv4fAm2B0z9Tmg3TFJ5A0jrCsUO9RB0Yqk4rS1ZGZpn3IwJJItx2vMoJ1voxPlOWY7IQUhahz7riORm6JWq1FENaglXTInwFIlsglLeeZCYMcn+ANT7vkf4Za5hZZtclLRW+Xl+P53IoqH25UZzSXs6ZYehB9bxe7bNBo5IH9swLxmX7RACSUsDVKlQCoxPPk6A/BW4i0DEIf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(921020)(38350700014)(3023799007)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W0S0KptHaA2pkyMQvTdgasqJrHhNs/2bqEqqBa4Bp80a3t+oqc4OtWUWqjg2?=
 =?us-ascii?Q?IP6gKx5+hbpF3O/H5jspKN4aewnLCjkTAyJJGvkTMrG4Acb+Q4nwHZ6ez5y9?=
 =?us-ascii?Q?V5cyukszjpgC60fAVi2ZdWQFF2ZHOypqFinkq1Y0BKF2JZfo92pn1MEi0TbS?=
 =?us-ascii?Q?CDgha50Zu20Ld+RunRHxvmYlhVY0g4C4PYocOvr5Xjh5jj2hVb5ZFbc60AMA?=
 =?us-ascii?Q?9YSWMrQYqeG/ZoMeGwtlSn9oOGzd6EGaTUa4QF2ABPU13tFXzWX2rfypEY01?=
 =?us-ascii?Q?VrmQcOwTYOw+dxSlO9IpZNWEgLr1EESvBEmg7VaHZzYDw7zSNIzHJ0Vidie2?=
 =?us-ascii?Q?b4lGJ4ZlQSEoRtrs2E7+/b/NC/DAC5RIstROdf1s92D/6brU3yXle0I/9oGQ?=
 =?us-ascii?Q?zL/KJgVUWTD958iGRsLc6eDsM77ZZnK8uYiORV3FHgxFwPJS6dBbBM/DVke5?=
 =?us-ascii?Q?J/FJUW+jOOaw2K+QYTcElHm2HPYjHaceBlXsruWOBHcmL3e11Zw26mWCuINS?=
 =?us-ascii?Q?MXsVxjNbeS8NyanKAMsY/HgqLNXbrmPFYY7Muv779uvbd+dCaay24hQ9icre?=
 =?us-ascii?Q?7IQJDhw5j8A762va29nKUzEE7//j4tOPV/90RHjPyuWv6VxICyo/PwdwZ2Hz?=
 =?us-ascii?Q?rRr6YOw8Lk9Pd0oP7+3c8YP0ntgfUjvqJRlvxw2Yl4yLokyfWPEHXKgAZwy4?=
 =?us-ascii?Q?QkkhAife8EJewk4u3PmaYGhw4iutR2VQ0g5G2wTi0/A/1GQPyouMUpimsCrp?=
 =?us-ascii?Q?oFqQSZ9OBVoWgTteUOdBWnn4n15g9O/D21Lpta/JmsPF0ghF8RZ3kMwsw9N/?=
 =?us-ascii?Q?zTVsp5voT7CAx6RoSrN4ZUVI+WIymuMRcrzUWAjAC12PxanBGqppJ/+U+Zt1?=
 =?us-ascii?Q?SSh72o0lYJuTo09xdFM4W1a2oTCuVDCtlbxWeNE3dsBug+MGj+/ARX3uslS8?=
 =?us-ascii?Q?nK7WL9CATqJgTtshTeTJLOZKNqIqKkxDibNRwE+zQiVnBM0oGkzO8PR/QB0F?=
 =?us-ascii?Q?A9w3x0NM6hTZL/EU/9ka00whc/rmj4RXREOsqBrouvHdaP2KEtUW8qqf9yx6?=
 =?us-ascii?Q?nIHm1pJr6VSp9RTNNGRZw53liPZViSaNlpY1VEdRGbKD5U2kQRoqqwxvR6FY?=
 =?us-ascii?Q?CA6y3yY+bRhd1lm+wjU2pMsJWK9aVUl+NbSUrygpFrwqSlSwFyUNKfQMmsJP?=
 =?us-ascii?Q?6i7ozX3hj0lMyGv2DnyqUJRMLVkmiMXG5F1F3QnK5k1iAB8aGPQs/zUySeBC?=
 =?us-ascii?Q?ElxLxnDuISPP4+G0yM7gpB4SAfVxfmdTKUP2goXWzbSVyBi2eSMcZaS+v+p0?=
 =?us-ascii?Q?bS6ZkRv7QwOTwAXlLowv6K5/uAwpTaF6dg2SK8klO87KIfYw0FMTS2paZeSG?=
 =?us-ascii?Q?mOimzNn5g2V+SKzphHp6ZqteKfAP6VWrruv5bSHdOcML3aTuCdySOipHuxp9?=
 =?us-ascii?Q?0lkrVZIY5c6qZ2NF67Ql6O1C6cHXU0mayORzwORPoijL9lS/sRKl/6jhxvmF?=
 =?us-ascii?Q?QDQnrT6waDKBNdsjq/kpPkDLk9OwCmr1t2jyzxUOY6hd5BICljyne+qhswmf?=
 =?us-ascii?Q?R6xOSh3Qx8JFLKXX9Cgtiygc4+BOKCRYjHQ0e2Nn/K3QsOsJUF+TKezv5X43?=
 =?us-ascii?Q?JZbPdATkRg/ZP79H0+RE15s9QD4y3UDJxGEraqOHD6J1hDKRm9cZKG+FvIte?=
 =?us-ascii?Q?UTEqHVv9eVV0eze8rTKpz2xXE2svqYkKGrSZbjfVuCo5FkZJVc4WFg0OI2y7?=
 =?us-ascii?Q?w8ZIuxwH8Zp+iX1XDZIwkKon5ttwZ3M=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9072b220-9769-4cf1-2d1b-08def2eddff7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:21.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxqpcnBmNbnCqC15NgwHedioYrBLp/0iV3AXH26E6y0h9rV4v5T8TN5gU7u49j2nuA6K+IkAGZF+X9nPdwmPNxMA9VHRsrCQIGCh1QXbUBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10830

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

Changes v10:
 * fix en7523 binding issue
 * improve a bit error handling

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
 .../pinctrl/airoha,en7523-pinctrl.yaml        |  378 +++
 .../pinctrl/airoha,en7581-pinctrl.yaml        |   15 +-
 drivers/pinctrl/airoha/Kconfig                |   42 +-
 drivers/pinctrl/airoha/Makefile               |    7 +
 drivers/pinctrl/airoha/airoha-common.h        |  147 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 2664 ++---------------
 drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 1487 +++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 1517 ++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 1157 +++++++
 12 files changed, 6454 insertions(+), 2482 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0

