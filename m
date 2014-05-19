From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio: make of_get_named_gpiod_flags() private
Date: Tue, 20 May 2014 00:07:40 +0900
Message-ID: <CAAVeFu+c1t=QJzL9-pZVaTzvTD2Ydrv__yKHnn+-SA11zsxu_A@mail.gmail.com>
References: <1400306090-4092-1-git-send-email-acourbot@nvidia.com> <20140519132822.GA9728@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140519132822.GA9728@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 19, 2014 at 10:28 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Sat, May 17, 2014 at 02:54:50PM +0900, Alexandre Courbot wrote:
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
>>
>>  drivers/gpio/gpiolib-of.c | 14 ++++++++++++++
>>  drivers/gpio/gpiolib.h    |  5 +++++
>>  include/linux/of_gpio.h   | 35 +++--------------------------------
>>  3 files changed, 22 insertions(+), 32 deletions(-)
>
> There are cases where GPIOs need to be obtained from device tree nodes
> without a corresponding struct device. Do you have any ideas on how to
> support such use-cases?
>
> There's currently no API to do that except of_get_named_gpio_flags().
> But that doesn't handled flags automatically in a way that gpiod_get()
> does.

Yeah, there is probably some legacy stuff that will need a few more
functions to be handled using gpiod.

As much as possible I'd like to avoid provider-specific functions, but
in the worst case we can imagine making another function available for
that:

struct gpio_desc *of_gpiod_get_index(struct device_node *np, const
char *con_id, unsigned int idx);

that will handle flags properly and everything. Would that do the trick?
