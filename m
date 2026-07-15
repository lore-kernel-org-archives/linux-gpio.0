Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023154398FC;
	Wed, 15 Jul 2026 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142095; cv=none; b=PuiFdrTtRx/ih7m+Qu6BRgiyX3BFcPjbbPuinhbynGoJVws++EIJ+w57IZvRptlnirqoXeTMNlfUWEer4EAIVIHCK/cYKcXMGuGQuKv6bzShHMShlnmk+vSY6H1a+QCYOU0W6ha1Pe4NiztvjvB5TjcR4ZeV77gx4bOOurEu7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142095; c=relaxed/simple;
	bh=U34UtZDme2Jm7hZTAbxkHwiukGQ2p127OJEoYQhlECY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=H2C5bo5Yx/a5IwP+RtALKABNnMSRpslVvcMIM232cBZXiDEalBGg0ux5LPUQ7AjWNvwcpsaXVyuGWE9kvVOQZNJfZTB822cyma5+fUJLkPrb98kMRi6igpuWu41LsYnTimz3d1tSpn8Y2Aax8C4vfVRaZ+R/ac8/Xawwv5afRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bbY2wqFZ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bbY2wqFZ"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4AAC686C5B;
	Wed, 15 Jul 2026 21:00:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uStAF4XjDWO; Wed, 15 Jul 2026 21:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784142046; bh=U34UtZDme2Jm7hZTAbxkHwiukGQ2p127OJEoYQhlECY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bbY2wqFZa69V9Qjll2lyftXL/ZHjgAuNhk2sswuK3jvhQpzuVzqpkndNMEIBzsVcC
	 LrNhXYLEWqkXKMk1pF99litzfUZxIZfCzZjJV+5nem5G5/joLThV3nFA9HyvZlD/0T
	 VC86TQyfAkAzOy9XHPwW7kwJGw46+3DRyIljVcKh1nQTEBzns/yGaIhYttgIY4oqWB
	 vqc/oXi0jl6N0yZMKQ+MgqQPlB3vlQEspG5REGW7+5dt4TkMNg1fzOj1CQ04sFJdXW
	 xIBR4DX3rvoCzgKezUj6WPt1ymtTwDMDMNuKyYeL7xGpDdfXZ2DyGZyp1/PikiGCuV
	 N7Kug1A+c1tdw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 19:00:45 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Sander Vanheule
 <sander@svanheule.net>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: realtek-otto: decide bank_read/write by device
 endianness
In-Reply-To: <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com>
References: <20260710183439.996923-1-adilov@disroot.org>
 <20260710183439.996923-3-adilov@disroot.org>
 <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com>
Message-ID: <3d6b8d6ab53aadef56e68c925030dd3b@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,
On 2026-07-15 09:39, Bartosz Golaszewski wrote:
> On Fri, 10 Jul 2026 20:34:39 +0200, Rustam Adilov <adilov@disroot.org> said:
>> In order to have a working gpio controller with SWAP_IO_SPACE,
>> the way bank_read and bank_write are defined must be changed and
>> separated from GPIO_PORTS_REVERSED flag. That also includes the
>> flags parameter used by gpio_generic_chip_config.
>>
>> To achieve it, use the device_is_big_endian() to decide the
>> bank_read/write parameter and the flag.
>>
>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>> ---
>>  drivers/gpio/gpio-realtek-otto.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
>> index 491fde846d46..f96072fbce92 100644
>> --- a/drivers/gpio/gpio-realtek-otto.c
>> +++ b/drivers/gpio/gpio-realtek-otto.c
>> @@ -393,16 +393,19 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>>
>>  	raw_spin_lock_init(&ctrl->lock);
>>
>> -	if (dev_flags & GPIO_PORTS_REVERSED) {
>> -		gen_gc_flags = 0;
>> -		ctrl->bank_read = realtek_gpio_bank_read;
>> -		ctrl->bank_write = realtek_gpio_bank_write;
>> +	if (dev_flags & GPIO_PORTS_REVERSED)
>>  		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
>> -	} else {
>> +	else
>> +		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>> +
>> +	if (device_is_big_endian(dev)) {
>>  		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
>>  		ctrl->bank_read = realtek_gpio_bank_read_swapped;
>>  		ctrl->bank_write = realtek_gpio_bank_write_swapped;
>> -		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>> +	} else {
>> +		gen_gc_flags = 0;
>> +		ctrl->bank_read = realtek_gpio_bank_read;
>> +		ctrl->bank_write = realtek_gpio_bank_write;
>>  	}
>>
>>  	config = (struct gpio_generic_chip_config) {
>> --
>> 2.55.0
>>
>>
> 
> Can you look at the sashiko report? I think it's right about this change
> possibly breaking existing devicetrees. Can we keep big-endian as the
> default?
> 
> Bart

Oh i didn't know sashiko was looking after this subsystem too.
But yes, it does require the rtl8380-gpio, rtl8390-gpio, rtl9310-gpio
to append big-endian or native-endian (as they are all big endian chips).

I was thinking earlier whatever it is appropriate to make changes to
the arch/mips/boot/dts/realtek in this commit because it is different
subsystem entirely but i guess this (previous sentence) answers the
question, doesn't it.

Also, what exactly do you mean by "Can we keep big-endian as the
default?" ? My only reading off is to change the if statement
so that the big endian flag and the _swapped functions to be
under the else part, is it correct?

Best,
Rustam
