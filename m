From: Octavian Purdila <octavian.purdila@intel.com>
Subject: Re: [PATCH RFT] gpio: dln2: Fix gpio output value in dln2_gpio_direction_output()
Date: Wed, 17 Dec 2014 11:32:59 +0200
Message-ID: <CAE1zotJW4JAAvogQ3WTYvAQe4VdS1V8fgsPk+wFyk4=jspc=8A@mail.gmail.com>
References: <1418740800.10278.1.camel@phoenix>
	<5490635D.6040305@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:44514 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbaLQJdB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Dec 2014 04:33:01 -0500
Received: by mail-wg0-f43.google.com with SMTP id l18so19771015wgh.16
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2014 01:32:59 -0800 (PST)
In-Reply-To: <5490635D.6040305@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Baluta <daniel.baluta@intel.com>
Cc: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Palcu, Laurentiu" <laurentiu.palcu@intel.com>

On Tue, Dec 16, 2014 at 6:52 PM, Daniel Baluta <daniel.baluta@intel.com> wrote:
>
>
> On 12/16/2014 04:40 PM, Axel Lin wrote:

Hi Axel,

Nice catch!

>>
>> dln2_gpio_direction_output() ignored the state passed into it. Fix it.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
>
> Tested-by: Daniel Baluta <daniel.baluta@intel.com>
>
>> ---
>> I don't have this hardware handy, so only compile test.
>>   drivers/gpio/gpio-dln2.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
>> index 978b51e..1434844 100644
>> --- a/drivers/gpio/gpio-dln2.c
>> +++ b/drivers/gpio/gpio-dln2.c
>> @@ -267,6 +267,7 @@ static int dln2_gpio_direction_input(struct gpio_chip
>> *chip, unsigned offset)
>>   static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned
>> offset,
>>                                       int value)
>>   {
>> +       dln2_gpio_set(chip, offset, value);

Could you change dln2_gpio_pin_set_out_val's signature to return an
error code than use it instead of dln2_gpio_set here? Then we can
check the error value. With that:

Reviewed-by: Octavian Purdila <octavian.purdila@intel.com>
