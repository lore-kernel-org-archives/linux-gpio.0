From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: pinctrl: imx: Checking reuse of grouping functionality
Date: Mon, 17 Apr 2017 18:08:24 +0200
Message-ID: <2c82f25b-4095-fbb0-f766-c83387b46ef5@users.sourceforge.net>
References: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
 <CAAMH-ysVX+ZX-+nEF2kyrAKqhrkaZisBKiZuv6fAZUrKk3-ZDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:62775 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752223AbdDQQIo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Apr 2017 12:08:44 -0400
In-Reply-To: <CAAMH-ysVX+ZX-+nEF2kyrAKqhrkaZisBKiZuv6fAZUrKk3-ZDg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> However the imx pinctrl driver _absolutely_ needs this configuration to work.

Thanks for your explanation that the file “drivers/pinctrl/freescale/Kconfig”
will usually provide needed information for this software module.

Would it make sense to document such a requirement also by a preprocessor error
directive in the source file “drivers/pinctrl/freescale/pinctrl-imx.c”
for the special case if the macro “CONFIG_GENERIC_PINCTRL_GROUPS” would
accidentally not be defined?

Regards,
Markus
