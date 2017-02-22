From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] pinctrl: samsung: Register pinctrl before GPIO
Date: Wed, 22 Feb 2017 15:37:37 +0100
Message-ID: <CACRpkdbq4RMH_2rfaxDbEZaqrQWO9bq8BS8AqnaV6SH=0s6jRQ@mail.gmail.com>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38508 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932756AbdBVOhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 09:37:39 -0500
Received: by mail-it0-f52.google.com with SMTP id y135so2523039itc.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 06:37:39 -0800 (PST)
In-Reply-To: <1487251636-2480-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>

On Thu, Feb 16, 2017 at 2:27 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> If we request a GPIO hog, then gpiochip_add_data will attempt to request
> some of its own GPIOs. The driver also uses gpiochip_generic_request
> which means that for any GPIO request to succeed the pinctrl needs to be
> registered. Currently however the driver registers the GPIO and then the
> pinctrl meaning all GPIO hog requests will fail, which then in turn causes
> the whole driver to fail probe. Fix this up by ensuring we register the
> pinctrl first. Although currently there are no users of GPIO hogs in
> mainline there are plenty of Samsung based boards that are widely used
> for development purposes of other hardware. Indeed we hit this issue
> whilst attaching some additional hardware to an Arndale system.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>
> Changes since v1:
>  - Updated commit message

Patch applied. Will not be visible in -next until after the merge window
though.

Yours,
Linus Walleij
