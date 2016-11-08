From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 09/15] pinctrl-sx150x: Replace sx150x_*_cfg by means of
 regmap API
Date: Tue, 8 Nov 2016 09:43:46 +0100
Message-ID: <CACRpkdZ4T-8pW56KqxBwukviJ4Pn6PFtquwOOTUKAGbsJ9jsKw@mail.gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com> <1478537603-23653-10-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:34622 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753004AbcKHInw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 03:43:52 -0500
Received: by mail-qk0-f182.google.com with SMTP id q130so208389185qke.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 00:43:52 -0800 (PST)
In-Reply-To: <1478537603-23653-10-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>

On Mon, Nov 7, 2016 at 5:53 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> The difference between 8 and 16 pin GPIO expanders can be accomodated by
> the means of regmap API without resorting to usaing driver-specific
> read/write accessors. This change, IMHO, brings the following benefits:
>
>         - Replaces driver's idiosyncratic way of dealing with
>           mult-register fields with regmap API, which, hopefuly,
>           makes the code a bit easier for a new reader to understand
>
>         - Removes various multi-read for-loop register read logic
>           from various places in the code and puts it in a signle
>           place
>
>         - Removes ad-hoc IRQ register caching code in
>           sx150x_irq_bus_sync_unlock, since that functionality is
>           provided by regmap
>
> Besided aforementioned benefits this change also implements necessary
> RegSense byte swap necessary for SX1503 and SX1506 variants of the chip.
>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Patch applied!

Yours,
Linus Walleij
