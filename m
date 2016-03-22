From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: IPSRx and MOD_SELx should be set
 before GPSRx
Date: Tue, 22 Mar 2016 15:33:22 +0100
Message-ID: <CACRpkdZmxFaN1aVDVHjLLf-2qjjkpz5aKYOvpuAzqZwnHUx5TA@mail.gmail.com>
References: <8760wnfe3r.wl%kuninori.morimoto.gx@renesas.com>
	<8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
	<CACRpkdYFzKkDEr-PE1euG7ZOGe5MQJfm-rdW-7YN1yQ_y4W9Zg@mail.gmail.com>
	<CAMuHMdUbcJZmyXgRd3EyNi55b-Gwc-dN84TQNdFf3F5JxvOR5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUbcJZmyXgRd3EyNi55b-Gwc-dN84TQNdFf3F5JxvOR5Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus <magnus.damm@gmail.com>, Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2016 at 3:30 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Mar 22, 2016 at 2:18 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> I wait for Geert to either queue this for his first v4.7 pull request
>> or tell me to apply it for fixes. Is it a regression?
>
> I'm not aware of any issues due to this.

OK just queue it with the rest.

I assume there will still be lots of action in sh-pfc for this merge
window.

Yours,
Linus Walleij
