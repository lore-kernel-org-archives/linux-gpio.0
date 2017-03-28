From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: Query about Open drain flag with active LOW
Date: Tue, 28 Mar 2017 14:33:46 +0530
Message-ID: <58DA26F2.6040108@nvidia.com>
References: <58D92DE0.3000907@nvidia.com> <CACRpkdYVdUyueSFsSi5SG6nfRn_s4tqfhHSkK3jhQov+9y2koA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13081 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755155AbdC1JWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 05:22:30 -0400
In-Reply-To: <CACRpkdYVdUyueSFsSi5SG6nfRn_s4tqfhHSkK3jhQov+9y2koA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


On Tuesday 28 March 2017 02:36 PM, Linus Walleij wrote:
> On Mon, Mar 27, 2017 at 5:21 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> I have the schematics, where I need to set it as
>> Pin state HIGH (by setting gpio-input mode) to enable the circuit.
>> Pin state LOW (by setting gpio-output mode with value to 0) to disable the
>> circuit.
> (...)
>> With this, I think the GPIO is active HIGH and open drain type.
>> If I set the active LOW from DT then I can not set pin to logical 1 using
>> the API gpiod_set_value() with “1”.
>> As this invert before calling _gpiod_set_raw_value() and so the value = 0
>> and it set the pin in the gpio mode output-Low.
>>
>> Shouldn'’t open drain pin are active HIGH?
> Sorry I do not understand, have you solved it?

I wanted to say that open drain flag should be with ACTIVE_HIGH | 
SINGLE_ENDED which is in inverted as of now.



> Else can you try to break down the problem, do you mean there is a bug
> in inverted handling for open drain lines in gpiolib?
>

Yes, I am suspecting the bug here with combination of ACTIVE state and 
SINGLE_ENDED flag. The logic to get OPEN DRAIN flag should be in 
inverted form.
Else we need to decouple the ACTIVE state with SINGLE_ENDED flag to get 
Open drain or open source.


If I want to say logical "1" for the open drain, it is setting pin in 
drive-0 mode. Actually, it should be in input mode so that pin state 
become HIGH.

In function of_find_gpio(), it is as follows:

         if (of_flags & OF_GPIO_SINGLE_ENDED) {
                 if (of_flags & OF_GPIO_ACTIVE_LOW)
                         *flags |= GPIO_OPEN_DRAIN;
                 else
                         *flags |= GPIO_OPEN_SOURCE;
         }


I think it should be
         if (of_flags & OF_GPIO_SINGLE_ENDED) {
                 if (of_flags & OF_GPIO_ACTIVE_LOW)
                         *flags |= GPIO_OPEN_SOURCE;
                 else
                         *flags |= GPIO_OPEN_DRAIN;
         }


Similar change is needed in the dtbinding gpio header also to invert the 
ACTIVE state with open drain/source.


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
