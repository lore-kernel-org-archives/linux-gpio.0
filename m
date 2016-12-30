From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] pinctrl: dt-bindings: Add documentation for Armada
 37xx pin controllers
Date: Fri, 30 Dec 2016 09:35:27 +0100
Message-ID: <CACRpkdY_yUpo1nkbr0T-FZVSRFynuLSZ_6etho0hHk+otaUiYw@mail.gmail.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com> <20161222172501.16121-2-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:34896 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751683AbcL3If3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 03:35:29 -0500
Received: by mail-qt0-f169.google.com with SMTP id c47so390392553qtc.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 00:35:28 -0800 (PST)
In-Reply-To: <20161222172501.16121-2-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

On Thu, Dec 22, 2016 at 6:24 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> Document the device tree binding for the pin controllers found on the
> Armada 37xx SoCs.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
(...)

> +Required properties for pinctrl driver:
> +- compatible:  "marvell,armada3710-sb-pinctrl" for the south bridge
> +               "marvell,armada3710-nb-pinctrl" for the north bridge
> +- reg: The first set of register are for pinctrl/gpio and the second
> +  set for the interrupt controller
> +- interrupts: list of the interrupt use by the gpio

While this makes sense on its own, it doesn't match the code you sent.

The code uses syscon and regmap inside a simple-mfd node, not reg.

Please clarify how this works so we can see what is going on.

The syscon part doesn't seem optional at all.

Yours,
Linus Walleij
