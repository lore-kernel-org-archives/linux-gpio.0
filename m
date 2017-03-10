From: Phil Reid <preid@electromag.com.au>
Subject: Re: PATCH v2
Date: Fri, 10 Mar 2017 08:04:06 +0800
Message-ID: <8ff57bd1-c6d8-5522-2aed-0c9eb76a2007@electromag.com.au>
References: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
 <CAKpcJVZ-rw=-dHSSy4bF8cMMVL=o7COnMrSdpvse84BtFx8gbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:48627 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751067AbdCJAEL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2017 19:04:11 -0500
In-Reply-To: <CAKpcJVZ-rw=-dHSSy4bF8cMMVL=o7COnMrSdpvse84BtFx8gbA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Middleton <robert.middleton@rm5248.com>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On 10/03/2017 00:37, Robert Middleton wrote:
> On Wed, Feb 22, 2017 at 10:34 AM,  <robert.middleton@rm5248.com> wrote:
>>
>> This v2 patch changes the MCP23S08 interrupt logic to ensure that if multiple
>> inputs are changed at the same time, the kernel will be notified of all
>> the pins that changed.
>>
>> I added several variables to the irq handler, however this means that there
>> are now quite a few local variables(possibly too many, as the kernel coding
>> standard says that more than 5-10 is probably too many:
>> https://www.kernel.org/doc/Documentation/process/coding-style.rst).  I'm
>> not sure what the best way to fix this is, or if it has to be fixed.
>>
>> -Robert Middleton
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> Hi, I would like to try and get some verification here on if this patch
> is a good fix or not.  I have done testing on my side, and was
> wondering if there was something else that I had to do in order to have
> this patched upstream.
>
G'day Rob,

I was going to test it on my setup, just haven't got to it this week so far.
Probably Monday for me at this rate.

-- 
Regards
Phil Reid

