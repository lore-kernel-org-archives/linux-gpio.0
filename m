From: Alan Tull <atull@kernel.org>
Subject: Re: [PATCH] gpio: gpio-dwapb: add optional reset
Date: Wed, 11 Oct 2017 11:05:35 -0500
Message-ID: <CANk1AXS0EgUjYhiDoc9sqFROfv1aLzBekBdVWs6_rfRpkmPsLQ@mail.gmail.com>
References: <20171010212617.3397-1-atull@kernel.org> <CACRpkdbS6b9GW8HXmthOfaRPFMARMpyNGaR8He5BJbtfOXLMVw@mail.gmail.com>
 <1507719418.22082.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751350AbdJKQGR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Oct 2017 12:06:17 -0400
In-Reply-To: <1507719418.22082.1.camel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hoan Tran <hotran@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Oct 11, 2017 at 5:56 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:

Hi Linus, Phillipp,

Thanks for the review.

> Hi Alan, Linus,
>
> On Wed, 2017-10-11 at 10:31 +0200, Linus Walleij wrote:
>> On Tue, Oct 10, 2017 at 11:26 PM, Alan Tull <atull@kernel.org> wrote:
>>
>> > Some platforms require reset to be released to allow register
>> > access.
>> >
>> > Signed-off-by: Alan Tull <atull@kernel.org>
>>
>> Fair enough.
>>
>> (...)
>> > +       rst = devm_reset_control_get_optional_exclusive(dev, NULL);
>
> The way this reset control is used, it looks like you could use _shared
> instead of _exclusive here. This relaxes the guarantees made by the API
> a bit and may allow this driver to work with more reset controllers.

OK, will use devm_reset_control_get_optional_shared().

>
>> > +       if (IS_ERR(rst)) {
>> > +               if (PTR_ERR(rst) == -EPROBE_DEFER)
>> > +                       return PTR_ERR(rst);
>
> The _optional variant of reset_control_get returns NULL if no reset is
> specified in the device tree. If an error value is returned, it is
> always an actual error (invalid device tree contents, reset is specified
> in the device tree but the driver returns an error, etc.).
> This should just be:
>
>         if (IS_ERR(rst))
>                 return PTR_ERR(rst);

That's great!

>
>> > +       } else {
>> > +               reset_control_deassert(rst);
>> > +               gpio->rst = rst;
>
> And this should be made unconditional. reset_control_deassert just
> ignores rst == NULL.

Nice.

>
>> > +       }
>>
>> I do not see why any error other than -EPROBE_DEFER
>> should be ignored?
>>
>> I guess the _optional API returns NULL if there is no
>> reset line so it should be fine to just return the error on
>> any error.
>
> Correct. The _optional API together with NULL reset control handles
> allows to simplify handling of optional resets in the consumer drivers.
>
>> > +       if (gpio->rst)
>> > +               reset_control_assert(gpio->rst);
>>
>> Is this the right way to handle an optional reset line?
>
> Just as the deassert above, this should be made unconditional.

I've made the requested changes which shrinks the patch to be even smaller :)

Will send up v2 soon.

Thanks,
Alan

>
> regards
> Philipp
