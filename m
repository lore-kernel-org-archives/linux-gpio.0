From: Anthony Fee <anthony.fee@emutex.com>
Subject: Re: [PATCH] gpio: generic: add request function pointer
Date: Mon, 19 May 2014 18:47:18 +0100
Message-ID: <8160553a1c8747171d90296c6d7c264b@statler.emutex.com>
References: <loom.20140512T195210-63@post.gmane.org>
 <CAAVeFuLUkP_4UW3EhStrPJ4caA5DdKqgJ-Do_qxWuzi5qHaotQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2.digiweb.ie ([83.147.160.14]:44562 "EHLO smtp.digiweb.ie"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754901AbaESRr0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 19 May 2014 13:47:26 -0400
In-Reply-To: <CAAVeFuLUkP_4UW3EhStrPJ4caA5DdKqgJ-Do_qxWuzi5qHaotQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Guys,

I'm going to resubmit this to the mailing list as a v2 patch due to 
formatting issues. Sorry for the confusion, I'm sending the patch with 
git send-email so there shouldn't be any issues.

Thanks,
Anthony

On 13/05/2014 08:59, Alexandre Courbot wrote:
> On Tue, May 13, 2014 at 2:54 AM, Anthony Fee <anthony.fee@emutex.com> 
> wrote:
>> gpiolib will require all gpio drivers to expicitly set the request 
>> function
>> pointer in future. To encourage gpio driver developers to adhere to 
>> this
>> standard gpio-generic.c now sets this function pointer.
> 
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> for the non-HTML version. :)
> 
> On top of being future-proof, having the GPIO range check is also a 
> good thing.
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
>> bgpio_chip
>> *bgc,
>>         return 0;
>>  }
>> 
>> +static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
>> +{
>> +       if (gpio_pin < chip->ngpio)
>> +               return 0;
>> +
>> +       return -EINVAL;
>> +}
>> +
>>  int bgpio_remove(struct bgpio_chip *bgc)
>>  {
>>         return gpiochip_remove(&bgc->gc);
>> @@ -413,6 +421,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct 
>> device
>> *dev,
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
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-gpio" 
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

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
