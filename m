From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] gpio: acpi: acpi_dev_gpio_irq_get: ignore the
 status of unselected irqs
Date: Mon, 13 Mar 2017 21:19:13 +0200
Message-ID: <1489432753.20145.226.camel@linux.intel.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
         <1489425824.20145.223.camel@linux.intel.com>
         <3133c2fe-427e-f742-9647-d1f45eeaed4a@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:32263 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751900AbdCMTUs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 15:20:48 -0400
In-Reply-To: <3133c2fe-427e-f742-9647-d1f45eeaed4a@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

On Mon, 2017-03-13 at 18:56 +0100, Hans de Goede wrote:
> On 13-03-17 18:23, Andy Shevchenko wrote:
> > On Fri, 2017-03-10 at 21:58 +0100, Hans de Goede wrote:

> > I will incorporate slightly different version of this (due to
> > changes
> > happened) into my branch. Please verify if everything is okay.
> 
> I just noticed that my patch was botched up a bit, it is
> taking a more complex approach then needed and it contained a bug
> (it did lookup->index = index, which should be lookup->index = i).
> 
> I've just finished writing a v2 (sorry).

NP.

Does it mean this one replaces both from v2? (to me looks like)

>  I've attached the v2 here,
> note this is against an unmodified v4.11-rc2 rather then your branch
> as I needed a clean base to debug some problems. But it should be
> easy to adapt to your branch I think.
> 
> Note this can go upstream either way (through your branch or
> directly since it is based on a clean v4.11-rc2 now) but it is
> probably easier to take it upstream through your branch to
> avoid conflicts.

I will rebase my series on your patch, but I'm going to slightly modify
it anyway (basically squash one of my patches).

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
