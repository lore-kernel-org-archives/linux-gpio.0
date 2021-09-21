Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707AAC433FE
	for <linux-gpio@archiver.kernel.org>; Tue, 21 Sep 2021 19:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D86F61050
	for <linux-gpio@archiver.kernel.org>; Tue, 21 Sep 2021 19:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhIUTcI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 21 Sep 2021 15:32:08 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18568 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229519AbhIUTcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 15:32:07 -0400
X-IronPort-AV: E=Sophos;i="5.85,311,1624287600"; 
   d="scan'208";a="94721283"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2021 04:30:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 504CE40E82D7;
        Wed, 22 Sep 2021 04:30:34 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 0/4] Renesas RZ/G2L IRQC support
Date:   Tue, 21 Sep 2021 20:30:24 +0100
Message-Id: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

The RZ/G2L Interrupt Controller is a front-end for the GIC found on
Renesas RZ/G2L SoC's with below pins:
- IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
- GPIO pins used as external interrupt input pins out of GPIOINT0-122 a
  maximum of only 32 can be mapped to 32 GIC SPI interrupts,
- NMI edge select.

                                                                _____________
                                                                |    GIC     |
                                                                |  ________  |
                                         ____________           | |        | |
NMI ------------------------------------>|          |  SPI0-479 | | GIC-600| |
                _______                  |          |------------>|        | |
                |      |                 |          |  PPI16-31 | |        | |
                |      | IRQ0-IRQ8       |   IRQC   |------------>|        | |
P0_P48_4 ------>| GPIO |---------------->|          |           | |________| |
                |      |GPIOINT0-122     |          |           |            |
                |      |---------------->| TINT0-31 |           |            |
                |______|                 |__________|           |____________|

The proposed RFC patches, add the IRQ domains in GPIO (pinctrl driver) and the
IRQC driver. The IRQC domain handles the actual SPI interrupt and upon reception
of the interrupt it propagates to the GPIO IRQ domain to handle virq.
Out of GPIOINT0-122 only 32 can be mapped to GIC SPI, this mapping is handled by
the IRQC driver.

Current implementation only supports TINT interrupts.

Cheers,
Prabhakar

Changes for v2:
-> Re-structured the driver as a chained handler
-> Moved gpio verification to pinctrl driver
-> Added locks to protect read/write
-> Fixed propagating of irq (v1 queried the pinctrl irq domain to propagate)
-> To keep it simple dropped edge both support
-> Used relaxed accessors
-> Switched to use generic_handle_domain_irq()
-> Used irq_domain_translate_twocell() instead of custom callback

Lad Prabhakar (4):
  dt-bindings: interrupt-controller: Add Renesas RZ/G2L Interrupt
    Controller
  irqchip: Add RZ/G2L IA55 Interrupt Controller driver
  pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO
    interrupt
  arm64: dts: renesas: r9a07g044: Add IRQC node to SoC DTSI

 .../renesas,rzg2l-irqc.yaml                   | 130 ++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  58 +++
 drivers/irqchip/Kconfig                       |   9 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c           | 393 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 214 ++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 7 files changed, 806 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

-- 
2.17.1

