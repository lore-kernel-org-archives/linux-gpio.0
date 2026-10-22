Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708629;
	b=K71qLCKf/T8YsCwlZap5Nzqdheo8P8/UYRljHPl/Izv4R4vzedfL3Km2+vjk+Q0qn39f
	 M0bw7kn0+pGOmHNL8dcYj3/1nwuF40YRTlYK2KLSwIO9wl9tP3RbqOkGgrQ/vhPZwiVAe
	 CmWKe0XwW3JqHrvgkxXF0PS0xyXaYWz4/Q3nhK/Lrlrb8yvAfTgtW/ugtYMuomFlR99t8
	 hT+n4ruD8Q02dOJ5CKonbEEBA4FxA/6qP+xFv5qLqr7H3+NWmXQlu3BRufi/k8NYU/UDE
	 SLFyzS3uAITrtF7IAMJ7efX6VHmEzihxOxmYCmFveTzIMFkBI4nOaTdkXXrm7FG6qBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708629;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+yeyyMbAI2MOwJ3S0TGAmuLyYlBFNNnWz5C75BntB8E=;
	b=pUqFmDYqEht74NNP6IZo9WNFc7ltZ/poktwGRZAT3px2BGuNjU9su9v7hbrh0Ldd5Y6T
	 8evg37h5ojGrQHVbgT7cq0VzuCqsKMZemqMoIxO5Qxsqyd/Ssjmihq3JgYb82qDrWK7O9
	 87YemLqfT/eMRxFeGK8PGNtHPRh6g/edhNM+V5KinYNTm/swrIwF+HlUo8r0dnICXgaMo
	 LQwNmSza5vwNWAdzmVvJ6kUKH0vkvzeJXyDfOvFiJZpaE39BpH3XYzRBzrPWZd16cD28G
	 r/3wumbd1RItNDpzbRdSFUhKFMDB5vEoh9Sk3E+DbV6HA13raZENn3/nop4aD3pbJFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/pqmdpR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D53606A319
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/pqmdpR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E211F031E4
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792708628;
	bh=+yeyyMbAI2MOwJ3S0TGAmuLyYlBFNNnWz5C75BntB8E=;
	h=From:Date:Subject:To:Cc;
	b=L/pqmdpRUQ0MJmtSv9JUBgg6tjqfUWcIUgifb94SJSO/gdz7NdF965hy6k2Qu9KeS
	 HhaEbj4FUMmeGJn58QIZuU/Ltdwi1aksINeJ+PQOEIRKqClXU9DkWCiInmfhqbRxhf
	 yk0zOmLUTq1FKglFaSiLeCUEu/aOk/XPu92BL7Fy53o8SYI9v+VdEzozLipveWve86
	 kSHhcC4lJMv2XNPTer9ubzu4CVSdE7VrAuXIFM2U7quHjZwRyftdsXpkNu9k7OyjK3
	 d/zwCCkLegbStPV9spuTnAY4aY32Z9hC7oDkUgeG+Tqid+hxZ8s5EcPPxYJunOM/qo
	 6gsHnc0WlQzjg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso1660101fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 15:37:08 -0700 (PDT)
X-Gm-Message-State: AFq9FYLFtFRly/4N6GZNlToDJ+GE6eMEMlbycS+JMHo630EvfD7gLWzC
	fgE80nNHhPJ0QCkJ+/vOPYGBU7zwEpw4LAdJDwLHb8rB4tlcI+H2BK4X+DL8NDyXQVtCzlZF4BP
	8fnT1RBpSUvTIcfd1CawTqZ+OkFC8ebs=
X-Received: by 2002:a05:651c:19a2:b0:3ab:4f5e:3edc with SMTP id
 38308e7fff4ca-3ac66341bf6mr553761fa.15.1792708627016; Thu, 22 Oct 2026
 15:37:07 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 23 Oct 2026 00:36:55 +0200
X-Gmail-Original-Message-ID: <CAD++jL=OgP757Dzhmwv6xoeMwW8Aey8eCCsTFLfX8isxSPHW0g@mail.gmail.com>
X-Gm-Features: AclHuK_rOhXxbdAjZ40qCERHzs0pUymvyY9S88YCmQrlTojM2Vx71ef0rXrFpHg
Message-ID: <CAD++jL=OgP757Dzhmwv6xoeMwW8Aey8eCCsTFLfX8isxSPHW0g@mail.gmail.com>
Subject: [GIT PULL] pin control bulk changes for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here is the main stash of pin control updates for v7.4.

Nothing special really, some new drivers, the usual trickle of fixes.
Oddly not even vary many LLM-assisted fixes, I guess they haven't
found their way into this subsystem yet.

Not even the merges are interesting, I think the branch ib-gpio-dir-imx
was pulled into the GPIO tree.

So: Boring. Nice.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.4-1

for you to fetch changes up to f33a24cc012d34f25bb9942681bd478a1757b806:

  pinctrl: stm32: program the EXTI mux from .alloc instead of
.activate (2026-10-16 15:17:27 +0200)

----------------------------------------------------------------
Pin control bulk changes for the v7.4 kernel cycle:

Core changes:

- Support input-debounce-ns pin config property.

New drivers:

- Qualcomm:

  - Hawi SoC TLMM and LPASS LPI TLMM.

  - Kuno (ARM32!) SoC TLMM.

  - MSM8952 SoC TLMM.

  - PMAU0102 SPMIO GPIO.

- Starfive JHB100 SoC sys0, sys0h, sys1, sys2, per0, per1,
  per2 per2pok and per3 (apparently strongly modularized silicon).

- Ambarella CV75.

- Apple T8140 SoC used in iPhone 16 [Pro] and MacBook Neo.

- Econet EN7528.

- Allwinner Sunxi A733.

- Mediatek MT6735.

Improvements:

- Renesas RZ/3GL: SD channel PoC, I2C power source etc.

- The SCMI pin controller uses generic helpers for handling
  groups and functions.

----------------------------------------------------------------
Ahmed Naseef (2):
      pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
      dt-bindings: pinctrl: Add EcoNet EN7528 pin controller

Alex Tran (3):
      pinctrl: scmi: Replace pinmux ops get function info with generics
      pinctrl: scmi: Replace pinctrl ops get group info with generics
      pinctrl: kconfig: Select generic pinctrl helpers for scmi pinctrl

Andre Przywara (7):
      pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
      pinctrl: sunxi: only use PortK special handling on A523
      pinctrl: sunxi: refactor IRQ register accessors
      pinctrl: sunxi: support A733 generation MMIO register layout
      dt-bindings: pinctrl: add compatible for Allwinner A733
      pinctrl: sunxi: a523-r: add a733-r compatible string
      pinctrl: sunxi: add support for the Allwinner A733

Andrew Gaylard (2):
      pinctrl: fix PINCTRL_SPPCTL=3Dm
      pinctrl: sunplus: fix kernel-doc parameter descriptions in sppctl.c

Andy Shevchenko (3):
      pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
      pinctrl: intel: constify parameter in intel_pinctrl_get_soc_data()
      pinctrl: intel: Try to retrieve driver data for pure platform drivers

Arnd Bergmann (2):
      pinctrl: ambarella: add CONFIG_OF dependency
      pinctrl: starfive: fix missing CONFIG_OF dependencies

Aryan Sinha (1):
      pinctrl: gemini: fix kernel-doc warnings

Bartosz Golaszewski (1):
      MAINTAINERS: add git tree for the Qualcomm pin control entry

Basavaraj Natikar (3):
      pinctrl: amd: Centralize per-pin register access
      pinctrl: amd: Factor out optional named resource lookup
      pinctrl: amd: Add support for the Remote GPIO (RGPIO) bank

Benjamin Larsson (1):
      pinctrl: airoha: add support of en7528 SoC

Bhargav Joshi (1):
      dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT schema

Biju Das (1):
      pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L

Bjorn Andersson (1):
      pinctrl: qcom: lpass-lpi: Include value in debugfs output

Chancel Liu (1):
      pinctrl: pinctrl-generic-mux: Fix provider resource leak on re-parse

Changhuang Liang (20):
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

Chuanhong Guo (1):
      pinctrl: mediatek: mt7629: fix the 2.4 GHz Wi-Fi pin mode array

Claudiu Beznea (5):
      pinctrl: renesas: rzg2l: Generalize power source code
      pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
      pinctrl: renesas: rzg2l: Unify power source handling
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document missing
I3C power source option
      pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting I3C power s=
ource

Conor Dooley (1):
      pinctrl: mpfs-mssio: fix whitespace in debugfs output

Cosmin Tanislav (8):
      pinctrl: renesas: rzt2h: Fix used_irqs indexing in clear path
      pinctrl: renesas: rzt2h: Wire up struct gpio_chip::set_config
      pinctrl: renesas: rzt2h: Remove unused struct rzt2h_pinctrl::gpio_ran=
ge
      pinctrl: renesas: rzt2h: Restore correct pin mode on IRQ free
      pinctrl: renesas: rzt2h: Setup IRQ in .irq_{request,release}_resource=
s()
      pinctrl: renesas: rzt2h: Fix reading pin value in IRQ function
      pinctrl: renesas: rzt2h: Reuse helpers
      pinctrl: renesas: rzt2h: Add a helper for reading PFC

Dan Carpenter (1):
      pinctrl: ambarella: fix NULL vs IS_ERR() bug in amb_pinctrl_register(=
)

Dhruvin Rajpura (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support

Hardeep Sharma (2):
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver

Hemanth Selam (2):
      pinctrl: fix typos in comments
      pinctrl: fix typo in log message

Jiale Yao (2):
      pinctrl: sprd: free maps on DT map failure
      pinctrl: tegra: xusb: free maps on DT map failure

Josua Mayer (1):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input/output-disab=
le

Ju Nan (2):
      pinctrl: stm32: Fix the unit of the hwspinlock timeout
      pinctrl: stm32: program the EXTI mux from .alloc instead of .activate

Karl Mehltretter (1):
      pinctrl: stm32: Drop the nonexistent CONFIG_MACH_STM32MP25 from
the STM32MP257 default

Kees Cook (4):
      pinctrl: qcom: tlmm-test: Add const to reg_names allocation type
      pinctrl: mediatek: Fix eint->base allocation type
      pinctrl: imx: Remove const from group_names allocation type
      pinctrl: s32cc: Remove const from groups allocation type

Konrad Dybcio (1):
      pinctrl: qcom: Drop marketing name-prefixed duplicate defines

Krzysztof Kozlowski (2):
      dt-bindings: pinctrl: fsl: Replace tabs with spaces
      dt-bindings: pinctrl: Use consistent indentation in the example

Linkai Gong (1):
      pinctrl: amd: add timeout to irq-enable readback

Linus Walleij (5):
      Merge tag 'renesas-pinctrl-for-v7.4-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge branch 'ib-gpio-dir-imx' into devel
      Merge branch 'ib-ambarella-pinctrl' into devel
      Merge tag 'pinctrl-qcom-updates-for-v7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel
      Merge tag 'intel-pinctrl-v7.4-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

Long Zhao (2):
      dt-bindings: pinctrl: add Ambarella CV75 pinctrl
      pinctrl: ambarella: add CV75 pin controller

Ma Ke (1):
      pinctrl: stm32: Fix fwnode reference leak in stm32_gpiolib_register_b=
ank()

Mehmet Fide (3):
      pinctrl: make the CONFIG_PINCTRL=3Dn gpio config stubs return -ENOTSU=
PP
      pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the
pad register
      pinctrl: include linux/errno.h in consumer.h for ENOTSUPP

Muzaffer Kadir (2):
      dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

Prasad Kumpatla (2):
      dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinct=
rl
      pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

Rosen Penev (1):
      dt-bindings: pinctrl: brcm,nsp-gpio: Convert to DT schema

Uwe Kleine-K=C3=B6nig (1):
      pinctrl: axp209: Drop check for disabled devices

Wentao Liang (2):
      pinctrl: nuvoton: Fix clock reference leak in ma35_get_bank_data()
      pinctrl: stm32: Fix clock reference leak in stm32_pctl_probe()

Xilin Wu (1):
      dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names

Yassine Oudjana (6):
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
changes from MT6795 document
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl
subnode and property descriptions
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765
pin controller
      dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add bindings for
MT6735 pin controller
      pinctrl: mediatek: Add MT6735 pinctrl driver

Yureka Lilian (2):
      dt-bindings: pinctrl: apple,pinctrl: Add t8140 compatible
      pinctrl: apple: Add t8140-pinctrl support

 .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     |    6 +-
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   |  237 ++
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |   12 +
 .../bindings/pinctrl/awinic,aw9523-pinctrl.yaml    |   54 +-
 .../devicetree/bindings/pinctrl/brcm,nsp-gpio.txt  |   80 -
 .../devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml |  130 +
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml         |    2 +-
 .../bindings/pinctrl/econet,en7528-pinctrl.yaml    |  190 +
 .../bindings/pinctrl/fsl,imx35-pinctrl.yaml        |    4 +-
 .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml        |   12 +-
 .../bindings/pinctrl/fsl,imx8m-pinctrl.yaml        |    4 +-
 .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml      |    4 +-
 .../bindings/pinctrl/fsl,imx9-pinctrl.yaml         |    4 +-
 .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml |    4 +-
 .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml |    4 +-
 .../devicetree/bindings/pinctrl/intel,lgm-io.yaml  |   14 +-
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  196 +-
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  |  236 --
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |    4 +-
 .../bindings/pinctrl/mediatek,mt8195-pinctrl.yaml  |    2 +-
 .../devicetree/bindings/pinctrl/pincfg-node.yaml   |   11 +
 .../devicetree/bindings/pinctrl/pinctrl-palmas.txt |  105 -
 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml       |  109 +
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           |    4 +-
 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml      |    4 +-
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 +
 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |    4 +-
 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     |  146 +
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |    3 +
 .../bindings/pinctrl/qcom,sc8280xp-tlmm.yaml       |    3 +
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |    4 +-
 .../bindings/pinctrl/semtech,sx1501q.yaml          |    4 +-
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml      |  179 +
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml      |  178 +
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml      |  168 +
 .../pinctrl/starfive,jhb100-per2pok-pinctrl.yaml   |  162 +
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml      |  166 +
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml      |  164 +
 .../pinctrl/starfive,jhb100-sys0h-pinctrl.yaml     |  162 +
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml      |  164 +
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml      |  165 +
 .../bindings/pinctrl/ti,palmas-pinctrl.yaml        |  170 +
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      |   54 +-
 MAINTAINERS                                        |   18 +
 drivers/pinctrl/Kconfig                            |   20 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/airoha/Kconfig                     |   15 +-
 drivers/pinctrl/airoha/Makefile                    |    1 +
 drivers/pinctrl/airoha/airoha-common.h             |    3 +
 drivers/pinctrl/airoha/pinctrl-airoha.c            |   33 +-
 drivers/pinctrl/airoha/pinctrl-an7563.c            |    1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c            |    1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c            |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c            |    1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c            | 1204 ++++++
 drivers/pinctrl/core.c                             |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |   56 +-
 drivers/pinctrl/freescale/pinctrl-imx.h            |    4 +
 drivers/pinctrl/freescale/pinctrl-vf610.c          |    2 +
 drivers/pinctrl/intel/pinctrl-intel.c              |   41 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    2 +-
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c          | 1120 ++++++
 drivers/pinctrl/mediatek/pinctrl-mt7629.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    3 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h      | 3993 ++++++++++++++++=
++++
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c     |    2 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35.c             |    8 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |    2 +-
 drivers/pinctrl/pinconf-generic.c                  |    2 +
 drivers/pinctrl/pinconf.c                          |    2 +-
 drivers/pinctrl/pinctrl-ambarella-cv75.c           |  587 +++
 drivers/pinctrl/pinctrl-ambarella.c                |  533 +++
 drivers/pinctrl/pinctrl-ambarella.h                |   40 +
 drivers/pinctrl/pinctrl-amd.c                      |  243 +-
 drivers/pinctrl/pinctrl-amd.h                      |  174 +
 drivers/pinctrl/pinctrl-apple-gpio.c               |   21 +-
 drivers/pinctrl/pinctrl-axp209.c                   |    3 -
 drivers/pinctrl/pinctrl-equilibrium.c              |    2 +-
 drivers/pinctrl/pinctrl-gemini.c                   |    3 +-
 drivers/pinctrl/pinctrl-generic-mux.c              |   76 +-
 drivers/pinctrl/pinctrl-scmi.c                     |  232 +-
 drivers/pinctrl/pinctrl-st.c                       |    2 +-
 drivers/pinctrl/pinmux.c                           |    2 +-
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   19 +
 drivers/pinctrl/qcom/Makefile                      |    3 +
 drivers/pinctrl/qcom/pinctrl-apq8064.c             |  188 +-
 drivers/pinctrl/qcom/pinctrl-apq8084.c             |  502 +--
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c      |  244 ++
 drivers/pinctrl/qcom/pinctrl-ipq4019.c             |  208 +-
 drivers/pinctrl/qcom/pinctrl-ipq8064.c             |  208 +-
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 ++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   17 +
 drivers/pinctrl/qcom/pinctrl-msm.h                 |   25 -
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1257 ++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/tlmm-test.c                   |    2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  410 +-
 drivers/pinctrl/renesas/pinctrl-rzt2h.c            |  182 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |    3 +
 drivers/pinctrl/starfive/Kconfig                   |  105 +
 drivers/pinctrl/starfive/Makefile                  |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c        |  182 +
 .../starfive/pinctrl-starfive-jhb100-per1.c        |  193 +
 .../starfive/pinctrl-starfive-jhb100-per2.c        |  136 +
 .../starfive/pinctrl-starfive-jhb100-per2pok.c     |   99 +
 .../starfive/pinctrl-starfive-jhb100-per3.c        |  129 +
 .../starfive/pinctrl-starfive-jhb100-sys0.c        |  121 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c       |   99 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c        |   94 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c        |  140 +
 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c | 1446 +++++++
 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h |  153 +
 drivers/pinctrl/stm32/Kconfig                      |    2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   69 +-
 drivers/pinctrl/sunplus/Kconfig                    |    8 +-
 drivers/pinctrl/sunplus/sppctl.c                   |   45 +-
 drivers/pinctrl/sunxi/Kconfig                      |    5 +
 drivers/pinctrl/sunxi/Makefile                     |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c          |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c      |    3 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c        |    2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c        |   50 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   41 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |   71 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |    6 +-
 .../dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h  | 1148 ++++++
 include/linux/pinctrl/consumer.h                   |    5 +-
 include/linux/pinctrl/pinconf-generic.h            |    5 +
 132 files changed, 18711 insertions(+), 1653 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio=
.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio=
.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-palma=
s.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.y=
aml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yam=
l
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/ti,palmas-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7528.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 drivers/pinctrl/pinctrl-ambarella-cv75.c
 create mode 100644 drivers/pinctrl/pinctrl-ambarella.c
 create mode 100644 drivers/pinctrl/pinctrl-ambarella.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-kuno.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8952.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2po=
k.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.=
c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h
