From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFI] pinmux: pin group ownership
Date: Tue, 12 May 2015 14:10:54 +0200
Message-ID: <CACRpkdYMgu-_52gYT54W0dSLXap9spDuaz35rcnrx0mGvu=B2Q@mail.gmail.com>
References: <554CCFD1.5050907@nvidia.com>
	<CACRpkdY_Le063_hA4+kKMD8NFMFdVVB89g8YeCsWnoTg4dADxw@mail.gmail.com>
	<5551E9B9.5030208@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36109 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302AbbELMKz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 08:10:55 -0400
Received: by oift201 with SMTP id t201so3828063oif.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 05:10:54 -0700 (PDT)
In-Reply-To: <5551E9B9.5030208@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>

On Tue, May 12, 2015 at 1:53 PM, Jon Hunter <jonathanh@nvidia.com> wrote:

[Me]:
>> The usecount are done on individual pins, not groups.
>
> Thanks for confirming. With regard to the change
> e5b3b2d9ed202697a937c282f9c4d93b1e3e0848, IIUC then this allows devices
> not to define any pins but just groups. Probably because from some
> devices (such as berlin) pinmux'ing is always done at the group level.

That's correct.

> If this is the case then it would appear that there is no protection
> against two devices trying to use the same group. Is this correct?

Seems like so... darn you found a loophole.

>> In the devel tree you can even set the pinmux_ops.strict to disallow
>> GPIOs and other functions to share a pin.
>
> Thanks, however, I don't think that this helps in this case because
> pin_request() would not be called by pinmux_enable_setting() as num_pins
> = 0.

You're right.

The implementation assumes collissions happen at pin level,
not group level.

I wonder if there are enough devices out there with this problem
that we need to check for it?

If so I would opt to create a bool .group_only property
on pinmux_ops like we created .strict so that we can
avoid all pin-specific code on such pin controllers.

But I don't know it it's worth it for these few pin controllers :/

On the U300 there is only group selection, but the datasheet
helpfully defined all pins anyway so I could handle collissions
on the pin level. This is the ideal solution if possible.

Yours,
Linus Walleij
