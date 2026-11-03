Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.98
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701373;
	b=z3BDs7ddPPmUw3yxW+pB59UB7JieO5KjOKvmNjzzNuMwtVfimISoJNgZUrIJSpHOL7f+
	 5IRJ+sHHbTkG/EhCpqeDZ9tx42VTH8UtvNuw3Kj3Bf5ykGg7yQZ0c+ILVnnh5ydkKlsTH
	 ScRGu1FHELiiRyDejKv2kKUIwnnPH8TsfGvfwNhcno6PuOpxqG7jzU3Vj+/5pouJavGpw
	 FOzMrXnbeLKyVn1YTo10ZE/5WCX/K+b5LeQcqFlLWnrTY3xhr7ehLdl23cphoYBwyxo5g
	 Av2aRVtkkFFLsvgKDHfw3DonZnxIphNNlFrS/OSlfz8JFljgfvSpQrf30lBMxTeq0hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701373;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KqgX7hWcgUkpToTnfjXI5YZ/4yXb6vJOPTh5IyLYv/g=;
	b=izzBB1ussO9cCR2flSeF3JSjYwrIWy8rT6fliCY/2PM98b+tjamE04Kqh7xIXEjUvI0N
	 vOP64kebwHKynTXNC0eNHwuYniKkEVGpqlOPnKeZPfjNFHHC8/XmqT2dwugCfUHRmLo8e
	 x3qR5M72xbR14T8oeEU/KTTgBzLUkYuac1AjuJ2keig1zqqJqQeNc8GwDGmfxc42dDVsn
	 hGhaor7aJE8w9/wntgFcOHEga0YfULWE5ZVz0ijP4n0lSSCKKPZ+kK3eltXm5In0A5Oaf
	 KqarhR5sced72FlNxIueH5pFeVFjT3VqQdRKp5obEcMfnOpkdB4gCaZKi0swg9vnMcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.98
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2098.outbound.protection.partner.outlook.cn [139.219.146.98])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A5606A332;
	Tue,  3 Nov 2026 10:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 176A5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9ia2fpJC67B9QHUzoROEcM6d1zgrs4cQNnBczQ/ylqp2PUWgOWwrD6wrKZQRfYIyH5KB3oKos3SoLXM27PbXCp13yL5oj2uk+4XidSFgQg169AuNzE7Doy0LYu5tkxXzyXBh9xwkjYl7/mLwcUr+aCxuHAZO8AsTnD4+9GvDk0ABguSpkXSCHgL3YlB0Cx5KkBzOnyhkZF8d1zfxWJ5Uwq1kChSedfxAMZP/WZ5ZcxyQzoR7pGeikBvMYaG8XYNrNFuIlMTzzjaH6YHYsnL921vBhDTzxum4hIUrFfqwUeJke+TvccOMVtUDDsRnnKQwfmANvyWncFjiIXdLCT9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqgX7hWcgUkpToTnfjXI5YZ/4yXb6vJOPTh5IyLYv/g=;
 b=oCvJVRSg3JQzoWOvN6hRdf4p3BryMdedwy3Vc2bfqKMbjGtIOpIb0ZQT1XwKkYeATK7SGMlLyAxAbseXxjTQRvy3k+CGddkpUH9coM8I6UKfQCPEb4EKKtqdh7hJPwYmelYVYP7tsK1sg8ULbGw2RC1LG9oEtMDFmISK4b/CU5lzPVgdVd0CSMCxNW6A/op/C+yZZYsKhOAAljkP+pzKxOS6qa+i5+IocuJrwSE5OZNy8SGx19B9OqTAIBsEuMqLNEeKf4l2AzeS5tivkNk2k7SavBRuxz7CaBcK3IlMp1Ghzd1mg4z3mtnnD+PdovYjbMC/keFODg/zf1ulDJuZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:45 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 RESEND 0/8] Add ADC, eMMC and VGA pinctrl for StarFive JHB100 SoC
Date: Tue,  3 Nov 2026 02:22:28 -0800
Message-Id: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn (10.43.33.33)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: ead083f2-9b3d-49a9-7601-08df399466b1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|18002099003|38350700014|56012099006|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	o9U1XQXnMb2KpQ9Hwz5dAU0xebOekKJoZwllSL7WQs0Eok5q+kCNKqgc9BTIz8/YbxRhCcYNjGeTuKiZteGGEVQZLcVLAsLJcc41D343G990TU80KQa9pWFSHziqZYEhj4hSh0Ry0ig2oeJUVJ2I8W6GYu1iRD6V2xyfJVJ+rOAr8bpOMEKkheDLULriQHYHOZmLYKHBLpfD/trKs0HMzvXNpjJoSnrVmd3PC+fk0N5B/NGHDtnq8vq+BiVQdeb//Y3J53aNmdy6qVxLmXq5mb1+2ASGHvZjAWjUFUIOEUVjCTrnNWua+n+YHOcZMDRK23Qch0H+rHdia0rVn4S6nEQHxtrXquSTM0ZS9splsYvE02YA2OktQwnfnZQWWQnA9luaoloZ5CHj9EEA18E0yClE12mBiKGNObkvbfBItSV2pUskQjc+c41tMlJAlYHjYzvDPPFF2BFrpccTbzwXaZ2m81dUAk8hGFJUeOCrNJfnSJ1Cbw9GW8YzBXTOd3QsDrytL0QffriHTDyTGD/xOu69T6QF8vDYRX1PrvZgjTmqX8+So2qnj6KmRsUQD3z0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(18002099003)(38350700014)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VRMZCEgyzXWwKU2KZIanWvjaCbTGE9Udg9fhKzYI8SQ7RK5uvUhAAknLvoAO?=
 =?us-ascii?Q?av0sTtuUxkaPLGGm6EFei8rbnGaO00KWvdeEwL1Giqz987ch1Nv3D6GshPaM?=
 =?us-ascii?Q?zsCSOHoULPgfeawBJbYuvPrn+AIqEAXIxaF8/OUPigRrmCFLxWSpesa3fcfS?=
 =?us-ascii?Q?htj6fNr/S6MdMFy4DN6WGnmp5QKwYB/1KSOm83npuqS6r5vKD2ED1BUOImQA?=
 =?us-ascii?Q?9+EGXipmvq7QD6Ceqib4WdPEsyN4/05ByKHHmaVk1M81QZS1YDdPbYv2vwyQ?=
 =?us-ascii?Q?H+nnKlPNQKLdAuP+EtzUaLctXRvoeIG6ixW25AGdJAiXB3wtwknxKqr6iP2t?=
 =?us-ascii?Q?MseNDdBzcG4Ac42t8CacpE+HK2EVnD9jqg3YTOZNv59InYq/lPhlIIsb4W+t?=
 =?us-ascii?Q?S/EjSaz4jwvoqM9lowi7fqz+v46AjqMWM4mTDJrpvrfClNZ9UozLdxAEqOai?=
 =?us-ascii?Q?9SxNrvzozWBBof7S/EqIWFjBBP7HcWaQaFQylIicpOoTIul3yvAV2n5rMOpd?=
 =?us-ascii?Q?/B+zaRGJ2OYTSDXtFsSuYnoOSr0Z99ogZeDEvgcobUDzKTjpS0q9gNFtYPa0?=
 =?us-ascii?Q?kzxH/IHBWJSOKdEXPlMcbzd1EvVBXYryOSWo8++xX4mxrwb4r51ed4/NGdeF?=
 =?us-ascii?Q?f91owZ3D/++5ka+XRiiL3r8KCITR0LwblrZdGnla+SPnUvevCE3aClm/0esq?=
 =?us-ascii?Q?EDeOJeIrkHyJ7cvzQC+FRqilMr9vp/nPBILYetbjb1aM7LgX+COXkwk/C8y7?=
 =?us-ascii?Q?v63gbUPkkjQEBGDMSAT19CCjC7cQB472Na2LgUvzO4fAq993J7TP1VNW3xnu?=
 =?us-ascii?Q?JtTCaHb/5zNAsmgMtPGYUJopMcTT+xE7fe8XSVl/5QVoTAlBIfG5FH6JFcmj?=
 =?us-ascii?Q?V089ozDJILDZHTCoNpHbSOH2A3EQPhQQgQnyvAOj2guftPq+C85XKRSa2yUE?=
 =?us-ascii?Q?66Y1rCxMVi5BO/G12eoHCwG3rkj7CS9xOr+X/G9oGEwu8feS3+sQPo3A3O1m?=
 =?us-ascii?Q?Pnz9swC6SEHxQwu3lG2IorIRgNhcemT6K248rPCnTEPXm5a7CB/m3EKZ31QR?=
 =?us-ascii?Q?9ExgdrHa8whdCt5Sm+Lr/vlT67kk8hOJSTHWJN0CTpuskz/+WFZsOXbhRfy8?=
 =?us-ascii?Q?7YlTpyL/2gcJIcybM0tbdvgnWWQBMZmWgqxqo2AT/jost3GFrK4CQUnLb8ar?=
 =?us-ascii?Q?I/TJ99OLktPprlF/gH0HH482SjmYY7bLS4tyTPsnAu+rCx+FN05L1SpgLApz?=
 =?us-ascii?Q?MpSa2d+zxl3HLrLysbT5kpVm+d6GWXDdKl4f2OrzCbaxVEloNzQhHjrFV8Ip?=
 =?us-ascii?Q?hX/j8nOlQN6x7v6FfFviidY2r6thqe7HPRWpg6mkJYsvnSTmV4kUpNNVjJ8D?=
 =?us-ascii?Q?ejLwOnnKr+KW6E5IeLJF+TjcqmyTr1yijjoD5jDNhlNVjAoj9NC7jJSErIJk?=
 =?us-ascii?Q?sGTgXu3zDhbVYjRrq0O3c57I9yoFn3vZz5BP1HjqeOEKRi9+fudz8PuwEobA?=
 =?us-ascii?Q?wUvsMfVyREVgmCkiR4PUQa5PxsbyaeZvbK/gk/osFzh4qETp3QG/9Gu/UvaC?=
 =?us-ascii?Q?AmY3+GZKKNqNyMSQlMZWFrrXsqCPxdtJtXbnK/TnhgKHFdgITTpFjTHyofEE?=
 =?us-ascii?Q?XgzLdG0L/O4B1m5E5cqb2pbWmvjYK/8EWiPsSraFCEEfZW6qVsY1mN0rEWR/?=
 =?us-ascii?Q?2lbXybA6BlgVOOx5KuYiEw87RxlowCFEup+QYyT+ZlelLP1AlH0RRcjqeVaN?=
 =?us-ascii?Q?GKZZufrVveze4JH8kZQbZMYFgGL1UZW0HKNTbZIolz5Xmq275HhO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead083f2-9b3d-49a9-7601-08df399466b1
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:45.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6fufwSSmmyVlmBqq/6Ysj6qo3g58DKwwy1MMgRqf/OZYwlvwQMbZ2xtA7LD9L13gzTQC0xqDs5A2MOGvdvc39IY40dZNI6lbEEHYHgGVRGFoyv4WVwABGlPeqU522xd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

Series [1] completed the submission of the first 9 domains; the current series
provides pinctrl implementation support for the remaining parts.

This is a resend of series [2], requested by Linus to be sent after v7.4-rc1 is released.
PATCH 1/3/5/7 in series [2] have received Reviewed-by tags from Rob, which are included
in this resend. No other content changes.

[1]: https://lore.kernel.org/all/20260910100357.130134-1-changhuang.liang@starfivetech.com/
[2]: https://lore.kernel.org/all/20261017052534.115203-1-changhuang.liang@starfivetech.com/

This part of the pinctrl has some special aspects:
1. adc0 and adc1 have different function select configurations.
2. Both adc0 and adc1 require 1 clock and 2 resets.
3. emmc only supports the input-debounce-ns pin configuration.
4. The drive-strength supported by adc0, adc1, and vga has 8 selectable values.

Changhuang Liang (8):
  dt-bindings: pinctrl: Add starfive,jhb100-adc0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 adc0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-adc1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 adc1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-emmc-pinctrl
  pinctrl: starfive: Add StarFive JHB100 emmc controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-vga-pinctrl
  pinctrl: starfive: Add StarFive JHB100 vga controller driver

 .../pinctrl/starfive,jhb100-adc0-pinctrl.yaml | 168 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-adc1-pinctrl.yaml | 168 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-emmc-pinctrl.yaml | 129 ++++++++++++++
 .../pinctrl/starfive,jhb100-vga-pinctrl.yaml  | 163 +++++++++++++++++
 drivers/pinctrl/starfive/Kconfig              |  44 +++++
 drivers/pinctrl/starfive/Makefile             |   4 +
 .../starfive/pinctrl-starfive-jhb100-adc0.c   |  85 +++++++++
 .../starfive/pinctrl-starfive-jhb100-adc1.c   |  85 +++++++++
 .../starfive/pinctrl-starfive-jhb100-emmc.c   |  77 ++++++++
 .../starfive/pinctrl-starfive-jhb100-vga.c    |  86 +++++++++
 10 files changed, 1009 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-vga-pinctrl.yaml
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c

--
2.25.1
