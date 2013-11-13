From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Wed, 13 Nov 2013 10:15:19 +0100
Message-ID: <52834327.9060308@aksignal.cz>
References: <874n7i4a7x.fsf@gmail.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from port.iol.cz ([194.228.1.9]:62008 "EHLO port.iol.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758875Ab3KMJPY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 13 Nov 2013 04:15:24 -0500
In-Reply-To: <874n7i4a7x.fsf@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Gamari <bgamari.foss@gmail.com>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Ben,
probably it's what I' trying to do.
Why it is not in master tree?
Please, send me some example of DT usage.
Thanks
Jiri

Dne 12.11.2013 03:36, Ben Gamari napsal(a):
> On Thu, Oct 17, 2013 at 6:03 PM, Alexandre Courbot wrote:
>> But maybe I'm missing your point - could you describe a concrete
>> use-case for this feature that can *not* be achieved using
>> gpio_export_with_link()?
>
> For what it's worth, it seems that the gpio-of-helper[1] driver found in
> BeagleBoard kernels targets a use-case similar to that intended by this
> patch.
>
> Cheers,
>
> - Ben
>
>
> [1] https://github.com/beagleboard/meta-beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainline-3.8/not-capebus/0182-gpio-Introduce-GPIO-OF-helper.patch
>
