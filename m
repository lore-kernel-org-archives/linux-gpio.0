From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v7] gpio: add Intel WhiskeyCove PMIC GPIO driver
Date: Tue, 13 Sep 2016 10:46:17 -0400
Message-ID: <20160913144617.GL28311@windriver.com>
References: <20160725215938.GC211765@worksta>
 <CAP=VYLrS3=YDjaeTsnRA1DOZG14yc9VNeAzcyG9o5AKCH9Fhfw@mail.gmail.com>
 <CAHp75Vfc8SVjiT=S5hSEa1p5anFuaGZAO_op9T=Cgm-BO9FB-Q@mail.gmail.com>
 <20160913133726.GI28311@windriver.com>
 <CAHp75Vd6X_f7sO0MqjTBgbpWHSNKxiL6iQytmYqTnb=3W8Lz-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vd6X_f7sO0MqjTBgbpWHSNKxiL6iQytmYqTnb=3W8Lz-w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bin Gao <bin.gao@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

[Re: [PATCH v7] gpio: add Intel WhiskeyCove PMIC GPIO driver] On 13/09/2016 (Tue 17:35) Andy Shevchenko wrote:

> On Tue, Sep 13, 2016 at 4:37 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> >> > This looks like an invalid address, and ....
> >>
> >> >> +MODULE_AUTHOR("Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>");
> >> >
> >> > ...the same here.  In fact it sure looks like two names.  Anyway I just got a
> >> > bounce when I tried to use it...
> >>
> >> It might be that person is no longer working for Intel, though I think
> >> It would be better log message for that.
> >
> > That might make sense if the driver was old, but it hasn't even hit
> > mainline yet -- it is only in linux-next, so it cant be more than a few
> > weeks old.
> 
> It's already quite off topic, so, I would just say that it is still
> valid point. Starting from some version of the series (which takes
> couple of months?) Bin Gao did improvements.

Not sure why you would call it off topic -- a new driver appearing in
mainline should have a valid author entry, and if it is an accidental
merge of two names into one then Bin Gao is the person who can ack that
and subsequently fix it.

P.
--

> 
> -- 
> With Best Regards,
> Andy Shevchenko
