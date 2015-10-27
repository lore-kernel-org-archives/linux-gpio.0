From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] drivers/pinctrl: Add the concept of an "init" state
Date: Tue, 27 Oct 2015 11:25:19 +0100
Message-ID: <CACRpkdZNBe8P8-FMyQd2E4ieJ2Bck9tgnzAiZqLGWVf8bW6W8Q@mail.gmail.com>
References: <1445400906-32284-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34545 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752677AbbJ0KZU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 06:25:20 -0400
Received: by oies66 with SMTP id s66so116824954oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2015 03:25:19 -0700 (PDT)
In-Reply-To: <1445400906-32284-1-git-send-email-dianders@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 21, 2015 at 6:15 AM, Douglas Anderson <dianders@chromium.org> wrote:

> For pinctrl the "default" state is applied to pins before the driver's
> probe function is called.  This is normally a sensible thing to do,
> but in some cases can cause problems.  That's because the pins will
> change state before the driver is given a chance to program how those
> pins should behave.
>
> As an example you might have a regulator that is controlled by a PWM
> (output high = high voltage, output low = low voltage).  The firmware
> might leave this pin as driven high.  If we allow the driver core to
> reconfigure this pin as a PWM pin before the PWM's probe function runs
> then you might end up running at too low of a voltage while we probe.
>
> Let's introudce a new "init" state.  If this is defined we'll set
> pinctrl to this state before probe and then "default" after probe
> (unless the driver explicitly changed states already).
>
> An alternative idea that was thought of was to use the pre-existing
> "sleep" or "idle" states and add a boolean property that we should
> start in that mode.  This was not done because the "init" state is
> needed for correctness and those other states are only present (and
> only transitioned in to and out of) when (optional) power management
> is enabled.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Caesar Wang <wxt@rock-chips.com>

Patch applied.

Yours,
Linus Walleij
