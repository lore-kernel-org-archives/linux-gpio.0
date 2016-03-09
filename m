From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Wed, 9 Mar 2016 14:17:57 +0100
Message-ID: <CAMuHMdVOu-KtWB9mtfftstbNBqyFDtrONYfaetR_NAFKHT-n-A@mail.gmail.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
	<CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
	<56DDDE6E.6090908@cogentembedded.com>
	<CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
	<56DDE5CB.60204@cogentembedded.com>
	<CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
	<20160309095805.GA1506@katana>
	<CACRpkdZzbp5MwD6uH=GbkYbvB=HsGOHYi+HcYpn5gZacmRwHwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZzbp5MwD6uH=GbkYbvB=HsGOHYi+HcYpn5gZacmRwHwg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Wed, Mar 9, 2016 at 11:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Mar 9, 2016 at 4:58 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> On Mon, Mar 07, 2016 at 10:00:37PM +0100, Geert Uytterhoeven wrote:
>
>>> >    This approach is better then, won't have to fix again whenever SH gets DT
>>> > support.
>>>
>>> Perhaps the of_have_populated_dt() check should be moved inside
>>> pinctrl_provide_dummies()?
>>
>> I suggest we pick up this patch now even with stable tag (the irq storm
>> fixup doesn't work correctly because of this) and consider the
>> refactoring as a second step?
>
> Sergei, Geert, do you ACK this?

I gave this a try on all my boards, plus the remote r8a7790/lager that
exhibited the problem.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Please pick it up. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
