From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] gpio: gpio-tb10x: remove incorrect __exit markup
Date: Wed, 18 Mar 2015 09:55:27 -0700
Message-ID: <20150318165527.GB11485@dtor-ws>
References: <20150309180409.GA24645@dtor-ws>
 <CACRpkdaUMDZYmK6t5S7LZcmZw6e-viTd0Z4d2UtXZCvEX9RSWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:37089 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755717AbbCRQzc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 12:55:32 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdaUMDZYmK6t5S7LZcmZw6e-viTd0Z4d2UtXZCvEX9RSWQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 17, 2015 at 01:30:15PM +0100, Linus Walleij wrote:
> On Mon, Mar 9, 2015 at 7:04 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > Even if bus is not hot-pluggable, the devices can be unbound from the
> > driver via sysfs, so we should not be using __exit annotations on
> > remove() methods. The only exception is drivers registered with
> > platform_driver_probe() which specifically disables sysfs bind/unbind
> > attributes.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> I prefer to have this fixed by setting
> .suppress_bind_attrs = true
> in the struct device_driver .drv portion of the device driver,
> so the driver cannot be removed from sysfs.
> 
> So platform_driver_probe() isn't really the only exception,
> there is a way to do the same supression on ordinary drivers
> if we know we won't fiddle with them from sysfs.

Yes, you are right, setting suppress_bind_attrs will work too.

> 
> Can you make a patch as per above (alternatively tell me
> how wrong I am...)

Unfortunately I won't be able to do that as I can't provide
justification for such change (i.e. I do not know why you want to
disable unbinding while still keeping the remove() implementation.

Thanks.

-- 
Dmitry
