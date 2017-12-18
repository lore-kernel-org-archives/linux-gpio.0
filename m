From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2 05/13] pinctrl: Add Microsemi Ocelot SoC driver
Date: Mon, 18 Dec 2017 17:09:00 +0100
Message-ID: <20171218160900.GR7022@piout.net>
References: <20171208154618.20105-1-alexandre.belloni@free-electrons.com>
 <20171208154618.20105-6-alexandre.belloni@free-electrons.com>
 <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
 <CAOFm3uF_OjqK0cQ1A4Xkp8kZab+afqPsnF5rB9=a7Dym9jiU4w@mail.gmail.com>
 <CACRpkdZaaZArEhw3iWaQagrKa__+DcrzSY4i7PWNYwhUiNtm4A@mail.gmail.com>
 <CAOFm3uFsM5Bbb2V-HYKf1kJgHokjUkuRLTht+7gO=-sxJ50faA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOFm3uFsM5Bbb2V-HYKf1kJgHokjUkuRLTht+7gO=-sxJ50faA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 15/12/2017 at 08:59:15 +0100, Philippe Ombredanne wrote:
> Alexandre, Linux
> 
> On Fri, Dec 15, 2017 at 12:53 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
> > On Wed, Dec 13, 2017 at 10:23 AM, Philippe Ombredanne
> > <pombredanne@nexb.com> wrote:
> >> On Wed, Dec 13, 2017 at 9:15 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> >>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >>>
> >>> Wow never saw that before. OK I guess.
> >>
> >> That's the new thing. Less legalese boilerplate, and more code for the
> >> better IMHO.
> >>
> >> You can check the doc patches from Thomas for details [1]
> >>
> >> [1] https://lkml.org/lkml/2017/12/4/934
> >
> > Yeah I'm aware of this part, but I didn't see that combined license
> > before.
> >
> > What is the reason for not just using GPL 2 here?
> 
> Linus,
> That'a a question for Alexandre that submitted this patch in the first
> place, not me.
> 
> Alexandre?
> 

I'm not the one taking that decision and I don't think this choice has a
particular issue (we use the same one for device trees).

I guess the idea behind it is to be able to reuse the same code in other
non-GPL projects.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
