From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 06/33] ARM: pxa/lubbock: add GPIO driver for LUB_MISC_WR
 register
Date: Mon, 29 Aug 2016 21:57:20 +0200
Message-ID: <87a8fve4bj.fsf@belgarion.home>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
 <E1beJk4-0000mH-4P@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1beJk4-0000mH-4P@rmk-PC.armlinux.org.uk> (Russell King's
 message of "Mon, 29 Aug 2016 11:24:36 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-pcmcia/>
List-Post: <mailto:linux-pcmcia@lists.infradead.org>
List-Help: <mailto:linux-pcmcia-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=subscribe>
Sender: "linux-pcmcia" <linux-pcmcia-bounces@lists.infradead.org>
Errors-To: linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-pcmcia@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, Kristoffer Ericson <kristoffer.ericson@gmail.com>, linux-arm-kernel@lists.infradead.org, Daniel Mack <daniel@zonque.org>
List-Id: linux-gpio@vger.kernel.org

Russell King <rmk+kernel@armlinux.org.uk> writes:

..zip...
> diff --git a/arch/arm/mach-pxa/lubbock.c b/arch/arm/mach-pxa/lubbock.c
> index 7245f3359564..e974d1eb0f88 100644
> --- a/arch/arm/mach-pxa/lubbock.c
> +++ b/arch/arm/mach-pxa/lubbock.c
...zip...

> @@ -110,20 +111,18 @@ static unsigned long lubbock_pin_config[] __initdata = {
>  };
>  
>  #define LUB_HEXLED		__LUB_REG(LUBBOCK_FPGA_PHYS + 0x010)
> -#define LUB_MISC_WR		__LUB_REG(LUBBOCK_FPGA_PHYS + 0x080)
>  
>  void lubbock_set_hexled(uint32_t value)
>  {
>  	LUB_HEXLED = value;
>  }
>  
> +static struct gpio_chip *lubbock_misc_wr_gc;
> +
>  void lubbock_set_misc_wr(unsigned int mask, unsigned int set)
>  {
> -	unsigned long flags;
> -
> -	local_irq_save(flags);
> -	LUB_MISC_WR = (LUB_MISC_WR & ~mask) | (set & mask);
> -	local_irq_restore(flags);
> +	unsigned long m = mask, v = set;
> +	lubbock_misc_wr_gc->set_multiple(lubbock_misc_wr_gc, &m, &v);
If gpio_reg_init() failed (and I know, the probability of a lack of memory at
that stage of the kernel boot is ridiculous), this will end up as an NULL
pointer dereference if either IRDA or PCMCIA is used.

If it's expected, then the the pr_err() below would deserve a pr_crit(). I would
as well take an option on a "panic()" if lubbock_misc_wr_gc allocation fails. If
not, maybe a not-NULL test on lubbock_misc_wr_gc is in order, even if that would
be "hidding under the carpet" and rather difficult to debug later.

Apart this detail point, it's good for me.

Cheers.

-- 
Robert
