From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: Bug introduced in the of_get_named_gpiod_flags function.
Date: Fri, 12 Oct 2018 10:54:57 +0200
Message-ID: <5d33d03a-5d62-c8c8-c9cc-2ccbe1b464f2@xilinx.com>
References: <90dbf770-5262-5128-e585-c44d086568f9@ise.pw.edu.pl>
 <CACRpkdYQBxvHh-AfODddzc5G+BMBhUBSRXUdLVO8_99yniUYPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYQBxvHh-AfODddzc5G+BMBhUBSRXUdLVO8_99yniUYPQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, wzab@ise.pw.edu.pl, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On 11.10.2018 10:27, Linus Walleij wrote:
> Hi Wojciech,
> 
> (Thanks also Randy for forwarding this!)
> 
> On Wed, Oct 10, 2018 at 6:32 PM wzab <wzab@ise.pw.edu.pl> wrote:
> 
>> The function of_get_named_gpiod_flags in older versions of the kernel
>> (up to 4.7.10 - https://elixir.bootlin.com/linux/v4.7.10/source/drivers/gpio/gpiolib-of.c#L75 )
>> contained an important workaround:
>>
>> /* .of_xlate might decide to not fill in the flags, so clear it. */if (flags)
>>    *flags = 0; Unfortunately, newer kernels do not contain it. Therefore if the
>> "xlat" function in the gpiochip driver does not set flags, (like e.g.
>> the Xilinx AXI GPIO driver: https://github.com/Xilinx/linux-xlnx/blob/c2ba891326bb472da59b6a2da29aca218d337687/drivers/gpio/gpio-xilinx.c#L262 )
>> the random, unitialized value from the stack in of_find_gpio
>> ( https://elixir.bootlin.com/linux/v4.18.13/source/drivers/gpio/gpiolib-of.c#L228 )
>> is used, which results in random settings of e.g., OPEN DRAIN or OPEN SOURCE mode.
>>
>> I have also reported the problem in the Xilinx forum:
>> https://forums.xilinx.com/t5/Embedded-Linux/Bug-in-of-get-named-gpiod-flags-function-in-the-kernel-random/td-p/897695
> 
> It seems the commit removing this is:
> 
> commit 762c2e46c0591d207289105c8718e4adf29b2b34
> "gpio: of: remove of_gpiochip_and_xlate() and struct gg_data"
> 
> But I honestly don't see a problem with it.
> 
> You are referencing an out-of-tree driver. Use the in-tree gpio-xilinx.c
> that does not do any custom xlate and you will be fine.
> 
> I looked over the driver doing custom flag translation in the kernel tree,
> and they all set flags, so this is not a problem in the upstream kernel.

There was an attempt to sync up xilinx internal gpio driver with
mainline by someone else but not sure what's the status.
If you have issue with xilinx internal patch please talk to us.
If the problem is with mainline please use this mailing list.

Thanks,
Michal
