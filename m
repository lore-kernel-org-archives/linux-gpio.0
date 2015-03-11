From: Nicolas Schichan <nschichan@freebox.fr>
Subject: Re: bcm63xx gpio issue on 3.19
Date: Wed, 11 Mar 2015 18:49:46 +0100
Message-ID: <5500803A.7080409@freebox.fr>
References: <54FDDE00.7030100@freebox.fr> <54FFD15E.3040202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <54FFD15E.3040202@nvidia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexandre Courbot <acourbot@nvidia.com>, linux-mips@linux-mips.org
Cc: Maxime Bizon <mbizon@freebox.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 03/11/2015 06:23 AM, Alexandre Courbot wrote:
>> Could you please advise on how to fix/workaround that ? (ideally while keeping
>> the possibility to invoke the gpiolib code from the setup/prom code).
> 
> The only allocation performed by gpiochip_add() is the array of gpio_descs.
> Having this array pre-allocated in your early code (maybe by using a static
> array variable) and passing it to a gpiochip_add_early() function would do the
> trick.
> 
> However, it is not that simple since gpio_desc is a private structure which
> details (including its size) are not visible outside of drivers/gpio.
> 
> Another solution I could see would be to have a kernel config option that
> would make gpiolib "pre-allocate" a number of gpio descriptors as a static
> array for such cases - similar to the global GPIO array, but not as big.
> 
> Finally, we can also restore the global GPIO array as a config option for the
> few architectures that need it.
> 
> Of course, I would prefer a solution based on dynamic allocation - is there a
> kind a primitive memory allocator that we can use at this early stage of boot?
> I.e. would alloc_pages() maybe work?
> 
> How do other subsystems that rely on dynamic allocation for registering their
> resources handle this? I guess regulator must fall in the same use-case,
> doesn't it?

Hi Alexandre,

Moving the bcm63xx_gpio_init() call from board_prom_init() to
bcm63xx_register_devices() (an arch_initcall) is enough to get called when
kmalloc is working. If code poking GPIOs is invoked earlier by a board code,
it will have to move in the board_register_devices() function though there
doesn't seem to any problems with the mainline bcm63xx board code in that regard.

I can produce a patch for that if it is an accepted solution. It has the
advantage of not requiring changes to the gpiolib code.

Regards,

-- 
Nicolas Schichan
Freebox SAS
