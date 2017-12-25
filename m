From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Mon, 25 Dec 2017 15:48:16 +0100
Message-ID: <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia>
 <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:39352 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752273AbdLYOsU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Dec 2017 09:48:20 -0500
In-Reply-To: <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On 24.12.2017 23:42, William Breathitt Gray wrote:
(..)
> By the way, don't hesitate to ask for more information on the ISA
> subsystem -- a lot of maintainers are unaware that it even exists since
> so few devices nowadays use ISA-style communication -- but I'm always
> happy to help. :)

It turns out that all this ISA bus is behind CONFIG_ISA_BUS_API which
cannot be automatically selected by this driver due to a recursive
dependency conflict with CONFIG_STX104.

All the existing ISA bus drivers seem to depend on CONFIG_ISA_BUS_API
instead of selecting it but IMHO this is wrong because:
1) This Kconfig option doesn't really enable or disable any bus support
but building of a library of some common boilerplate code.
Libraries are normally selected by drivers needing them and only provided
as an user-selectable option if there is a possibility that a out-of-tree
module would need it,

2) On x86_64 this option (or rather, its parent option CONFIG_ISA_BUS)
cannot be enabled without CONFIG_EXPERT,

3) This device isn't really a ISA bus device any more than, for example,
a 8250 serial port or a PC-style parallel port and these don't need
that an user explicitly enables "ISA bus support" in his kernel
configuration.

To be clear I'm fine with converting this driver to use the ISA bus (in
fact, I have already done so), but I think that currently this would be
a regression from user-friendliness perspective due to the points above.

> William Breathitt Gray

Best regards,
Maciej Szmigiero
