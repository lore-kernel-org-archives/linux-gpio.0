From: Anthony Fee <anthony.fee@emutex.com>
Subject: Re: [PATCH] gpio: generic: add request function pointer
Date: Tue, 13 May 2014 09:19:12 +0100
Message-ID: <37251112d9fb0ecf9c2e8174fe27728a@statler.emutex.com>
References: <loom.20140512T195210-63@post.gmane.org>
 <CAAVeFuLUkP_4UW3EhStrPJ4caA5DdKqgJ-Do_qxWuzi5qHaotQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2.digiweb.ie ([83.147.160.14]:59755 "EHLO smtp.digiweb.ie"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1758769AbaEMITS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 13 May 2014 04:19:18 -0400
In-Reply-To: <CAAVeFuLUkP_4UW3EhStrPJ4caA5DdKqgJ-Do_qxWuzi5qHaotQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Yes sorry about the spam! I only realised after that I had HTML enabled 
:)
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
