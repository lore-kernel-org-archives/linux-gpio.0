Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn [139.219.146.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB97F1A285;
	Sat,  1 Aug 2026 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593000; cv=fail; b=ucgtUWyZVmpjjwIHuhQj5HG+F2oX3uwCP+Y5uRHGK4ZBbVqFAaW2J1vyNGpxX4X6altrBSF6s9bUebHZJpJJCG4JrkK5Xx+7fp4TzN9VvQyGE1le9Q8XgjYTodl6N5+bKUg5BDv6ZPuSTJqgqzJjnporA0+WRzCzuHn0gaSs3JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593000; c=relaxed/simple;
	bh=HIVpTaObT5ryaxteuiskOU03xQy7uvl83u1d4G8ZNao=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eUH+vmZFxqOKfb944gbtrYmQvJld96Re58mZ7+iXa9QKv2rTuZfO/XSHSJ3oCMnlJcoXCMHhluY3nRryX20t+WgF4CNRU5DuOHTBxsja1m1uS4uNonJj36tqFNKu3iKBQfkN98IkMmPW5wjVDFVEsK8Fi51U8SsCRyZ9Z+df+30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkOF+SrqHkCNFau0NMXUjV0h17qYqLnO/afyMJzN+tLt3jgVyjD09VkRhlllo5o5FPM2l+1W91oqCUjnVjpYcJMaRNqBkFJo28Rt68y9cVtGdsoPhuubIsk41W9X5hLUpFnQvNnPhNkINX6JiYLo6SX91IALOm9pKCwS6Udy1sZANqG6h1FJGKqTBbGJisDsGf4VcRLXXTjAuV8sXh7zLCTpBWOcLtA8ag9jabX6imX/xtfwVqeycIA8avoShmtzeUwkiCarI1soIXeIip17KklpH4Itle+htxQ8jg07YTx11lGv/n61jHKYmX/OJK/qCS1bWlqBQmKwIbWAmCybAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzR8QYzRYGYwbMGPLuYtygp0rJ2UZSwTwQCJQH4ZzAg=;
 b=G4esmNVJdriuUBREFthpW0sJXAIB7PCG0k2PXoPL+qIIjE2qI+OZtpcD9FfyOP6H0Hs4yrCfSMEjc96PyC/yh9YSRpizhyy4CsKqlY9Vew0dMltUNzeMA5MDd9+PGafvUp4jlvIfHnftLLAAbVN9rko8enYXMS80NJhg7AX7f1R8+rE/Y44hSqmBQieJCQeyih6D4vM/GPbQ3laFMEN6Q+XG4273BkkMfuoXUzw9tVcGjds/2Xc3yIihvAjGJGKnK9GQPSVtfRZCu3mH3DbLzE7vfBONjBT1IROlnJaHDdg79Ss2dNY3/IKTkBeNHeG+tQ0dQIq3Sallxmxd5A7Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 07:27:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:19 +0000
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
Subject: [PATCH v4 00/21] Add basic pinctrl drivers for JHB100 SoC
Date: Sat,  1 Aug 2026 00:26:50 -0700
Message-Id: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: fa82d842-99ea-4ce5-2012-08deef9e51cb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XNGLIXfyjEdQvCzJQKg50HTkXmKTJHdJooXvIU9XbTvy6J2NcosDrk0lU81OL+juIQWP5MrK6D4Fs0qFVe1x0foXaedhia3ggD0LUcyj57WvgWY5RpZRpcksFBwqAreByPtsD7ds1lQshZgV9zxgudrtaNOQmjVGQQyQOWbzk91BQd9ikIGBtxlM78CL4uy7U/YiSttHCGIO4cmc/og9VQJYUK8DARYYc9nVQyp5YP5VryQfa2espAW3R6D4Jvv7/YCGUi+kFnZbzwW8iCWELdQqwhp0i4qEB+lDz6a+ARxDzPg5wz8eMs2KGXMIjfhxZuH7aP2P08o3rmGz9OdZE114Qe0p2bA+l6Njf9DsngX8NmkS84+LEIB4LOy5mAMWXGsqcUX8Unc5cIcNjm2bmTTSviwqHNbv+Lawc3JaYvy28YjvR9jxx2MZeBFhcdbHhPc53yb139LzNfWdqNZ2weTTCyiqdpPnrj3Y0pBUxxAO6a5fDn3l/bUi7MIoDEPiLQXAtNZvyIA1VxuHPlR6gcZXjQIQ27HMSBSde+uyA5FkYGTQuFskKUM+Wf1ezDV++2htCFPe/HU5f8L8EOEwHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V09Hd3VXUXZSZXdvaFRGRFBOQ0Nzd3NSUXRSbGViekx0QXNUTWd0ZFRlWkQ3?=
 =?utf-8?B?VHpQOEV4RUJiNXU5ZEFFRWZ2RDFpUkJ2QlVmajZVS1ZHRnFkNERXeW9nMlJS?=
 =?utf-8?B?UVNvUE9YVWZlUDJGMTUxVWFEb29TUWtiM29KSHBHdUF4TUdSL1hmWkthdWh6?=
 =?utf-8?B?L2NlVDVlUURBL2pDVFFvc1JBRWc4QWlHeFJIQ1VpU2xQTXZMaUpYWEtMSFlD?=
 =?utf-8?B?SHhiWjg5ZFc4dW9zOUgyZUVrT0ZnNzZod2JHL3hkdDNVZ1EzZ2pPbVU2VTlm?=
 =?utf-8?B?c2pVRTFIeGZWR3ZTL1JwSEw3ZWFHS2lNS2RzdFVkZW1oUGM5K2IvQU1zeGdN?=
 =?utf-8?B?OFVBKzc0R2RiUElSQS9KZkJOcnhkUmJzSUllU0F1KzhIUWlLVFF3Y2tpMzBu?=
 =?utf-8?B?TlZSVWlIbS9lSWJqOVRIelNwR2dqaEc0VGJBVE5GY2NjeUFEQmJnL3ZOQyt2?=
 =?utf-8?B?YnVpTlhnbVlGU0xJQ3NteW5WVWJqTUJEWkFrYU9oM0YvK0hoeWlEV3ZJMnZ1?=
 =?utf-8?B?Y3BXbTFMSDlJN214N1N0TjFzckY0aExUZzRwdjI3dGZjdlZ5WTdBdTd3Z1FL?=
 =?utf-8?B?NVlUeWlReHlrVVhNNzBZQ0JSZlAvdVhHUlNwWDZWQnJlMzFvVTIyd0dXR2Jo?=
 =?utf-8?B?K3c4UlBpRTNnVk5KQmdxR3FFanRQM1pMOTBTNUZ4WUVjSTNSSSs1Uk5Xbmdm?=
 =?utf-8?B?aTJyRWh6enJmOVB5bVNDQUdTTXlnQ25NdXFqNHg1bG5McnhXOTExVjh0T09Z?=
 =?utf-8?B?TVFzajlEK215TitvMHJodW1rRDNjKzlPbm9ZTkZwK2psREtyU0dnZitaSmx3?=
 =?utf-8?B?U2tNWCs4Wm1lOTJ2QTlKbm04K1VnTUlHSEZOb1hqOXBYS01nckZkOTZtZ01u?=
 =?utf-8?B?bVB1RGgwMTVhVjc3a0lQRTYxQWovTVN1dFNOWHlOK1gxS1VPaFZ4TVg4QzBE?=
 =?utf-8?B?a29YcVZIOXUwSGhSVGQxc0cyMFpDWE9hSisxbXJaYmpzejh4cmNpRGczQ0sy?=
 =?utf-8?B?ZHc3UU5BZHpOV3F4NTh1cGpzSnlqUDI5UTdlbjdGZjczWTFJVS9VRHArN0k5?=
 =?utf-8?B?akxoaC9ueCtBSUJLZFNkOUZrTEp3dFJsa2FkaDh5cGdFMm9RQ1NjUVdzU1Zw?=
 =?utf-8?B?WXd3UWM5OVZueE1hdGs4QzA1RlBQMnJWbDJPV1RwcFBpNDl0NG1uWS94cUQr?=
 =?utf-8?B?U0ptOXdFckdDR3d3eFh4ZStpeFR4cXY5SGdBTGo4amNzM2hDeU5HSENiSVBa?=
 =?utf-8?B?d2ZvRUlUWWxFYnV2V0ErM0tLUjhZcStSdnpYazJ4NExNdXNWQnFEU0twRUVt?=
 =?utf-8?B?TFJEanBsYnVXRmNONW96RTZCVjQ0OEFDUlF6RWJHcnk0U1RwSGV2THArNnY0?=
 =?utf-8?B?UzRBV3JQRFM5YSs4eEhqTE44TnVIN3ZtMVZ0NTR0SVZoUHYwTzQ4SGJpRFJv?=
 =?utf-8?B?Zy82MXc4UjlWbFZLZ2kxdkg4Z1RSVTZlTWUzdmxMSGRITEtrUVlJTkw2eE1s?=
 =?utf-8?B?ZUpKK1Z1U1dubEg0ZXU2ODlqSk1nUFZLR3pSRndCYktiRTd5QS9JanVnZnZv?=
 =?utf-8?B?R1JCVmZHd0RSQUczYWJ5Q2QyNFlZbnM2QXFKWk9tdU1PcEtkSmhsUVlVb21R?=
 =?utf-8?B?ZmFobThoa3JBemh2azdmd1FhaHhaV0FwVmxpb0Y4REZpZ1hhSzVNakh4MDdR?=
 =?utf-8?B?OTRrWnVRcldZVFp3U3FFTDZXSWhMVUpoa2F5b3QxSFJwYjBEK1p1dkJwREdr?=
 =?utf-8?B?bW5ac3c4SUNSdlUxa2lNYWJKOVFqOGw2d0VBcUxWVHhRM1JPUk9ya0tkVCsw?=
 =?utf-8?B?N3BMUzMyd3dtUjA1T2QyWlBsc3VkZzIwREN1RHBkdWpjTDlxMjRjdnlERlh5?=
 =?utf-8?B?WXhQL1NqNWErK2k3SWxJZnEvOXhBekNONUViWjFKNlVLbjRla011Tk5xVTdu?=
 =?utf-8?B?b0gxa2h1NkRlUFo5QnExdHhDZjNkY2JIenltZmV3czdZb2l4Ny9HMzVybW1q?=
 =?utf-8?B?NHZ2ZGpwaTRtN21DMkVZdVJJRkNvMnQ4UTlVdlhGOWhocnhPaXgwdXBLMDJB?=
 =?utf-8?B?QzhNYjROdFRnQjAweEc3bWx3OVRiY2syenhwaHJKbVVTSjNxbHJEN1hxY0t3?=
 =?utf-8?B?S2h6UjdaR1JCRjNlSTZ6MW9PT0dlSEsrM01VQXF1ZVZnNTg3eGZUVmNHZjVH?=
 =?utf-8?B?ZmtnZVJrRU9abkE5R1FBdWt1b1MzNWRRU01UMWE2dGdVL2E1TENZSjQ2RG9B?=
 =?utf-8?B?N29zbCtYYkh2S0JUbWVlZyt2bHY1cWhWckxReTVwQlJmMUoxRnBIQXNRQnY1?=
 =?utf-8?B?WGY4dUZoM2g0V1pyVHV0UXZoOGtVVVhtR3ZHeVZTcHJUYjI1TXVRdy9hMXZm?=
 =?utf-8?Q?yNQh7ct10w0zWwQZQKGz13y8igc+p8RZzxPUQ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa82d842-99ea-4ce5-2012-08deef9e51cb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:19.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGx5gysQn6+bpDakC3barbs+CeFTlFqK496YeGUoy+/m45jLoVpMJAMg5G/aLNh3DIwFB33uGrzrsaT3eqB96F2nShcqfsjYeaap+2XUdXOxCD+v2Dzc+Bk8Kxv87ydi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

Change since v3:

PATCH 3/5/7/9/11/13/15/17/19:
- Restrict input-debounce-ns to a maximum of 10,485,680.

PATCH 9/11/13/15/19/21:
- Change power-source to set the actual voltage in millivolts.

PATCH 19:
- Add support for an option to set 2500 mV.

PATCH 4:
- Use GPIO_GENERIC to register the GPIO controller.
- Acquire sfp->lock with raw_spinlock_irqsave guard.
- Implement the .gpio_request_enable and .gpio_set_direction
  callbacks for struct pinmux_ops。
- Add reset_control_assert on driver unload.
- Convert the pincfg structure to an enum array.
- Simplify the calculation of the number of GPIOs in a GPIO bank.
- Remove check_pinctrl_layouts() to improve code readability.

PATCH 4/6/8/10/12/14/16/18/20:
- Add const qualifiers to struct config_reg_layout_desc
  and struct starfive_pinctrl_regs.

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
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  180 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  179 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  168 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  162 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  166 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  164 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  162 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  164 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  170 ++
 MAINTAINERS                                   |    9 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |    3 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |   23 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  110 ++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/starfive/Kconfig              |  108 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  153 ++
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  163 ++
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  124 ++
 .../pinctrl-starfive-jhb100-per2pok.c         |   96 ++
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  118 ++
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  119 ++
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   96 ++
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   92 ++
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  132 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1456 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  159 ++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  247 +++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 30 files changed, 4752 insertions(+)
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
