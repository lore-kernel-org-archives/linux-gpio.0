Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2102.outbound.protection.partner.outlook.cn [139.219.17.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED7E3E316C;
	Mon, 31 Aug 2026 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176146; cv=fail; b=SCgEmUODbo7qlJn1xNlsupBeudUwZ1lCZ7AJ77AhqzXjwq/EShiHS9v0/V8tRRQPv5I/pzJZ8mbjer3AbARO+bFHZTVao+Crt0+MM6TUR0zHB/aMNNGzgwNiAnYveSWp/Z2G+HeWsURQZsZhniWb640iPhk0wjQ4kN+R4Ds9sLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176146; c=relaxed/simple;
	bh=Rljp4CLaQQGMD1TVc1/LaMjESLaBEXq2hHFz/KXTRaU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sReDOpQ2Ri4enULF7H9PwKPYxywOA3YzMifI11FV/tABRCCX5IfzT94QmmD1mJ8Aa199pPkj+wF7625AJTsG6dMlnlGRBzvgo7vx/iCpQFer3WZCIogsJahs99aDXDA01Xm4fpUj3jrZlcruNfznx0vaBFugFY6BrWSOi4sAAM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbsxAS82AXar6xq+JWk+U3UVgkrhjaTfLcTtGRye471hemjOqJVMsvq4YPAZ5RFHnjDhLIVFGlpS6CFT6uCyirkh+SEnwDOYP1D+XLIPilF9R1ZAn8F5w/ECyQn80G5n5zYTaBhUZ8PJxrH/S70n1i0eEeW1a7i56ymhaDpdkBovTz0AJH90jk13pedzIAPZytC07Ax29tEwT6ifWomrvAKnueK/JwhzVzuwOfILHouPob0D/uphOgjZtOnpCfBt8bJ6TnHlo2WadMRJklqyTicXFHLxsCrseO5kmyNRNK7QPQ4tSuFEw4aMSGHq4XV8hk0td8zqe0bqnqjC3GZXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDDbAiwaesIj0GvY1WB3QLXjKgShEqD/jWge5CWQGyg=;
 b=TnMTln3bYm28hx9M/i9RMTczbkmzQKz5R/mTFHAsAy8y15bex+I/bnQZRQ7HxjkxA493Ca1pELL67exkvxcoFNV2xGcEWbB/fD6X+No9cuWnZtuOnrk3hfHXR4nAQ/bL7X0UhG6YmLDqGNldj4pmGmmrcDU5LWWoh9pGVpz4FzpUcRqj56xn8pP5wtxZnOpDsDZCUKs6rb2VgRQ+oiYH/4UDhBOkwytA9gfNuKI0vR/4DM3U4hs4tBpTfRfiY1PFl21KhC+YYbHjaMbhItD2wtU3CDS8lRg/Cu5PDwscQeSrtsnI9gqKqqZPG6rTBYeZu2mWLPA8pHtLwwEPlZMsNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Mon, 31 Aug
 2026 11:35:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:24 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v7 00/21] Add basic pinctrl drivers for JHB100 SoC
Date: Mon, 31 Aug 2026 04:34:53 -0700
Message-Id: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: c811c04c-c011-4fe2-ddc7-08df0753f2aa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|52116014|376014|38350700014|921020|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	6rQ7LTNuVdv6IFTKCcBozY81ywm+9CuGCbd/BJFgl/m3L+MN51RYgsKhyrgD845tlOm4nZsUYokoKLqjWxX1PXorvNLXGxw3SamNgX3oJjDMuvq3wtD/Rka1S0v9Lu+1Vx5RvqIDg/1S4ZWda5jaOqfH4s8LWzgW1nRc4yrjXUk1HHQ7voj+YuZoFPtiI2YWx3Kqr9nTjH3OMJxbESO4+o4XQqnbNZO/QTYxvjDSEBmFf4uxtZNQvsli5juVLvhOAbUwXVgXBsQJ7uy3oXbPYECZMeIraZCiYxp4Iv87Is5L5kzGWg5/GMh5/Dx4zK6jaaamo16lwzX3EggVIOHDJ3xC5EcK+ae1EoMRNVQk1YLPhfmtAS9zJZ5/ou1iM9K20mGbBAXrEzWKyekBdxHOCI4Fna1T3BdxCiZaUSxFnYnVQ7hoOEE6HfcxN3KNQ14I6a+kVCq49F9pJXqGawasg9zPfPRih5s1Womh5oOyzXq09VSHZ/sGB1Tvh+UJTtHPWwvp/Nkfbf/lIyPivDBe1Tdofo39nOdQ9NUNOniLGP5lUAg1WlXuyNVZDNCKuBHdA7Ty6OIbLKBiKl2r55Y7xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5YAx8Ip+G6oeicku5/J6j7ILJQ4k3kXDJa68X7IzPvjURV2fghIqJ5Xl0BbL?=
 =?us-ascii?Q?bMZvM2FTQvAxATnve5MpDf0BFqXvQnpAFwQa/3h4qvoIzc1AtlhGgNz73MRp?=
 =?us-ascii?Q?IdnQK+VOu/MsmO6Ru+3XYvCO4/MW7yOYlGFgAc33jSjTWJDyXPHrXjj+ubKA?=
 =?us-ascii?Q?RRyRJf232tJdOxF5FaYKTmEuGaAj6zLQmhMOi5kj9Zhbwl4E6T3jq3hfqXX+?=
 =?us-ascii?Q?8wtTuJPVAwJlQRyXQyZnuDfjBHg1meeQH3NaaoR1PfnNL9dHORICuU5cYO1M?=
 =?us-ascii?Q?kJa2my235XCE3R0XxpstrYgzSveqruMzq3Rm9L4X3I0KWIAkxsvRVVWBbJph?=
 =?us-ascii?Q?Y9rTZb78dwOwC664RUltt5N719syfSnsM9xAMZkhQ2YjXUiySCsPJgeWh7yF?=
 =?us-ascii?Q?7zI+BXIkjpAnbQLzDIS8saqlHHi/HzX2vCQpd7RR9pYSzsCv6f0bk4NUfHgB?=
 =?us-ascii?Q?mkACRr+/VgHCRU7Vvp5jiEiymdypZzU7Mc/WI+QPFCOa/R9/JQo/HjFY0whu?=
 =?us-ascii?Q?OAqMqcNDX9RYdqm2xV8eqW7xHyx1jMKDFlouRFpq/FmhFhJ3NUpOq8K0nRkm?=
 =?us-ascii?Q?p0C01BKTF5ukWaF7nm3Zrzc4mG+he0V9eOCsVfTuiI3ihx11Fjb/3qH8oygC?=
 =?us-ascii?Q?h3Upli+Sl5v7/WZGpsstgMQPxt3yK1UDw05ITwsD3OaKMnw9QYlSIHx9CS5r?=
 =?us-ascii?Q?XHoNMPib/RNoML+hSpo4lVbbny1gWrK4W4v/PSXQVQqKnCMkzLkwewlCJkRg?=
 =?us-ascii?Q?LOJWufiOpbNgK7y5Y4ref/nrPdheKQ26v9BzcSqK5gX3tTmTZ+0IuUV6p8ui?=
 =?us-ascii?Q?n4dPJAE/Be2lQo3QjNovfBW09tNgwauPrX3jpNaASjtJBALuiAwtBF64C0NX?=
 =?us-ascii?Q?Oz/YyxXeXI6aORzT9GvrUj83UVkM4anS4tHI8MR/cfX+OCKunA4+rgiwamP8?=
 =?us-ascii?Q?gU2L8rqf0zKAeWMB/ol9LFVhhMRI4xx/1G5ZOULgYl+5usJlIMdnQVVVSCrA?=
 =?us-ascii?Q?JOI9URivzeuTSJ7YwVJ2GNuL1yhY/m2XNXSPVOY20I4VyeWgCTsBvz9FoYYP?=
 =?us-ascii?Q?PnYIU806H06pJ/PifLiSxNXJyWqCD4Tgap4kcgI/nGPeHFOnBoB1fD0kxR/i?=
 =?us-ascii?Q?tAAdS0gc+SXOv7S+mCCPEwq84HBsnj8ShBangzF+KDl4OebUMMF0SzEVA0WH?=
 =?us-ascii?Q?IN+L8Mk/RSv4X9XBT2VAMgQSJrFuhVu22pxiM+6bH2dsAgivTn59ROh4Ugms?=
 =?us-ascii?Q?85CEu+bPHgXUhJ51ROK5kytiXbLs2USumxCmgoz68cCqdrEc5RL5+LSp2/oB?=
 =?us-ascii?Q?1t4FUi5gWHT6XmBRjzuFbmBmQanfp1+44wQkNTsYUVhHPTaV/Gghv7t9Mtds?=
 =?us-ascii?Q?90qLTBrPy27ymKFLtmrwjBxr8skHttWrwwRggdlgUI/jNANrQpJeGfOZClqu?=
 =?us-ascii?Q?CSDsLnxGnq3NC49ZaH8Ryxi6VaUPLLBMqXwqU70cWEaicwHAhLOmNy5CqGTb?=
 =?us-ascii?Q?vjIiWeVznfDCKkkoQfqMHe6pQnosYO4Nl+wN15Xkaof/4oq9SumyKkK8CiW9?=
 =?us-ascii?Q?71Y3l8OSyri/ULl5+Yw16zzfk0M9y0CL1MJAmQF9I4d+XCfJAf0c5zV1IRC0?=
 =?us-ascii?Q?vPWmOHlBwxjk88+gh0GFzPTUzwOMONcQbNl3sVgvQTpy80anCbjjDyhcHCrx?=
 =?us-ascii?Q?wxFL07IH7dv+9vuxD5pH0gFZdFFK/QHX1VG2XxFl1Nng6PBNIKMlrtKFqTXI?=
 =?us-ascii?Q?EiiWi2/v8rbznh4/YQyswZI/bSqvj9HeZszkNV0Z5LjJCMPL1uvT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c811c04c-c011-4fe2-ddc7-08df0753f2aa
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:24.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiCaodT3X3s5ETngY3itxArC76J1OiNkFPvzegDnZWBYuWm1BCThvFdlnmHfvbFh9x7e3jcMELkN+2HooM7TaMJZg1ShbJ992zxSSBGruJh6nwm2mBR4qeXOWHPuWmQa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

Change since v5:
PATCH 3/5/7/9/11/13/15/17/19/21:
- Change #interrupt-cells from 3 to 2.
- Change #gpio-cells from 3 to 2.
- Revert the gpio-ranges element from 5 to 4.

PATCH 4:
- Remove struct jhb100_gpio_bank
- Remove starfive_of_node_instance_match()
- Remove IRQF_SHARED in devm_request_irq()
- Remove the use of gpio_generic_chip_init() and switch to using the
  custom jhb100_gpio_get/set().
- Replace of_device_get_match_data() with device_get_match_data().
- Add a set of macros to simplify getting GPIO register offsets and masks.
	#define JHB100_NR_GPIOS_PER_BANK		32
	#define JHB100_BANK_OFFSET(n)			((n) * 4)
	#define JHB100_GPIO_BANK(gpio)			((gpio) / JHB100_NR_GPIOS_PER_BANK)
	#define JHB100_GPIO_MASK(gpio)			BIT((gpio) % JHB100_NR_GPIOS_PER_BANK)
	#define JHB100_GPIO_REG_OFFSET(gpio)		JHB100_BANK_OFFSET(JHB100_GPIO_BANK(gpio))
- Update jhb100_gpio_irq_handler() to support domains with more than 32 GPIOs.

v6: https://lore.kernel.org/all/20260829025720.23915-1-changhuang.liang@starfivetech.com/
v5: https://lore.kernel.org/all/20260810063650.239303-1-changhuang.liang@starfivetech.com/
v4: https://lore.kernel.org/all/20260801072711.153217-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260603055347.66845-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260514111218.94519-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260424111330.702272-1-changhuang.liang@starfivetech.com/

Changhuang Liang (21):
  dt-bindings: pincfg-node: Add property 'input-debounce-ns'
  pinctrl: pinconf-generic: Add property 'input-debounce-ns'
  dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per3 controller driver
  riscv: dts: starfive: jhb100: Add pinctrl nodes

 .../bindings/pinctrl/pincfg-node.yaml         |   11 +
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  179 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  178 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  168 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  162 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  166 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  164 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  162 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  164 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  165 ++
 MAINTAINERS                                   |    9 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |    3 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |   23 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  107 ++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/starfive/Kconfig              |  107 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  152 ++
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  162 ++
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  123 ++
 .../pinctrl-starfive-jhb100-per2pok.c         |   95 ++
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  117 ++
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  118 ++
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   95 ++
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   91 ++
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  131 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1446 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  153 ++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  247 +++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 30 files changed, 4716 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

--
2.25.1
