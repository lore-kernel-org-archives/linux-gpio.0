From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio: make of_get_named_gpiod_flags() private
Date: Fri, 23 May 2014 12:34:13 +0900
Message-ID: <CAAVeFu+8MQwBtUaz5r84zGgJZMLns1XzOkUWTtd+mTk6VF-ieQ@mail.gmail.com>
References: <1400306090-4092-1-git-send-email-acourbot@nvidia.com> <CACRpkdbfNpx6fHZyQTP1X3NSxBe_u2OXLgnNOmLuKvYq9ghprA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbfNpx6fHZyQTP1X3NSxBe_u2OXLgnNOmLuKvYq9ghprA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 21, 2014 at 6:16 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, May 17, 2014 at 7:54 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
>> of_get_named_gpiod_flags() is visible and directly usable by GPIO
>> consumers, but it really should not as the gpiod interface relies
>> on the simpler gpiod_get() to provide properly-configured GPIOs.
>>
>> of_get_named_gpiod_flags() is just used internally by gpiolib to
>> implement gpiod_get(), and by the old of_get_named_gpio_flags()
>> function, therefore it makes sense to make it gpiolib-private.
>>
>> As a side-effect, the unused (and unneeded) of_get_gpiod_flags()
>> inline function is also removed, and of_get_named_gpio_flags() is moved
>> from a static inline function to a regular one in gpiolib-of.c
>>
>> This results in all references to gpiod_* functions in of_gpio.h being
>> gone, which is the way it should be since this file is part of the old
>> integer GPIO interface.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> Changes since v1:
>> - Fixed compilation error when CONFIG_OF_GPIO is not defined
>> - Fixed warning due to of_gpio_flags enum not being declared
>>   in private gpiolib.h header
>
> Applied this v2 version and pushed for testing, let's hope it flies
> properly this time :-D

Looks like the world did not break this time. However I noticed that
the commit in your tree (and -next) included the changes since v1 in
its log. Is it intended?
