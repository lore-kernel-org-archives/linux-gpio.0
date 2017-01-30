From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/3] pinctrl: intel: Add support for hardware debouncer
Date: Mon, 30 Jan 2017 17:38:57 +0200
Message-ID: <20170130153857.GN17297@lahna.fi.intel.com>
References: <20170127100716.194910-1-mika.westerberg@linux.intel.com>
 <20170127100716.194910-2-mika.westerberg@linux.intel.com>
 <CACRpkdbDuOOzsOBYC+oqogQ3QQU-0EFft9KjkvvbTE9kt4VjCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbDuOOzsOBYC+oqogQ3QQU-0EFft9KjkvvbTE9kt4VjCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2017 at 03:03:32PM +0100, Linus Walleij wrote:
> On Fri, Jan 27, 2017 at 11:07 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > The next generation Intel GPIO hardware has two additional registers
> > PADCFG2 and PADCFG3. The latter is marked as reserved but the former
> > includes configuration for per-pad hardware debouncer.
> >
> > This patch adds support for that in the Intel pinctrl core driver. Since
> > these are additional features on top of the current generation hardware,
> > we use revision number and feature flags to enable this if detected.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Patch applied no matter what the build robot says.
> Days like these it is like C-3PO.

Thanks!

> This ended up really pretty I think, didn't it? :)

Totally agree. Thanks for the suggestion :)
