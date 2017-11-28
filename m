From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: limit Strago DMI workarounds to
 version 1.0
Date: Tue, 28 Nov 2017 21:47:25 +0200
Message-ID: <1511898445.25007.470.camel@linux.intel.com>
References: <20171128191435.uxftu3bl4x4f2fxi@dtor-ws>
         <20171128192947.GI22431@lahna.fi.intel.com>
         <20171128194632.pvrp5e2td2mhlubi@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171128194632.pvrp5e2td2mhlubi@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, 2017-11-28 at 11:46 -0800, Dmitry Torokhov wrote:
> On Tue, Nov 28, 2017 at 09:29:47PM +0200, Mika Westerberg wrote:
> > On Tue, Nov 28, 2017 at 11:14:35AM -0800, Dmitry Torokhov wrote:
> > > As Google/Intel will fix the BIOS/Coreboot issues with hardcoding
> > > virtual interrupt numbers for keyboard/touchpa/touchscreen
> > > controllers
> > > in ACPI tables, they will also update BIOS version number from 1.0
> > > to 1.1. Let's limit the DMI quirks that try to preserve virtual
> > > IRQ
> > > numbers on Strago boards to those that still carry BIOSes 1.0.
> > > 
> > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > 
> > Assuming there is no version "0.9" or so having the same issue.
> 
> No, as far as I can tell they all had the default 1.0...

Thanks for fixing that eventually!


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
