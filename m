From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: Revisiting rbtx4927: gpiod_direction_output_raw: invalid GPIO
Date: Mon, 01 Aug 2016 23:23:59 +0900 (JST)
Message-ID: <20160801.232359.1867350514422089320.anemo@mba.ocn.ne.jp>
References: <CAMuHMdUARn_SxhkWiTsGdSixFv9a=VjKLLgQMfPTtxufrjepCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAMuHMdUARn_SxhkWiTsGdSixFv9a=VjKLLgQMfPTtxufrjepCg@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: geert@linux-m68k.org
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Geert, sorry for loooong delay ...

On Thu, 14 Apr 2016 21:06:05 +0200, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> I've just updated my old rbtx4927 from v3.13-rc3 to v4.6-rc3.
> Surprisingly, it boots to nfsroot without any kernel changes.

Good news!  I'm happy to hear that.

> However, there's an annoying warning in the boot log:
> 
>         gpiod_direction_output_raw: invalid GPIO
> 
> This is caused by the following code in arch/mips/txx9/rbtx4927/setup.c:
> 
>         static void __init rbtx4927_mem_setup(void)
>         {
> 
>                 /* TX4927-SIO DTR on (PIO[15]) */
>                 gpio_request(15, "sio-dtr");
> 
> returns -EPROBE_DEFER
> 
>                 gpio_direction_output(15, 1);
> 
> VALIDATE_DESC triggers the warning.
> 
> Probably a silly GPIO conversion was missed during the last 2+ years?

Maybe txx9_gpio_init() failed to add gpio_chip since it was called too
early on startup.

Nowadays gpiochip_add_data calls kzalloc so cannot be called from
plat_mem_setup context.

Could you try moving these txx9_gpio_init(), gpio_request() and
gpio_direction_output() calls to rbtx4927_arch_init() or
rbtx4927_device_init()?

---
Atsushi Nemoto
