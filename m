From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: IPSRx and MOD_SELx should be set
 before GPSRx
Date: Tue, 22 Mar 2016 14:18:53 +0100
Message-ID: <CACRpkdYFzKkDEr-PE1euG7ZOGe5MQJfm-rdW-7YN1yQ_y4W9Zg@mail.gmail.com>
References: <8760wnfe3r.wl%kuninori.morimoto.gx@renesas.com>
	<8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <8737rrfe1f.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus <magnus.damm@gmail.com>, Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2016 at 1:48 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Gen2 / Gen3 datasheet will have below note in next version.
> This patch follows this note.
>
> IPSRx and MOD_SELx registers shall be set before setting GPSRx
> registers in case that they need to be configured.
> MOD_SELx registers can be set either earlier or later than setting
> IPSRx registers.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

I wait for Geert to either queue this for his first v4.7 pull request
or tell me to apply it for fixes. Is it a regression?

Yours,
Linus Walleij
