Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4732BC4338F
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Aug 2021 14:25:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FC1F61184
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Aug 2021 14:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238286AbhHFOZr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 6 Aug 2021 10:25:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:17257 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238173AbhHFOZr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Aug 2021 10:25:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="211274586"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="211274586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 07:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="420742652"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by orsmga003.jf.intel.com with ESMTP; 06 Aug 2021 07:25:27 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com,
        lakshmi.bai.raja.subramanian@intel.com, tamal.saha@intel.com,
        lakshmi.sowjanya.d@intel.com
Subject: [PATCH v4 0/2] Add pinctrl support for Intel Keem Bay SoC
Date:   Fri,  6 Aug 2021 19:55:25 +0530
Message-Id: <20210806142527.29113-1-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Hi,

This patch set enables the support for the integrated pin controller in
the Intel Keem Bay SoC.

Patch 1 holds the implementation of pinctrl driver.
Patch 2 holds the relevant Device Tree bindings documentation and an
entry in MAINTAINERS file

High-Level Architecture:
-----------------------

                                   +----------------------------+
     ------------------------------|MODE 0 -                    |
      -----------------------------|MODE 1      PIN MUX         |
       ----------------------------|...                         |
        ---------------------------|...                         | PAD M
         +-------------------------|MODE 7(GPIO)		-------
         |                         |                            |    .
         |                         |  +---------------------+   |    .
         |                         |  |  GPIO_MODE (0-79)   |   |    .
         |                         |  | INV|PU|PD|DIR|MODE  |   |    .
         |                         |  +---------------------+   |    .
         |                         |    PIN CONFIGURATION       |    .
         |                         +----------------------------+    .
         |                                                           .
         |                         +----------------------------+    .
         |        -----------------|MODE 0 -                    |    .
         |         ----------------|MODE 1      PIN MUX         |    .
         |          ---------------|...                         |
         |            -------------|...                         | PAD N
         |                +--------|MODE 7(GPIO)		-------
         |                |        |                            |
         |                |        |  +---------------------+   |
         |                |        |  |  GPIO_MODE (0-79)   |   |
         |                |        |  | INV|PU|PD|DIR|MODE  |   |
         |                |        |  +---------------------+   |
         |                |        |    PIN CONFIGURATION       |
         |                |        +----------------------------+
         |                |
         |                |
         |                |
         |                |	   +------------------------------------+
         |                |        |       GPIO PIN CONTROL		|
         |                |        |					|
         |                |        |    +-------------------------+	|
         |                |        |    | GPIO_DATA_IN (0-2)      |	|
         |                |        |    +-------------------------+	|
     0   1..28   29  30  31  -------    +-------------------------+	|
     |   |   |   |   |    |        |    | GPIO_DATA_OUT_HIGH (0-2)|	|
     \   \   \   \   \    |        |    | GPIO_DATA_OUT_LOW (0-2) |	|
      |   |   |   |   |   |        |    +-------------------------+	|
      |   |   |   |   |   |        |					|
      |   |   |   |   |   |	   +------------------------------------+
      \   \   \   \   \   |
       |   |   |   |   |  |              GPIO_INT_CFG (Bits)
       |   |   |   |   |  |     +---|-------|--|------|--|----|--|---+
      +-------------------+-+   |31   30     23    16  15 14-8 7 6-0 |
      | GPIO_INT_CFG(0-7)   |   +---|-------|--|------^--|----|--|---+
      +---------------------+   |En   Idx   |En| Idx  |En| Idx|En|Idx|
        |   |    |  |           +---|-------|--|------|--|----|--|---+
       0|  1|...6| 7|
        |   |    |  |
     +-------------------+
     |                   |
     |                   |
     |                   |
     |                   |
     |  Interrupt        |
     |  Control          |
     |                   |
     |                   |
     |                   |
     |                   |
     +-------------------+

Explored registering GPIOCHIP per 32 bits, from the IP there are
registers
for set/clear and read pins which falls under the category of per
register
handling 32 bits, but for other functionality like direction, config,
interrupt mux, there is a need to have customised solution.

Using gpiochip per 32 bits involves additional data structures, and
it has an impact in the device tree for all the users of these
PADs.

Spinlock is not required for all the operations like set/get as there
are separate for each. Configuring all the registers in a single driver
is preferred as it is easy to debug.

Please help to review this patch set.

Thanks in advance,
Sowjanya

Changes from v3:
 - Initialized ret variable 

Changes from v2:
 - Removed unused variable trig

Changes from v1:
 - Changed the boolean to true in yaml
 - Removed spinlock for all the transactions except irq transactions
 - Added standard ngpios instead of num-gpios
 - Added gpiochip_generic_config() api
 - Added check for IRQ_ENABLE and removed the check for the mask
   IRQ_TYPE_SENSE_MASK

Lakshmi Sowjanya D (2):
  dt-bindings: pinctrl: Add bindings for Intel Keembay pinctrl driver
  pinctrl: Add Intel Keem Bay pinctrl driver

 .../pinctrl/intel,pinctrl-keembay.yaml        |  135 ++
 MAINTAINERS                                   |    5 +
 drivers/pinctrl/Kconfig                       |   19 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-keembay.c             | 1731 +++++++++++++++++
 5 files changed, 1891 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
 create mode 100644 drivers/pinctrl/pinctrl-keembay.c

-- 
2.17.1

