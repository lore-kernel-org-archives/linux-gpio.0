From: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Subject: [PATCH 0/3] gpio support for Broadcom NSP
Date: Tue, 1 Dec 2015 23:46:01 -0500
Message-ID: <1449031561-18697-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:43294 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752331AbbLBEqK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 23:46:10 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

This patchset contains the gpio support for the Broadcom's
Northstar Plus (NSP) SOC.

The first patch provides the documentation details and the
second patch contains driver details. The third patch
contains the enable method.

This patchset has been tested on NSP bcm958625HR board with pinctrl
patch added.
This patchset is based on v4.4.0-rc1 and is available from github
repo: https://github.com/Broadcom/cygnus-linux.git
branch: nsp-gpio-v1

Yendapally Reddy Dhananjaya Reddy (3):
  pinctrl: Broadcom NSP GPIO-a device tree bindings
  pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC
  ARM: dts: enable GPIO-a for Broadcom NSP

 .../devicetree/bindings/pinctrl/brcm,nsp-gpio.txt  |  80 +++
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  12 +
 drivers/pinctrl/bcm/Kconfig                        |  17 +
 drivers/pinctrl/bcm/Makefile                       |   1 +
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             | 749 +++++++++++++++++++++
 5 files changed, 859 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
 create mode 100644 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c

-- 
2.1.0

