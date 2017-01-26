From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to tristate
Date: Thu, 26 Jan 2017 11:19:31 +0200
Message-ID: <20170126091931.GD17297@lahna.fi.intel.com>
References: <20170125162608.58bfbfb1@endymion>
 <CACRpkdb9npDaMe07+v-ZzntD1Z_U2Swstk6bv=7uhHLmpM5LVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb9npDaMe07+v-ZzntD1Z_U2Swstk6bv=7uhHLmpM5LVA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2017 at 09:55:36AM +0100, Linus Walleij wrote:
> On Wed, Jan 25, 2017 at 4:26 PM, Jean Delvare <jdelvare@suse.de> wrote:
> 
> > The pinctrl-baytrail driver builds just fine as a module so give
> > users this option.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > This was discussed almost one year ago, with no clear conclusion, but
> > also no evidence that the driver can't be built as a module. Is there
> > any way to push this forward?
> 
> I see ACKs for this patch, but in my git I also have:
> 
> commit 360943a8d26265825025b88da32961bd9ad4f7c6
> pinctrl: baytrail: make it explicitly non-modular
> 
> Acked by Mika.

Heh, yeah we even removed possibility to unbind the driver with that
commit. Totally forgot that one.

> So which one is it going to be?

Good question. I'm fine with both but I would really like to get some
confirmation that turning the driver to module actually does not break
anything.

I have one Minnowboard MAX here but it does not do any ACPI magic for
GPIOs so testing on that one might not catch all possible issues.

> If this should be applied, the previous patch from Paul Gortmaker
> should be reverted first. Especially the runtime PM parts seem
> important to get back.

Runtime PM actually does not do anything - there is no way to power down
the GPIO controller in Baytrail.

> Then I want a patch reverting that and adding this tristate in one.

I agree + really good explanation in the changelog why this was done.
