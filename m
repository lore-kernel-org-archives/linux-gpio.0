From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v4] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Tue, 2 Feb 2016 10:45:55 +0000
Message-ID: <56B088E3.7080603@collabora.co.uk>
References: <56AF52E0.2080507@collabora.co.uk>
 <20160202103622-15241-91021-mailpile@palmtree-beeroclock-net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51042 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754488AbcBBKqA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2016 05:46:00 -0500
In-Reply-To: <20160202103622-15241-91021-mailpile@palmtree-beeroclock-net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Karl Palsson <karlp@tweak.net.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>



On 02/02/16 10:41, Karl Palsson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Martyn Welch <martyn.welch@collabora.co.uk> wrote:
>>
>>
>>
>> The cp2105 is the only one of these devices that muxes GPIO
>> with serial control signals. The cp2102, cp2103 and cp2108
>> provide both GPIO and serial control signals separately, so the
>> logic to configure the GPIO for those devices will be much
>> simpler. (Hence why I called this cp210x_shared_gpio_init, as I
>> figured the best approach for supporting the other devices
>> would be through a separate init routine).
>>
>>> What about the other configurations supported for these pins (e.g.
>>> traffic indication, rs485, ...). Would you also end up with non-zero
>>> values for those?
>>>
>>
>> Will investigate.
>>
>
> CP2105 is configured by OTP rom, so should those options even be
> configurable? It's _very_ easy to blow through your settings
> trying to configure these. Especially given that cp2102 and
> cp2104 and cp2108 all have proper EEPROM for these settings. (And
> the "dual" ports aren't remotely equal, the cp2105 is a kinda
> ugly stepchild really)
>

I'm not trying to configure the device, however I do need to determine 
how the device is configured to do the right thing.

Martyn

> Cheers,
> Karl P
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
>
> iQIcBAEBAgAGBQJWsIfxAAoJEBmotQ/U1cr2MZIQAKG+N/qiXbv0VYB3nglB/xss
> d9Jhx9BuCHFcMdxH/zKipqxn43v7/QRJvCdXNRYyDWWjbNvgi7VjqaGo+ywcgE9P
> KZxF3DgvUD0ybrrkEV2p9p7Gu2y2tGQazQLAKXAuRTmHRJnASasOVTEBXI8n7IR1
> oTO0WctaTITHl7cA7BcZe3oIN9E5XU1GLTqaOP5pWqwiz55xDbFUVHkfhq+psHPR
> X8P5Vn9yKWYWa4qw/Xg8p6SdW83sdlAIIN+XXrM8kHH1S3YHT0oi2KcDuIY4wsxD
> WkqnPnzsJG7yFTXcXqyEaV4s54ALsKTcFIIMLfP+O6H7OYD/BIxCbWa7RfBBB0ts
> tfml5cx7gfy7SUwmaZVs9hCbwQskx8jU2mnl685dbGQH6zAV4DfAPYQb3aYQxkP8
> B+klSwBPTptYvZLMiuvb9cUF6XpdQqDmdC820APAaEv1cl+uuqjtn2YkLlEv/JqV
> sZmkpiNH4yVwvTRcqOYtaMZbLndnXJaz667dkYGfEOO6njWFmYHy0MJBY8O1OKzO
> ZZtpoa6oAT6kmbF5DR0wUpl9hu7O423qogLngDYYP5jUZUwxQtvsSsdYRWfF+wCX
> FAcwzYVZ/EiyAU/jeyOZhxoMZ5+x6Ikze1Kb4KJJKvKnLJu57bHHGPsby0ZJPa6b
> tWxRfTEBA5limAc0NXSF
> =ZPkX
> -----END PGP SIGNATURE-----
>
