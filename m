From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an
 architecture check
Date: Wed, 5 Jul 2017 09:01:12 +0100
Message-ID: <CALeDE9NAsehP8X60BSWP1tcLSX+rD738bd9h9DtyunCz39HSHQ@mail.gmail.com>
References: <20170704064947.10792-1-pbrobinson@gmail.com> <20170704095459.GB1250@kuha.fi.intel.com>
 <1499163673.22624.248.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:34672 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbdGEIBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2017 04:01:14 -0400
Received: by mail-yw0-f193.google.com with SMTP id a12so6990927ywh.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jul 2017 01:01:14 -0700 (PDT)
In-Reply-To: <1499163673.22624.248.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Jul 4, 2017 at 11:21 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, 2017-07-04 at 12:54 +0300, Heikki Krogerus wrote:
>> On Tue, Jul 04, 2017 at 07:49:47AM +0100, Peter Robinson wrote:
>> > The Intel pin control drivers are architecture specific so add an if
>> > arch
>> > to check for X86 or compile test to ensure continued test coverage.
>> >
>
> Sorry, have not seen the original mail.

https://marc.info/?l=linux-gpio&m=149915099506284&w=3

>> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> > ---
>> >  drivers/pinctrl/intel/Kconfig | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/pinctrl/intel/Kconfig
>> > b/drivers/pinctrl/intel/Kconfig
>> > index 396830a41127..0c7edc321415 100644
>> > --- a/drivers/pinctrl/intel/Kconfig
>> > +++ b/drivers/pinctrl/intel/Kconfig
>> > @@ -1,6 +1,7 @@
>> >  #
>> >  # Intel pin control drivers
>> >  #
>> > +if (X86 || COMPILE_TEST)
>
> And what about ARM et al. architectures?

If you look in the various sub directories you'll see that the various
arch sub directories have similar for their SoC eg ARCH_SUNXI or
explicit depends on the SoC achieving the same outcome.

> Instead I would propose to reorganize parent Kconfig to have something
> like

Well they're done in alphabetical and there's appropriate depends
ARCH_ or SOC_ etc so that those architectures don't randomly pop up in
configs for other unrelated things, the intel/ one is one of the only
ones that doesn't do this (hence this patch)

> if (ARM || COMPILE_TEST)
> ...ARM stuff...
> endif
>
> if (X86 || COMPILE_TEST)
> ...X86 stuff...
> endif
>
> But personally I don't like any of the above. So, what's the issue this
> patch is targeting against?

So that every time (in my case a distro) they don't have to explicitly
have unrelated "# CONFIG_PINCTRL_CHERRYVIEW is not set" style bits
through all their configs because it's completely unrelated to the
platform.

>> >
>> >  config PINCTRL_BAYTRAIL
>> >     bool "Intel Baytrail GPIO pin control"
>> > @@ -72,3 +73,5 @@ config PINCTRL_SUNRISEPOINT
>> >       Sunrisepoint is the PCH of Intel Skylake. This pinctrl
>> > driver
>> >       provides an interface that allows configuring of PCH pins
>> > and
>> >       using them as GPIOs.
>> > +
>> > +endif
>>
>> OK by me:
>>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>>
>> Thanks,
>>
>
> --
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy
