From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 1/3] irq/irq_sim: add a simple interrupt simulator framework
Date: Mon, 14 Aug 2017 16:49:21 +0200
Message-ID: <CAMRc=MdnWbwvt8vv5XgZhT57muv-zjHQZXW3dBL7Um9sg-nhkQ@mail.gmail.com>
References: <20170814112056.3751-1-brgl@bgdev.pl> <20170814112056.3751-2-brgl@bgdev.pl>
 <alpine.DEB.2.20.1708141505160.1865@nanos> <CAMRc=Mdsc9W5VJStkhwiKyc4evEnw1j6D8D3FewmVvGaSV4keA@mail.gmail.com>
 <alpine.DEB.2.20.1708141647390.1865@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1708141647390.1865@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

2017-08-14 16:48 GMT+02:00 Thomas Gleixner <tglx@linutronix.de>:
> On Mon, 14 Aug 2017, Bartosz Golaszewski wrote:
>> 2017-08-14 15:06 GMT+02:00 Thomas Gleixner <tglx@linutronix.de>:
>> > On Mon, 14 Aug 2017, Bartosz Golaszewski wrote:
>> >
>> >> Implement a simple, irq_work-based framework for simulating
>> >> interrupts. Currently the API exposes routines for initializing and
>> >> deinitializing the simulator object, enqueueing the interrupts and
>> >> retrieving the allocated interrupt numbers based on the offset of the
>> >> dummy interrupt in the simulator struct.
>> >>
>> >> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> >> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> >> ---
>> >>  include/linux/irq_sim.h |  44 ++++++++++++++++++
>> >>  init/Kconfig            |   4 ++
>> >>  kernel/Makefile         |   1 +
>> >>  kernel/irq_sim.c        | 121 ++++++++++++++++++++++++++++++++++++++++++++++++
>> >
>> > Please move this to kernel/irq/ ... and the config option to kernel/irq/Kconfig.
>> >
>> > Thanks,
>> >
>> >         tglx
>> >
>> >
>>
>> How about moving irq_work.c there too?
>
> We could, but irq_work is not really part of the interrupt subsystem, while
> your interrupt simulator definitely is.
>

Fair enough, let's leave it where it is.

I'll send v4.

Thanks,
Bartosz
