From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Tue, 23 Jan 2018 15:15:40 +0100
Message-ID: <20180123141540.GJ3055@rfolt0960.corp.atmel.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:21056 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751629AbeAWOPx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jan 2018 09:15:53 -0500
Content-Disposition: inline
In-Reply-To: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

Hi,

On Fri, Jan 19, 2018 at 02:28:40PM +0100, Bartosz Golaszewski wrote:
> Hi,
> 
> I would like to release libgpiod v1.0 soon (preferably before FOSDEM
> 2018). The first version (v0.x series) was written in a matter of two
> weeks and the API was not well designed. Since v0.3 release I've been
> working on redesigning the public API to make it simplier and more
> useful.
> 
> I want to commit to a stable interface for the library starting from
> v1.0 but it would be great if I could get some reviews first - it's
> basically only about reviewing a single public header: include/gpiod.h
> in which all public symbols are documented. Any implementation details
> can always be changed later.
> 
> The most prominent changes since 0.3 include:
> - removal of custom error handling in favor of errnos
> - merge of two separate interfaces for event requests and regular line requests
> - redesign of the simple API
> - addition of a bunch of helpers for line requests
> - redesign of the iterator API
> - making the use of prefixes more consistent
> - renaming of symbols all over the place
> - and various minor tweaks
> 
> As far as usefulness goes - the user space tools that are included all
> use this API and it looks pretty clean.
> 
> The project is hosted at kernel.org:
> 
>     https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
> 
> and the code that needs review is on the master branch.
> 
> Thanks in advance to anyone who'll find the time to take a look.
> 

Thanks for your work, I am using your library and I am trying to promote it.

Some people were confused concerning the naming when requesting line(s)
as output. 'init_val(s)' may be better than 'default_val(s)'.

The callback for gpiod_simple_set_value(_multiple) is optional, you may mention
it. Concerning the multiple variant, I would enforce that the callback
is called when ALL the values are set.
I don't see the added value of this callback. What's the difference with
executing it depending on gpiod_simple_set_value(_multiple) return value?

Regards

Ludovic
