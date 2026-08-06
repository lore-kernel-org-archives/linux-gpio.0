Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48F41A4EC;
	Thu,  6 Aug 2026 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053990; cv=fail; b=eK5tz8C3elgHi7Jcx1IFryq/s3k2phFKgBPSVZgikrqu+TmOJS1teM9LagE/stv/0F90ql09pQX2bWElr2yU2tBchsrXy0pwGP0cunusvsYrcyG9PYPJM/US3iGMB3g5RTk0j+9JEvGsDSPxx6vcNkHOgnO807HdbjXYDnNGGX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053990; c=relaxed/simple;
	bh=7i7iUi86uLKp/hvthsmDMq1Cf70O5Ea7XivxmHwAlmo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bAxs1PrzGayL1cmMhugsjBZPB+3IZSOKVoh6ME2UV27CdAkQAgttAhaudI8/CVaEuI0Av0ROZ4be4Im2jwCge8TKj3vJzP+t3oMp282fA6sNB3pztNSg8eTwshjpvvlBYpFPf8TYA0nCIbTjCiCppDSjEph/eIQyA0xkAqWdNt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=M3FaS8A8; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="M3FaS8A8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPQUtzUUWJoxswoTbEZ6SOhmJhA4lm77W6JO3LrRtOOmaQztSYVCirVB4mZslve9snSTXPDTr8b6/IqruQwflPIGkcq7Lq/nzwuDA9xdSg7aLh15D7/fNtlg7rqkN025fHwNjK3dv8/r02i96Dcw3z+eJedA95cmXy0KMsJP5QKgxYdIrNlSYrQyUeOm84Ey/hggELbL1cHyBkB08lXC3yJdgYjoFS5OY39nYXc5XSmM+I5O/xxMjULTeCTFomMKMrNQG/R42IqsR/fAA63wLwtgMNpyVZfUKHvWUXdv+Zs0OzMMR9s8oXz+43Im5BiJDt45gYMlum9BmPo8YI2FDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kbik6KtVjqs+bog3IBGa43LcuOKTdzPwkW2xTIsTlJ4=;
 b=ytXqhMatH0Zkr/Yh/bkSD3Bpkb0vyvd79dFQKkTFmseTr9hrZKgpfYJZ9HWAohncdXGDJSn2+sIGguY39EfasEPL9HRjY0txEowj672H4fwgwcmC+wnDUSCCHJqzWYRh5hg5pr86YQSGcWROb0XFnJg+u/qspQoOR8DwzoL956lJ1WZqPnXnj6A9P966+m1CLU5HQrdZCmtBnwUl2YCOmqboc09xyvcKWxw18h//NnOCggNthp8c1yczLQWegdmY3X+JIBLgcF27/HH+VZWJZGjh1Fcbp45brUyKxCr3U6wim5Q6Xn7fVzezbBNHGMtT9bjQgzrp8EwkIx8pvrLDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbik6KtVjqs+bog3IBGa43LcuOKTdzPwkW2xTIsTlJ4=;
 b=M3FaS8A8KJWKNvHRHMFNpDzcvm0I6MFzdFlyd7NYIyqM+avOsk0Ef6CKORv3aEB/ptOS6P0mRAalB8hJAGGx1nDm3OFL1x0o73KCoteaKuJTmGCzX71mv0yXJu1J5sQGUh58lD7EOWX4leUgMajNljMpiqIdCQMCEIesUDysWw1rxU2+xQnxkn/tl77IFUgREJhlKC70TId1G7+XekC0Wvn70oAV4xFrVWC+7jVWlv5MeMpILIboSanX6J6AT8NH7KAuBZQAwpS8pP0zFbx9NYymOw2xrxx9zte7Sgkeo0WPmQbFeyco6ysz7sX0eBvHBH3ewkeXsPMehK2pSFIqCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:24 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:24 +0000
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
Subject: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC drivers, add more SoCs
Date: Fri,  7 Aug 2026 01:05:38 +0300
Message-ID: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
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
X-MS-Office365-Filtering-Correlation-Id: fb20219d-faf1-43d8-f5ba-08def406f47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|3023799007|6133799003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	hXbO1sMJ/Vcu54KfAPh02dLzefxmRpW0D8BQdPTvRoNKl+2iXoVrwZyDHDJV727e8cBydp7evT+TG9BFnI3qGXfv5arM86PhvtlNh5L4c/n5sP0bPRjGnuBZ9WiP7eE9dmmOYehjD1adL+SLZhv04up5JtE3v6ercUWp+z/5uaViXNbSwLefUYYNwDhVIWeB8OBKZfZ6LKty/CoFc4AdgoGNK7K+CTuO049fA2oir4zO3xfyRUYlJaVyW5HpBRMjSkOSQcM+/cVFHTAmegBHJZU+XfTrMXFkbT4cw//EnHJpNYWVyO5b+8xlp5/+h14lcaQidGIXRn44x6kYMpKgsSGla2nGgQBc42JJ8Mom19pChB03m/3mR2aFNF38jvisg++Kt1XLM95x+ulGqCVkU7GtBj88r7hv4/ZsBX0VA4zHA89+RAKbJet0z3ULpgomZ9mX4xvkTMTPA0W9SFDdha1avH/BU4YeOCi9kb88/GkYOVJLxHYaFB1BuA+lkjOGOePrMim5uNPTelxNCHRctmH496l8I+TgntWKTeHzZDL2S1ntuEJoYcJLLaZTawn1Wik6yrPJs9dpviR96XEE42RDCIuBjXD+qPeVe8iPeUOHSr1sytw00rVopA8Y+DVpqWrdZS9w11lB70VT1L1g1x4LBS9w3H79VUpSbC/fWJfjh8eiYe5wBOuGSxzJAB9u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(3023799007)(6133799003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?szwQ8i5EtX0iEsn7HfAyhUlBQR62OjUG5f4ubUsCb5c1ggHaRh3N8iU29aDt?=
 =?us-ascii?Q?evg9WAnsflSmp8nLxUEGkyMWsxOUFSaqzJgSVcu9knPH4BsjhSFmSYel4XgM?=
 =?us-ascii?Q?ec/ndl0UTdVSamOypEp9qz8RnN5PR57uWTNCEWMHgwh0kYMFewFujidmgjhj?=
 =?us-ascii?Q?0LZ9jFoRqsXxR3sQjmI5CDjDvfzDrcb0+eG+2CGwjNLssSnp6OtgprHfww/L?=
 =?us-ascii?Q?oD3gOZHHr1C8zTTYGHu0pktSIoOwnOoTkKEJFJprtiCtAtBj899d9EOkAjLq?=
 =?us-ascii?Q?c1NpOmPg5rTEjNROGAU3HCySOzppd5cfGw/fwCPPbpAqAN8gREOvNWHVSIMw?=
 =?us-ascii?Q?gdopbXCO4bjEvAHSMuhF111X97cLwY90xk3AZRhsulHXdPILBv8qyH3/DrVI?=
 =?us-ascii?Q?PXtlFNuXGH2zHXJxiHkmjAW0ELylcjXSK4jrU4KQDSarDgiVYKNhqjpj2NbF?=
 =?us-ascii?Q?ZLhzdKal9Thlx7hntJaRpxZ1SJTlbKVfbS2K6qwIeqtwfyKuuokIbe0j9Frk?=
 =?us-ascii?Q?q07QKiiZa5KAf49gIVbSe84tq2DhN7YbIUsays4XdhM/fAQWZh6J5ljr7Ypu?=
 =?us-ascii?Q?l9OCogEWq05pTFevJgf9vJjweacdSwS+Qa54xoFCcmWf3cjvU75+5GfodbjL?=
 =?us-ascii?Q?p2Bffi5MnDVOhFy0yAuP9AyQYqnsbtEzpiFLQNtf9iYRDkdnVoIFfvJxAT2R?=
 =?us-ascii?Q?NJ++ApZv73hNX1ztLqEj06Ee5VS/t9S/7eL6dy+INmRB6NYSJLe70Fg1FKJT?=
 =?us-ascii?Q?ZRiW7XS3tTAv59+ucdvtRBs9iAXTzWLPeUESjQzfJ/sJKU+K8eTi5vs9N3vL?=
 =?us-ascii?Q?bHt0DjTxRLWkshvdatq/988Y/xvWJ2zmXxrHSCATFvJPO3DSEyL1ivNTQQi5?=
 =?us-ascii?Q?Yqq7aLPnS3HULuqFZqM0TF/OGzDt/Qgf7phhWQHb2XAc83yC7CxiqpkDbv8K?=
 =?us-ascii?Q?ETqr1CFvCzbzoxiXf6huI5/AnADbtvsG/nq9P06oezhIf9P4UXW8pTj2npu1?=
 =?us-ascii?Q?pYhA698NF11q+E+gfqsF4lMv4mJV24RS1Ba77Reu6EKCgMw4KVcC/Vpfh+RY?=
 =?us-ascii?Q?NjFGWMgYKly40JKS2K5crYnOWyKD2M98Ix4LXOvJ70U/aNMjGMKhWal28Zy5?=
 =?us-ascii?Q?ogbKVCTpu49XkPLKMyV6PCgkrFMhm/LTXHY4Di4yaG+VJLpIEy83yBxzU4Nr?=
 =?us-ascii?Q?kozfkKekC+xp/dgDPnLuLNoz+pAeAVWfvhTTykLQGlB9W36Q5+BcMFkNPUy4?=
 =?us-ascii?Q?tIVQkFFaqrimWolKZO7xNfsszDWheQGipa9h4r6ydk8iw0xroX3IwTTqNtQn?=
 =?us-ascii?Q?oLa0QXXqvQMPOol0gn55xxLhV7eLtD964aK6IF4tqGp4qEBH2C7TP1P3gPLd?=
 =?us-ascii?Q?2ZluMPn9GknXm4MSq4ravu2zVEjz5c2UVCGpF9PnmtV7DoPK0fsY1Rao9hRG?=
 =?us-ascii?Q?uxj8dQiyXuwb4spOpugi/Xx+wYx2h2bBgu4HpT8InRe46YUa0QrxEyc95ZKu?=
 =?us-ascii?Q?iLK83O9w5IUNQTUbdt/YzNEwAJ8SNSIEaR6s5oqzClRdl2gUlPdvDy8GF4xd?=
 =?us-ascii?Q?19WqYIvbLgm5Tp1/NO2yPMHcHlMo3CnLlXG3uDoDSJUW2AU1WQD2+WcWYNVI?=
 =?us-ascii?Q?g1VP0gJsCcrifbEWWYuD7y4fCwVIvzNfhR06Y5Gf3Qmrtk4bLOCZJsGb1wGp?=
 =?us-ascii?Q?TpiFJiNqz5MVHOxpIjQ4/R9asUs2PxzeIMJ1AcKsAjTxDhRUMPsgy4wUEo2x?=
 =?us-ascii?Q?1idci7Zrx8OrfKkREeXOfsfoiXtmxBw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fb20219d-faf1-43d8-f5ba-08def406f47c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:24.5336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLxyIOgy9NUARRts8sOLz26ipYdQedWmvSP5Ig+6pZJN0UHkMNCtysVZ012XRuF9kMUzBw2BdnZQa6meSKLHtRc+ZUckMePS2xF4F/dPa7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

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

Changes v11:
 * improve binding patches
 * add Acked-by Krzysztof Kozlowski where it was approved

Daniel Schwierzeck (3):
  pinctrl: airoha: fix I2C1 pin mux config for AN7581
  pinctrl: airoha: fix I2C pin mux config for AN7583
  pinctrl: airoha: fix AN7583 MDIO pin mux config

Mikhail Kshevetskiy (34):
  dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function
    name
  dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
  pinctrl: airoha: fix mdio bitfield names
  pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
  pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
  dt-bindings: pinctrl: airoha: en7581: allow configuration of
    pcie_reset pins as gpio or pwm
  pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
  dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio
    default pins as gpio and pwm
  pinctrl: airoha: an7583: fix muxing of non-gpio default pins
  dt-bindings: pinctrl: airoha: an7583: add i2c0 group for i2c function
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
  dt-bindings: pinctrl: airoha: an7583: add missed features
  pinctrl: airoha: an7583: add support for npu_uart pinmux
  pinctrl: airoha: an7583: add support for pon_alt pinmux
  pinctrl: airoha: an7583: add support for olt pinmux
  dt-bindings: pinctrl: airoha: add support of en7523 pin controller
  pinctrl: airoha: add support of en7523 SoC
  pinctrl: airoha: try to find chip scu node by phandle first
  dt-bindings: pinctrl: airoha: add support of an7563 pin controller
  pinctrl: airoha: add support of an7563 SoC

 .../pinctrl/airoha,an7563-pinctrl.yaml        |  350 +++
 .../pinctrl/airoha,an7583-pinctrl.yaml        |   61 +-
 .../pinctrl/airoha,en7523-pinctrl.yaml        |  378 +++
 .../pinctrl/airoha,en7581-pinctrl.yaml        |   17 +-
 drivers/pinctrl/airoha/Kconfig                |   42 +-
 drivers/pinctrl/airoha/Makefile               |    7 +
 drivers/pinctrl/airoha/airoha-common.h        |  147 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 2664 ++---------------
 drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 1487 +++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 1517 ++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 1157 +++++++
 12 files changed, 6460 insertions(+), 2482 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c

-- 
2.53.0

