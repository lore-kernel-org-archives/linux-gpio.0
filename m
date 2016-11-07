From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Use lookup function for
 bias data
Date: Mon, 7 Nov 2016 11:57:36 +0100
Message-ID: <CAMuHMdUhR8Kh-8XLSwPXDYf7S+UVQiGSE4esmQtAfs0Qo-paog@mail.gmail.com>
References: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se>
 <20161103153421.15527-3-niklas.soderlund+renesas@ragnatech.se> <2675389.IrWB4HU6aN@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:32902 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751856AbcKGLWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 06:22:45 -0500
In-Reply-To: <2675389.IrWB4HU6aN@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 3, 2016 at 6:10 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday 03 Nov 2016 16:34:21 Niklas S=C3=B6derlund wrote:
>> There is a bug in the r8a7795 bias code where a WARN() is trigged
>> anytime a pin from PUEN0/PUD0is accessed.
>>
>>  # cat /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins
>>
>>  WARNING: CPU: 2 PID: 2391 at drivers/pinctrl/sh-pfc/pfc-r8a7795.c:5364
>> r8a7795_pinmux_get_bias+0xbc/0xc8 [..]
>>  Call trace:
>>  [<ffff0000083c442c>] r8a7795_pinmux_get_bias+0xbc/0xc8
>>  [<ffff0000083c37f4>] sh_pfc_pinconf_get+0x194/0x270
>>  [<ffff0000083b0768>] pin_config_get_for_pin+0x20/0x30
>>  [<ffff0000083b11e8>] pinconf_generic_dump_one+0x168/0x188
>>  [<ffff0000083b144c>] pinconf_generic_dump_pins+0x5c/0x98
>>  [<ffff0000083b0628>] pinconf_pins_show+0xc8/0x128
>>  [<ffff0000081fe3bc>] seq_read+0x16c/0x420
>>  [<ffff00000831a110>] full_proxy_read+0x58/0x88
>>  [<ffff0000081d7ad4>] __vfs_read+0x1c/0xf8
>>  [<ffff0000081d8874>] vfs_read+0x84/0x148
>>  [<ffff0000081d9d64>] SyS_read+0x44/0xa0
>>  [<ffff000008082f4c>] __sys_trace_return+0x0/0x4
>>
>> This is due to the WARN() check if the reg field of the pullups struct
>> is zero, and this should be 0 for pins controlled by the PUEN0/PUD0
>> registers. Change the layout of the pullups struct to embed the pin
>> number inside the struct and loop over it to fetch the correct
>> information or WARN() if no pin is found.
>
> This lowers the memory consumption at the cost of increased CPU usage. Gi=
ven
> that the get/set bias functions are not part of a critical path I'm fine =
with
> that. We could possibly optimize the implementation by using a dichotomic
> search, but I don't think that's needed at the moment.

Alternatively, we could steal one bit from the "reg" bitifield to
add a "present" bit, without increasing the table size:

        static const struct {
                u16 present : 1;
                u16 reg : 10;
                u16 bit : 5;
         } pullups[] =3D {

While 10 bits is not sufficient in general (the PFC register block size
is 0x50c), it's good enough to address the PUx registers. And if needed,
we can switch from register byte offsets to register indices, indexing the
32-bit register file.

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
