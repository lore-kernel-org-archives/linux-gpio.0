From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Mask all interrupts on Intel_Strago
 based systems
Date: Sun, 3 Dec 2017 16:00:42 +0200
Message-ID: <20171203140042.GU22431@lahna.fi.intel.com>
References: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
 <CACRpkdYfOz2ET_0JnqpTwCwRt5Wd0-6zfsjPLx42g8ia-KwgMA@mail.gmail.com>
 <e6a8c2aa-787b-d2cc-7a86-c19a7437c038@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:5346 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752088AbdLCOAu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 3 Dec 2017 09:00:50 -0500
Content-Disposition: inline
In-Reply-To: <e6a8c2aa-787b-d2cc-7a86-c19a7437c038@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-gpio@vger.kernel.org

On Sat, Dec 02, 2017 at 09:25:13AM -0800, Guenter Roeck wrote:
> On 12/02/2017 07:51 AM, Linus Walleij wrote:
> > On Fri, Dec 1, 2017 at 11:25 AM, Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > 
> > > Guenter Roeck reported an interrupt storm on a prototype system which is
> > > based on Cyan Chromebook. The root cause turned out to be a incorrectly
> > > configured pin that triggers spurious interrupts. This will be fixed in
> > > coreboot but currently we need to prevent the interrupt storm from
> > > happening by masking all interrupts (but not GPEs) on those systems.
> > > 
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> > > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > > Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > 
> > Fixes:?
> > Cc: stable@vger.kernel.org?
> 
> Fixes: bcb48cca23ec ("pinctrl: cherryview: Do not mask all interrupts in probe")

Right, thanks. I'll add them to v2.

> Mika, any chance to send an update soon ? I would like to apply the patch to
> chromeos-4.14, and I would prefer to use the final version.

I'll send an updated version tomorrow.
