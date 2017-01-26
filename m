From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to
 tristate
Date: Thu, 26 Jan 2017 10:05:06 +0100
Message-ID: <20170126100506.5edf26e3@endymion>
References: <20170125162608.58bfbfb1@endymion>
        <20170125161651.GX17297@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36868 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752207AbdAZJFL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 04:05:11 -0500
In-Reply-To: <20170125161651.GX17297@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>

Hi Mika and all,

On Wed, 25 Jan 2017 18:16:51 +0200, Mika Westerberg wrote:
> On Wed, Jan 25, 2017 at 04:26:08PM +0100, Jean Delvare wrote:
> > The pinctrl-baytrail driver builds just fine as a module so give
> > users this option.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Assuming you have checked that nothing breaks in Baytrail, I'm fine with
> this change,

I have not, as I do not have access to any Baytrail hardware. This is
the very reason why I'd like this code to be buildable as a module: I'm
not happy with a useless 50 kB driver being loaded on all my systems. I
was hopping someone at Intel would have access to the hardware to
perform the test.

Meanwhile I have found that my patch is not good, because since I wrote
it, Paul Gortmaker remove the module glue code from the driver itself:

commit 360943a8d26265825025b88da32961bd9ad4f7c6
Author: Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Mon Jun 6 22:43:01 2016 -0400

    pinctrl: baytrail: make it explicitly non-modular

This would have to be reverted first. Paul, do I understand it
correctly that the commit above was generated automatically and was not
specific to the pinctrl-baytrail driver?

-- 
Jean Delvare
SUSE L3 Support
