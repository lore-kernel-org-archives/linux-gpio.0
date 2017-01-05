From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 6/6] pinctrl: intel: Add Intel Gemini Lake pin controller
 support
Date: Thu, 5 Jan 2017 12:06:52 +0200
Message-ID: <20170105100652.GZ3353@lahna.fi.intel.com>
References: <20170104153109.28663-1-mika.westerberg@linux.intel.com>
 <20170104153109.28663-7-mika.westerberg@linux.intel.com>
 <CAHp75Ve2svxG1OBDvjmF_GHeD_19gp7+sWF17T_2Ls7J+WWHtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Ve2svxG1OBDvjmF_GHeD_19gp7+sWF17T_2Ls7J+WWHtg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 05, 2017 at 01:18:19AM +0200, Andy Shevchenko wrote:
> On Wed, Jan 4, 2017 at 5:31 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > This driver adds pinctrl/GPIO support for Intel Gemini Lake SoC. The
> > GPIO controller is based on the next generation GPIO hardware but still
> > compatible with the one supported by the Intel core pinctrl/GPIO driver.
> >
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> 
> SoB but no Author line. Perhaps elaborate what this credit for?

David did couple of changes to the driver when it was being developed.

I can also put something like this in the changelog if that's better:

  This patch includes material from David E. Box.

> 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> 
> > +/*
> > + * Intel Gemini Lake SoC pinctrl/GPIO driver
> > + *
> > + * Copyright (C) 2017 Intel Corporation
> > + * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
