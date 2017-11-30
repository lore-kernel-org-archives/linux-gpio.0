From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: Fix A80 interrupt pin bank
Date: Thu, 30 Nov 2017 16:48:29 +0100
Message-ID: <CACRpkdaYpObvUdzXgVi84P_uQt8tWWEvYgovwN9jn07OFrVgMw@mail.gmail.com>
References: <20171125121948.24012-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34919 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751444AbdK3Psa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 10:48:30 -0500
Received: by mail-it0-f68.google.com with SMTP id f143so8952056itb.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 07:48:30 -0800 (PST)
In-Reply-To: <20171125121948.24012-1-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org

On Sat, Nov 25, 2017 at 1:19 PM, Andre Przywara <andre.przywara@arm.com> wrote:

> On the A80 the pins on port B can trigger interrupts, and those are
> assigned to the second interrupt bank.
> Having two pins assigned to the same interrupt bank/pin combination does
> not look healthy (instead more like a copy&paste bug from pins PA14-PA16),
> so fix the interrupt bank for pins PB14-PB16, which is actually 1.
>
> I don't have any A80 board, so could not test this.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied with Chen-Yu's ACK and fixes tag.

Yours,
Linus Walleij
