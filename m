Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F16C433EF
	for <linux-gpio@archiver.kernel.org>; Thu, 14 Jul 2022 12:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiGNMXq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 14 Jul 2022 08:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238976AbiGNMXp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jul 2022 08:23:45 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6EBB615B;
        Thu, 14 Jul 2022 05:23:43 -0700 (PDT)
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
        by maillog.nuvoton.com (Postfix) with ESMTP id 2EB961C80F83;
        Thu, 14 Jul 2022 20:23:42 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 14 Jul
 2022 20:23:41 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 14 Jul 2022 20:23:41 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id CAE6F63A20; Thu, 14 Jul 2022 15:23:40 +0300 (IDT)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <j.neuschaefer@gmx.net>, <zhengbin13@huawei.com>
CC:     <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: nuvoton: add pinmux and GPIO driver for NPCM8XX
Date:   Thu, 14 Jul 2022 15:23:20 +0300
Message-ID: <20220714122322.63663-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set adds pinmux and GPIO controller for the Arbel NPCM8XX 
Baseboard Management Controller (BMC).

Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
period time.

Arbel BMC NPCM8XX Pinmux functions accessible only for pin groups 
and pin configuration parameters available only for individual pins.

Arbel BMC NPCM8XX has eight identical GPIO modules,
each module has 32 GPIO ports.

Most of the GPIO ports are multiplexed with other system functions.

The NPCM8XX pinctrl and GPIO driver were tested on NPCM845 evaluation board.

Addressed comments from:
 - Andy Shevchenko : https://www.spinics.net/lists/devicetree/msg516573.html
 - Krzysztof Kozlowski: https://www.spinics.net/lists/kernel/msg4368955.html

Changes since version 1:
 - Pin controller driver
	- Remove unnecessary debug prints and comments.
	- Use fwnode functions.
	- Remove Redundant 'else'.
	- Use switch case instead of else if.
	- Use GENMASK and BIT macros.
	- Use dev_err_probe in probe error.
	- Use callback GPIO range.
	- Add GCR phandle property.
	- Parameter order in reversed xmas

 - Pin controller dt-binding
	- Modify name from pin to mux.
	- Add phandle property.

Tomer Maimon (2):
  dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
  pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver

 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      |  213 ++
 drivers/pinctrl/nuvoton/Kconfig               |   13 +
 drivers/pinctrl/nuvoton/Makefile              |    1 +
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 2528 +++++++++++++++++
 4 files changed, 2755 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c

-- 
2.33.0

