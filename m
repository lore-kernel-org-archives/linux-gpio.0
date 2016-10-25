From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/9] pinctrl: meson: allow gpio to request irq
Date: Tue, 25 Oct 2016 11:14:35 +0200
Message-ID: <CACRpkdYUVXny57AC9rKX3VRAyooEk_2XLvqe9jOuT3rOaE75rg@mail.gmail.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
 <1476871709-8359-5-git-send-email-jbrunet@baylibre.com> <CACRpkdaCZPS45t3eTcjJExOu=YT_YkjNkdpg09jQqvLQOJH=Qw@mail.gmail.com>
 <1477040798.15560.96.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:37820 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754373AbcJYJOg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 05:14:36 -0400
Received: by mail-qk0-f179.google.com with SMTP id w69so15959140qka.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 02:14:36 -0700 (PDT)
In-Reply-To: <1477040798.15560.96.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>

On Fri, Oct 21, 2016 at 11:06 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:

>> Isn't this usecase (also as described in the cover letter) a textbook
>> example of when you should be using hierarchical irqdomain?
>>
>> Please check with Marc et al on hierarchical irqdomains.
>
> Linus,
> Do you mean I should create a new hierarchical irqdomains in each of
> the two pinctrl instances we have in these SoC, these domains being
> stacked on the one I just added for controller in irqchip ?
>
> I did not understand this is what you meant when I asked you the
> question at ELCE.

Honestly, I do not understand when and where to properly use
hierarchical irqdomain, even after Marc's talk at ELC-E.

Which is problematic since quite a few GPIO drivers now
need to use them.

I will review his slides, in the meantime I would say: whatever
Marc ACKs is fine with me. I trust this guy 100%. So I guess I
could ask that he ACK the entire chain of patches
from GIC->specialchip->GPIO.

Yours,
Linus Walleij
