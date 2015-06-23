From: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH] pinctrl: single: support GPIO for bits pinctrl
Date: Tue, 23 Jun 2015 18:18:45 +0800
Message-ID: <CABymUCO-mV-yBrVm8oyNfo_96HTX7qveHKTPK_-TcLvhwQ-GOA@mail.gmail.com>
References: <1434506172-4401-1-git-send-email-jun.nie@linaro.org>
	<20150617071740.GL2712@atomide.com>
	<CABymUCPb7ouZ8DVww=d=K87tkS13Qr1CuGs0+Qnb4skD7_0g2g@mail.gmail.com>
	<20150623101415.GV20628@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:36749 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932489AbbFWKSr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2015 06:18:47 -0400
Received: by lbbpo10 with SMTP id po10so3536482lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2015 03:18:45 -0700 (PDT)
In-Reply-To: <20150623101415.GV20628@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, "wan.zhijun" <wan.zhijun@zte.com.cn>, Jason Liu <jason.liu@linaro.org>

2015-06-23 18:14 GMT+08:00 Tony Lindgren <tony@atomide.com>:
> * Jun Nie <jun.nie@linaro.org> [150623 02:56]:
>> 2015-06-17 15:17 GMT+08:00 Tony Lindgren <tony@atomide.com>:
>> > * Jun Nie <jun.nie@linaro.org> [150616 18:58]:
>> >> +             if (pcs->bits_per_mux) {
>> >> +                     int pin_pos, byte_num, num_pins_in_register;
>> >> +
>> >> +                     num_pins_in_register = pcs->width / pcs->bits_per_pin;
>> >> +                     byte_num = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
>> >> +                     offset = (byte_num / mux_bytes) * mux_bytes;
>> >> +                     pin_pos = pin % num_pins_in_register;
>> >> +                     pin_pos *= pcs->bits_per_pin;
>> >> +                     data = pcs->read(pcs->base + offset) &
>> >> +                             ~(pcs->fmask << pin_pos);
>> >
>> > Should you check the pcs->fmask here too in case some bits are reserved?
>> >
>> Did not catch your idea? Those bits set in fmask are dedicated for one
>> pin mux control and should be clear before set as desired value per my
>> understanding. Do you mean some bits may be reserved and not for any
>> function?
>
> Right, can you please check that we don't try to write to reserved
> bits in the hardawre if the mask is set?
Then I have question that how can I know what bits is for function
mask, what bits are for reserved? Do we have any other value to
indicate it? I did not find it in one register for one pin mux case.

>
> Regards,
>
> Tony
