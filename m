From: =?UTF-8?Q?Wojciech_Zabo=c5=82otny?= <wzab@ise.pw.edu.pl>
Subject: Re: Bug introduced in the of_get_named_gpiod_flags function.
Date: Mon, 15 Oct 2018 15:41:20 +0200
Message-ID: <d8faabe9-1123-3d0e-6b7d-8335cd2b6a44@ise.pw.edu.pl>
References: <90dbf770-5262-5128-e585-c44d086568f9@ise.pw.edu.pl>
 <CACRpkdYQBxvHh-AfODddzc5G+BMBhUBSRXUdLVO8_99yniUYPQ@mail.gmail.com>
 <5d33d03a-5d62-c8c8-c9cc-2ccbe1b464f2@xilinx.com>
 <efcb67bf-bdf3-e3a8-5139-0f778ea00f1d@elektron.elka.pw.edu.pl>
 <CACRpkdaeBMc-wqZxh0vVXRiRMvTHDFXxOk0aaxN=swcnLBhG5w@mail.gmail.com>
Reply-To: wzab@ise.pw.edu.pl
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaeBMc-wqZxh0vVXRiRMvTHDFXxOk0aaxN=swcnLBhG5w@mail.gmail.com>
Content-Language: pl-PL
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, wzabolot@elektron.elka.pw.edu.pl
Cc: Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 13.10.2018 18:23, Linus Walleij wrote:
> On Sat, Oct 13, 2018 at 5:53 PM wzabolot@elektron.elka.pw.edu.pl
> <wzabolot@elektron.elka.pw.edu.pl> wrote:
>
>> The question is, if there may be any other in-tree GPIO controller
>> driver that does not initialize those flags?
> So as I said, I looked over them and they all initialize
> their flags.
>
>> Anyway the current situation is somehow dangerous.
> Not very dangerous compared to much other kernel code.
>
>> Maybe the best solution would be to initialize the automatic variable in
>> the of_find_gpio?
> Patches welcom, make sure they are tested with mainline
> code and drivers.
>
> Yours.
> Linus Walleij

OK. So I suggested correction of the Xilinx GPIO driver so that it always sets the flags:

static int xgpio_xlate(struct gpio_chip *gc,
		       const struct of_phandle_args *gpiospec, u32 *flags)
{
	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
	struct xgpio_instance *chip = container_of(mm_gc, struct xgpio_instance,
						   mmchip);
        if(flags)
              * flags = 0;

	if (gpiospec->args[1] == chip->offset)
		return gpiospec->args[0];

	return -EINVAL;
}

With best regards,
Wojtek
