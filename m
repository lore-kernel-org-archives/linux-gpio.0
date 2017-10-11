From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7795: fix trivial typo in comment
Date: Wed, 11 Oct 2017 11:28:14 +0200
Message-ID: <CAMuHMdVEiCvkd25yx2V8Pud+x7F4hP+2EUEVqvZLdFkcvSKPHg@mail.gmail.com>
References: <20171009083725.6474-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171009083725.6474-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Wolfram,

On Mon, Oct 9, 2017 at 10:37 AM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since V1 for both patches:
>         * corrected authorship email address (sorry for the noise!)
>
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index 8fc5d659e2dc01..8ca59b35595068 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -1508,7 +1508,7 @@ static const u16 pinmux_data[] = {
>  };
>
>  /*
> - * R8A7795 has 8 banks with 32 PGIOS in each => 256 GPIOs.
> + * R8A7795 has 8 banks with 32 GPIOs IN EACH => 256 GPIOs.

I don't think the capitalization of "in each" had to be changed?
(overzealous use of vim ~?)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.15 with the above fixed, and once more
after filtering through s/r8a7795/r8a7795-es1/g.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
