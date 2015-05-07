From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: pinctrl: imx7d: undefined Kconfig option SOC_IMX7D
Date: Thu, 7 May 2015 09:17:40 +0200
Message-ID: <CAD3Xx4+VeF5WUj+WdyXackbA0xuTZ-YY4hm_yMoCwFsiUf0eaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:35458 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379AbbEGHSM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2015 03:18:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Frank.Li@freescale.com
Cc: linus.walleij@linaro.org, shawn.guo@linaro.org, b20788@freescale.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>

Hi Frank,

your commit c30024a64490 ("pinctrl: add imx7d support") is in today's
linux-next tree (i.e., next-20150507) adding driver support for IMX7D
pinctrl.  However, the driver cannot be compiled at its current state
since the required Kconfig option PINCTRL_IMX7D depends on SOC_IMX7D,
which is not defined in Kconfig, see:

+config PINCTRL_IMX7D
+       bool "IMX7D pinctrl driver"
+       depends on SOC_IMX7D

Is there a patch queued somewhere to add this option?

I found this issue with ./scripts/checkkconfigsymbols.py by diffing
yesterday's and today's linux-next trees.

Kind regards,
 Valentin
