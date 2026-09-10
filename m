Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33FC3AE18A;
	Thu, 10 Sep 2026 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034669; cv=fail; b=KQcYKlHuJSdNt44f+LkOUsn/nS6edeF7jWzY2cyI7zXw7T3VgX8iVI1/KjquKOdVGx52uvNjJ1MEOyKR7AiAiwt10qGa3wX3QnyU47pZETmgA93sce9quS+oOKwsDQlc5wzX1P3b2+wW/RvOKMW7gnKfewsCE3H58ClnjW6zFgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034669; c=relaxed/simple;
	bh=UCJ9QNgqf7DZ446bIlwaWxt4eW1hU8giwzGqrs5ways=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UAAkMwVTFWcRAl0yYbd5zk2YJgbUIMKUAgxv/yHLabm5Hd8HUhztrYUELb++NbFFeIgUZc0NCS93HJmTWZf0xoJYT4RLCcSfritB7rA+dhz4HOTdO8gsT7jYso2ypLVNuN8HOS9QnJn1B0/Lf3lgX+B/JcwsqJuk22tMPj7a8u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL0t0a6w/xTOm9fplLLDJi1K+jYgIzWQ5tsodsd+slpXTdnHh+MO46r1mF8g9eMz4rVJN8tw8YAMzkijEAMr4BWgmXxeEUI7jeHhAY8l/txJ7ItWOfvlnwq3fI+ELgPBJNJT+l7kTF2+LFGlET5X/1ppLPMVTDVoSIjXMHliynT+Fi9igGc8L0JT3CDIr+0mNBPKn1blla9zBEuurAKwwBkTjoklSm78jimy5Rxepe/dxKaX2NoATAWDOasTKPxd0L5ACHTbIB2+sN280BHR3OnhEMlBeIhQu7pyNW4F4TpdheHbXio2WGgoifXi5k5S8rmM2FVRTsFWZY3/dd38Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdDpd2HZ9sxk5Pac91US6gyd5lUb/s//Y3TQnwqc2KU=;
 b=YyT600gv8TN0l3po5SohPew0EboTuFPiXTQKPEo+PL1f0AKIBXjcx52uX9hd8+y0yMzNi6VVTJZx0RINXed1nxsxyruPONYSrqfa5IWiDajP6lvnDNCWqYKM8Ks0A/w3MeOtFVk5ociP6PO0zT0VbznI3B6ncKy0SmJ8Dv3+xMpk37TmfcDOJOg/qJzpsTvqcP/A/SA6CCKMcx66ao1rqlSoO7pyWd+GorCjeq7SnfD1qTR5EJOuJ20UKEvWOZiA3azk+32Erm3lv0QMDUQXHcU6dKdg8MetfVQVzva/b/eZ8f6ojSHa83f8k1OBUFXtT5YgAoLLi2I4ObKHgr4c7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:09 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:09 +0000
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
Subject: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
Date: Thu, 10 Sep 2026 03:03:35 -0700
Message-Id: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: ca40df03-4852-4cbc-4e89-08df0f22db43
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|56012099006|10067099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	++uJwwSnt+ehsZfKaRKVNaxIc5Mp0lcHwvdHSd+zUS/nxONYouqf3T12aXGHUZ3B+aytBVLAgDwoAVXBdOL+Hnidn4YqIMZSfsChbbviQoM+fVtsE/ZeyUazIPlS1IqlLHAz0hLtTJoqMwcle13Z+A8+VoBEbZtB17FOEolFNldLSGW2Ti94imGHee7pcuXVmGZqouIRW/zSltmyiqmNFnKNZjrsgkIApzya7Bm4/gAVe9jwG4wYb0LG7JMypRsKIjqvNdxN1A7HxxSWO3FcrvkDoneRidvst/TsoxurFrimcT61ioaamzLkRJF1GgVi9sAxd/EQdg4yFm9BzNxS1sL3AQ/3s9zWiBtFfQ1B1lOmChd3iqqOvnL0UDk1GGXnUlRZqLSOPTnBvQ62NEsDH+sA5GmVkSGdyY7zXr8ODj/QDbrz1hA8sVChBjXJLh10w76Pfm6769mYJozloRGE0hjEzNb76uisqZlvTdXoG2OaiXVLCSydZAGRiXBig3N+YP7AITkReXuJ1pYgz/2OIBseiDw/QdCLEl5UsDaps+wtFFhKW25GkaKBlgJpn2aT6ToCuMWdKLxJkrSgD0fqkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(56012099006)(10067099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HEI9tFVnQCxCCSc7iMMtwJcDmdS1bYZkBRGrCDi/yAwDuqs7SMe00aagoUli?=
 =?us-ascii?Q?bpENJJqFlfmoxcFmvlXTujPAhos9xRVvEkixwTbu47gLRX13hFhh/k0GtDBS?=
 =?us-ascii?Q?eEF51s2fRxkYH13mFoRTD+Zq/xqFb4iwu0Tf2Mv+ABi3fgjIa1WxI9BcwA00?=
 =?us-ascii?Q?uLK+2c57eYawmJnXcjw+zDaGLSxkAac2XK5o4PKo+jqEo83OjOL3VRePPdah?=
 =?us-ascii?Q?H4yOkjabJshP7b1+oTcYD8rCA5xvWuQz/qtNoacz95WyWacbrDwi4lrtk65/?=
 =?us-ascii?Q?NnS2wP/qF1zDJULOtSf+OyCBWclm4nmy7LxNlsTYPLPC5jC9hcMOWClIjK7v?=
 =?us-ascii?Q?Gbj0c0vo9Kc9q8U92rytqJg68Lo8drzCSE7OWwnathYbBSyryg6e3ymAmjT5?=
 =?us-ascii?Q?yNjA5fyYJ1vKuj6xyqz1PXE39G5+2LS2UuZ3lGbalCkxLSgGW6olL/z2qHos?=
 =?us-ascii?Q?3uwinmlDIblFZASzQvGxIVDo2pidX+jcaEqU6+PaLjOXtPQWamlpHtuXX4ue?=
 =?us-ascii?Q?YqMW5xl7UN0v1Q+H9X0od3ebfIiPU9ZXEoZ1ZYWAmyogmkIfwD0Ukbllh5Ek?=
 =?us-ascii?Q?XJ6oGOchaMnq3F7+qrWIPcNgOnj79Ig0NtYX4X51vQ4Y/5VhRrrXAQHfkFdE?=
 =?us-ascii?Q?mdNeKLOZDZLr2NuhHJz3TZ513mkQlhK0I81CUXPIZlU0lwHegPeQ19dDXsT4?=
 =?us-ascii?Q?lgp0ngExifhmXWZH5cm6mwUu0naRs29sh+aG97DD+tsTDjntzMZZeoq0xDwC?=
 =?us-ascii?Q?K/eOdnRVuIPI/5REaG5wr8ZOWq5zxIa/fJKG59sPNugd07b8tvHc9flQKoSM?=
 =?us-ascii?Q?PzVWfKtkyJ43JJ/QoK22L37o5WI9rSFAMh3qcyK1FVzIGLI46iuZbc9kxNZE?=
 =?us-ascii?Q?BtgwVTlZyiubWCmaBIQgZYeEolkHnkr/jLX3BXYhupyxKO/YGaBu5fBxSB2f?=
 =?us-ascii?Q?9Qr7hU5VNECwImWtgYY+BfmobR2kxtHj1/5yGoXkX8/f1xqeE0t7LlVN1IZP?=
 =?us-ascii?Q?IBa7gyx7c6B5oohVxgUVnVCRwsMMSfFNJf+/rEu/cIdLPheYTkBTPZlWLz4i?=
 =?us-ascii?Q?pLmG0VMZfeTSXvWPdG4v3+pYz69vMVvmFD1JyQmM1rFTYHu7Z6CoxcuMY78G?=
 =?us-ascii?Q?oUL3K1oxUEjI25Z848/N7to68sQMdHpRNem5P7coYUUN6J5HbpB6GUP2TIzj?=
 =?us-ascii?Q?oqxNOoe8SUuMNYbynppffSsYwQut5gKFJ38TvQJTtS7fXtJveAM1E+UiKsoA?=
 =?us-ascii?Q?Qoz51wdHFU3iaQxGn4nuuRCEb78CZ+ddZhj/RzLXzeJzEULYcvIw1ynJyDBG?=
 =?us-ascii?Q?cnwsh4mDYMBv/+bjlkekVqIa9xMLWwhN/0Gi9g57h2HJV6bTjJnGjyfF9eS3?=
 =?us-ascii?Q?YuJeRfFxJDS8kps8E6KJgr3nEqnLoP+xh9J5+AQYg0HqmzigUTY9XPF2WT5E?=
 =?us-ascii?Q?Hprz0urPz/o0y7JCOX8hOrXg0gOON2aO2kEVEQUavfADn7W5pQnlEL+EHhh/?=
 =?us-ascii?Q?8hQ5EUZAfEd85MUqiWNzfhzhIX4eFuNqFTetlNp/SwnbQalA1CpyPAIIO4in?=
 =?us-ascii?Q?fBDz82UbR+RcuJsr2vM59ljRmQEvKax7bkAypkb6ZylLWJff3Kaxws1fNtKm?=
 =?us-ascii?Q?26IRvyJDGH1ikA7Rd97R3YdEgmrqxex5dErw6KjgkkIamvzlMr/21nEdqraJ?=
 =?us-ascii?Q?eQgxtUU/xFoHapVOkXMMx4jb1SOFIrztaXl2qQtdCO/HEEJXaBoRNM7Wiw6d?=
 =?us-ascii?Q?2OBlHrdSTKjBu2VkE7Xh1+lmRqXbWpV4jl6uu6DB2e6lwrOcvPPT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca40df03-4852-4cbc-4e89-08df0f22db43
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:09.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkzLfyRHb2/cuFuhibqb2WRLlqGRRlKk2AV3JeeVtISz+R/qvCJs8g5ntTlCvZbwPyTn/LScNF8K6MS46AuMDyG8hLjW8D+CS6jQX0/glUCeHo8tu0fZ/rSnU+E7jZY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

Change since v7:
Add a new patch 21.

PATCH 3/5/7/9/11/13/15/17/19:
- Delete the file starfive,jhb100-pinctrl.h in the
  binding directory.

PATCH 4/6/8/9/10/12/14/16/18/20:
- Add definitions specific to .c files

v7: https://lore.kernel.org/all/20260831113514.66382-1-changhuang.liang@starfivetech.com/
v6: https://lore.kernel.org/all/20260829025720.23915-1-changhuang.liang@starfivetech.com/
v5: https://lore.kernel.org/all/20260810063650.239303-1-changhuang.liang@starfivetech.com/
v4: https://lore.kernel.org/all/20260801072711.153217-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260603055347.66845-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260514111218.94519-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260424111330.702272-1-changhuang.liang@starfivetech.com/

Changhuang Liang (22):
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
  riscv: dts: starfive: Add JHB100 pinctrl pad number header
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
 .../dts/starfive/starfive,jhb100-pinctrl.h    |  247 +++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/starfive/Kconfig              |  107 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  182 +++
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  193 +++
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  136 ++
 .../pinctrl-starfive-jhb100-per2pok.c         |   99 ++
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  129 ++
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  121 ++
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   99 ++
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   94 ++
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  140 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1446 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  153 ++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 30 files changed, 4825 insertions(+)
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
 create mode 100644 arch/riscv/boot/dts/starfive/starfive,jhb100-pinctrl.h
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

--
2.25.1
