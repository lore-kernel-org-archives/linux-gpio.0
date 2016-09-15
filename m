From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Thu, 15 Sep 2016 16:38:34 +0200
Message-ID: <20160915143834.GE5012@twins.programming.kicks-ass.net>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net>
 <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net>
 <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
 <20160915075150.GO5008@twins.programming.kicks-ass.net>
 <CACRpkdbbx4YA4paPGF1PtWYrPLR=dDVH8Q7FWd2gUCygT2HwtQ@mail.gmail.com>
 <CAMpxmJV+qBF4OL2WejqhdR3StmU-yOWDXVN8jJPWVTiMOJQxjg@mail.gmail.com>
 <20160915133922.GE5016@twins.programming.kicks-ass.net>
 <CAMpxmJWTyv=7GAN2KZH2yShG=0U6i8KaLd8dT71ROwE19EoCTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40218 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750750AbcIOOii (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 10:38:38 -0400
Content-Disposition: inline
In-Reply-To: <CAMpxmJWTyv=7GAN2KZH2yShG=0U6i8KaLd8dT71ROwE19EoCTQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

On Thu, Sep 15, 2016 at 04:08:52PM +0200, Bartosz Golaszewski wrote:
> 2016-09-15 15:39 GMT+02:00 Peter Zijlstra <peterz@infradead.org>:

> > In any case, if this fails, we can always punt and simply count the
> > total number of instances of this driver on the system and go with that.
> >
> 
> But for __mutex_init() to work with the key argument you need to know
> it at compile time, right?

You can do something like:

	mutex_init(&mutex);
	lockdep_set_subclass(&mutex, nr);

which will of course fail at runtime the moment nr >= 8, but is that
really a concern?

Equally you can do:

static struct lock_class_key my_keys[NR];

	mutex_init(&mutex);
	BUG_ON(nr > NR);
	lockdep_set_class(&mutex, my_keys + nr);

and have a bigger limit.
