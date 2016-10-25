From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RFC PATCH] gpio: of: fix GPIO drivers with multiple gpio_chip
 for a single node
Date: Tue, 25 Oct 2016 10:46:08 +0900
Message-ID: <CAK7LNAS1R0_=ZHs3RC1Sdy_EtCM-8BL4HqC_JmZfW=0ONoLvdQ@mail.gmail.com>
References: <1477295033-6008-1-git-send-email-yamada.masahiro@socionext.com> <1477328294.27514.6.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:36933 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758168AbcJYBqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2016 21:46:31 -0400
In-Reply-To: <1477328294.27514.6.camel@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Axel Haslam <ahaslam@baylibre.com>

2016-10-25 1:58 GMT+09:00 Sylvain Lemieux <slemieux.tyco@gmail.com>:
> Hi Masahiro,
>
> On Mon, 2016-10-24 at 16:43 +0900, Masahiro Yamada wrote:
>> Sylvain Lemieux reports the LPC32xx GPIO driver is broken since
>> commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
>> struct gg_data").  Probably, gpio-etraxfs.c and gpio-davinci.c are
>> broken as well.
>>
>> Those drivers register multiple gpio_chip that are associated to a
>> single OF node, and their own .of_xlate() checks if the passed
>> gpio_chip is valid.
>>
>> Now, the problem is of_find_gpiochip_by_node() returns the first
>> gpio_chip found to match the given node.  So, .of_xlate() fails,
>> except for the first GPIO bank.
>>
>> Reverting the commit could be a solution, but I do not want to go
>> back to the mess of struct gg_data.  Another solution here is to
>> take the match by a node pointer and the success of .of_xlate().
>> It is a bit clumsy to call .of_xlate twice; for gpio_chip matching
>> and for really getting the gpio_desc index.  Perhaps, the long-term
>> goal might be to convert drivers to single chip registration, but
>> this commit will solve the problem until then.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Reported-by: <slemieux.tyco@gmail.com>
>> ---
>>
>>  drivers/gpio/gpiolib-of.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>> index ecad3f0..f996596 100644
>> --- a/drivers/gpio/gpiolib-of.c
>> +++ b/drivers/gpio/gpiolib-of.c
>> @@ -26,14 +26,18 @@
>>
>>  #include "gpiolib.h"
>>
>> -static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
>> +static int of_gpiochip_match_node_and_xlate(struct gpio_chip *chip, void *data)
>>  {
>> -     return chip->gpiodev->dev.of_node == data;
>> +     struct of_phandle_args *gpiospec = data;
>> +
>> +     return chip->gpiodev->dev.of_node == gpiospec->np &&
>> +                                     !chip->of_xlate(chip, gpiospec, NULL);
>
> for the patch to work, the second compare of the return statement
> should be updated:
>         return chip->gpiodev->dev.of_node == gpiospec->np &&
>                chip->of_xlate(chip, gpiospec, NULL) >= 0;
>
> the patch, with this return statement, is fixing the issue;
> can you submit an updated version of your patch?
>

Thanks for correction.
I've sent v2.


-- 
Best Regards
Masahiro Yamada
