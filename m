Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011056.outbound.protection.outlook.com [52.103.14.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BF7175A60;
	Sun, 26 Jul 2026 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082162; cv=fail; b=OR5a3grDc6Hk6FT/phDw2vcckIPZIO/Dvqw80C/AiZoopNz5XsswhUwFkAUuuEJ5SUK3wzlEyWOVe92PlpV5n3a8PQ4taayvpqSrXwmPInhtSE2SfcpC83LIlV/hd39TE7cm3umskBeFCgMJWZ9sf8tG3o3KAQph/NWXcq5KQdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082162; c=relaxed/simple;
	bh=rZw+/CvZu11YJ89b8LrMGWyLergCGvn2wKhpnhCrYYc=;
	h=Message-ID:From:To:Cc:Date:Subject:Content-Type:MIME-Version; b=pOHWQfm+xztMUcXgfnfXOLr7wn0Y42vJ94XfBuSf/pUSC9CsYjt8hQErzBZQwzd5yLB2BVtxAEt3A5rwo0VpdcpvIEJ7S93PNczCLxlTh7t/08JLu23chpUzHk7EINLhHjYI72AARy2p/rRZT6SZKeKQwF3cjH8JbUooFoqHzdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UYn7uwhz; arc=fail smtp.client-ip=52.103.14.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UYn7uwhz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIVK6gDWwoAas/92BSQKVmkojJLItbePb/lqnbVy6+K/JPbokNxQQOKhjK6o5pwP0YfO1icHii+R3g9KGjhMG7ovvMPIWLpnNXT0Euf/ZsE2/Say3vPUFhUykuaUPUhaPPgWPHppt2qrecs4axSXpX93oMFNvoXsJWtlCQNFCHaLEu7+un5J+cV3nBknXS3QxQagd8ZaGqsZ0vvTfeb8X/WZiWKcNCOP1QTpMFd1FkMTT+tIIkh5Qa+jGvqBMbF4fg/KTyDJIlArc79TMUFQ9Y9EsvpstODSBoGQX5PgLUc6K8UiTxPiH8pTzsjhtflCIlW6QN9lUgn4ahO0qtnGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vArjTketORLFw/mEFoHRTUMDuuTy+s9AMGsjWG+05BA=;
 b=Cq/jS2CQMP2LW1JtxBpDgwLiyUtbeqBe8y220HUembCMKpMoxfW+rXo1ZtxYP3i6Rg26O5d05jGs5ClU55tJ99cA1AgauBbCBomfTpUS45ENQVjwXy6p+r6sEUf8uHduxMy8mmOgqjcUkJAtCUiQuVneaL1zZdL2oItkMlWorXr0f46fgJBE538/9CQmC3i55v2xCYTvh5KpAksC7HLN/vufXAWks4F3iBKhuQ9nOSEKw108SSvJboNhqpDrGnA69jysZHRh+x420Q7ew/P9P28anMLQ+O1LFHqSn59lr4ts/gVbucGIY2HrAvyu4nbGtb43hahG76zWYCk3YfV5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vArjTketORLFw/mEFoHRTUMDuuTy+s9AMGsjWG+05BA=;
 b=UYn7uwhzw6YfNWcySCeTwS7PE+Lg+VSNfl6ZKEXYYwLqmNky0ZhPIwI0KJR2bhahfpxYjZnwbh/qsCEXpfkSJhOgQLO6k+MXchvRZMVP3ldY3VWtAkayo+/N7I1V2G6NXT14xBoty1hktpZPgNoo4N4HSobuHupFfcjIGNe2y+M94+w7TCEjxPF3fXRIgf0wmMOEb3mF1X8o1e3yGQr0C/rJB+AyhK7OwW0tWXa7eeT2FQBGNoKJg+XpB3VWpcb9nU4DG1rOS4Z1nrFEnrvfIeeImtiygQ5BZSI7eLfP1s92866cRJ7ibFe8jw6pdIZek67OM62vcjj+oCElqLH/Kw==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:18 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:18 +0000
Message-ID:
 <MN0PR19MB60913319D62A6F78F6EFFAFEACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, mfd@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Sun, 26 Jul 2026 23:49:10 +0800
Subject: [PATCH 0/9] ARM: stm32: add STM32H7R7 and ART-Pi2 support
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <cover.1785080950.git.liucj1228@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: df180fe2-c094-45f6-0f0b-08deeb303f1c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|15080799012|23021999003|5072599009|4140399003|25010399006|16041099003|37011999003|5062599005|19110799012|8060799015|12121999013|3412199025|440099028|26104999009|53005399003|41105399003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5JpHw/v71BOCLWhRBFMYQI2UdBw25vOZIcltpRL7/KZiebsX5+MM6zfkHy90?=
 =?us-ascii?Q?6e9V0moM5Ft7wjYuwAM3PLEAfVhEuEffhfVZsTLmSiY8JMsBwgn+ZjSgdyLy?=
 =?us-ascii?Q?Mg9fuZ9BP7PUN+BqbXjKbP3pAAXLHDfcVjwyUV560tqlezFaqELSvSvdMzEc?=
 =?us-ascii?Q?2JoXfIkLY1suSwJLQVyyl9Av6zKut5WIJFk0QKvBvPFlhcdjyIXQ9sNyCAQW?=
 =?us-ascii?Q?kDJCJZWeYHaFsipqZKvWLdMI9cGQX1wFUt7oqhyKDng9EIKUGrOgdmTvPSKr?=
 =?us-ascii?Q?8p6L+xyph40U8hmCPkyQMYDqwXDWlQssceE/yte8Ch8ZuiLOYY5jsmmlp+7h?=
 =?us-ascii?Q?oWaPLlCYfE51xc0MXoIZY6YkREdNaJU2EoGBfDgbZmhYbnYKdFtLSk93+ZAt?=
 =?us-ascii?Q?/+ncYqIZb+e2AXec9BuVMeYmuJx+yb4OkdGgT1gHVsLrhIJL1Q5xiwOAz6BX?=
 =?us-ascii?Q?uuDDedLzLK5B9GFQ338JFXrjpmiQ8OzosjUnfOcAO4q+CLYCP2+Z/znVDqXe?=
 =?us-ascii?Q?lICtpDuY2dOzlJi3Y8PbIa3xXirrLEUT0xsnND4OezBySpIa1VNeWz96DS0t?=
 =?us-ascii?Q?KvzNqJkLRO50XVxhz1BdFdbO+VyaqS7r4fkQ8H8OTh9OeLfcKydIpCoWv//f?=
 =?us-ascii?Q?aNMclGhVhbHMAlIPR7bLuRcokUnyDYFjUryMuspQHFMRZpjWNtJeLw07cff8?=
 =?us-ascii?Q?Z6L8KFDe1Mn1uxLyq4RrfY7OBMSFqGTnyyN87eKDxCl+OB9fcbv/t03QpizC?=
 =?us-ascii?Q?KgYd9hPOZ1chCo559XuX0A3cnI9EACiRZPJYrDwnnetvEU2/m23IMgzn9vd0?=
 =?us-ascii?Q?AspkBryzkR9vuBAWFcYv8f3xd2euzBIiKXBr2FCbI4bnSSCrum6bqB2JNOLN?=
 =?us-ascii?Q?AGCL3A6IJn48QkjKuDKR1DY5PfhpOXW2cn5pg0jaHWm8byX+scA/6xTxd6Xz?=
 =?us-ascii?Q?Le3f6J5hCbe4JoNwc60FJwthnubsLpx1zcSfG5RPPTAm2ddsmKI29+5xnUQe?=
 =?us-ascii?Q?ko35BDpsS2RnkAVNib4T/3XF4Xu8cb7oSCwZdj7n4ayZ2EI21YoJIK8YQMeb?=
 =?us-ascii?Q?M9+MC8+sKs7qVsS7A6m3OPFbG3Wr5g=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GHJQZ4kJbUrn5HZ+QXY7lmx+oib3bizhIAOkFRknSfHqLiXKCxERMHO+lICW?=
 =?us-ascii?Q?hIVKuJLrcGsK895lPfxaxnQA268hE/ch4hVIY2UCAVrXKAKp/2tbZVBCi1y4?=
 =?us-ascii?Q?swp+jmfnjLK06xz3R/VdPReksRSMFKuaMHIsX9HTLS7vNhbMyStOQjm//CL3?=
 =?us-ascii?Q?IxcwngAs1q4MJOnyLB5cmh3rqOawjkfAzQmHHZWcsw/2LU9DYbP7zJ0L0sJr?=
 =?us-ascii?Q?5g31Yarn/4p5BzSAOA1C+45gweDcWLmlPAab8RNdM7q6I30+gHvoHje+9k8I?=
 =?us-ascii?Q?3xrm97JAjfqcVJ0P6brO1QvYQww5aUTewLW849q33ieh6TM0WsW1+pK/ovU+?=
 =?us-ascii?Q?6a4DMvrhAPX9Evk4EXpLrNAC15wQtjxgJDF8l098/xEZrgN3VHf+TaDtU1qd?=
 =?us-ascii?Q?aPGC1QxW5o/SkM2gPwYUFOrezj8mQipHrZQqRQ+4C6hNHy78rt8VSifiHgB4?=
 =?us-ascii?Q?C0d3ho2D5tiTffmTD0+M3hKKz5RNx62WhbfCTv5/27A0I5sm4NazzEmKFZrq?=
 =?us-ascii?Q?G50NdOds52IpGSPWScyO10BA/7fd6HBNj+Ht/0E8XCzows3cvljbKzG3Z9TJ?=
 =?us-ascii?Q?pbkbZ0h/dPhqJOiF/NL0mIbJtxvXi1qIvnEz6Oimmj3e4Y/sFyezNhiPLYmV?=
 =?us-ascii?Q?azluiiBaUche1v6nWxf/5Q7EALi7jvcfhPlLs0FrAcXkxKyOrz1Bpx4yBDIy?=
 =?us-ascii?Q?oH1Rx47sM5+aZdHANDIrKZMwlv8ulE5ef7/F9OleaHvuwf+u7svNTGV9ngp0?=
 =?us-ascii?Q?+A2Ga1GFEiw48QYA5OvapSdZW6epb0GRLekMrNGrLzubYK3+jeIcMYR5qY1p?=
 =?us-ascii?Q?Xtk+ZjVvvWWNfpLaunkReleuZy17bcIRi9BvYwRg0PtklJy+OfRsljA9658r?=
 =?us-ascii?Q?CnElLYpeNSfL1qDAA3Cmq9vb56pC3uugNZ09ASnLolXFjvNxhW7mvazKj31j?=
 =?us-ascii?Q?xjFBgmhJQmo1889gv5Q898Dqtc27HKahxw16PV2r/V9OaTp4VMhET+rxAnCz?=
 =?us-ascii?Q?y1BLiL0HzlY3qIpKZiGsPtQw9l/Bg1mqNiSj12CwkHx3ptZ1ZtXxBmKUX5Bd?=
 =?us-ascii?Q?q0lo1vwNA+7Dg+QG64Jqntb77Eqf2XP0GqkY92dTdy59mn1DnfI35HCuD7Ny?=
 =?us-ascii?Q?7njNjdMCOQwhqBEsZ9WeATr8SWZpd2elMQ+96XgKFg4aj2jrcKg+ayCsq8Cf?=
 =?us-ascii?Q?dsKUhZrzCWmGLp1CMYN62bPz4DXWFEkqTQCRU8r3jQGEgNYfZJGLyslgGlWn?=
 =?us-ascii?Q?YgGVyQxdO7xBnLBoz+dsoQSWjwjAf1OKcPZIeJ002hr012r4pgW9e9VdUptT?=
 =?us-ascii?Q?ZdgSv83hfqQ89jESOMCQHTsUmmPVw1zIjY/N+XpgbRDL1TgdZ0FmNAay240L?=
 =?us-ascii?Q?OXpok6eOzslN3ycuob9r/wUdXqph4b0W7V+udhRdTOKK+wPfCg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df180fe2-c094-45f6-0f0b-08deeb303f1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:18.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765

Add initial mainline support for the STM32H7R7 and the Ruiside ART-Pi2
development board.

The ART-Pi2 boots through first-stage firmware in the STM32 internal flash.
That firmware configures the PLLs and memory interfaces before Linux
executes in place from external XSPI NOR, with 32 MiB of HyperRAM used as
system RAM.  Reprogramming the PLLs from Linux could therefore stop the
instruction stream.

The RCC driver in this series intentionally reconstructs the active clock
rates from the firmware-programmed RCC registers.  It exposes the resulting
SYSCLK, bus, timer, UART and SDMMC clocks, while Linux owns only the
peripheral clock gates used by the initial device tree.  It also exposes
the RCC reset registers through the existing reset-simple driver.  The
first reset consumer is SDMMC1.

The pinctrl driver covers GPIOA-H and GPIOM-P, including the AF0 trace
functions described by the STM32H7RS pin-control data.  The board device
tree enables UART4, TIM5, twelve GPIO banks, two LEDs, the user button and
the four-bit SDMMC1 interface used by the microSD socket.  The socket has
no card detect signal connected to the MCU, so the board uses broken-cd.

ARM noMMU selects DMA_GLOBAL_POOL.  The board therefore reserves a 2 MiB
shared DMA pool for the SDMMC internal DMA descriptor and bounce buffer.
The pool is required before the mainline mmci-pl18x driver can probe.

Tested on an ART-Pi2:

- booted an XIP kernel from external NOR to a static-FLAT BusyBox
  userspace;
- detected 32 MiB of HyperRAM;
- used UART4 as early and normal console;
- used TIM5 as clockevent and clocksource;
- registered all twelve GPIO banks, both LEDs and the gpio-key input
  device;
- registered SDMMC1 through mmci-pl18x and detected a 59.5 GiB SDXC card;
- wrote a 1 MiB random file to an ext4 partition, synced, unmounted and
  remounted it, and verified identical SHA-256 hashes before deleting the
  test file and unmounting cleanly;
- exercised the SDMMC1 reset through the RCC reset controller;
- built the target DTB with CHECK_DTBS=y;
- passed dt-doc-validate for all four changed binding files and
  dt_binding_check for st,stm32-rcc.yaml;
- passed checkpatch and the local upstream preflight for all nine patches.

The test kernel kept the Cortex-M7 instruction and data caches disabled.
DMA coherency with the data cache enabled remains to be validated
separately.

The only dtbs_check diagnostic is the existing lack of a schema matching
"arm,cortex-m7".

Signed-off-by: Liu Changjie <liucj1228@outlook.com>

Liu Changjie (9):
  dt-bindings: arm: stm32: add Ruiside ART-Pi2
  dt-bindings: clock: stm32: add STM32H7RS RCC
  clk: stm32: add STM32H7RS RCC driver
  dt-bindings: pinctrl: stm32: add STM32H7RS
  pinctrl: stm32: add STM32H7RS support
  ARM: stm32: add STM32H7R7 platform support
  ARM: dts: stm32: add STM32H7R7 SoC
  ARM: dts: stm32: add Ruiside ART-Pi2 board
  ARM: stm32: document STM32H7R7 support

 Documentation/arch/arm/index.rst              |    1 +
 .../arch/arm/stm32/stm32h7r7-overview.rst     |   28 +
 .../devicetree/bindings/arm/stm32/stm32.yaml  |    3 +
 .../bindings/clock/st,stm32-rcc.yaml          |   73 +-
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |    7 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm/Kconfig.debug                        |   12 +
 arch/arm/boot/dts/st/Makefile                 |    1 +
 arch/arm/boot/dts/st/stm32h7r7.dtsi           |  255 +++
 arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts  |  100 +
 arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi   |   63 +
 arch/arm/include/debug/stm32.S                |    2 +-
 arch/arm/mach-stm32/Kconfig                   |    8 +
 arch/arm/mach-stm32/board-dt.c                |    1 +
 drivers/clk/Kconfig                           |    5 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-stm32h7rs.c                   |  466 +++++
 drivers/pinctrl/stm32/Kconfig                 |   11 +
 drivers/pinctrl/stm32/Makefile                |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32h7rs.c     | 1849 +++++++++++++++++
 include/dt-bindings/clock/stm32h7rs-clks.h    |   32 +
 include/dt-bindings/mfd/stm32h7rs-rcc.h       |   11 +
 22 files changed, 2916 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/arch/arm/stm32/stm32h7r7-overview.rst
 create mode 100644 arch/arm/boot/dts/st/stm32h7r7.dtsi
 create mode 100644 arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts
 create mode 100644 arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi
 create mode 100644 drivers/clk/clk-stm32h7rs.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32h7rs.c
 create mode 100644 include/dt-bindings/clock/stm32h7rs-clks.h
 create mode 100644 include/dt-bindings/mfd/stm32h7rs-rcc.h


base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
-- 
2.55.0
