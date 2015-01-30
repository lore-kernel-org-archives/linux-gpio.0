From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] gpio: max732x: add set_multiple function
Date: Fri, 30 Jan 2015 12:13:42 +0000
Message-ID: <yw1x8ugkbh55.fsf@unicorn.mansr.com>
References: <1421860669-9217-1-git-send-email-mans@mansr.com>
	<CACRpkdZ4ZjLM4jUA=1kEv_3bJzRgpfcnogiKHWvfwHUP9DM6ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from unicorn.mansr.com ([81.2.72.234]:56145 "EHLO unicorn.mansr.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754744AbbA3MNn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 07:13:43 -0500
In-Reply-To: <CACRpkdZ4ZjLM4jUA=1kEv_3bJzRgpfcnogiKHWvfwHUP9DM6ug@mail.gmail.com>
	(Linus Walleij's message of "Fri, 30 Jan 2015 11:29:54 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Wed, Jan 21, 2015 at 6:17 PM, Mans Rullgard <mans@mansr.com> wrote=
:
>
>> This adds a set_multiple function to the MAX732x GPIO driver,
>> allowing for performance gains when using gpiod_set_array().
>>
>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>
> Patch applied, thanks M=E5ns!
> BTW: are you interested in maintaining this driver?
>
> It needs converting to GPIOLIB_IRQCHIP so I'll cook a patch set for
> this, if you're using IRQs with this driver, can you pls help out
> testing it? Thanks a lot with sugar on top.

I don't have one with the interrupt line connected, so I can't really
help with that.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
