From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv2 4/8] gpio: altera-a10sr: Add A10 System Resource Chip
 GPIO support.
Date: Mon, 24 Oct 2016 17:29:33 -0500
Message-ID: <4a5e17f2-de45-1b2d-5b80-28e9d21a9ab2@opensource.altera.com>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
 <1464889948-28793-5-git-send-email-tthayer@opensource.altera.com>
 <CACRpkdZJVbyBgnt1x5uMr3yKm5RYYrkKETeDga30+eEpw6dU+w@mail.gmail.com>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-dm3nam03on0046.outbound.protection.outlook.com ([104.47.41.46]:31975
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754899AbcJXWhw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Oct 2016 18:37:52 -0400
In-Reply-To: <CACRpkdZJVbyBgnt1x5uMr3yKm5RYYrkKETeDga30+eEpw6dU+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: mika.westerberg@linux.intel.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On 10/21/2016 04:08 AM, Linus Walleij wrote:
> On Thu, Jun 2, 2016 at 7:52 PM,  <tthayer@opensource.altera.com> wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add the GPIO functionality for the Altera Arria10 MAX5 System Resource
>> Chip. The A10 MAX5 has 12 bits of GPIO assigned to switches, buttons,
>> and LEDs as a GPIO extender on the SPI bus.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>i
>> ---
>> v2      Change Altera to Intel in copyright header
>
> Patch applied!
>
> Hey it just worked despite being months old.
>
> Let's see if it builds fine & all.
>

Thanks! Yes, it builds properly but to get past a NULL pointer kernel 
panic, I had to revert the recent devprop_gpiochip_set_names() change 
(9427ecbe). Once I did that it worked perfectly.

I'll investigate further and update you.

I apologize for missing this patch earlier. Thank you for your patience.

Thor

> Yours,
> Linus Walleij
>
