From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] gpio: acpi: acpi_dev_gpio_irq_get: ignore the
 status of unselected irqs
Date: Mon, 13 Mar 2017 21:38:41 +0200
Message-ID: <1489433921.20145.230.camel@linux.intel.com>
References: <20170310205846.16530-1-hdegoede@redhat.com>
         <1489425824.20145.223.camel@linux.intel.com>
         <3133c2fe-427e-f742-9647-d1f45eeaed4a@redhat.com>
         <1489432753.20145.226.camel@linux.intel.com>
         <ef81a5ba-edaa-d6cc-70df-74180269c409@redhat.com>
         <1489433465.20145.228.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:2031 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751874AbdCMTkO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 15:40:14 -0400
In-Reply-To: <1489433465.20145.228.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

On Mon, 2017-03-13 at 21:31 +0200, Andy Shevchenko wrote:
> On Mon, 2017-03-13 at 20:23 +0100, Hans de Goede wrote:
> > Hi,
> > 
> > On 13-03-17 20:19, Andy Shevchenko wrote:
> > > On Mon, 2017-03-13 at 18:56 +0100, Hans de Goede wrote:
> > > > On 13-03-17 18:23, Andy Shevchenko wrote:
> > > > > On Fri, 2017-03-10 at 21:58 +0100, Hans de Goede wrote:
> > > I will rebase my series on your patch, but I'm going to slightly
> > > modify
> > > it anyway (basically squash one of my patches).
> > 
> > Ok, sounds good. If you're going to use my patch as a base,
> > shall I cherry-pick the version with your changes squashed and
> > submit that upstream stand-alone ?
> 
> If you want to, I have no objections.
> Lemme submit the branch first.

Done.

Please, test it!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
