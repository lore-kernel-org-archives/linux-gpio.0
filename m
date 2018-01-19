From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [RFC] libgpiod public API reviews needed
Date: Fri, 19 Jan 2018 14:28:40 +0100
Message-ID: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f174.google.com ([74.125.82.174]:42756 "EHLO
        mail-ot0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753332AbeASN2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 08:28:41 -0500
Received: by mail-ot0-f174.google.com with SMTP id s3so1376052otc.9
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jan 2018 05:28:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

Hi,

I would like to release libgpiod v1.0 soon (preferably before FOSDEM
2018). The first version (v0.x series) was written in a matter of two
weeks and the API was not well designed. Since v0.3 release I've been
working on redesigning the public API to make it simplier and more
useful.

I want to commit to a stable interface for the library starting from
v1.0 but it would be great if I could get some reviews first - it's
basically only about reviewing a single public header: include/gpiod.h
in which all public symbols are documented. Any implementation details
can always be changed later.

The most prominent changes since 0.3 include:
- removal of custom error handling in favor of errnos
- merge of two separate interfaces for event requests and regular line requests
- redesign of the simple API
- addition of a bunch of helpers for line requests
- redesign of the iterator API
- making the use of prefixes more consistent
- renaming of symbols all over the place
- and various minor tweaks

As far as usefulness goes - the user space tools that are included all
use this API and it looks pretty clean.

The project is hosted at kernel.org:

    https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/

and the code that needs review is on the master branch.

Thanks in advance to anyone who'll find the time to take a look.

Best regards,
Bartosz Golaszewski
