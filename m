From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/1] gpio: gpio-altera: Remove gpiochip on probe failure.
Date: Mon, 1 Feb 2016 11:07:45 +0800
Message-ID: <56AECC01.7090201@electromag.com.au>
References: <1452828742-57299-1-git-send-email-preid@electromag.com.au>
 <1452828742-57299-2-git-send-email-preid@electromag.com.au>
 <CACRpkdaONPbiTRgTGJRBm0vxV6XM-HBez3Mm+fkKK671gFmnGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:37210 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752726AbcBADOb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Jan 2016 22:14:31 -0500
In-Reply-To: <CACRpkdaONPbiTRgTGJRBm0vxV6XM-HBez3Mm+fkKK671gFmnGA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tien Hock Loh <thloh@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 27/01/2016 5:50 PM, Linus Walleij wrote:
> On Fri, Jan 15, 2016 at 4:32 AM, Phil Reid <preid@electromag.com.au> wrote:
>
>> On failure to setup the irq altera_gpio_probe would return an error
>> but not call altera_gpio_probe. This resulted in kernel fault
>> "Unable to handle kernel paging request at virtual address xxxxxxxx"
>> later on in of_gpiochip_find_and_xlate.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>
> Fixed up commit message and patch applied.
>
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
Thanks for fixing that.

Regards
Phil Reid

