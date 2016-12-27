From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/5] pinctrl: aspeed-g4: Add mux configuration for all pins
Date: Tue, 27 Dec 2016 23:18:57 +0100
Message-ID: <CACRpkdbZdi1s0anajbtRZMBwdE1c=k_MiUythuLpz1kixCU+FQ@mail.gmail.com>
References: <20161220073551.28522-1-andrew@aj.id.au> <20161220073551.28522-4-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:33642 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754027AbcL0WS6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Dec 2016 17:18:58 -0500
Received: by mail-qk0-f179.google.com with SMTP id t184so231237728qkd.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Dec 2016 14:18:58 -0800 (PST)
In-Reply-To: <20161220073551.28522-4-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timothy Pearson <tpearson@raptorengineering.com>

On Tue, Dec 20, 2016 at 8:35 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The patch introducing the g4 pinctrl driver implemented a smattering of
> pins to flesh out the implementation of the core and provide bare-bones
> support for some OpenPOWER platforms. Now, update the bindings document
> to reflect the complete functionality and implement the necessary pin
> configuration tables in the driver.
>
> Cc: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij
