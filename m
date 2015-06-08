From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH][RESEND] gpiolib: rename gpiod_set_array to gpiod_set_array_value
Date: Mon, 08 Jun 2015 09:17:16 +0200
Message-ID: <2222617.akd5TaKMMV@pcimr>
References: <2187916.sj28RxH2Yd@pcimr> <CAAVeFuLtNt3ePL_ZpM4wm0Gibzpop_sq5fNr=7cW5GUVg8_Rgg@mail.gmail.com> <CAAVeFuL1bDieCPB+JzeCaSB4mqxk4hOPtdw-LqfVnKK72U=DTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:58793 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751248AbbFHHRU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2015 03:17:20 -0400
In-Reply-To: <CAAVeFuL1bDieCPB+JzeCaSB4mqxk4hOPtdw-LqfVnKK72U=DTQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Monday 08 June 2015 15:46:44 Alexandre Courbot wrote:
> On Mon, Jun 8, 2015 at 2:37 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> > On Mon, Jun 1, 2015 at 8:41 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> >> There have been concerns that the function names gpiod_set_array() and
> >> gpiod_get_array() might be confusing to users. One might expect
> >> gpiod_get_array() to return array values, while it is actually the array
> >> counterpart of gpiod_get(). To be consistent with the single descriptor API
> >> gpiod_set_array() is renamed to gpiod_set_array_value().
> >
> > Linus, if you are ok with this change I suggest we merge it early in
> > order to avoid conflicts as more people start using these APIs! :)
> 
> Actually, Rojhalat: could you define temporary macros to ease the
> transition? Something like
> 
> #define gpiod_set_raw_array gpiod_set_raw_array_value
> 
> We would then take them out around 4.2, once all consumers are converted.
> 

Hi Alexandre,

Linus already applied the patch. (He replied to my original RFC mail.)

I am not sure those temporary macros are justified. Do you really think
there are that many out-of-tree consumers? And if so, how would we know
when all of them have converted to the new interface? After all with those
macros around, they might not even notice they are using a deprecated
interface.

   Rojhalat

