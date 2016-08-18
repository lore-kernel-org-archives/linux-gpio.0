From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Revisiting rbtx4927: gpiod_direction_output_raw: invalid GPIO
Date: Thu, 18 Aug 2016 14:36:54 +0200
Message-ID: <CAMuHMdW6e=Tms0TXLVomRm7EdhPNpvFTO13nx3W2cyx52VDUmQ@mail.gmail.com>
References: <CAMuHMdUARn_SxhkWiTsGdSixFv9a=VjKLLgQMfPTtxufrjepCg@mail.gmail.com>
 <20160801.232359.1867350514422089320.anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160801.232359.1867350514422089320.anemo@mba.ocn.ne.jp>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Nemoto-san,

On Mon, Aug 1, 2016 at 4:23 PM, Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> On Thu, 14 Apr 2016 21:06:05 +0200, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> I've just updated my old rbtx4927 from v3.13-rc3 to v4.6-rc3.
>> Surprisingly, it boots to nfsroot without any kernel changes.
>
> Good news!  I'm happy to hear that.
>
>> However, there's an annoying warning in the boot log:
>>
>>         gpiod_direction_output_raw: invalid GPIO
>>
>> This is caused by the following code in arch/mips/txx9/rbtx4927/setup.c:
>>
>>         static void __init rbtx4927_mem_setup(void)
>>         {
>>
>>                 /* TX4927-SIO DTR on (PIO[15]) */
>>                 gpio_request(15, "sio-dtr");
>>
>> returns -EPROBE_DEFER
>>
>>                 gpio_direction_output(15, 1);
>>
>> VALIDATE_DESC triggers the warning.

Note that as of commit 54d77198fdfbc4f0 ("gpio: bail out silently on NULL
descriptors"), the warning is gone. But the underlying issue isn't.

>> Probably a silly GPIO conversion was missed during the last 2+ years?
>
> Maybe txx9_gpio_init() failed to add gpio_chip since it was called too
> early on startup.
>
> Nowadays gpiochip_add_data calls kzalloc so cannot be called from
> plat_mem_setup context.

That's correct. It failed (silently) with -12, which is -ENOMEM...

> Could you try moving these txx9_gpio_init(), gpio_request() and
> gpio_direction_output() calls to rbtx4927_arch_init() or
> rbtx4927_device_init()?

Thanks, that works! Will send patches soon...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
