From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Bug introduced in the of_get_named_gpiod_flags function.
Date: Wed, 10 Oct 2018 09:39:29 -0700
Message-ID: <4695559c-3f80-584a-c943-37a3bd9c24a7@infradead.org>
References: <90dbf770-5262-5128-e585-c44d086568f9@ise.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90dbf770-5262-5128-e585-c44d086568f9@ise.pw.edu.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: wzab@ise.pw.edu.pl, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

[adding linux-gpio + Linus W.]

On 10/10/18 9:13 AM, wzab wrote:
> Hi,
> 
> The function of_get_named_gpiod_flags in older versions of the kernel 
> (up to 4.7.10 - https://elixir.bootlin.com/linux/v4.7.10/source/drivers/gpio/gpiolib-of.c#L75 )
> contained an important workaround:
> 
> /* .of_xlate might decide to not fill in the flags, so clear it. */if (flags)
>    *flags = 0; Unfortunately, newer kernels do not contain it. Therefore if the
> "xlat" function in the gpiochip driver does not set flags, (like e.g.
> the Xilinx AXI GPIO driver: https://github.com/Xilinx/linux-xlnx/blob/c2ba891326bb472da59b6a2da29aca218d337687/drivers/gpio/gpio-xilinx.c#L262 )
> the random, unitialized value from the stack in of_find_gpio 
> ( https://elixir.bootlin.com/linux/v4.18.13/source/drivers/gpio/gpiolib-of.c#L228 )
> is used, which results in random settings of e.g., OPEN DRAIN or OPEN SOURCE mode.
> 
> I have also reported the problem in the Xilinx forum: https://forums.xilinx.com/t5/Embedded-Linux/Bug-in-of-get-named-gpiod-flags-function-in-the-kernel-random/td-p/897695
> 
> With best regards,
> Wojciech Zabolotny
> 
> 
> 


-- 
~Randy
