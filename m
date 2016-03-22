From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: IPSRx and MOD_SELx should be set
 before GPSRx
Date: Tue, 22 Mar 2016 15:30:24 +0100
Message-ID: <CAMuHMdUbcJZmyXgRd3EyNi55b-Gwc-dN84TQNdFf3F5JxvOR5Q@mail.gmail.com>
References: <8760wnfe3r.wl%kuninori.morimoto.gx@renesas.com>
	<8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
	<CACRpkdYFzKkDEr-PE1euG7ZOGe5MQJfm-rdW-7YN1yQ_y4W9Zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYFzKkDEr-PE1euG7ZOGe5MQJfm-rdW-7YN1yQ_y4W9Zg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus <magnus.damm@gmail.com>, Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Mar 22, 2016 at 2:18 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Mar 16, 2016 at 1:48 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
>
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> Gen2 / Gen3 datasheet will have below note in next version.
>> This patch follows this note.
>>
>> IPSRx and MOD_SELx registers shall be set before setting GPSRx
>> registers in case that they need to be configured.
>> MOD_SELx registers can be set either earlier or later than setting
>> IPSRx registers.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> I wait for Geert to either queue this for his first v4.7 pull request
> or tell me to apply it for fixes. Is it a regression?

I'm not aware of any issues due to this.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
