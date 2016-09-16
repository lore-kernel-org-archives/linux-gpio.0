From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Fri, 16 Sep 2016 16:21:10 +0200
Message-ID: <CAMpxmJUMv_9MCuProjbUQZ4O1sy+m1oPHjyzUireHzJRtR+1KQ@mail.gmail.com>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net> <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net> <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
 <20160915075150.GO5008@twins.programming.kicks-ass.net> <CACRpkdbbx4YA4paPGF1PtWYrPLR=dDVH8Q7FWd2gUCygT2HwtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34491 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935259AbcIPOVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2016 10:21:12 -0400
Received: by mail-io0-f174.google.com with SMTP id q92so27152681ioi.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2016 07:21:12 -0700 (PDT)
In-Reply-To: <CACRpkdbbx4YA4paPGF1PtWYrPLR=dDVH8Q7FWd2gUCygT2HwtQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

2016-09-15 14:41 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
>
> Oh clever. Of course.
>
> Bartosz can you try out this approach?
>
> Yours,
> Linus Walleij

Hi Linus,

I submitted a patch reusing a routine already present in i2c.h that
allows to test if an i2c adapter's parent is also an i2c adapter,
which is the case for adapters behind a multiplexer.

Also Cc'ed linux-i2c and Wolfram Sang to let him take a look if the
API is used correctly.

Best regards,
Bartosz Golaszewski
