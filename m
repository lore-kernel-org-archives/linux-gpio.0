From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Fri, 16 Sep 2016 12:56:26 +0200
Message-ID: <20160916105626.GH5020@twins.programming.kicks-ass.net>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net>
 <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net>
 <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
 <20160915075150.GO5008@twins.programming.kicks-ass.net>
 <CACRpkdbbx4YA4paPGF1PtWYrPLR=dDVH8Q7FWd2gUCygT2HwtQ@mail.gmail.com>
 <CAMpxmJV+qBF4OL2WejqhdR3StmU-yOWDXVN8jJPWVTiMOJQxjg@mail.gmail.com>
 <20160915133922.GE5016@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44267 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752629AbcIPK43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2016 06:56:29 -0400
Content-Disposition: inline
In-Reply-To: <20160915133922.GE5016@twins.programming.kicks-ass.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

On Thu, Sep 15, 2016 at 03:39:22PM +0200, Peter Zijlstra wrote:

> In any case, if this fails, we can always punt and simply count the
> total number of instances of this driver on the system and go with that.

One caveat with that approach is that if this is s module, someone doing
rmmod, insmod a number of times gets tricky.
