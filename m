From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to
 tristate
Date: Fri, 27 Jan 2017 09:55:53 +0100
Message-ID: <20170127095553.02cbd9ad@endymion>
References: <20170125162608.58bfbfb1@endymion>
        <20170125161651.GX17297@lahna.fi.intel.com>
        <20170126100506.5edf26e3@endymion>
        <20170126092911.GF17297@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126092911.GF17297@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, 26 Jan 2017 11:29:11 +0200, Mika Westerberg wrote:
> On Thu, Jan 26, 2017 at 10:05:06AM +0100, Jean Delvare wrote:
> > I have not, as I do not have access to any Baytrail hardware. This is
> > the very reason why I'd like this code to be buildable as a module: I'm
> > not happy with a useless 50 kB driver being loaded on all my systems. I
> > was hopping someone at Intel would have access to the hardware to
> > perform the test.
> 
> We do not have all the possible hardware here. I have one Minnowboard
> MAX which I can test this on (like I commented in the other email) but
> it does not have any ACPI GPIO OpRegion stuff that is present in many
> Baytrail based laptops out there.

Takashi, do you have any such laptop or know anyone at SUSE who does
and could test?

-- 
Jean Delvare
SUSE L3 Support
