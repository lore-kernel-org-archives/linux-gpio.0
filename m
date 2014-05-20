From: Anthony Fee <anthony.fee@emutex.com>
Subject: Re: [PATCH v2] gpio: generic: add request function pointer
Date: Tue, 20 May 2014 08:41:20 +0100
Message-ID: <669207ef972b9bccabc489bc72a51004@statler.emutex.com>
References: <1400521754-4480-1-git-send-email-anthony.fee@emutex.com>
 <CAAVeFu+rVyV=_iPsGLxxUnvEMGR0_emmwZwj0VdPFzJi7bRBaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2.digiweb.ie ([83.147.160.14]:36388 "EHLO smtp.digiweb.ie"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750745AbaETHl0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 20 May 2014 03:41:26 -0400
In-Reply-To: <CAAVeFu+rVyV=_iPsGLxxUnvEMGR0_emmwZwj0VdPFzJi7bRBaw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On 20/05/2014 07:49, Alexandre Courbot wrote:
> On Tue, May 20, 2014 at 2:49 AM, Anthony Fee <anthony.fee@emutex.com> 
> wrote:
>> gpiolib will require all gpio drivers to expicitly set the request 
>> function pointer
>> in future. To encourage gpio driver developers to adhere to this 
>> standard
>> gpio-generic.c now sets this function pointer.
> 
> This one applies. ;)
> 
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> (btw, please carry the acks you received to the next revisions of your
> patches, that will be that much that the maintainer does not need to
> do).

Thanks for the tip. I'll keep this in mind in the future.

> 
>> 
>> Signed-off-by: Anthony Fee <anthony.fee@emutex.com>
>> ---
>>  drivers/gpio/gpio-generic.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
>> index b5dff9e..fea8c82 100644
>> --- a/drivers/gpio/gpio-generic.c
>> +++ b/drivers/gpio/gpio-generic.c
>> @@ -388,6 +388,14 @@ static int bgpio_setup_direction(struct 
>> bgpio_chip *bgc,
>>         return 0;
>>  }
>> 
>> +static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
>> +{
>> +       if (gpio_pin < chip->ngpio)
>> +               return 0;
>> +
>> +       return -EINVAL;
> 
> Nit: I might have preferred it turned that way:
> 
>     if (gpio_pin >= chip->ngpio)
>             return -EINVAL;
> 
>     return 0;
> 
> That makes the error case the exception and the success case the
> default, which looks more natural to me. But the statement is simple
> enough to be easily understood anyway.
> 

I see your point. It makes sense to end the function on the non-error 
condition. Another thing I'll remember in future :)

>> +}
>> +
>>  int bgpio_remove(struct bgpio_chip *bgc)
>>  {
>>         return gpiochip_remove(&bgc->gc);
>> @@ -413,6 +421,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct 
>> device *dev,
>>         bgc->gc.label = dev_name(dev);
>>         bgc->gc.base = -1;
>>         bgc->gc.ngpio = bgc->bits;
>> +       bgc->gc.request = bgpio_request;
>> 
>>         ret = bgpio_setup_io(bgc, dat, set, clr);
>>         if (ret)
>> --
>> 1.9.0
>> 

-- 
Anthony Fee
Software Engineer
EMUTEX LTD.
Callan Centre, National Technology Park, Limerick, Ireland
Phone: +353 (0)61 514496, Mobile: +353 (0)86 3197614
Web: www.emutex.com, Email: anthony.fee@emutex.com

This email may contain information, which is confidential and/or
privileged. The information is intended solely for the use of the
individual or entity named above. If you are not the intended recipient, 
be
aware that any disclosure, copying, distribution or use of the contents 
is
prohibited. If you have received this electronic transmission in error,
please notify the sender by telephone or return email and delete the
material from your computer. Emutex Ltd is registered in Ireland, No
256238, at Callan Centre, National Technology Park, Limerick, Ireland.
