From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to tristate
Date: Thu, 26 Jan 2017 11:29:11 +0200
Message-ID: <20170126092911.GF17297@lahna.fi.intel.com>
References: <20170125162608.58bfbfb1@endymion>
 <20170125161651.GX17297@lahna.fi.intel.com>
 <20170126100506.5edf26e3@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170126100506.5edf26e3@endymion>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2017 at 10:05:06AM +0100, Jean Delvare wrote:
> Hi Mika and all,
> 
> On Wed, 25 Jan 2017 18:16:51 +0200, Mika Westerberg wrote:
> > On Wed, Jan 25, 2017 at 04:26:08PM +0100, Jean Delvare wrote:
> > > The pinctrl-baytrail driver builds just fine as a module so give
> > > users this option.
> > > 
> > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > 
> > Assuming you have checked that nothing breaks in Baytrail, I'm fine with
> > this change,
> 
> I have not, as I do not have access to any Baytrail hardware. This is
> the very reason why I'd like this code to be buildable as a module: I'm
> not happy with a useless 50 kB driver being loaded on all my systems. I
> was hopping someone at Intel would have access to the hardware to
> perform the test.

We do not have all the possible hardware here. I have one Minnowboard
MAX which I can test this on (like I commented in the other email) but
it does not have any ACPI GPIO OpRegion stuff that is present in many
Baytrail based laptops out there.
