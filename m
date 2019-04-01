From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Mon, 1 Apr 2019 10:49:53 +0300
Message-ID: <20190401074953.GQ3622@lahna.fi.intel.com>
References: <20171121105205.GP22431@lahna.fi.intel.com>
 <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
 <20171121120422.GR22431@lahna.fi.intel.com>
 <CAD8Lp444FNHZh6fLUfhfp1i_UBpMbS5QuvJ4FuZn7PKH1Ucy=A@mail.gmail.com>
 <20190327172940.GR3622@lahna.fi.intel.com>
 <20190328091729.GV9224@smile.fi.intel.com>
 <CAD8Lp44xuzHj4uu3a-Y9wscSyEmuG6=nbww6T9-9FaYZT_qYsw@mail.gmail.com>
 <CAB4CAwfH237-EUgfyR8-KWKo0HJOf=QkxiNjkBRg+gBpbKiM7g@mail.gmail.com>
 <20190328123444.GX3622@lahna.fi.intel.com>
 <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAB4CAwcQTH5BiDDbzfFXTDDuYQ_fuDd_1tKkecf6vwygGQmn5w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Daniel Drake <drake@endlessm.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 29, 2019 at 04:38:20PM +0800, Chris Chiu wrote:
> On Thu, Mar 28, 2019 at 8:34 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > On Thu, Mar 28, 2019 at 08:19:59PM +0800, Chris Chiu wrote:
> > > On Thu, Mar 28, 2019 at 5:38 PM Daniel Drake <drake@endlessm.com> wrote:
> > > >
> > > > On Thu, Mar 28, 2019 at 5:17 PM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > Hmm... Can you confirm that laptop you declared as a fixed case and the
> > > > > mentioned here is the same one?
> > > >
> > > > They are definitely not the same exact unit - originally we had a
> > > > pre-production sample, and now we briefly diagnosed a real production
> > > > unit that was sold to a customer. There could be subtle motherboard
> > > > variations as you mention.
> > > >
> > > > > If it's the case, I recommend to ping Asus again and make them check and fix.
> > > >
> > > > We'll keep an eye open for any opportunities to go deeper here.
> > > > However further investigation on both our side and theirs is blocked
> > > > by not having any of the affected hardware (since the models are now
> > > > so old), so I'm not very optimistic that we'll be able to make
> > > > progress there.
> > > >
> > > > > Meanwhile, Mika's proposal sounds feasible and not so intrusive. We may
> > > > > implement this later on.
> > > >
> > > > Chris will work on implementing this for your consideration.
> > > >
> > > > Thanks for the quick feedback!
> > > > Daniel
> > >
> > > What if I modify the patch as follows? It doesn't save HOSTSW_OWN register.
> > > It just toggles the bit specifically for the IRQ GPIO pin after resume when DMI
> > > matches.
> >
> > I don't really like having quirks like this if we can avoid it and in
> > this case I think we can. Just always save HOSTSW_OWN and then restore
> > it if there is a GPIO requested and the value differs (and log a warning
> > or something like that).
> 
> You mean save the content of hostsw_own register on padgroup based ex.
>     communities[i].hostown[gpp] = readl(base + gpp * 4);
> 
> And then check the hostown bit for the GPIO requested pin in
> intel_pinctrl_resume(),
> differs the hostsw_own bit on pin base (like padcfg), then restore the
> hostsw_own
> value of the padgroug which the GPIO pin is belonging to?

Yes.

> I think what you mean should be a much more straightforward solution
> for this. Could
> you implement this in your way and we can try to help verification. Thanks.

Sure I can but it probably does not happen until end of the week because
I'm currently busy with something else.
