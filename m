From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 0/2] gpio: add imx7ulp gpio support
Date: Mon, 15 May 2017 14:28:24 +0800
Message-ID: <1494829706-5661-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn3nam01on0043.outbound.protection.outlook.com ([104.47.33.43]:26186
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1759323AbdEOG2d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 02:28:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, shawnguo@kernel.org, stefan@agner.ch, ping.bai@nxp.com, fugang.duan@nxp.com, kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>

The Rapid General-Purpose Input and Output with 2 Ports (RGPIO2P)
on MX7ULP is similar to GPIO on Vibrid. But unlike Vibrid, the
RGPIO2P has an extra Port Data Direction Register (PDDR) used
to configure the individual port pins for input or output.

We introduce a FSL_GPIO_HAVE_PDDR with fsl_gpio_soc_data data
to distinguish this differences. And we support getting the output
status by checking the GPIO direction in PDDR.

Dong Aisheng (2):
  dt-bindings: gpio-vf610: add imx7ulp support
  gpio: gpio-vf610: add imx7ulp support

 .../devicetree/bindings/gpio/gpio-vf610.txt        |  4 +-
 drivers/gpio/gpio-vf610.c                          | 49 ++++++++++++++++++++--
 2 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.7.4

