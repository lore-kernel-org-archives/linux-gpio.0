Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE8199EAD
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562462; cv=none; b=AO4AvRLLWoiQeA+f5ow8U7PkME9oEcKRBTNSURhfODtgnCSODWcOAELlBmstB2jW+bNC35EW0g69xzGxPeG1tiyhOi6ditBh9hBeSM/2VljcLS9pu66OLMU/8QzBaYf3ifZrjo9KQUs1tGu4+0pSuw74FhA8zFEyECkgoT+FAi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562462; c=relaxed/simple;
	bh=zxSP0hjLvZJ6gdIi9nsO+F9bJfeKV2WHGGD8c59oFI0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iWBxDbM4miLkn4FPmW/6nbWz61XVEsufCktrGOOeQYGTFGaD6N2RtCYlVsOJImY6uxBbyDdIRaNVi4Rc2m6anRvZmk6e2VEvOh8u+oNLyt6mWM+y+28rLDbboG0hWrHG7G6PhPranOAZCzASf/j4stT+wKfZ2d3CDGJYkFMBPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0fzFXEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0fzFXEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B871F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787562460;
	bh=TV/a+q25hkEqFKAlyCGGigfo5Z4qmEacmhTv+k7sRAY=;
	h=From:Date:Subject:To:Cc;
	b=g0fzFXEZx5kMh+gAKEQ6wsgmLDWS1Zmh+VyAa+6O4sb4LPG5HK7YR+thoZauDFQna
	 CfPD5ajgQ7xYoeDTOi4Mb65w1ZPdqSI89w4KJ9DFQohJRr4Y36xzYwenOCvJmwMyQd
	 Bxk808mGCVoF7MhRMFlDC/+z2n8tqFqiDi3rNQXVEkSzgJXvcfS5UMjonqe1TowH4j
	 0XJW2J8Qo6jN3Nkx111+m1j/3Y15erBgTG1bRMSY9PD3PtiG/XNpjOsB5FAG8yqQzm
	 4eb1G3CC6ICl078s9j+0G9Ej4AgphfYfY1xrYR7PQjdHc0EevTM5tUU4zi1D0VBy88
	 6IdsqPatQIhgA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso3240998e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 02:07:40 -0700 (PDT)
X-Gm-Message-State: AFuF++kOu+EOUJseECrphmpR8lfQezpcvU3BI/fymVeqcTLMC4ak24fg
	7MPNCf0O4fcgsa9BtKYQTzGWVHUXJcZmAk8tOY9webPGRLGQJr0KB/6R0cORoFBgFEls2o4zMD1
	KlmZjmIlCJEvmoMHjtghROZEm34SqPls=
X-Received: by 2002:a05:6512:3f16:b0:5b2:158e:9918 with SMTP id
 2adb3069b0e04-5b484261b55mr8571313e87.19.1787562459310; Mon, 24 Aug 2026
 02:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 24 Aug 2026 11:07:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLmw5z+=hx_L_CmumKFZQsGjUHTvgjO4rcpj47u9VSre4Q@mail.gmail.com>
X-Gm-Features: AcwNN1XW1SZaMBI5X3UiBZvAQD0CroUTSWhBTAXl7lkKL8HjcnKiWsVD8EHPFUY
Message-ID: <CAD++jLmw5z+=hx_L_CmumKFZQsGjUHTvgjO4rcpj47u9VSre4Q@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for v7.3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here are the bulk of pin control improvements and nonurgent fixes for
v7.3.

Random screwups:

- The S32CC GPIO portions were implemented and then reverted out
  because it didn't work as expected.

- The SH maintainer is a hobbyist and I was impatient so I merged some
  pin control-related cleanups to my tree including board file fixes to
  arch/sh/*. I shouldn't have, so I reverted this out again. The SH maintai=
ner
  will funnel those changes.

Regarding the voluminous Airoha router SoC work I've been a bit torn betwee=
n
sending some of these upstream as prompt fixes or seeing the whole SoC
support as still a bit experimental, as the only downstream consumer (which
is OpenWrt) is already carrying all the patches so no-one is hurt. I might =
do
this differently in the future because I don't like stuff being
outoftree for too long.

AI review and scrutiny can be seen in some of the finer details of the patc=
hes
and probably increased the volume and quality overall a bit. Pin control ha=
s
a *lot* of data picked from datasheets, and by letting an LLM check the
definitions in the code against the datasheets a lot of typos and oversight=
s
are caught these days.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.3-1

for you to fetch changes up to d067f0f4c96cb5402a111cf649b7bf9c5771ec74:

  Merge tag 'pinctrl-qcom-updates-for-v7.3-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel
(2026-08-16 18:59:43 +0200)

----------------------------------------------------------------
Pin control bulk changes for kernel v7.3

Core changes:

- Use the non-blocking mux_state_try_select() in the generic
  MUX pin control back-end.

- Free pin maps on pinctrl_generic_to_map() failure in the core
  helpers.

New drivers:

- Qualcomm Maili TLMM SoC pin control.

- Qualcomm PMG1110 PMIC pin control.

- Qualcomm Eliza LPASS LPI TLMM SoC pin control (this is for
  the low power audio, LPASS =3D Low Power Audio SubSystem
  portions).

- Upboard support on top of the Intel pin controller.

- Apple T6030 and T6031 support (just compatible strings).

- Samsung Exynos 8855 SoC pin control.

- Mediatek MT6858 SoC pin control.

- Rockchip RK3308B SoC pin control.

- Rockchip RV1106 SoC pin control.

- Airoha EN7523 SoC pin control.

- Airoha AN7563 SoC pin control.

Improvements:

- Qualcomm TLMM GPIOs are unconditionally marked as wakeup capable.

- Qualcomm improvements on top of the Qualcomm PDC (power domain
  controller) irqchip improvements from tglx:s tree.

- Qualcomm IPQ806x and IPQ9650 nonurgent pin grop fixups.

- The NPCM8xx driver has been put into shape fixing many pin and
  group definitions.

- Some nonurgent Tegra 264 pin assignments are fixed up.

- Some nonurgent fixups to Airoha AN7581 and AN7583 registers and
  pin assignments, missing features etc.

----------------------------------------------------------------
Alex Tran (1):
      pinctrl: pinctrl-rp1: Make use of str_hi_lo helper

Alim Akhtar (3):
      dt-bindings: pinctrl: samsung: Add exynos8855-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos8855-wakeup-eint compatible
      pinctrl: samsung: Add Exynos8855 pinctrl configuration

Alvin =C5=A0ipraga (1):
      pinctrl: fix PINCTRL_GENERIC_MUX not always being selectable

Andrei Stefanescu (2):
      pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
      pinctrl: s32cc: implement GPIO functionality

Andy Shevchenko (1):
      Merge patch series "upboard pinctrl support for device id INTC1055"

Bartosz Golaszewski (3):
      Merge tag 'v7.2-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
pinctrl-qcom/for-next
      MAINTAINERS: add myself as the maintainer for Qualcomm pin control dr=
ivers
      Merge tag 'irq-chip-qcom-pdc-for-gpio-07-07-26' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into HEAD

Bhargav Joshi (1):
      dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT schema

Billy Tsai (2):
      dt-bindings: pinctrl: aspeed,ast2700-soc1: Add JTAGM1TRST group
      pinctrl: aspeed: Split TRST out of the AST2700 SoC1 JTAGM1 group

Chen-Yu Yeh (1):
      dt-bindings: pinctrl: mt7622: allow gpio-hogs

Daniel McCarthy (1):
      pinctrl: bcm2835: Don't remove an unregistered GPIO chip

Daniel Schwierzeck (3):
      pinctrl: airoha: fix I2C1 pin mux config for AN7581
      pinctrl: airoha: fix I2C pin mux config for AN7583
      pinctrl: airoha: fix AN7583 MDIO pin mux config

Dmitry Torokhov (5):
      pinctrl: renesas: gpio: isolate function gpiochip from parent fwnode
      sh: pfc: attach software node to the GPIO chip
      sh: mach-rsk: rsk7203: use static device properties for LEDs and
GPIO buttons
      pinctrl: renesas: gpio: support software nodes for function GPIOs
      sh: mach-rsk: rsk7203: convert pin configuration to using software no=
des

Eduard Bostina (1):
      dt-bindings: pinctrl: Convert TI DA850 pupd to DT schema

Felix Gu (1):
      pinctrl: imx1: fix device_node leak in dt_is_flat_functions()

Fenglin Wu (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support

Frank Li (1):
      pinctrl: pinctrl-generic-mux: use mux_state_try_select()

Gary Wang (2):
      pinctrl: tigerlake: add some pin groups and functions for INTC1055
      pinctrl: upboard: add device id INTC1055 based UP boards support

Hans Ulli Kroll (2):
      pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
      pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function

Hans de Goede (2):
      pinctrl: qcom: Drop unnecessary bitmap_fill() call
      pinctrl: qcom: Drop unused irq_data argument from
msm_gpio_update_dual_edge_pos()

Hugo VALTIER (3):
      pinctrl: rockchip: constify mux recalced and route data arrays
      pinctrl: rockchip: extract iomux_recalced_routes_init()
      pinctrl: rockchip: add support for RK3308B SoC

Igor Putko (2):
      gpio: tb10x: use unsigned int instead of bare unsigned
      gpio: tb10x: remove unnecessary braces

Janne Grunau (1):
      dt-bindings: pinctrl: apple,pinctrl: Add t6030 and t6031 compatibles

Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

Julian Braha (2):
      pinctrl: fix unmet dependencies from missing GPIOLIB
      pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC

Justin Yeh (5):
      pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
      pinctrl: mediatek: free EINT resources on unbind
      pinctrl: mediatek: allow common drivers to be built as modules
      pinctrl: mediatek: mt7986: register both platform drivers from a
single initcall
      pinctrl: mediatek: enable module build support for all SoC drivers

Khristine Andreea Barbulescu (3):
      pinctrl: s32cc: add/fix some comments
      pinctrl: s32cc: remove inline specifiers
      dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources

Komal Bajaj (1):
      pinctrl: qcom: shikra: Fix intr_target_width for summary interrupt ro=
uting

Konrad Dybcio (1):
      pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151

Linus Walleij (9):
      pinctrl: tb10x: Mark base as __iomem
      Merge branch 'ib-rsk7204' into devel
      Merge tag 'renesas-pinctrl-for-v7.3-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Revert "pinctrl: s32cc: implement GPIO functionality"
      Merge tag 'samsung-pinctrl-7.3' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Revert "Merge branch 'ib-rsk7204' into devel"
      Merge tag 'intel-pinctrl-v7.3-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'pinctrl-qcom-fixes-for-v7.2' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel
      Merge tag 'pinctrl-qcom-updates-for-v7.3-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

Maulik Shah (7):
      irqchip/qcom-pdc: Restructure version support
      irqchip/qcom-pdc: Move all static variables to struct pdc_desc
      irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
      irqchip/qcom-pdc: Configure PDC to pass through mode
      Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
      pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip
      pinctrl: Use IRQ trigger mask helpers

Mikhail Kshevetskiy (34):
      dt-bindings: pinctrl: airoha: en7581: fix misprint in i2s function na=
me
      dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
      pinctrl: airoha: fix mdio bitfield names
      pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
      pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
      dt-bindings: pinctrl: airoha: en7581: allow configuration of
pcie_reset pins as gpio or pwm
      pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
      dt-bindings: pinctrl: airoha: an7583: allow configuration of
non-gpio default pins as gpio and pwm
      pinctrl: airoha: an7583: fix muxing of non-gpio default pins
      dt-bindings: pinctrl: airoha: an7583: add i2c0 group for i2c function
      pinctrl: airoha: an7583: fix spi group pins
      pinctrl: airoha: add missed get_direction() function for gpio_chip
      pinctrl: airoha: add set_direction() helper for gpio_chip
      pinctrl: airoha: minor improvements
      pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the
IRQ handling code
      pinctrl: airoha: add missed IRQ resource helpers
      pinctrl: airoha: fix IRQ mask/unmask code
      pinctrl: airoha: fix edge-triggered interrupts handling
      pinctrl: airoha: remove not needed irq_type[] array
      pinctrl: airoha: statically allocate gpio regs structure
      pinctrl: airoha: move common definitions to the separate header
      pinctrl: airoha: split driver on shared code and SoC specific drivers
      pinctrl: airoha: an7581: remove en7581 prefix from variable names
      pinctrl: airoha: an7583: remove an7583 prefix from variable
names and definitions
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

Nikolai Burov (3):
      dt-bindings: pinctrl: mediatek: Add MT6858
      pinctrl: mediatek: Add driver for MT6858
      arm64: dts: mediatek: mt6858: Add pinmux macro header file

Pan Chuang (4):
      pinctrl: intel: Remove redundant dev_err_probe()
      pinctrl: airoha: Remove redundant dev_err()
      pinctrl: bcm: Remove redundant dev_err()
      pinctrl: Remove redundant dev_err()/dev_err_probe()

Pengpeng Hou (1):
      pinctrl: sx150x: add missing MODULE_DEVICE_TABLE()

Prathamesh Shete (2):
      dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT pin names
      pinctrl: tegra264: fix DAP2 DIN/DOUT pin assignment

Ravi Hothi (2):
      dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
      pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

Rosen Penev (1):
      pinctrl: renesas: rza2: Embed pins in the priv struct

Sang-Heon Jeon (1):
      pinctrl: mediatek: remove conditional return with no effect

Simon Glass (5):
      pinctrl: rockchip: Reset the pin count when recalculating SoC data
      pinctrl: rockchip: Restrict the RV1103B 2-bit drive type to bank 2
      pinctrl: rockchip: Decode drive strength in the get function
      dt-bindings: pinctrl: rockchip: Add RV1106 compatible
      pinctrl: rockchip: Add RV1106 pinctrl support

Sneh Mankad (2):
      pinctrl: qcom: Avoid assigning unused private context in test cases
      pinctrl: qcom: Unconditionally mark gpio as wakeup enable

Stephan Gerhold (1):
      pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller

Surendra Singh Chouhan (1):
      pinctrl: generic: free maps on pinctrl_generic_to_map() failure

Taceddin Sancak (1):
      pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins

Tomer Maimon (8):
      pinctrl: npcm8xx: drop RTS/CTS pins from bmcuart1
      pinctrl: npcm8xx: enable RMII outputs from RMII groups
      pinctrl: npcm8xx: support RG2 drive strength selection
      pinctrl: npcm8xx: clear pending GPIO events during init
      pinctrl: npcm8xx: rename GPIO7 IOX2 signal to DO
      pinctrl: npcm8xx: move GPIO IRQ setup into request_resources
      pinctrl: npcm8xx: correct JM1 and SMB7 pin flags
      pinctrl: npcm8xx: fix debounce register selection

Troy Mitchell (1):
      pinctrl: spacemit: validate pins in pinconf callbacks

Tsz Shan Chan (3):
      pinctrl: sx150x: allow build when I2C is a module
      pinctrl: sx150x: Return IRQ_NONE if no pending irq
      pinctrl: sx150x: get parent IRQ trigger type from firmware

Udaya Kiran Challa (1):
      dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT sche=
ma

Xianwei Zhao (2):
      pinctrl: meson: a4: Add input enable pin configuration
      pinctrl: meson: sync some modify from A4

Yu-Chun Lin (2):
      pinctrl: realtek: rtd1625: fix base_bit for VE4 GPIO 13
      pinctrl: realtek: rtd1625: remove unused group name spdif_sel

Yuhong Cheng (1):
      docs: driver-api: pin-control: fix spelling of below

Yulin Lu (1):
      pinctrl: eswin: Fix Handling of PIN_CONFIG_PERSIST_STATE

 .../bindings/pinctrl/airoha,an7563-pinctrl.yaml    |  350 +++
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    |   61 +-
 .../bindings/pinctrl/airoha,en7523-pinctrl.yaml    |  378 +++
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    |   17 +-
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    2 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       |    1 +
 .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  |  190 ++
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml  |    5 +
 .../bindings/pinctrl/microchip,pic32-pinctrl.txt   |   60 -
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml       |  109 +
 .../pinctrl/nvidia,tegra264-pinmux-main.yaml       |    6 +-
 .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml  |   90 +-
 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 +
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      |   18 +-
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |    1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |    1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |    1 +
 .../devicetree/bindings/pinctrl/ti,da850-pupd.txt  |   55 -
 .../devicetree/bindings/pinctrl/ti,da850-pupd.yaml |   74 +
 .../bindings/pinctrl/ti,dra7-iodelay.yaml          |   83 +
 .../devicetree/bindings/pinctrl/ti,iodelay.txt     |   47 -
 Documentation/driver-api/pin-control.rst           |    2 +-
 MAINTAINERS                                        |    7 +
 arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h      | 1335 ++++++++++
 drivers/gpio/gpio-tb10x.c                          |    5 +-
 drivers/irqchip/qcom-pdc.c                         |  540 +++-
 drivers/pinctrl/Kconfig                            |    6 +-
 drivers/pinctrl/actions/pinctrl-owl.c              |    2 +-
 drivers/pinctrl/airoha/Kconfig                     |   42 +-
 drivers/pinctrl/airoha/Makefile                    |    7 +
 drivers/pinctrl/airoha/airoha-common.h             |  147 ++
 drivers/pinctrl/airoha/pinctrl-airoha.c            | 2669 ++--------------=
----
 drivers/pinctrl/airoha/pinctrl-an7563.c            | 1115 ++++++++
 drivers/pinctrl/airoha/pinctrl-an7581.c            | 1487 +++++++++++
 drivers/pinctrl/airoha/pinctrl-an7583.c            | 1517 +++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c            | 1157 +++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c    |    6 +-
 drivers/pinctrl/bcm/Kconfig                        |    2 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    1 -
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |    9 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |    7 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |    2 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |   32 +
 drivers/pinctrl/mediatek/Kconfig                   |   80 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |   27 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   11 +-
 drivers/pinctrl/mediatek/pinctrl-mt2701.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt2712.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt6795.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt6797.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt6858.c          | 1409 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c          |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt7620.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt7621.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt7623.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt7629.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt7981.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c          |   21 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt8167.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |    5 +
 drivers/pinctrl/mediatek/pinctrl-mt8183.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c          |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c          |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c          |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c          |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |    7 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   22 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h      | 2378 ++++++++++++++++=
+
 drivers/pinctrl/mediatek/pinctrl-mtmips.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    2 +-
 drivers/pinctrl/mediatek/pinctrl-rt2880.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-rt305x.c          |    4 +
 drivers/pinctrl/mediatek/pinctrl-rt3883.c          |    4 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         |   14 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |    8 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |    5 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  191 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |   49 +-
 drivers/pinctrl/pinctrl-aw9523.c                   |    2 +-
 drivers/pinctrl/pinctrl-eic7700.c                  |    3 +
 drivers/pinctrl/pinctrl-generic-mux.c              |    2 +-
 drivers/pinctrl/pinctrl-generic.c                  |   25 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |    5 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |    2 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  508 +++-
 drivers/pinctrl/pinctrl-rockchip.h                 |    9 +-
 drivers/pinctrl/pinctrl-rp1.c                      |    2 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |    4 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   23 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |    2 +-
 drivers/pinctrl/pinctrl-upboard.c                  |   21 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |    8 +-
 drivers/pinctrl/qcom/pinctrl-ipq9650.c             |    4 +-
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1625 ++++++++++++
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c     |   40 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   75 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |    5 +
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c            |   21 +-
 drivers/pinctrl/qcom/pinctrl-shikra.c              |    1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/pinctrl-x1e80100.c            |    4 +-
 drivers/pinctrl/qcom/tlmm-test.c                   |    3 -
 drivers/pinctrl/realtek/pinctrl-rtd1625.c          |    4 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c             |   26 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  132 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              |   10 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c             |    2 +-
 drivers/pinctrl/tegra/pinctrl-tegra264.c           |   24 +-
 125 files changed, 15686 insertions(+), 3039 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd=
.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd=
.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,iodelay.tx=
t
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h
 create mode 100644 drivers/pinctrl/airoha/airoha-common.h
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7581.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7583.c
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6858.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-maili.c
