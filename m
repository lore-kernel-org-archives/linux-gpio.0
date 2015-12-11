From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 0/2] gpio: Add driver for SPI serializers
Date: Fri, 11 Dec 2015 13:46:22 -0600
Message-ID: <1449863184-29668-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:44402 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751434AbbLKTqh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Dec 2015 14:46:37 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>

Hello all,

This series adds a GPI(General Purpose Input) driver for generic
parallel-in/serial-out shift registers, such as the SN65HVS882
that this driver was tested on. This should also work for the rest
of the SN65HVS88x series as well as other 74x165 style devices.

Thanks,
Andrew

Andrew F. Davis (2):
  dt-bindings: GPIO: Add generic serializer binding
  gpio: Add driver for SPI serializers

 .../devicetree/bindings/gpio/gpio-pisosr.txt       |  34 ++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-pisosr.c                         | 182 +++++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
 create mode 100644 drivers/gpio/gpio-pisosr.c

-- 
2.6.4

