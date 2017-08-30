From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio before querying its direction"
Date: Wed, 30 Aug 2017 15:59:00 +0200
Message-ID: <87ziah2m3f.fsf@free-electrons.com>
References: <20170830112424.7a3a7c36@windsurf.lan>
        <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42563 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbdH3N7I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 09:59:08 -0400
In-Reply-To: <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org> (Timur
        Tabi's message of "Wed, 30 Aug 2017 07:31:41 -0500")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@free-electrons.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>

Hi Timur,
 
 On mer., août 30 2017, Timur Tabi <timur@codeaurora.org> wrote:

> On 8/30/17 4:24 AM, Thomas Petazzoni wrote:
>> Therefore, with Timur's commit applied, when the system boots, we get
>> serial output, up to the point where gpiochip_add_data() is called, and
>> requests all GPIOs. Since our UART pins are not requested at the
>> pinctrl level, the gpio_request succeeds and re-muxes those pins as
>> GPIOs: we lose the UART.
>
> This part I don't understand.  My patch just only impacts the code
> that queries the direction of the GPIO.  It does not set the
> direction.
>
> When gpiochip_add_data() calls chip->request, what function is that
> calling?

the request callback is gpiochip_generic_request so I would be surprised
that there was a bug in it.

>
> The only thing I can think of is that the ->request function is not
> just returning status, but is also muxing the GPIO.  If so, then I
> think that's a bug.

Gregory

>
> -- 
> Sent by an employee of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the
> Code Aurora Forum, hosted by The Linux Foundation.
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
