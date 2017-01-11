From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/3] gpiolib: Convert fwnode_get_named_gpiod() to
 configure GPIO
Date: Wed, 11 Jan 2017 15:35:40 +0200
Message-ID: <1484141740.2133.57.camel@linux.intel.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
         <20170109140228.47613-4-andriy.shevchenko@linux.intel.com>
         <CACRpkdbAwpg581qodaqyUJBwp4DMCqS4kv2AjDFFuszgryZhrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:55499 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759648AbdAKNio (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 08:38:44 -0500
In-Reply-To: <CACRpkdbAwpg581qodaqyUJBwp4DMCqS4kv2AjDFFuszgryZhrw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, 2017-01-11 at 13:21 +0100, Linus Walleij wrote:
> On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Make fwnode_get_named_gpiod() consistent with the rest of
> > gpiod_get() like API,
> > i.e. configure GPIO pin immediately after request.
> > 
> > Besides obvious clean up it will help to configure pins based on
> > firmware
> > provided resources.
> > 
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This is overall fine. However I have another patch in the works from
> Alexander Stein to pass down the label to the core properly, can you
> look
> at this patch too, so we don't have to mess around too much?
> http://marc.info/?l=linux-gpio&m=148179211709228&w=2
> 
> Which patch should we base on which patch? Or can they be
> combined into one?



> That patch has been held back awaiting ACKs and already
> has an ACK from Jacek so I would merge it first. Could you
> rebase this patch on top of Alexander's patch?
> 

At the first glance looks okay to just merge it. 
Means I don't see it might affect functionality of what I'm trying to
do.

So, please, go ahead and thanks for pointing out. I will prepare mine on
top of it.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
