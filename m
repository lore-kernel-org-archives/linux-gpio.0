From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: aspeed: Add core pinconf support
Date: Mon, 24 Apr 2017 14:54:31 +0200
Message-ID: <CACRpkdYDhBhfMc80oAmSr5NKB1eKYgjqM0Gn5jb5QJVufmEAjw@mail.gmail.com>
References: <20170407125713.15678-1-andrew@aj.id.au> <20170407125713.15678-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35436 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1170330AbdDXMyd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 08:54:33 -0400
Received: by mail-it0-f46.google.com with SMTP id 70so56551459ita.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 05:54:33 -0700 (PDT)
In-Reply-To: <20170407125713.15678-3-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Fri, Apr 7, 2017 at 2:57 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Several pinconf parameters have a fairly straight-forward mapping onto
> the Aspeed pin controller. These include management of pull-down bias,
> drive-strength, and some debounce configuration.
>
> Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
> ADC and RMII/RGMII pins. As the bias configuration for each pin in a
> bank maps onto a single per-bank bit, configuration tables will be
> introduced to describe the ranges of pins and the supported pinconf
> parameter. The use of tables also helps with the sparse support of
> pinconf properties, and the fact that not all GPIO banks support
> biasing or drive-strength configuration.
>
> Further, as the pin controller uses a consistent approach for bias and
> drive strength configuration at the register level, a second table is
> defined for looking up the the bit-state required to enable or query the
> provided configuration.
>
> Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
> system, and pinctrl-aspeed-g5 on an AST2500EVB as well as under QEMU.
> The test method was to set the appropriate bits via devmem and verify
> the result through the controller's pinconf-pins debugfs file. This
> simultaneously validates the get() path and half of the set() path. The
> remainder of the set() path was validated by configuring a handful of
> pins via the devicetree with the supported pinconf properties and
> verifying the appropriate registers were touched.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Waleij
