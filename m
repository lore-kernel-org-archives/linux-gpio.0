From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-tb10x: remove incorrect __exit markup
Date: Tue, 17 Mar 2015 13:30:15 +0100
Message-ID: <CACRpkdaUMDZYmK6t5S7LZcmZw6e-viTd0Z4d2UtXZCvEX9RSWQ@mail.gmail.com>
References: <20150309180409.GA24645@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34876 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbbCQMaQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 08:30:16 -0400
Received: by obfv9 with SMTP id v9so5671844obf.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 05:30:15 -0700 (PDT)
In-Reply-To: <20150309180409.GA24645@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 9, 2015 at 7:04 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Even if bus is not hot-pluggable, the devices can be unbound from the
> driver via sysfs, so we should not be using __exit annotations on
> remove() methods. The only exception is drivers registered with
> platform_driver_probe() which specifically disables sysfs bind/unbind
> attributes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I prefer to have this fixed by setting
.suppress_bind_attrs = true
in the struct device_driver .drv portion of the device driver,
so the driver cannot be removed from sysfs.

So platform_driver_probe() isn't really the only exception,
there is a way to do the same supression on ordinary drivers
if we know we won't fiddle with them from sysfs.

Can you make a patch as per above (alternatively tell me
how wrong I am...)

Yours,
Linus Walleij
