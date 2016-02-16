From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 1/1] gpio: pisosr: Don't use magic numbers
Date: Tue, 16 Feb 2016 16:35:42 +0100
Message-ID: <1799444.UXy1g4WTOV@ws-stein>
References: <1455527640-10446-1-git-send-email-alexander.stein@systec-electronic.com> <CACRpkda2LXaPFHdqkonNwnRwv_YhTN3AoOsH-wTRoBZ+-J9shg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:35522 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755389AbcBPPft (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Feb 2016 10:35:49 -0500
In-Reply-To: <CACRpkda2LXaPFHdqkonNwnRwv_YhTN3AoOsH-wTRoBZ+-J9shg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tuesday 16 February 2016 15:55:47, Linus Walleij wrote:
> On Mon, Feb 15, 2016 at 10:14 AM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
> 
> > At first view I thought this function returned an error, but actually
> > it is the input direction. Use the define for input which makes reading
> > the code much easier.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> 
> NACK that flag is for consumers, not drivers.
> Drivers have their own API and should ideally
> return a bool true/false, but that would be another major
> refactoring....

Well, having a callback get_direction returning a bool would seem really strange. Actually the comments on gpiod_get_direction explicitly state GPIOF_DIR_IN and GPIOF_DIR_OUT as return values which aren't used in that function itself, they come from the callback. Also other dirvers like e.g. gpio-ich return (in ichx_gpio_get_direction) GPIOF_DIR_IN or GPIOF_DIR_OUT.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010

