From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] gpiolib: Provide and export gpiod_export_name
Date: Tue, 12 Aug 2014 17:29:05 -0700
Message-ID: <20140813002905.GA31412@roeck-us.net>
References: <1406139132-5404-1-git-send-email-linux@roeck-us.net>
 <CAAVeFuKsJpSYo2DMyTdYE2J5Cu_ZD=b9o-=S0DLDccyNmwniNg@mail.gmail.com>
 <53D0A8B7.2010005@roeck-us.net>
 <CAAVeFuK5uKhpkpEnoRFGKU4G4Fey0+giz5wwmtr+OCLJHPvnLQ@mail.gmail.com>
 <53E32C09.5000704@roeck-us.net>
 <CAAVeFuJohBznnjELvJj0OUCK+anbZ-j1xPc9gyKDGVq9X0MDSA@mail.gmail.com>
 <53E8DE1D.9070503@roeck-us.net>
 <CAAVeFuK8kb3kopVaM9qz+qOa4RT_oji8LNLQa_UHDxxxwyfZgw@mail.gmail.com>
 <53E8EBBD.6080500@roeck-us.net>
 <CAAVeFuKE8z6JunJT-pE5wyjEBR5KvEUZoh5pASzhg1n2qsWcag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:37844 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415AbaHMA3J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Aug 2014 20:29:09 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFuKE8z6JunJT-pE5wyjEBR5KvEUZoh5pASzhg1n2qsWcag@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>

On Mon, Aug 11, 2014 at 03:05:54PM -0700, Alexandre Courbot wrote:
> On Mon, Aug 11, 2014 at 9:13 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 08/11/2014 08:20 AM, Alexandre Courbot wrote:
> > [ ... ]
> >
> >>
> >> Note that this doesn't change anything to the core of the argument ;
> >> we have not heard what Linus thinks about named GPIOs in
> >> /sys/class/gpio yet, maybe he will have a different opinion...
> >>
> >
> > Well, please let me know if/when you are planning to take away
> > that existing ABI so I can plan accordingly. FWIW, out-of-kernel
> > users I am currently aware of are Juniper Networks and Zodiac
> > Aerospace. The latter asked me to help them upstreaming their code.
> >
> > If you plan to remove the ABI, you might want to inform its current
> > in-kernel users. You can look those up yourself.
> 
> We are not taking existing user-space ABIs away. But we are also not
> encouraging people to use bad ABIs by introducing new ways to use
> them, hence my restraint towards this patch.
> 

You bring it to the point. You believe that the gpio ABI, or maybe just
named gpio pins, is a bad idea. Nothing I am going to say will influence
that opinion; all we do is to keep turning in circles.

So let's stop wasting our time, agree to disagree, and move on.

Thanks,
Guenter
