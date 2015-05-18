From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 18 May 2015 16:06:08 +0300
Message-ID: <5559E3C0.1040207@linaro.org>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org> <20150518110214.GC28127@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:33718 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753683AbbERNGM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2015 09:06:12 -0400
Received: by lagr1 with SMTP id r1so137286065lag.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2015 06:06:10 -0700 (PDT)
In-Reply-To: <20150518110214.GC28127@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Johan,
On 05/18/2015 02:02 PM, Johan Hovold wrote:
> On Fri, May 15, 2015 at 04:25:21PM +0300, grygorii.strashko@linaro.org wrote:
>> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>>
>> Now GPIOs, wich are requested as IRQ only, will not be displayed
>> through GPIO debugfs. For example:
>>   # cat /proc/interrupts
>>              CPU0       CPU1
>> ...
>> 209:          0          0  4805d000.gpio  11 Edge      0-0021
>>
>>   # cat /debug/gpio
>> ...
>> GPIOs 160-191, platform/4805d000.gpio, gpio:
>> <--- no info about gpio used as IRQ only here
>>
>> GPIOs 192-223, platform/48051000.gpio, gpio:
>>   gpio-203 (vtt_fixed           ) out hi
>> ...
>>
>> Hence, improve GPIO debugfs code to show such kind of gpio and print
>> IRQ number also. In addition, add marker "requested" for GPIOs wich
>> were requested by using gpioX_request().
>>
>> After this patch sys/kernel/debug/gpio will produce following output:
>>
>>   # cat /debug/gpio
>> ...
>> GPIOs 160-191, platform/4805d000.gpio, gpio:
>>   gpio-171 ((null)              ) in  hi IRQ209
>>
>> GPIOs 192-223, platform/48051000.gpio, gpio:
>>   gpio-203 (vtt_fixed           ) out hi requested
> 
> This is backwards. All gpios *should* be requested. *If* we are to
> include not-requested gpios in the debug output, then it is those pins
> that need to be marked as not-requested.

Sry, but I didn't fully understand your point here ( - Why is it backward?
Now GPIO can be requested in three ways:
1) As pure GPIO (gpioX_request())
2) As pure GPIO IRQ, especially in DT boot case. 
  DT:
	interrupt-parent = <&gpio6>;
	interrupts = <11 IRQ_TYPE_EDGE_FALLING>; 
  Code:
	platform_get_irq() or of_irq_get()
        request_irq()
3) combination of (1) and (2) with one restriction
   - GPIO direction should be 'In' and can't be changed.

Personally I'm using this case for debug purposes to do a fast check of GPIO pin state
through GPIO sysfs (GPIO export) when such GPIO is used as GPIO IRQ in some driver
and I don't see that corresponding IRQ is triggered as expected.  

So, this patch just adds missed information in GPIO debugfs for the case (2) in general.

Of course, format of the marker "requested" is discussable. Could be:
- "requested" --> "not-requested"
- "I R" or "I G" where I - IRQ, G - GPIO, R - requested
- etc.

> 
> The irq-number mapping could perhaps be useful, but it should go in a
> separate patch. I'd suggest adding a '-' before the irq-number (e.g.
> "IRQ-209").

I've thought about this, but finally decided not to split it.
Could be done, if you insist )

-- 
regards,
-grygorii
