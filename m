From: Hoan Tran <hotran@apm.com>
Subject: Re: [PATCH] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Tue, 14 Feb 2017 17:22:09 -0800
Message-ID: <CAFHUOYxxygE4ouZySwvLr3=xBPSATk0XqpMDVL=EZcciV7FNRA@mail.gmail.com>
References: <1485891838-27093-1-git-send-email-hotran@apm.com>
 <CACRpkdZw-QLOeiPqSRaEJ+mGGDwi5fh9B1uenPxQGBtTwj+cuw@mail.gmail.com> <20170213093834.GA16603@page>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170213093834.GA16603@page>
Sender: linux-kernel-owner@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Weike Chen <alvin.chen@intel.com>, Alexandre Courbot <gnurou@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>, Duc Dang <dhdang@apm.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus, Jamie and all,

Do you have any comments on this patch?

Thanks
Hoan

On Mon, Feb 13, 2017 at 1:38 AM, Jamie Iles <jamie@jamieiles.com> wrote:
> Hi Linus,
>
> On Mon, Feb 06, 2017 at 11:21:09AM +0100, Linus Walleij wrote:
>> On Tue, Jan 31, 2017 at 8:43 PM, Hoan Tran <hotran@apm.com> wrote:
>>
>> > Next generation of X-Gene SoC's GPIO hardware register map is very
>> > similar to DW GPIO. It only differs by a few register addresses.
>> > This patch modifies DW GPIO driver to accommodate the difference
>> > in a few register addresses.
>> >
>> > Signed-off-by: Hoan Tran <hotran@apm.com>
>>
>> On next iteration please include Jamie Iles, Weike Chen and Sebastian
>> Andrzej Siewior.
>> They all provided substantial contributions to this driver.
>>
>> The dwapb needs a proper maintainer in MAINTAINERS actually, it is one of
>> those that can't use GPIOLIB_IRQCHIP so it requires special attention.
>> Jamie, interested in the job? Patches welcome :)
>
> I actually don't have access to hardware using this driver anymore so
> I'm probably not the right person for the job, but still happy to review
> patches!
>
> Jamie
