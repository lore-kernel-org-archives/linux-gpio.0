From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 00/10] add pinmuxing support for pins in AXP209 and
 AXP813 PMICs
Date: Sat, 2 Dec 2017 17:00:03 +0100
Message-ID: <CACRpkdaMxaLjsDETm6_56tyGDu6=W0L4SQCAA2mmSR4mkR-jAA@mail.gmail.com>
References: <cover.3ff63fdf302c6bda02ea7d160ad2aa5afee0899d.1512135804.git-series.quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:40055 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752386AbdLBQAE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 11:00:04 -0500
Received: by mail-it0-f68.google.com with SMTP id f190so5571850ita.5
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 08:00:04 -0800 (PST)
In-Reply-To: <cover.3ff63fdf302c6bda02ea7d160ad2aa5afee0899d.1512135804.git-series.quentin.schulz@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-sunxi <linux-sunxi@googlegroups.com>

On Fri, Dec 1, 2017 at 2:44 PM, Quentin Schulz
<quentin.schulz@free-electrons.com> wrote:

> The AXP209 and AXP813 PMICs have several pins (respectively 3 and 2) that can
> be used either as GPIOs or for other purposes (ADC or LDO here).
>
> We already have a GPIO driver for the GPIO use of those pins on the AXP209.
> Let's "upgrade" this driver to support all the functions these pins can have.
>
> Then we add support to this driver for the AXP813 which is slighlty different
> (basically a different offset in two registers and one less pin).
>
> I suggest patches 1 to 8 go through Linus's tree and 9 and 10 via Maxime or
> Chen-Yu's tree.
>
> v4:

Looks overall good. As soon as Maxime is happy with everything I will
happily apply 1-8 to the pinctrl tree and then pull it to GPIO as well to
avoid clashes.

I think there were some minor comments but it seems almost finished.

Yours,
Linus Walleij
