From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFI] pinmux: pin group ownership
Date: Tue, 12 May 2015 13:30:18 +0200
Message-ID: <CACRpkdY_Le063_hA4+kKMD8NFMFdVVB89g8YeCsWnoTg4dADxw@mail.gmail.com>
References: <554CCFD1.5050907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35329 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753019AbbELLaS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 07:30:18 -0400
Received: by oign205 with SMTP id n205so3077584oig.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 04:30:18 -0700 (PDT)
In-Reply-To: <554CCFD1.5050907@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>

On Fri, May 8, 2015 at 5:01 PM, Jon Hunter <jonathanh@nvidia.com> wrote:

> Looking at this change, if pinmux_enable_setting() is called but
> .get_group_pins() is not defined, then num_pins will be 0. If this is
> the case then pin_request() is not called to allocate the pins in the
> group (because no pins are defined for the group). So that makes sense.
>
> However, I am trying to understand then, if the pinmux driver will
> protect against another device attempting to use the same group for a
> different function when already in-use?
>
> For example, if you have the two functions i2c0 and uart0 mapped to pin
> group A, but no pins are defined for group A, will pinmux prevent
> someone attempting to configure both functions on the same group at the
> same time?
>
> I did not see anywhere that sets a usecount for a group (ie. allocates
> the group) but only for a pin.

The usecount are done on individual pins, not groups.

In the devel tree you can even set the pinmux_ops.strict to disallow
GPIOs and other functions to share a pin.

Yours,
Linus Walleij
