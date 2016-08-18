From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Thu, 18 Aug 2016 16:58:13 +0300
Message-ID: <20160818135813.GJ30827@lahna.fi.intel.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
 <20150601092348.GK1747@lahna.fi.intel.com>
 <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
 <20150602141520.GE4057@lahna.fi.intel.com>
 <CALUN=qLAvUipcHArE_NT7Opv8iDjaZ3OTAsgs_jpXtBbvpwUXQ@mail.gmail.com>
 <20160817081344.GM30827@lahna.fi.intel.com>
 <CALUN=q+LAfTf_=V4tXy3_h48K2BLtNOjxK4=AKRTtdjfW8970g@mail.gmail.com>
 <20160818121328.GE30827@lahna.fi.intel.com>
 <CALUN=qJ_KEXXD4T11h3Xxjxx9LExBnzevVKGQ1K=XGZn-SS_rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALUN=qJ_KEXXD4T11h3Xxjxx9LExBnzevVKGQ1K=XGZn-SS_rg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anisse Astier <anisse@astier.eu>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 18, 2016 at 03:52:57PM +0200, Anisse Astier wrote:
> On Thu, Aug 18, 2016 at 2:13 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Wed, Aug 17, 2016 at 03:42:58PM +0200, Anisse Astier wrote:
> >> pin 25 (GPIO_SUS6) GPIO ctrl0 0xec918201 ctrl1 0x05c00001
> >
> > It is this one (GPIO_SUS6).
> >
> > I wonder if we can relax the driver so that it only masks pins which are
> > not configured to generate interrupts by the BIOS. I quickly tried
> > following on one Braswell machine and it did not generate spurious
> > interrupts.
> >
> > Can you check if this works for you?
> 
> I tried it, your patch is working. It gives the same result as not
> clearing the north community. I receive the ACPI events.

OK, thanks for testing.

I'll make a formal patch and submit it with you CC'd. Let's hope it will
not break anything :)
