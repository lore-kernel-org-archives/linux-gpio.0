From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl / gpio: Introduce .set_config() callback
 for GPIO chips
Date: Tue, 24 Jan 2017 13:53:53 +0100
Message-ID: <CACRpkdYW9fe39w3KkdLgiiJLr_rQcX2rTrN=54pzP+zqFoLXZQ@mail.gmail.com>
References: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
 <20170123123434.61972-4-mika.westerberg@linux.intel.com> <20170123171107.GC32404@localhost>
 <20170124111130.GE17297@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:38705 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750836AbdAXMyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2017 07:54:00 -0500
Received: by mail-it0-f42.google.com with SMTP id c7so88460742itd.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2017 04:54:00 -0800 (PST)
In-Reply-To: <20170124111130.GE17297@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 24, 2017 at 12:11 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Jan 23, 2017 at 06:11:07PM +0100, Johan Hovold wrote:
>> On Mon, Jan 23, 2017 at 03:34:34PM +0300, Mika Westerberg wrote:
>> > Currently we already have two pin configuration related callbacks
>> > available for GPIO chips .set_single_ended() and .set_debounce(). In
>> > future we expect to have even more, which does not scale well if we need
>> > to add yet another callback to the GPIO chip structure for each possible
>> > configuration parameter.
>> >
>> > Better solution is to reuse what we already have available in the
>> > generic pinconf.
>> >
>> > To support this, we introduce a new .set_config() callback for GPIO
>> > chips. The callback takes a single packed pin configuration value as
>> > parameter. This can then be extended easily beyond what is currently
>> > supported by just adding new types to the generic pinconf enum.
>> >
>> > If the GPIO driver is backed up by a pinctrl driver the GPIO driver can
>> > just assign gpiochip_generic_config() (introduced in this patch) to
>> > .set_config and that will take care configuration requests are directed
>> > to the pinctrl driver.
>> >
>> > We then convert the existing drivers over .set_config() and finally
>> > remove the .set_single_ended() and .set_debounce() callbacks.
>> >
>> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
>> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> For greybus and USB serial:

>>
>> Acked-by: Johan Hovold <johan@kernel.org>
>
> Thanks!
>
>> Note however that this patch fails to apply to linux-next (conflicts in
>> pinctrl as well as staging).
>
> Indeed, it does. I did the series on top of v4.10-rc5 but looks like
> there are some changes in linux-next that I missed.
>
> I'll rebase the series on top of linux-next and resend.

If the conflicts are just with the GPIO tree then the  "devel" branch
in the GPIO tree is what you should base it on.

If there are conflicts with other trees including pinctrl it should
probably be based on v4.10-rcN and end up in my face, in this case
maybe I should just make an immutable branch in the GPIO tree and
pull to both itself and pincontrol and resolve the conflicts if they are
clashing.

Yours,
Linus Walleij
