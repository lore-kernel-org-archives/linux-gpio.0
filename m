From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [RFT][PATCH] gpio: xtensa: Implement .direction_input and
 .direction_output callbacks
Date: Sat, 26 Apr 2014 22:38:00 +0300
Message-ID: <20140426193800.GA4806@tarshish>
References: <1398429188.1754.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:51951 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751180AbaDZTiR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 26 Apr 2014 15:38:17 -0400
Content-Disposition: inline
In-Reply-To: <1398429188.1754.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org

Hi Axel,

On Fri, Apr 25, 2014 at 08:33:08PM +0800, Axel Lin wrote:
> The implementation of _gpiod_direction_output_raw() checks both .set and
> .direction_output callbacks. To make gpio_direction_output() works, both .set
> and .direction_output callbacks needs to be implemented in the driver.
> 
> Similarly, gpiod_direction_input() checks both .get and .direction_input
> callbacks. To make gpio_direction_input() works, both .get and .direction_input
> needs to be implemented in the driver.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi Baruch,
> I don't have this h/w to test, so this patch needs test.
> I think both gpio_direction_output() and gpio_direction_input() do not work
> without this patch. Which means gpio_request_one() also does not work.

I don't have access to this hardware anymore either. Adding the Xtensa list to 
Cc.

> BTW, I also hit below build error.
>   CC      drivers/gpio/gpio-xtensa.o
> drivers/gpio/gpio-xtensa.c: Assembler messages:
> drivers/gpio/gpio-xtensa.c:87: Error: unknown opcode or format name 'read_impwire'
> drivers/gpio/gpio-xtensa.c:116: Error: unknown opcode or format name 'rur.expstate'
> drivers/gpio/gpio-xtensa.c:130: Error: unknown opcode or format name 'wrmsk_expstate'
> make[2]: *** [drivers/gpio/gpio-xtensa.o] Error 1
> make[1]: *** [drivers/gpio] Error 2
> make: *** [drivers] Error 2
> (I found the same build error is already reported by Geert Uytterhoeven.)

This should be fixed by commit 8e9356c6146d0 (xtensa: fsf: drop nonexistent 
GPIO32 support) for the fsf variant. This commit is included in v3.14. If you 
build a different variant you must use a matching toolchain.

baruch

>  drivers/gpio/gpio-xtensa.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
> index 7081304..ed6d874 100644
> --- a/drivers/gpio/gpio-xtensa.c
> +++ b/drivers/gpio/gpio-xtensa.c
> @@ -96,6 +96,12 @@ static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
>  	BUG(); /* output only; should never be called */
>  }
>  
> +static int xtensa_impwire_direction_input(struct gpio_chip *gc,
> +					  unsigned offset)
> +{
> +	return 0;
> +}
> +
>  static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
>  {
>  	return 0; /* output only */
> @@ -126,6 +132,13 @@ static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
>  	disable_cp(flags, saved_cpenable);
>  }
>  
> +static int xtensa_expstate_direction_output(struct gpio_chip *gc,
> +					    unsigned offset, int value)
> +{
> +	xtensa_expstate_set_value(gc, offset, value);
> +	return 0;
> +}
> +
>  static struct gpio_chip impwire_chip = {
>  	.label		= "impwire",
>  	.base		= -1,
> @@ -133,6 +146,7 @@ static struct gpio_chip impwire_chip = {
>  	.get_direction	= xtensa_impwire_get_direction,
>  	.get		= xtensa_impwire_get_value,
>  	.set		= xtensa_impwire_set_value,
> +	.direction_input = xtensa_impwire_direction_input,
>  };
>  
>  static struct gpio_chip expstate_chip = {
> @@ -142,6 +156,7 @@ static struct gpio_chip expstate_chip = {
>  	.get_direction	= xtensa_expstate_get_direction,
>  	.get		= xtensa_expstate_get_value,
>  	.set		= xtensa_expstate_set_value,
> +	.direction_output = xtensa_expstate_direction_output,
>  };
>  
>  static int xtensa_gpio_probe(struct platform_device *pdev)
> -- 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
