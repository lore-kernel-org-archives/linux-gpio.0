From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: Fix a memory leak in 'sunxi_pinctrl_build_state()'
Date: Tue, 16 Oct 2018 10:04:24 +0200
Message-ID: <CACRpkdYFjz_9mvvikCCdpJh=6S8F-u+kuJ3n55brA8e7wPhHtg@mail.gmail.com>
References: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016062228.19472-1-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 16, 2018 at 8:22 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If 'krealloc()' fails, 'pctl->functions' is set to NULL.
> We should instead use a temp variable in order to be able to free the
> previously allocated memeory, in case of OOM.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
