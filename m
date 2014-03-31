From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 1/3] gpio: dwapb: drop irq_setup_generic_chip()
Date: Mon, 31 Mar 2014 17:22:00 +0100
Message-ID: <20140331162200.GB2579@page.Home>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>
 <1395345324-18299-2-git-send-email-bigeasy@linutronix.de>
 <CACRpkdY3ctcLNhpSWtuqj=d48_fqDyNzG9nGAorpAbwjAnOJUw@mail.gmail.com>
 <CACRpkdbu6LKLntP2J=ypLTrAYscvzf5WjPYb-E+RKH_vAPEYHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbu6LKLntP2J=ypLTrAYscvzf5WjPYb-E+RKH_vAPEYHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 25, 2014 at 09:37:50PM +0100, Linus Walleij wrote:
> Aha Jamie not even on the original thread. Here.
> 
> On Tue, Mar 25, 2014 at 9:37 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Mar 20, 2014 at 8:55 PM, Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> >
> >> This looks kinda wrong I didn't manage to fully test it.
> >> The driver calls irq_alloc_domain_generic_chips() which creates a gc and
> >> adds it to gc_list. The driver later then calls irq_setup_generic_chip()
> >> which also initializes the gc and adds it to the gc_list() and this
> >> corrupts the list.
> >> I can't find a single chip in tree which uses both functions so I think
> >> that irq_setup_generic_chip() can be dropped.
> >>
> >> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> >
> > Jamie: comments?

I don't have anything to add to either yours or Alan's comments.  I'll 
be more than happy to review the versions with the generic helpers if 
I'm copied onto the review.

Thanks,

Jamie
