From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Subject: Re: [Resend][PATCH] Pinctrl: imx1: fix wrong pin-name resolving
Date: Fri, 17 Jul 2015 09:33:13 +0800
Message-ID: <55A85B59.5060906@gtsys.com.hk>
References: <558C9C49.7090600@gtsys.com.hk>	<CACRpkdZ4h59v6i6_htLGj2K9n_-qidd2wtZFW21N2J1p=OK=Cw@mail.gmail.com>	<20150716113458.GM1426@pengutronix.de> <CACRpkdawo3048Kt-_Jio0kgSkUU5mkKkZ4gAJRZom3uKisEF0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.fpasia.hk ([202.130.89.98]:46553 "EHLO fpa01n0.fpasia.hk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751033AbbGQBd0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 16 Jul 2015 21:33:26 -0400
In-Reply-To: <CACRpkdawo3048Kt-_Jio0kgSkUU5mkKkZ4gAJRZom3uKisEF0A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?VXdlIEtsZWluZS1Lw7Y=?= =?UTF-8?B?bmln?= <u.kleine-koenig@pengutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

>>>
>>> Patch applied. Can't seem so see anyone who's safeguarding this
>>> driver recently, putting some people on To:
>>
>> I commented in that thread and the outcome from my POV was that the fix
>> needs a better changelog and it could be optimised to not lookup the pin
>> if debug is off. (I don't know the patch content, as it was stripped in
>> the reply.)
>
> OK Chris will you send a new version of this patch?
>
> Yours,
> Linus Walleij
>

Hi Uwe

If you don't mind take over the ownership of patching this issue?

I'm very busy at the moment and afraid it takes too long to bring the right
comments etc..

Thanks
Chris


-- 
GTSYS Limited RFID Technology
9/F, Unit E, R07, Kwai Shing Industrial Building Phase 2,
42-46 Tai Lin Pai Road, Kwai Chung, N.T., Hong Kong
Tel (852) 9079 9521

Disclaimer: http://www.gtsys.com.hk/email/classified.html
