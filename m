From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: limit Strago DMI workarounds to
 version 1.0
Date: Tue, 22 May 2018 13:44:34 -0700
Message-ID: <20180522204434.GB123708@dtor-ws>
References: <20171128191435.uxftu3bl4x4f2fxi@dtor-ws>
 <20171128192947.GI22431@lahna.fi.intel.com>
 <20171128194632.pvrp5e2td2mhlubi@dtor-ws>
 <1511898445.25007.470.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511898445.25007.470.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 28, 2017 at 09:47:25PM +0200, Andy Shevchenko wrote:
> On Tue, 2017-11-28 at 11:46 -0800, Dmitry Torokhov wrote:
> > On Tue, Nov 28, 2017 at 09:29:47PM +0200, Mika Westerberg wrote:
> > > On Tue, Nov 28, 2017 at 11:14:35AM -0800, Dmitry Torokhov wrote:
> > > > As Google/Intel will fix the BIOS/Coreboot issues with hardcoding
> > > > virtual interrupt numbers for keyboard/touchpa/touchscreen
> > > > controllers
> > > > in ACPI tables, they will also update BIOS version number from 1.0
> > > > to 1.1. Let's limit the DMI quirks that try to preserve virtual
> > > > IRQ
> > > > numbers on Strago boards to those that still carry BIOSes 1.0.
> > > > 
> > > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > 
> > > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > 
> > > Assuming there is no version "0.9" or so having the same issue.
> > 
> > No, as far as I can tell they all had the default 1.0...
> 
> Thanks for fixing that eventually!

Ugh, so this is broken, as 1.0 is BOARD version and not BIOS. Bios
version is in form of Google_BUILD.BRANCH.PATCH, so we can't really use
it to limit the workaround (as we do not have "less than" comparator).

Anyway, in coreboot we changed board version to 1.1, so we should use
it. I'll post v2. Luckily this patch has not been picked by Linus as far
as I can tell.

-- 
Dmitry
