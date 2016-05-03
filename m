From: Duc Dang <dhdang@apm.com>
Subject: Re: [PATCH 1/1] gpio: xgene: Enable ACPI support for X-Gene GFC GPIO driver
Date: Mon, 2 May 2016 18:00:32 -0700
Message-ID: <CADaLND=cvDTeodGKfZOzn_hBScYChR9zxDYMAAFX2RTBdPYpSw@mail.gmail.com>
References: <1462049367-10028-1-git-send-email-dhdang@apm.com> <CACRpkdZDaC=S9NVWgTzDwg16xLnxT5pNv+Qh1bLTt-ACwLQpGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZDaC=S9NVWgTzDwg16xLnxT5pNv+Qh1bLTt-ACwLQpGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches <patches@apm.com>
List-Id: linux-gpio@vger.kernel.org

On Sun, May 1, 2016 at 1:25 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Apr 30, 2016 at 10:49 PM, Duc Dang <dhdang@apm.com> wrote:
>
>> This patch enables ACPI support for X-Gene GFC GPIO driver.
>>
>> Signed-off-by: Duc Dang <dhdang@apm.com>
>
> Patch applied.

Thanks, Linus.

>
> Duc do you have a datasheet for this GPIO controller?
>

This controller is simple. We have 3 16-pin sets of GPIO pins (these
pins can be configured as part of the Flash controller pins, or as
GPIO pins).
In GPIO mode, we can configure the pin as output or input. There is no
interrupt support for these GPIO pins.

Regards,
Duc Dang.

> I want to know if it has further abilities, when I see this:
>
> #define GPIO_SET_DR_OFFSET    0x0C
> #define GPIO_DATA_OFFSET    0x14
> #define GPIO_BANK_STRIDE    0x0C
>
> It seems like there is a whole bunch of registers there that are not
> yet utilized.
>
> Yours,
> Linus Walleij
