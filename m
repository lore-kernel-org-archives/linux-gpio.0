From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2 1/2] pinctrl: sh-pfc: r8a7796: Add drive strength support
Date: Tue, 15 Nov 2016 13:54:00 +0100
Message-ID: <CAMuHMdW0a+aYEE0Q5wASUjSca9z75R0iocz18pmq_xbDCqh6mw@mail.gmail.com>
References: <20161112161002.13070-1-niklas.soderlund+renesas@ragnatech.se>
 <20161112161002.13070-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUmw14iv7P+anCF6X9XBD7wFSKuDjCk-N_vqCUqOZYHmQ@mail.gmail.com> <20161115121810.GD27089@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161115121810.GD27089@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Niklas,

On Tue, Nov 15, 2016 at 1:18 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7, DU_DOTCLKIN2, SH_PF=
C_PIN_CFG_DRIVE_STRENGTH),
>>
>> DU_DOTCLKIN3 is pin AR8.
>
> DU_DOTCLKIN2 is pin AR8, right?

Yes. Silly typo on my part, and copied and pasted to bring more confusion :=
-(

>> > +               { PIN_A_NUMBER('R', 8),  24, 2 },       /* DU_DOTCLKIN=
3 */
>>
>> Probably this is a bug in the datasheet, as M3-W does not have DU_DOTCLK=
IN3?
>
> No bug in the datasheet only me who is confused by the naming of the
> external leads and pins described above. Will fix this up and resend
> after your feedback, sorry for the confusion and thanks for spotting it.

The bit is labeled for H3 only in the PUEN register, but not in the
PUD register.

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
