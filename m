Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010003.outbound.protection.outlook.com [52.103.13.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F43ACA48;
	Sun, 26 Jul 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082406; cv=fail; b=Cm6+ZMDPcjXFI2+t9ikkNt6dgBurqo9GP/dxmE4sIR5i+3FMqz2p6V+YzYgF2Uac5+MPs7ag8FhoSvIYe4vG6Nj5/0yBppbkw+prIbFPAHvYqGsLlJS2NgaoDM5lBD2ezdSQH/+ria0hCxg+oJ37dFBBpF4InaAAULF4CYT5XyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082406; c=relaxed/simple;
	bh=L1HJt+IaBXK+X332l8qLb2F10VvlMmb+MTc7DqHMlgE=;
	h=Message-ID:From:To:Cc:Date:Subject:Content-Type:MIME-Version; b=XqSAD0QP0SYJf6GfCQOoLSQDg/Yn9/BwamrLNihSWhtLNAnsPfiwRqW4BEDWhBsbZadQYbMeh4GQ7UeDvKkb8gmyypFPn9gRhWWP6vAMr0hfYHhzlo+l+1xyyZ+SQ8FQaYD3VNQFrWajl1Km2clmev/H4zAW8z6twhGfjZE5sQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tt50AV2S; arc=fail smtp.client-ip=52.103.13.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tt50AV2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yM9RtSMFp1eFI5nSlC9VN+PlazRPehb+x6cTLx/+YWlGzK1qiUQQVgPPXJti02Rk5Ut+CX6ltD43ZxK5B/ZRKpVH/gxm1J+b+BQq8l9r6kLUkc5zHKTXw7vN76sJ4kJvk+kvnyUpRn9LCQwX880t3uB+0Hz8m07E4Fmyby+DobsCpSyGBqAtDvRK/OjHcUw7iBOPNxhSCQktHtDkm+C0PC0QIX7iT8ExL1DGk7//ptf6jSIImCzTQpLEQkddqkXBDjhKTi+vIhS8/AxXVW70mNdd+tF03TqMm2r1ToMPVECbuMCbehYgz0RP1aS4LK1Q91C8rzUgyo67Pb+vbyoqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ugGjUf29GeTiAKUEleGkJ5o8IrbMj+5aiaZWoisX0=;
 b=XfA/3KP8AUuXuA8m+slcQwAbwtGl/gbl0SgQhEo8XB8Zg/pzydmjKm58egM2xNeGCUj+/0eomrlEeQEVT6X47mZgIbjwCihtTO+t65caTRNGzQPF3P+tmkNAGus4SuVyrUtluF11GVNWRlu37tmtuLHIzvgqmCVrlJaw5TFoLo8PQOpyEwYl/I0fg9kEyspXoaj8W54NhUNaPsMWHo6rKNlzO1L3uleD6nMLIQTpF4Pe1UjWR+hKLCbS/bwe85qzJJlQoHbu27WeEoHzH0udzH5gjkIP7GXE7h4PzP8E3gCqYekF2L53N1cq/DakQsCSxhmXOVA232QYqdyLIIbiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6ugGjUf29GeTiAKUEleGkJ5o8IrbMj+5aiaZWoisX0=;
 b=tt50AV2SyjiU4tyiZ7DkBisoU26to03ec0G1AR5jBllORKaDnue7AwV7apRczFyhN/TjBOzqMOAsuP51KVSgbn+OVlKAJyfUytmMjQtHO021Hx+/od9h65kjQn24OPgad3XrCQkkKLXOyz1vSStoekjnUkxaHhRJcv/QWAEqviENlNMKORMXPIk5LlVRRM8iPSK25DNV9O/jbArJ5m6kyhkxXHFM7crp7ocZVI5UmNMP8yL15bJa4/I6TL7o3vrNQwJLsZS0ACGc2t+lQDVRNWsAi6IKXb6f//d07cWx6Aoyq2bRMyC2temPtSExTpfzJE1KGGX9ruL5wQgprddmSQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sun, 26 Jul
 2026 16:13:20 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:13:20 +0000
Message-ID:
 <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
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
Subject: [PATCH RESEND 0/9] ARM: stm32: add STM32H7R7 and ART-Pi2 support
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::10) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <178508241516.28466.2214738758143784956.artpi2-resend-0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb56675-8efb-4a99-7f56-08deeb30cf61
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|2604032031799003|704163111799003|8060799015|19110799012|37011999003|12121999013|23021999003|15080799012|51005399006|24021099003|16051099003|25010399006|5072599009|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bSgMNpzX8iutwqaQ4RrMmrnYUJsRPLoL+DHaBSg4X6Dq9i36wmQAlCD+btmF?=
 =?us-ascii?Q?Nb7voQTVJ3eiX/VrNj+zVG/+UJqFdgOTti240dLT9BaLWuwARsZhOHcY1VVo?=
 =?us-ascii?Q?Y0XxbqMNGuQCtK2QdCAhWiM3K8Qx73giVPh6ggonNhK8UVIp3zzP6cjmsCk7?=
 =?us-ascii?Q?2iULmiL5wWjogy9IVdbE28MDwGrsJFSAJq9pk0m5gHOdH1hwQf00tLFFcotA?=
 =?us-ascii?Q?ZapTd1fyGSiUiNeYYgWmpJompYu5XgrYCE1t19W5HskqMagIFbCotJmpt2nI?=
 =?us-ascii?Q?9ftaOeaYPmY0Nwd75NkseW7yHYPRKXgCIqgC9J51jRKm5eK13NQ4BLSYaC3i?=
 =?us-ascii?Q?g6mJK2/xnysNleHq97Vq8TjbnOZ+fB9/rlOS/kb/2w+1kOBAkLAqWqlqFn5x?=
 =?us-ascii?Q?PTIwj+gLNKqb8D4R+gf33MgCUjCqA4o943pv+HkPyJC++Bh1a1WIb3/A7MqH?=
 =?us-ascii?Q?zehFIPLhuYF5EO3ROfYUF3KUD2yFGnOVwIWYvIWSqci3lPZ2woGe7JcoIUCZ?=
 =?us-ascii?Q?xCw0ZSqvTUfFeBTA8GaM4Hpa52WkGxHjHqR2fFI0hmawhDtmVapFhOdRZQtz?=
 =?us-ascii?Q?xgzdtr29L9JZUyr9oVGBMPGn7MxfxVK00Sw1bAEv0CeDUx0KjqyEHdpzkFU5?=
 =?us-ascii?Q?IDosrCPTsYblS46sJf4rhemmTkUoZcWTi4pqE0t97290wdJoFhByCH0Nq7LA?=
 =?us-ascii?Q?Mxhk16cWlyxVzinIz2zkEPcughxGDWRgvoDgarPXuLRwMIqwwRSEsRTNG0wc?=
 =?us-ascii?Q?N1yUrvXrX19ygJNyrL3vmGHbwKUyGDbBZcMqzpwpAuCorOmBUIvCx13aaaWW?=
 =?us-ascii?Q?yfH5Fk9FfMPt5+cmKuBzENQDrOHsBdqvO6YNu4+7ePLRxDrD4xQPZCrKIzqm?=
 =?us-ascii?Q?GDSsZBN2HxgiOyz81bZ0SMUrmsfsShEDoDx+In9zIzIT5aLQM77VjXBJJBSX?=
 =?us-ascii?Q?pWvIoddOIZsFspArkQ7PxLfB6g4H+s/bBt37748WIFV3jNZFsXvIQQs+QZYG?=
 =?us-ascii?Q?ritEYMpZ/TA6yHF3QdLYFBoooQAiaBd9GSPsVw9SdhS+88lafW70AioTTTC6?=
 =?us-ascii?Q?hURcPRK04GK1eUvjnLsnkxW4lP8LJTrAZHSjTvUOKO1TINUAnw5S7h0472g0?=
 =?us-ascii?Q?DkbuM0GnHEwakmhaS6cH7Hxslb+yiVsuuA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J88llGKmFCUKE45nvwYe21hCiQekKy2ZtPbHbhpUJDu065HNN9zqNp7jj+Fi?=
 =?us-ascii?Q?DxPg/7HmZFyH6bRaYaFJn7L9IYdXCLZLqt2HKx2Fa2PNxabIZXeaQ8aFk78+?=
 =?us-ascii?Q?psjAji137UwIRqBgWRck/rav6pKY0EwPM5f5lQwUM9GzV99s/d1SiN+IGF/u?=
 =?us-ascii?Q?p1KQXCSHAzIlBn4ebRfuWBhp9KIOioEVsy2+oO8x7hCDOlFu7hOeB/BBHFG9?=
 =?us-ascii?Q?KiD44499xGpLEP2F6Isv5Sl8uJG+GLmeY+X5IczqzPjpJuUP+P1Wtiok8jcX?=
 =?us-ascii?Q?ckmXm4D3zdcO0soTG4lnHxAUhJpoXfJzAslFJ7FZcKLiSCP+A5zpc24KFiMS?=
 =?us-ascii?Q?yV2ZGBTHp4ZhfFIUgZObHcSHqsC+sW5zaMlHw50JWf5FXokhvgbzuFBSGsXy?=
 =?us-ascii?Q?2GPy990wNPUUw6nrm4MDWjUdyG2OQQbNxmN3NGtXX7l+qwaMxv7PHa1+nIco?=
 =?us-ascii?Q?g9XsvxeBZJmA/rYncCUJj09BfRckO38JT08SAOhiA+dPAOR6W0NqT2x4wFPq?=
 =?us-ascii?Q?CiL6V9fA43HxaWIJkBrY/NP/DfYy4c9wmeVyFamYhxdCkPcd3aKrbkEqYj9I?=
 =?us-ascii?Q?njaS/3+ubv0a0IZ4rLpHsvps8g2/MFjVEn2Rvxft0+YMSlc9tMRuOlj81luD?=
 =?us-ascii?Q?zgZmfBCjIjZzEcYzG70btxgecwV6eND8/0fKITnZAkoMa5fgswUSwA9q899S?=
 =?us-ascii?Q?ZGyhHqGrkhpF0Bhzc3v/mzE/gPfN1ihfK+0wrcysz3hd86jKICHpAJznzV6i?=
 =?us-ascii?Q?Ks6b/MX9qH3uNutJ/6HoQsWn+B+FhqMv3KHdAf1kMqu13aQq63WXnYBJoVre?=
 =?us-ascii?Q?yc6cbTbB/h1lloy7QN1gkj7+pYALK3XIv3O89h8RzXZnZh2SQA9bAQL9lkPq?=
 =?us-ascii?Q?Gw0QgXKQuMWJOdNJcTe+TrmyuvcENBcAsULx6nwS7DFPRgTh3m8EbBTsQ+9l?=
 =?us-ascii?Q?izHPz3gHvWy7zBhWwAAjvbAxHj3SgJhl/gn8LHk2StdWPiH/pbOToQY3r6bD?=
 =?us-ascii?Q?BzJK3y73izmd2S32aczbKeAEzAePWWUXIKgXmjemt+h3T3JThq2Fuwz9LKOZ?=
 =?us-ascii?Q?fPBSI0jK3gmFfyMHZihMHCFpCN5ZMrBL9WAuKhrWjASY5G7MiuygGX7W7IU0?=
 =?us-ascii?Q?VEZmWiqkXqHdmLU7uGPD1ZKFGUwa2Fr4p9MngChTQFXgBNJ3eaTNsJ34hmIG?=
 =?us-ascii?Q?/AqAuklFAUNNKFMZarOTGHnYKizF8cPdK0GFmolcE0p2X9y4qExfMLe/VTLx?=
 =?us-ascii?Q?vsf+BS/2Uvs8ATaZXLa+QaWNEbYbaYyfHIAMnA1NbxwI0E/0q0Sybqp6eu6B?=
 =?us-ascii?Q?jCEr82sHrTTJUPfMfiXPXyOCoCNETkl4G60avGoxg1jjVwyyiYEtMs5TkElV?=
 =?us-ascii?Q?T+7B6oKQkoP4px3ruf9KRcqdEYJq00Q0xxi9/d5Lv1idHdttfg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb56675-8efb-4a99-7f56-08deeb30cf61
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:13:20.6707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807

Resending to repair threading after Outlook rewrote the cover Message-ID
during SMTP submission. Patch contents are unchanged.
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
