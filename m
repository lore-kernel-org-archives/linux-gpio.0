From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Thu, 15 Sep 2016 15:39:22 +0200
Message-ID: <20160915133922.GE5016@twins.programming.kicks-ass.net>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net>
 <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net>
 <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
 <20160915075150.GO5008@twins.programming.kicks-ass.net>
 <CACRpkdbbx4YA4paPGF1PtWYrPLR=dDVH8Q7FWd2gUCygT2HwtQ@mail.gmail.com>
 <CAMpxmJV+qBF4OL2WejqhdR3StmU-yOWDXVN8jJPWVTiMOJQxjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:52060 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752183AbcIONjZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 09:39:25 -0400
Content-Disposition: inline
In-Reply-To: <CAMpxmJV+qBF4OL2WejqhdR3StmU-yOWDXVN8jJPWVTiMOJQxjg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

On Thu, Sep 15, 2016 at 03:20:58PM +0200, Bartosz Golaszewski wrote:
> 2016-09-15 14:41 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> >> So can't you walk up that and see if you encounter the exact same driver
> >> again?
> >>
> >> Something like:
> >>
> >>         for (nr = 0, parent = dev->parent; parent; parent = parent->parent) {
> >>                 if (parent->device_driver == &pca953x_driver.driver)
> >>                         nr++;
> >>         }
> >
> > Oh clever. Of course.
> >
> > Bartosz can you try out this approach?
> >
> 
> I think it may be more complicated than that, depending on the hw
> topology, but the general idea seems reasonable. I'll try this.

Yeah, I figured there might be more to it.

In any case, if this fails, we can always punt and simply count the
total number of instances of this driver on the system and go with that.

