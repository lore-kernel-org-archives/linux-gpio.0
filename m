From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: [PATCH v2 1/3] irq/irq_sim: add a simple interrupt simulator framework
Date: Mon, 14 Aug 2017 18:04:12 +0800
Message-ID: <9179B569-5F66-4F50-8D8D-DE2DB8F91243@jic23.retrosnub.co.uk>
References: <20170801145028.7558-1-brgl@bgdev.pl> <20170801145028.7558-2-brgl@bgdev.pl> <20170812124357.56ddd01d@archlinux> <CAMRc=MdZXbY4Lp-a=qu+d7civ9PFQi2niXqzeFYqvVF03sy=Cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from saturn.retrosnub.co.uk ([178.18.118.26]:43032 "EHLO
        saturn.retrosnub.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752709AbdHNKEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2017 06:04:24 -0400
In-Reply-To: <CAMRc=MdZXbY4Lp-a=qu+d7civ9PFQi2niXqzeFYqvVF03sy=Cw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org



On 14 August 2017 17:54:22 GMT+08:00, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>2017-08-12 13:43 GMT+02:00 Jonathan Cameron <jic23@kernel.org>:
>> On Tue,  1 Aug 2017 16:50:26 +0200
>> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>>> Implement a simple, irq_work-based framework for simulating
>>> interrupts. Currently the API exposes routines for initializing and
>>> deinitializing the simulator object, enqueueing the interrupts and
>>> retrieving the allocated interrupt numbers based on the offset of
>the
>>> dummy interrupt in the simulator struct.
>>>
>>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> Looks good to me.
>>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>
>> Only tiny thing is the lack of a specified license for the code...
>
>I'll send a v3 with license added.
>
>> + checkpatch is warning about wrong file mode...
>> #105:
>> new file mode 100644
>>
>> Though I have no idea why...
>>
>
>I think this only says that a file was created with given mode, it's
>not a warning. The actual warning is about missing a new entry in
>MAINTAINERS.
Doh, how did I miss that!


>
>>> --- a/init/Kconfig
>>> +++ b/init/Kconfig
>>> @@ -23,6 +23,10 @@ config CONSTRUCTORS
>>>  config IRQ_WORK
>>>       bool
>>>
>>> +config IRQ_SIM
>>> +     bool
>> You could make this tristate, but then the handling of the
>> users would get complex so perhaps given it's so small boolean
>> is the way to go.
>>
>
>Nah, irq_work is built-in to at even greater size. Let's just leave it
>like this, especially when only testing modules select it.
>
Fair enough.

>Thanks,
>Bartosz

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
