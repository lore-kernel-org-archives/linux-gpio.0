From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Use lookup function for
 bias data
Date: Wed, 9 Nov 2016 13:30:50 +0100
Message-ID: <CAMuHMdUU5ju++2kTZpoJpBW=_-Ub4gReOTCitkct8sdRFkEovQ@mail.gmail.com>
References: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se>
 <2675389.IrWB4HU6aN@avalon> <CAMuHMdUhR8Kh-8XLSwPXDYf7S+UVQiGSE4esmQtAfs0Qo-paog@mail.gmail.com>
 <1534860.cl1iMAJKMz@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1534860.cl1iMAJKMz@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On Wed, Nov 9, 2016 at 11:43 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 07 Nov 2016 11:57:36 Geert Uytterhoeven wrote:
>> On Thu, Nov 3, 2016 at 6:10 PM, Laurent Pinchart wrote:
>> > On Thursday 03 Nov 2016 16:34:21 Niklas S=C3=B6derlund wrote:
>> >> There is a bug in the r8a7795 bias code where a WARN() is trigged
>> >> anytime a pin from PUEN0/PUD0is accessed.
>> >>  # cat /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins
>> >>
>> >>  WARNING: CPU: 2 PID: 2391 at drivers/pinctrl/sh-pfc/pfc-r8a7795.c:53=
64
>> >>
>> >> r8a7795_pinmux_get_bias+0xbc/0xc8 [..]
>> >>
>> >>  Call trace:
>> >>  [<ffff0000083c442c>] r8a7795_pinmux_get_bias+0xbc/0xc8
>> >>  [<ffff0000083c37f4>] sh_pfc_pinconf_get+0x194/0x270
>> >>  [<ffff0000083b0768>] pin_config_get_for_pin+0x20/0x30
>> >>  [<ffff0000083b11e8>] pinconf_generic_dump_one+0x168/0x188
>> >>  [<ffff0000083b144c>] pinconf_generic_dump_pins+0x5c/0x98
>> >>  [<ffff0000083b0628>] pinconf_pins_show+0xc8/0x128
>> >>  [<ffff0000081fe3bc>] seq_read+0x16c/0x420
>> >>  [<ffff00000831a110>] full_proxy_read+0x58/0x88
>> >>  [<ffff0000081d7ad4>] __vfs_read+0x1c/0xf8
>> >>  [<ffff0000081d8874>] vfs_read+0x84/0x148
>> >>  [<ffff0000081d9d64>] SyS_read+0x44/0xa0
>> >>  [<ffff000008082f4c>] __sys_trace_return+0x0/0x4
>> >>
>> >> This is due to the WARN() check if the reg field of the pullups struc=
t
>> >> is zero, and this should be 0 for pins controlled by the PUEN0/PUD0
>> >> registers. Change the layout of the pullups struct to embed the pin
>> >> number inside the struct and loop over it to fetch the correct
>> >> information or WARN() if no pin is found.
>> >
>> > This lowers the memory consumption at the cost of increased CPU usage.
>> > Given that the get/set bias functions are not part of a critical path =
I'm
>> > fine with that. We could possibly optimize the implementation by using=
 a
>> > dichotomic search, but I don't think that's needed at the moment.
>>
>> Alternatively, we could steal one bit from the "reg" bitifield to
>> add a "present" bit, without increasing the table size:
>
> That's an option too, but given how sparsely populated the table is at th=
e
> moment, I'd prefer lowering the memory consumption by moving the pin numb=
er in
> the table and removing unused entries. The increase in CPU time could be
> further limited by using a dichotomic search if needed.

After discussing with Niklas, I agree.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
