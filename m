Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D43480353;
	Sat, 17 Oct 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231231; cv=fail; b=Bw3AwjljI+V/Z4fIA2i6+hpxbX7XatLMiSAcho5rIyJ98xmMqzTmGrTtnmqgHKOmmNV7O+FYNTJGwlJNshUdRu1s47MgTZp06gYAZYjoa54jLZlLEX80N+IVjrFsc5ZgvYv50rCUn/AcauVFVRUy0Ept5jWzb+Lfu/7MGNTsgGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231231; c=relaxed/simple;
	bh=rqfWz8mnuTu3icpkMoIFaj5SFFde6Czm29C2y/JGP7o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=X3LTMWXyaCo6s4SiFi1uujEiJfl1uVmFWGVq4L/ZM3YD6AE1Kn+DTu4AAbMd7ZQxRd0pqPaETgQpvhY4d2bLRRcfDbDzrNOaUecFhJJwp6A6c+Vu5DBo3QU9sSa488bbEGnrPpa+kq13kpX9aascFjj0IgyutHRVtsBCgVXH6KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnh9D/U9gGF5RF+qcrZNocKQIX2xMtSz2uLHz5dHZowcUOxEapsNedjWwRpM1xguFYeVYRKISthX0D6JImk2/gyJ9DBaTsAyI8VuN+5LPT55gyXslZ6Ga2rAoRHI0OXgvBEirsxlsxA5cKb9hIWUuR0kaeojjJGsKj1FUmtFTb/NDPA+tUtNf5acRnfOKvqwRZZfDEW4jeoHMkZw7NfO5fr9HjQcHj/K6UYE3QBBK5X0vc8JdRjSdxJaHYTYh2ZCOiO4OQf9HrqM3esAD68rbyt9+fepqIRYfKJXqMkg0upDgyP1UIQvWBgPRT3raBxtX+16XuQ7pQeZ0hgF2yDhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGI47VyFxzWFs01bJ2NEHSW1CMfTAtTqTQtvXRA+cVo=;
 b=mgQbQMCVosUk583TExD8dOfxs5mWn1ZDmHyjppFcc/IaXxX7rdwavFE7mfc4tScZbtbb7syiEbctqQRLOB11pF9WCsUu2CYbIm0Keb+HdJOo9eRr9V3+fqqxGg90W9TqZXb4CiZ2h3wI6aMPx+ZN8QjdY03HFDbLJiwMxQNJjRAt0uy9WmslSkhL/V+XWdDQkyNlfaEBm3wGQvGMg8csNuNs9wPb/d99EQyXEEG3mlPMNc9RPk48W5H/vMcewLdElexc7mtX+1CG+J9PhnSdJYCxP2wxlNtR9LzeyyhWECzOmuLsue01q0pyAz4ps6Cq/pso7JDkpGqUlY+qgG2NOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:42 +0000
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
Subject: [PATCH v1 0/8] Add ADC, eMMC and VGA pinctrl for StarFive JHB100 SoC
Date: Fri, 16 Oct 2026 22:25:26 -0700
Message-Id: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e31f80-7d27-4fff-66d5-08df2c0f1689
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UzUTIxCb6MsdFn6vgcnBwvr6vCTkhjoS1Xzohmegb3s2ZA5S8M3ayBc9TWFwpDOWcsi0UUxjInj6qVqJz6ZmyH1WkjBQCFJnFqOjYnVTj463YFEp6skl1YJzWVF0nshWlJ+qdcHiVJSI/w5aAHTMq85cQfO4qbkv7BZFk2YpSKwbyfNB2CABv/DpnACSQZW78PXVAXMnByM8ec6cBnjCO3tGfvOGFUsHBkrD58sRX6JmshRFKW9cbZFPePqa32kgeoTX/fmfmtxdqiZf/h9dLRSPBwWYONE0kQFuPjcAlhbebG7e//8etIkvLBgCaXxtU8iveR1TdbzAs1fVCA5xzvbuhbSaYi2as1AmKxytTcuabPnZSqFztNPhoqVMwMT4EZPkq3InZoU1ian5Kzboc1ofzUp2c8v2F39ApJrwMPZAtwnqurFNvsyopyZib0lpwD7jQYvKc6WZwJVTr0NTOqgWIqHvJXn8oBv/pLrCTU5sYnIZZMEVCVmzOYs+f4kc7pOZQ+h9jrVKgI1wQw68WpLlUTza0k/Qd1n9eAN/x/TJfPsiMVp9WQpvcWxEiJhc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AZtOqGn1gM0g0hz5ofLAeAZ8xKqczOv5OfNzQykdXVq04BZGDZ9lHTT0+gPp?=
 =?us-ascii?Q?Sr0dN+z285rBtdhw/u0fehkCI6gIncsrxPx6dyxnyG9LMCHStBwaW/CM6uGR?=
 =?us-ascii?Q?luLTxalBlma7c55DYZSASIzCEeUm4Qp90IpYPSrj64t9W638AF9syZ4uuYml?=
 =?us-ascii?Q?MkKZUJq+JwWXH0XqlHq5qarMuM9UeA/O/7SLSrJy0wStUpJF22MgjNR6b7g+?=
 =?us-ascii?Q?9LCYp+H2IyAlcTt/4IP6cQ5V0uEcvHeZRe+z3MQLobhx/yZ1MBBMK5le7Ppk?=
 =?us-ascii?Q?vBC1qWKNzIoNNzSJzua00l4A17ReywfIx2eH5XkNvyYXGqBdHTBbujhnb1nw?=
 =?us-ascii?Q?zChJxXP5f+12ZOpCa5a5EMCU41alqKcZ9zdf3HncXrc7iBY0u92SNfAwLP43?=
 =?us-ascii?Q?c5JVCb3gMPYIH25WwHmWbEytyVY0lhUWiZa2yzBs4Y1KTfTtIE9VjJc6GR+K?=
 =?us-ascii?Q?lUOkWrvTZZlAO2LFIyARNx61vCKZZSkqtJRZKxP1E6FlJ7V1PU2CnvawCGEZ?=
 =?us-ascii?Q?cbW1s1Je/2IrqincNhFmzNyv4/ycFUbu/VQc3QDhHVxSGKAxsR9v/RCmtY36?=
 =?us-ascii?Q?FM+DQtNSUWbcyaiV6ccjmxKK8j3xdTCLA3x5IN+ANmZANvi0qvEEVH9fGsQT?=
 =?us-ascii?Q?0y1TxyvJxADb2Bjl5HYTSYFwiAZ3E/UnHDpO7vPTdbCDjRZIPAgy/ElsouYr?=
 =?us-ascii?Q?WLyCzPTn5h49B+sblH/3+0AsBo2pFWWafm3qn3VjL0agJH1MRlXE0as4mkYw?=
 =?us-ascii?Q?A6SwsOMpT0ua5judtXKMARceI3avuyH+d2mAwtuVQiaew7qXgIZ6GXMQUnFP?=
 =?us-ascii?Q?dWHicBsr0h6GS1x/h1LCzjaIF4siTc/4rj1hdFozCm4/rgNRLGTWcM1f0yDn?=
 =?us-ascii?Q?zPPmx8lRJQKl4uhjD8ja4a9igX3AdOUmNqIg7LwhjSqeoNT9ENSM+Aptq7Q1?=
 =?us-ascii?Q?bwSyWs07cPa7WhxVju3bvgXCG4RyA7aNdGi95CneePAaM357tM4O/CoIuHNV?=
 =?us-ascii?Q?uWGeKzDWR5jWXs7TuxzbwkSUnLM+iUWwF6dw2je//QoNf3ek2Ihm5RCarEl8?=
 =?us-ascii?Q?yF2EHZuEYxwcaOrTcpZbA2S4Uea5jWOhRYmpoM0250w7iBF56qR3wu0FObuD?=
 =?us-ascii?Q?iDsA/WVCuBRpR+EiP6aE55IahAI0x5SASk6DeVxOGfjvVh5WVAWfhAmJ5d9f?=
 =?us-ascii?Q?wqEOiGT4fUVtW3QnU5RJvOUI9dpsPlO9xeQZipxlcIAX9hWBQvkEIJg7PziJ?=
 =?us-ascii?Q?iC6z9l6cncHmofu+jXHL53eXHrARIuNA+aF/gTS5y2EHBOV2o2NiW53QtuwE?=
 =?us-ascii?Q?VY/brmIm3zG50qhgKgWvW/d0rYkX3Mft7BBJw9z8ptttr4G2KbwyAFXQuc5l?=
 =?us-ascii?Q?eYY9FYYRyBgL9VFUnUSAcj1f43NzW+o4CUt6Q8+D3ehBLf8HA4H/AHarBBlt?=
 =?us-ascii?Q?kSSzS/vQf9fb5KFgm51lmaRC5Wd5rcp+PuIj7BUXMhdD3zQstLq0saG2HeaZ?=
 =?us-ascii?Q?MaBut4KM6NNAwRbazEv5/F6oodZ8rPKTGRrlIZxXtrki0jyY8wVNoHGDGKRw?=
 =?us-ascii?Q?nm/BTPUO1zMMOfevY4FGST9B09d4Hx6HEf7j4A3nToby4sN5XjGZCmflmXst?=
 =?us-ascii?Q?hBS4FTNFenoofq1dUYQwZxT97VVI4N6AhVVhqG+NJ61VjonFbHhTaehKu7hB?=
 =?us-ascii?Q?rnLqJU1SBksOaP+qFLog391d5kzpyup2VCfv7hcdy6DliiBwDEToTePxBlTS?=
 =?us-ascii?Q?U8SMYFbleDtDz7YOwyqqbnaGd4/9cPDs1Az1Xzhc/UgF/WZ9nCMO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e31f80-7d27-4fff-66d5-08df2c0f1689
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:42.5074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOeUSb26i+NGjeqjxOu07aYf+qY3x2+y2JbsheSqgMsHBvidIN9WfVdjyO7t3FGx/70GkLsSCkrLECBQc1v/jDiGydSvEyKITce18j3g0ciFmT+kyTdQbbwSEacvtHxl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

Series [1] completed the submission of the first 9 domains; the current series
provides pinctrl implementation support for the remaining parts.

[1]: https://lore.kernel.org/all/20260910100357.130134-1-changhuang.liang@starfivetech.com/

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
