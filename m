From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v3] pinctrl: Add Microsemi Ocelot SoC driver
Date: Tue, 9 Jan 2018 15:07:05 +0100
Message-ID: <20180109140705.GC2719@piout.net>
References: <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
 <20180106000926.13770-1-alexandre.belloni@free-electrons.com>
 <CACRpkdaCfjW7hWS1VnC6MR+j48=Q0uo7OSMA_6G90D7Cz7NMZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:57941 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752198AbeAIOHH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jan 2018 09:07:07 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaCfjW7hWS1VnC6MR+j48=Q0uo7OSMA_6G90D7Cz7NMZA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/01/2018 at 14:56:36 +0100, Linus Walleij wrote:
> On Sat, Jan 6, 2018 at 1:09 AM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> 
> > The Microsemi Ocelot SoC has a few pins that can be used as GPIOs or take
> > multiple other functions. Add a driver for the pinmuxing and the GPIOs.
> >
> > There is currently no support for interrupts.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  - use  pinctrl_gpio_direction_input/output from
> >    ocelot_gpio_direction_input/output
> >  - add a comment for ALT0/ALT1
> >  - fill .max_register of ocelot_pinctrl_regmap_config
> 
> Patch applied. And it looks very good too.
> 
> This was all I had to do, right? No dependent patches?
> 

Nothing more for you, thanks! I'll get back to this driver if there is
interest in having IRQ support but I don't think this will happen soon.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
