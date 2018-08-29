From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: lpc18xx: mark expected switch fall-throughs
Date: Wed, 29 Aug 2018 13:47:51 +0200
Message-ID: <CACRpkdYLWLhw-O00=Gc3FeVWt9dKFURNO2m5ic4MyjbJrGtGdA@mail.gmail.com>
References: <20180815171035.GA17360@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180815171035.GA17360@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Joachim Eastwood <manabian@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 15, 2018 at 7:10 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
>
> Addresses-Coverity-ID: 1292308 ("Missing break in switch")
> Addresses-Coverity-ID: 1292309 ("Missing break in switch")
> Addresses-Coverity-ID: 1309546 ("Missing break in switch")
> Addresses-Coverity-ID: 1357369 ("Missing break in switch")
> Addresses-Coverity-ID: 1357389 ("Missing break in switch")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied.

Yours,
Linus Walleij
