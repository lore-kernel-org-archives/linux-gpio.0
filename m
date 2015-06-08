From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH][RESEND] gpiolib: rename gpiod_set_array to gpiod_set_array_value
Date: Mon, 8 Jun 2015 15:46:44 +0900
Message-ID: <CAAVeFuL1bDieCPB+JzeCaSB4mqxk4hOPtdw-LqfVnKK72U=DTQ@mail.gmail.com>
References: <2187916.sj28RxH2Yd@pcimr> <CAAVeFuLtNt3ePL_ZpM4wm0Gibzpop_sq5fNr=7cW5GUVg8_Rgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35620 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123AbbFHGrG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2015 02:47:06 -0400
Received: by oihd6 with SMTP id d6so87112887oih.2
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2015 23:47:05 -0700 (PDT)
In-Reply-To: <CAAVeFuLtNt3ePL_ZpM4wm0Gibzpop_sq5fNr=7cW5GUVg8_Rgg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Mon, Jun 8, 2015 at 2:37 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Mon, Jun 1, 2015 at 8:41 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
>> There have been concerns that the function names gpiod_set_array() and
>> gpiod_get_array() might be confusing to users. One might expect
>> gpiod_get_array() to return array values, while it is actually the array
>> counterpart of gpiod_get(). To be consistent with the single descriptor API
>> gpiod_set_array() is renamed to gpiod_set_array_value().
>
> Linus, if you are ok with this change I suggest we merge it early in
> order to avoid conflicts as more people start using these APIs! :)

Actually, Rojhalat: could you define temporary macros to ease the
transition? Something like

#define gpiod_set_raw_array gpiod_set_raw_array_value

We would then take them out around 4.2, once all consumers are converted.
