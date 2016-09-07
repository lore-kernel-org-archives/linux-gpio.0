From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] pinctrl: meson-gxbb: add the pins for the SDIO/sd_emmc_a controller
Date: Wed, 07 Sep 2016 12:07:39 -0700
Message-ID: <7hk2enttok.fsf@baylibre.com>
References: <20160828164725.19429-1-martin.blumenstingl@googlemail.com>
        <20160828164725.19429-2-martin.blumenstingl@googlemail.com>
        <CACRpkdbPVeUA+BSPgQ1XmFJw_J6-V_2BM9h3kO2yq-vUfySsGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:35987 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbcIGTHl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 15:07:41 -0400
Received: by mail-pf0-f175.google.com with SMTP id 128so9378535pfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 12:07:41 -0700 (PDT)
In-Reply-To: <CACRpkdbPVeUA+BSPgQ1XmFJw_J6-V_2BM9h3kO2yq-vUfySsGQ@mail.gmail.com>
        (Linus Walleij's message of "Wed, 7 Sep 2016 16:24:29 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Carlo Caione <carlo@caione.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sun, Aug 28, 2016 at 6:47 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>
>> sd_emmc_a is used a controller for the SDIO modules. This adds the pin
>> configuration for the SDIO controller.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> No reply from maintainers, but you obviously know what you're doing so
> patch applied.

Oh, I thought Neil already responded, but I'm not seeing it now.  This
patch is missing the SDIO IRQ line.

Martin can you respin?

Sorry for the lag, I'm still catching up after some vacation,

Kevin
