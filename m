From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Fri, 16 Sep 2016 14:00:58 +0200
Message-ID: <CAMpxmJUj-YS48CCfexZ3q0hxk60MS+1B51h=KRO63tpwmffBcQ@mail.gmail.com>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net> <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net> <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
 <20160915075150.GO5008@twins.programming.kicks-ass.net> <CACRpkdbbx4YA4paPGF1PtWYrPLR=dDVH8Q7FWd2gUCygT2HwtQ@mail.gmail.com>
 <CAMpxmJV+qBF4OL2WejqhdR3StmU-yOWDXVN8jJPWVTiMOJQxjg@mail.gmail.com>
 <20160915133922.GE5016@twins.programming.kicks-ass.net> <20160916105626.GH5020@twins.programming.kicks-ass.net>
 <CAMpxmJVxBGHK9Y96_6Sp4p2hCki_J=errR41zp28uBtXuDmKjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:34010 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756183AbcIPMBA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2016 08:01:00 -0400
Received: by mail-io0-f169.google.com with SMTP id q92so23005284ioi.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2016 05:00:59 -0700 (PDT)
In-Reply-To: <CAMpxmJVxBGHK9Y96_6Sp4p2hCki_J=errR41zp28uBtXuDmKjA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

2016-09-16 13:14 GMT+02:00 Bartosz Golaszewski <bgolaszewski@baylibre.com>:
>
> The whole thing is a bit more complicated - I'm trying to figure out
> the code behind it, but the first expander has four parents whose
> driver == pca953x, while the second has five of them. There is no
> device name, but kobj->name corresponds with the i2c device
> sub-directories on correct addresses and busses (1-0021 for the first
> one and 4-0020 for the second on my board).

Actually nevermind my last e-mail - I did a braindead mistake when
obtaining logs.

Thanks,
Bartosz
