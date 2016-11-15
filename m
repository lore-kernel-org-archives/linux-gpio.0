From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 5/6] pinctrl: sh-pfc: r8a7778: Use lookup function for
 bias data
Date: Tue, 15 Nov 2016 10:38:27 +0100
Message-ID: <CAMuHMdVrMuO5hSgSNvjG8m4A2jGd=JtvHHaRjY76zJZWsdZtqA@mail.gmail.com>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
 <20161112160429.12524-6-niklas.soderlund+renesas@ragnatech.se> <3799953.2bFHkKiW66@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <3799953.2bFHkKiW66@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Nov 13, 2016 at 2:49 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Saturday 12 Nov 2016 17:04:28 Niklas S=C3=B6derlund wrote:
>> Change the data structure and use the generic sh_pfc_pin_to_bias_info()
>> function to get the register offset and bit information.
>>
>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech=
.se>
>
> Except for the bias_info for which I trust your regexp skills,

Approved by "git wshow".

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
