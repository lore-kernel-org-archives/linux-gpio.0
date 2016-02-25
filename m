From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v2 0/3] pinctrl: lpc18xx: support pint setup
Date: Thu, 25 Feb 2016 22:44:36 +0100
Message-ID: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36660 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbcBYVot (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 16:44:49 -0500
Received: by mail-lf0-f43.google.com with SMTP id 78so41841250lfy.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 13:44:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

Some background here:
The LPC1850 has no less than 3 GPIO interrupt blocks. One of these
blocks is called 'gpio pin interrupt' or just PINT. LPC1850 PINT can
handle up to 8 interrupts and these have a one-to-one relationship with
the main interrupt controller (NVIC).

Selecting which GPIOs that are associated with PINT irq lines is done in
pinctrl hw block (SCU). The pinctrl device usually deals with the pin
namespace but PINT selecction is done in the GPIO namespace. Fortunatly
there is a function that can translate from the pin namespace to the
GPIO namespace.

Selection is done in DT with the "nxp,gpio-pin-interrupt" property.
Example usage;
&pinctrl {
	gpio_joystick_1_cfg {
		pins =  "p9_0";
		function = "gpio";
		nxp,gpio-pin-interrupt = <0>;
		input-enable;
		bias-disable;
	};
};

The reason for not doing this irq line selection on the fly in the
irqchip driver is that the registers lie in the SCU hw block not in the
PINT block and DT gives you more control since you can select a specific
irq lines easily.

The irq chip driver is ready but will posted separately.

Joachim Eastwood (3):
  pinctrl: core: create nolock version of pinctrl_find_gpio_range_from_pin
  pinctrl: lpc18xx: add nxp,gpio-pin-interrupt property
  pinctrl: lpc1850-scu: document nxp,gpio-pin-interrupt

 .../bindings/pinctrl/nxp,lpc1850-scu.txt           |  14 ++
 drivers/pinctrl/core.c                             |  35 +++--
 drivers/pinctrl/core.h                             |   4 +
 drivers/pinctrl/pinctrl-lpc18xx.c                  | 143 ++++++++++++++++++++-
 4 files changed, 178 insertions(+), 18 deletions(-)

-- 
1.8.0

