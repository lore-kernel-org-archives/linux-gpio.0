From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] PXA1928 GPIO support
Date: Mon, 26 Jan 2015 22:46:03 -0600
Message-ID: <1422333966-18338-1-git-send-email-robh@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:44639 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751966AbbA0EqR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jan 2015 23:46:17 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>

PXA1928 is an ARMv8 SOC in the PXA/MMP family. This series enables 
building on ARM64 and adds support for the PXA1928. The PXA1928 
GPIO differs from previous generations by adding a 6th GPIO bank.

Rob

Rob Herring (3):
  gpio: pxa: remove mach IRQ includes
  dt/bindings: gpio: add compatible string for marvell,pxa1928-gpio
  gpio: pxa: add PXA1928 gpio type support

 .../devicetree/bindings/gpio/mrvl-gpio.txt         |  4 +-
 drivers/gpio/gpio-pxa.c                            | 55 +++++++++++++---------
 2 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.1.0

