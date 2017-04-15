From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: pinctrl: imx: Checking reuse of grouping functionality
Date: Sat, 15 Apr 2017 21:55:19 +0200
Message-ID: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:61637 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751616AbdDOTzg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 15 Apr 2017 15:55:36 -0400
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Fabio Estevam <fabio.estevam@nxp.com>, Gary Bisson <gary.bisson@boundarydevices.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello,

A preprocessor symbol like “CONFIG_GENERIC_PINCTRL_GROUPS” was introduced
by the commit c033a718f615b6b3ddc83ce3e0a217c30bd09cb5 (“pinctrl: stricten up
generic group code”) on 2017-01-03. Some functions are only available then
when this macro is defined.

I have got the impression that the corresponding programming interface is used
by the source file “drivers/pinctrl/freescale/pinctrl-imx.c” unconditionally.
How do you think about to extend specifications for conditional compilation there?

Regards,
Markus
