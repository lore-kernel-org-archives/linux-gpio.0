From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add gpio_add_lookup_tables() to add several tables
 at once
Date: Mon, 7 Aug 2017 14:18:40 +0200
Message-ID: <CACRpkdY6i18Jv2-GZUAvcRHaThg7KnvsScaCo3b2YDev0XOLxA@mail.gmail.com>
References: <20170725205800.GA25245@dtor-ws> <1501064497.29303.251.camel@linux.intel.com>
 <20170801192418.GE28401@dtor-ws> <1501675570.29303.353.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501675570.29303.353.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2017 at 2:06 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, 2017-08-01 at 12:24 -0700, Dmitry Torokhov wrote:
>> On Wed, Jul 26, 2017 at 01:21:37PM +0300, Andy Shevchenko wrote:
>> > On Tue, 2017-07-25 at 13:58 -0700, Dmitry Torokhov wrote:
>> > > When converting legacy board to use gpiod API() there migt be
>> > > several
>> > > lookup tables in board file, let's provide a way to register them
>> > > all
>> > > at
>> > > once.
>> >
>> > Looking into the code which is using several GPIO look up tables I
>> > noticed that the pattern often something like
>> >
>> >
>> > gpiod_add_lookup_table(x_tbl);
>> > platform_device_register(x_dev);
>> >
>> > ...
>> >
>> > gpiod_add_lookup_table(y_tbl);
>> > platform_device_register(y_dev);
>> >
>> > which looks also logical.
>> >
>> > So, I have no strong opinion here, though it would be nice to have
>> > an
>> > example where it makes sense.
>>
>> Here is an example. It actually does not have multiple GPIO tables,
>> but
>> it allows to keep the structure of init sequence for the board, which
>> relies on having series of arrays conditionally populated with devices
>> and other data that need to be registered.
>
> I see your point. Okay, no objections from me.
>
> Please, add a stub for !GPIOLIB case.
>
> After addressing it,
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

OK I wait for the stub-inclusive patch.

Yours,
Linus Walleij
