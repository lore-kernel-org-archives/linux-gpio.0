From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: don't bother warning when failing to get gpios
Date: Fri, 29 Nov 2013 14:33:15 +0100
Message-ID: <CACRpkdYa3yhECCNbY_=ey+-1-SMqaCMpyc9B_pn_EJSFO2jd+A@mail.gmail.com>
References: <1385716566-9810-1-git-send-email-heikki.krogerus@linux.intel.com>
	<CAAVeFuJUWcOKos3ds-ekRv6T0=sU6dtx5M3rQNTGKMDCVj68Eg@mail.gmail.com>
	<20131129110845.GA3942@xps8300>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:37837 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543Ab3K2NdQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 08:33:16 -0500
Received: by mail-ob0-f169.google.com with SMTP id wm4so10065915obc.14
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 05:33:15 -0800 (PST)
In-Reply-To: <20131129110845.GA3942@xps8300>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 29, 2013 at 12:08 PM, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> On Fri, Nov 29, 2013 at 06:37:35PM +0900, Alexandre Courbot wrote:
>> On Fri, Nov 29, 2013 at 6:16 PM, Heikki Krogerus
>> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> > index 4e10b10..2f0305e 100644
>> > --- a/drivers/gpio/gpiolib.c
>> > +++ b/drivers/gpio/gpiolib.c
>> > @@ -2434,10 +2434,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
>> >                 desc = gpiod_find(dev, con_id, idx, &flags);
>> >         }
>> >
>> > -       if (IS_ERR(desc)) {
>> > -               dev_warn(dev, "lookup for GPIO %s failed\n", con_id);
>> > +       if (IS_ERR(desc))
>> >                 return desc;
>> > -       }
>> >
>> >         status = gpiod_request(desc, con_id);
>>
>> I kind of agree with the logic that motivates this patch, but how
>> about turning this warning into dev_dbg() instead so that people who
>> wish so can still continue using it?
>
> Sure, I'll send v2 of this and do just that.

Please do, this has been a bit noisy and should probably go in
as a fix.

Yours,
Linus Walleij
