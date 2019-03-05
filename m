From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 bus+gpio 3/5] bus: moxtet: Add sysfs documentation
Date: Tue, 5 Mar 2019 12:11:41 +0100
Message-ID: <CAK8P3a2V-rxF4-oWiRGkFafgDuCVTS3ObZ==LD3nAw08s831rw@mail.gmail.com>
References: <20190301035852.26780-1-marek.behun@nic.cz> <20190301035852.26780-4-marek.behun@nic.cz>
 <CACRpkdam_CYGtph16McpQQ_WwohpZr+Rzi1B=re4UrGxXmSEqg@mail.gmail.com>
 <20190301161510.20b15183@nic.cz> <CACRpkdb0Bv1iwtd61GUQLU25nAKrfk-VS0PGKTYh_LoyjYWHFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb0Bv1iwtd61GUQLU25nAKrfk-VS0PGKTYh_LoyjYWHFg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Behun <marek.behun@nic.cz>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 4, 2019 at 1:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Mar 1, 2019 at 4:15 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> > On Fri, 1 Mar 2019 15:34:26 +0100
> > Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > > +What:          /sys/bus/moxtet/devices/moxtet-<name>.<addr>/output_value
> > > > +Date:          March 2019
> > > > +KernelVersion: 5.2
> > > > +Contact:       Marek Behún <marek.behun@nic.cz>
> > > > +Description:   (RW) Read last written value or write value to the
> > > > module on
> > > > +               this Moxtet address. Format: %x
> > >
> > > What is the usecase for these?
> > >
> > > If this is for debugging it should be in debugfs rather than in sysfs.
> > >
> > > If it is here for random userspace drivers, we need some good
> > > explanation as to why they can't just be kernel drivers.

I had the same thought, and then saw you already commented.

> > Hmm, it was for debugging purposes but the ability to write there is
> > not needed anymore... Shall I make it read/only? Or completely remove
> > it?
>
> I would either remove it or move it to debugfs.

How about removing it for the initial submission? Then we
can see if it's still needed later and discuss how it should be
done when we need it.

     Arnd
