From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: fix GPIO IRQ status mask
Date: Wed, 26 Apr 2017 17:50:12 +0300
Message-ID: <20170426145012.GC7152@lahna.fi.intel.com>
References: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
 <3257d22879148692da6887f89843389bd37ee877.1493060870.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CACRpkda-GxRLJ=RHhDLRiu_ub=mpibQ7UPXg0=p-7jwJKpK5kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:14259 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1041178AbdDZOuX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Apr 2017 10:50:23 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkda-GxRLJ=RHhDLRiu_ub=mpibQ7UPXg0=p-7jwJKpK5kg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Bin Gao <bin.gao@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sathyaosid@gmail.com

On Wed, Apr 26, 2017 at 04:26:17PM +0200, Linus Walleij wrote:
> On Mon, Apr 24, 2017 at 9:15 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> 
> > From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> >
> > According to Whiskey Cove PMIC spec, bit 7 of GPIOIRQ0_REG belongs to
> > battery IO. So we should skip this bit when checking for GPIO IRQ pending
> > status. Otherwise, wcove_gpio_irq_handler() might go into the infinite
> > loop until IRQ "pending" status becomes 0. This patch fixes this issue.
> >
> > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Looks fine to me, tentatively applied.
> 
> Bin, Mika, Andy, OK?

Looks fine to me as well :)

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
