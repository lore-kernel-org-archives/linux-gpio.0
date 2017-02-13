From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH] gpio: dwapb: Add support for next generation of X-Gene
 SoC
Date: Mon, 13 Feb 2017 09:38:34 +0000
Message-ID: <20170213093834.GA16603@page>
References: <1485891838-27093-1-git-send-email-hotran@apm.com>
 <CACRpkdZw-QLOeiPqSRaEJ+mGGDwi5fh9B1uenPxQGBtTwj+cuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34921 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbdBMJih (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 04:38:37 -0500
Received: by mail-wm0-f65.google.com with SMTP id u63so18298458wmu.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2017 01:38:36 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdZw-QLOeiPqSRaEJ+mGGDwi5fh9B1uenPxQGBtTwj+cuw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hoan Tran <hotran@apm.com>, Jamie Iles <jamie@jamieiles.com>, Weike Chen <alvin.chen@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>, Duc Dang <dhdang@apm.com>

Hi Linus,

On Mon, Feb 06, 2017 at 11:21:09AM +0100, Linus Walleij wrote:
> On Tue, Jan 31, 2017 at 8:43 PM, Hoan Tran <hotran@apm.com> wrote:
> 
> > Next generation of X-Gene SoC's GPIO hardware register map is very
> > similar to DW GPIO. It only differs by a few register addresses.
> > This patch modifies DW GPIO driver to accommodate the difference
> > in a few register addresses.
> >
> > Signed-off-by: Hoan Tran <hotran@apm.com>
> 
> On next iteration please include Jamie Iles, Weike Chen and Sebastian
> Andrzej Siewior.
> They all provided substantial contributions to this driver.
> 
> The dwapb needs a proper maintainer in MAINTAINERS actually, it is one of
> those that can't use GPIOLIB_IRQCHIP so it requires special attention.
> Jamie, interested in the job? Patches welcome :)

I actually don't have access to hardware using this driver anymore so 
I'm probably not the right person for the job, but still happy to review 
patches!

Jamie
