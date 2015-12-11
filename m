From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 134/182] m68k: gpio: switch to gpiochip_add_data()
Date: Fri, 11 Dec 2015 19:28:11 +0100
Message-ID: <CACRpkdYXDhvL26Xd=UeX5yc0tH5Ke7aAjxedLRPr6Cfx_i7UQA@mail.gmail.com>
References: <1449668315-4352-1-git-send-email-linus.walleij@linaro.org>
	<CAMuHMdXhcaDfhwOR6Cw+zU+AWFPNftiZ0NtQPS9nssH1YfkC8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33344 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420AbbLKS2L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 13:28:11 -0500
Received: by obbsd4 with SMTP id sd4so39761498obb.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 10:28:11 -0800 (PST)
In-Reply-To: <CAMuHMdXhcaDfhwOR6Cw+zU+AWFPNftiZ0NtQPS9nssH1YfkC8A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Ungerer <gerg@uclinux.org>

On Wed, Dec 9, 2015 at 2:59 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Linus,
>
> On Wed, Dec 9, 2015 at 2:38 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> We're planning to remove the gpiochip_add() function to swith
>> to gpiochip_add_data() with NULL for data argument.
>
> Just wondering, and I don't think this was clarified in the cover letter
> (I'm not subscribed to linux-gpio, so I used a web archive): why don't you keep
> gpiochip_add() as an inline wrapper around gpiochip_add_data()?
> That would avoid conversions like this one.

Because I don't want that kind of stuff around cluttering the place.
Besides it's only a handful drivers of the 180 or so I converted.

Yours,
Linus Walleij
