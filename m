Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85949C433F5
	for <linux-gpio@archiver.kernel.org>; Fri, 30 Sep 2022 09:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiI3JJM (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 30 Sep 2022 05:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiI3JJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 05:09:11 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB9D2ED4A;
        Fri, 30 Sep 2022 02:09:08 -0700 (PDT)
X-QQ-mid: bizesmtp78t1664528816tuqcmaei
Received: from ubuntu.localdomain ( [113.72.146.201])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Fri, 30 Sep 2022 17:06:54 +0800 (CST)
X-QQ-SSF: 01000000000000305000000A0000000
X-QQ-FEAT: dcYQFNbI8vHgGBegdo4q9m3MYLIYCHcw61t0e3fQ/Hq7EkLkmrCEJbkHKfFlG
        J4zmi7grr3n/OnwCkitlLiu4qcHnTOsYdPqejqBFnT0LtYo71L1edvOVk8EqtBU/4NITA1v
        PtvMIi33G6+geE5Dd7Xac7PKFO83VGfrb9v3HUE71s36L+Ak4KHisHaZkXU39WXe8TV7AUX
        q+V7+WA4YGqKpmQTORK9G3XgM1C5YwLvoydQ6vz8XQ8mL/G9PJW987+tEw4XK5Hu7XQzgcN
        KjPitbWT1T8TMnUvEQDlipeEru32FxvLp89vTIwWeP2uI+17rxGu3MROCL82u0OFZBPCrY+
        J8aBzuhMWa2Us40P8GNsprTnvf4zhQfu4pLTNgpXugz2pvHj18+EXRpgSYrCSlqRLsMhXA8
        O7fk+0n7ykI=
X-QQ-GoodBg: 0
From:   Hal Feng <hal.feng@linux.starfivetech.com>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@linux.starfivetech.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 29/30] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
Date:   Fri, 30 Sep 2022 17:06:53 +0800
Message-Id: <20220930090653.7449-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
StarFive JH7110 and JH7100 SoCs to boot with serial ports.

Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..0c44484cd3a4 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
-- 
2.17.1

