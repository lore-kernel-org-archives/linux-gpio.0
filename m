Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2099.outbound.protection.partner.outlook.cn [139.219.17.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF2175A5;
	Sat, 29 Aug 2026 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974237; cv=fail; b=RbmQfwSGIrl+Fxtcu9Wygn9g1kuQ4u90OdZHqzjWuhMHCGR8ZmrTSCiRXp2xg0hX3AyamN65UxgIiKv64UxB2BfMTmYwR/on8HdwgYO9cBZZlz4rRa7+IWimM2aFBG22JyOaNrdc30Pt+kCxdnhfQ7NVm57P6dMtA8XkqRO37V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974237; c=relaxed/simple;
	bh=BeWjHVTsYDWmvm2zOdyAaWqqLXHj5K4LL/o9tYPTMxI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QlmXcFv/is/fl9NzXv18Uk2drlG6eJ7h63+kAmJdCAwRglpDmB7aYEokhgS4cGVSGHkzFKSJXmKH18tZKAjWQRs7CZYZAcQNBXRH6DtG06RF2g2HwCRfrOcX8/9hGoG51jKstLRa6PrBxnVwG5B4xTF+hXnYsf8Lci6/2pyRPkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvMQGkcA8KnS/bGN2z012LqCZEIPVYavGpcAx9HMRmJQtLyPVZxUxKLzWUZGbcwCWwQs2Zgavd9qoImo5eMIlX5oSdjCq9Fx/JZRRsSABXJAR1gsxz+cd4lC3JBg2i13fgWArMul4RCLXcZ3iYYD9x92P7h+mg+xRJbXOj9B9QP3+GSik10wKe8+CpGOoQU7W0zPn8QkPTEuds4G7xdYLRg4jyMpiJLAnjIJZigZ6/gA3gYnfpSm8BF017Wicre3TNtQgsHtO2ShUwLH51Fu8RaYOSfy/UGCViOUeCb/iMUYw6ctB6sIWhmPDjw3smRIJ7oDVHufRkvYiuGJwmIL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUtu7YnYC1qAgFyNwkrndssoXJreMrWGgh00qG2/teE=;
 b=gnuzPZYaA5kUtie7z9Ey139ajR7ZWgy98g8E/FXPWLNyRavA1NGs0plu0mSZClMYrsBgrhjxdXTU1M1A0Mb84+kf4tu2Bzeef/BrCxhHtfTGtH7wAdWIDRO/+6GLHzre1NCfxI9uDeTPTnWUaaSBEx9uvfaU4SYLVSFi8sNsWq4thScNoV5HfIVJ2jxk1BRHoV2adS5NHBk/j5x/eZGpr50mDTEe2pp3oVUrM3zNx4CrK4SZWi+kDgJ2HJEdLielimxBfi3NwnnMNr7Libzznqclhwz72V4tF8IOl90YOLMaByKKgZVycIbDzBdPoYc85i3xB2xp5SW4osnXgw6NJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:33 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:33 +0000
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
Subject: [PATCH v6 00/21] Add basic pinctrl drivers for JHB100 SoC
Date: Fri, 28 Aug 2026 19:56:59 -0700
Message-Id: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn (10.2.8.16)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a60a69-6717-4b93-f6c9-08df057945da
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|18002099003|56012099006|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	BkmzntWNqavWKXriJRrobbaWfmOUVrKUrhU9QkG9Fl2apDtMdWRN6NLyBOC+8v1BWJNIqdSkaJhIZ2+nYeZA0PCr31hDcBS36otkoCeUBXPCZ2fkPV1SwBOyzoFRG6eh12xWnwR8NmybImrKLWm19Zb3AY8xV3PeB2XhObRB+U+UW5luic7wB8KbxCXP1TIKsedw7i/rnjImeuX8ffW1q24tvqkhmUtS+libRhOM1feT2YK8xI6GQ5c6MfYh14bG32nhMBGv9VwHYtjhytMmPoIUtjZuVDuhOEQVKNVLKOuOON+rnl1YTK24xSVUj79j7pMdXN/e29uXu2RjcZMuPBvlx7vyUSxFo9/oc9ogefkbJFVt2lI9ql9FbgbnKILLDmXfRx3Z3upCxHyR/aMabKnD3EAWaKdvFN/Tik66vulcYiGKyyGFSil6F1uTH8gLRrNMwxKNCUfCfhBDBThZgjFvdtfzk8SjqHT5sFrk8TU5oDVRFwaTMJYEc7DuYNYsuCMGXE5fQnZh7kpxUfUOvoIbVYsGWyOfpHsrPV4vC2tB6dK3ZiE1BFIQcH7nO6/jnn1c2jqcjXmRND2Vybp9Og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(18002099003)(56012099006)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9j476ZVvMf8meRZ/QSCoJFRUb8um1tuYYV4GMEwN3KDvO9ARXSd7L9V8Slbt?=
 =?us-ascii?Q?2Cpy333BP6EOyZuHCgPx9aftdvZyPGsZbejPP0LHAj96hA+FILkk/IY3rxXg?=
 =?us-ascii?Q?ds4IlNsOnIWp5+K3mBqxH2FG9ewcy2mrmdX/a1VusjPiYSZkNFkoxG8xtlP+?=
 =?us-ascii?Q?MbPYIqDSy0PwOCq99JBrxSTpMHPbk9Rv4Q1j8Y7/0uas8MHfoGsFe46+IUWL?=
 =?us-ascii?Q?xH6tHH7CNSHMhv68hmGmReVyFLqHoOHPH8i+ECbqt5A4yyxkEaprp0CWrt9c?=
 =?us-ascii?Q?lTYg62vlWLGNK+1St5PpB5+0SO+5vfm5an1IiIkMyUboQMUv6wZ/RYevXFL8?=
 =?us-ascii?Q?o5KIjY6jI40nP0c9AgAKAwra6URv1HeOVod5ykYoNVGrnu0gTaIGqS8Xfd2K?=
 =?us-ascii?Q?d+x3kq0yZvcy2n3JrrCLs1JY1eyEOspTZkSraBuSyeZlCKEd8n3jiGen8YOc?=
 =?us-ascii?Q?se50ynsff+l3iGpLPt3lodbK3LCZREJKawl2NIdj16ztNGk3cb+R44E041v8?=
 =?us-ascii?Q?/gs/wkT//julpGsFv3nCeAm3TgyQKiqvavOTPbH0qWXJbjtXSYNBupwk2l1f?=
 =?us-ascii?Q?/Fz6KLDhzNOg0n7Ji+07wsnSFbQOVfhj+058ap/myxgZlwByyWc45fXFsxk1?=
 =?us-ascii?Q?m53kKvcx5144YjhgncBPTyQAaZMNbx7oiSwbcqqqKzSBxN6lPUgET/G3YHXm?=
 =?us-ascii?Q?RVbjAHDurhCB8Jvfb65Jnp797YNnPKeMHcXXPC8q7HVm43MBIZ+2kk8FupJk?=
 =?us-ascii?Q?hpSG+wCTuLB2Of2QwLl6INy47DNoFo+aUAHXok8Ooz5KvifUom3YVZ+KISU2?=
 =?us-ascii?Q?faQympwEWvbgivsV8fDjbuBXrXatckq+PSIASGQEyYKvcrEnwDkolABo+ghE?=
 =?us-ascii?Q?UX1VRIf5YQcEJ/DF3h6tQcJp4G7gyvwSnT8MdGyaJl30SRp22exTawPUfln8?=
 =?us-ascii?Q?jy4S1uWxDs88mhI0udWx1cRqNdPy90EjwJ/slYHPb+aa6046OFfswiGEvy20?=
 =?us-ascii?Q?UYeM1ibX9U11N2xb3dzE6jQ6cU5Hl4WlbODCyz3aNop4RuuzkmeyyzCFUx5m?=
 =?us-ascii?Q?V1w5qrU+Hy5izNkM4eO9PJ6e75bwIzX94pf8mJ4cGWqqhUjcTXcHYYewZ8pv?=
 =?us-ascii?Q?59bXBncTSFymaBdv2pDUjVetKOpf5r2u46j2cPMgYvXEYevZCwU+7l9kbz2P?=
 =?us-ascii?Q?x+8CGU5dvKd3ujfDyuQIRYXJieI3K020Pv4qG5hEpE934LPHdSo5NMAMgz+u?=
 =?us-ascii?Q?MhO8/uQUrhxkkLrhGvC8TF8N9Z19gfUXlmeQi/4EA+QprACL1D8ijJKG49Rj?=
 =?us-ascii?Q?FwSqWk3ILLK0TxcJmlc47Wtq6VZUkpc+g1dS57XM0bvimHFaleLIwx4miHPZ?=
 =?us-ascii?Q?yHEN4CLtajm2okYJUMFLj6GPp8QoZOwVSyRqZBqgY3QiU4WTwLgEfvy1tPGO?=
 =?us-ascii?Q?TYwhss8Q+9c+wJX3raRt7NdR/uaX4u3EHfuOdS5kwLS3l1AJlZROxGaVyEj6?=
 =?us-ascii?Q?RqwOo0aL6tzqB+7KrXkZPw63ETnYnVpTXa7DHLECOkpHROJlq1rObfgh8nA3?=
 =?us-ascii?Q?WWOiKY2YCZXyft5TsRgfPY0o5q2pfNQz/VM85BVG9aTXA2mQnlKWYhPZOPyt?=
 =?us-ascii?Q?oeuPWuhbkrlCSL9OXfv9b5yeL3kYZ0UWZ/n5cESKrN+Ayinc6H5+DsxTQ0GB?=
 =?us-ascii?Q?GZv9Wbray1sci4nbXJi0Sn5AQJ3Uga2buJKZAIm5kq5l3f02XPPsNJEaQi5v?=
 =?us-ascii?Q?5gO9qH+AW9WStyoGMOdVnSyzoa8/aMnWKo9sibR35FI1TeB2llKz?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a60a69-6717-4b93-f6c9-08df057945da
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:33.2775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSUoPZUDb/F4KFbyWi598tINErIBIc4pKBpu0t07I6cc2xAMxU2iNtC3wNnRQMBAuFksXLhWeRBfu7jxPqOIWW+TR9hqLGngaDG29gFsHP1hvkop7rvoBAL/V9WvmVAn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

I kept devm_reset_control_array_get_optional_shared() because the
pinctrl_adc to be added later will have two reset lines, and one
will be shared with the ADC.

Change since v5:
PATCH 3/5/7/9/11/13/15/17/19:
- Update commit messages.

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
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  180 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  179 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  168 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  162 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  166 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  164 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  162 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  164 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  166 ++
 MAINTAINERS                                   |    9 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |    3 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |   23 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  110 ++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/starfive/Kconfig              |  108 ++
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
 .../starfive/pinctrl-starfive-jhb100.c        | 1456 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  159 ++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  247 +++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 30 files changed, 4739 insertions(+)
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
