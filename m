From: <kamlakant.patel@broadcom.com>
Subject: [PATCH 0/2] Add GPIO controller driver for Netlogic XLP SoCs
Date: Tue, 28 Apr 2015 20:10:43 +0530
Message-ID: <1430232045-5114-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:24454 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965882AbbD1Olo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2015 10:41:44 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

This patch set adds support for GPIO controller driver Netlogic XLP SoCs.

Kamlakant Patel (2):
  Documentation: Add Netlogic XLP GPIO devicetree bindings
    documentation
  gpio: xlp: GPIO controller for Netlogic XLP SoCs

 .../devicetree/bindings/gpio/gpio-xlp.txt          |   47 +++
 drivers/gpio/Kconfig                               |   11 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-xlp.c                            |  425 ++++++++++++++++++++
 4 files changed, 484 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xlp.txt
 create mode 100644 drivers/gpio/gpio-xlp.c

