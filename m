From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mt7622: mark expected switch fall-through
Date: Mon, 9 Jul 2018 15:38:41 +0200
Message-ID: <CACRpkdZmv+_4B--J-RXfEu44bvQbq2yS0zei9uPYrtr+cBTxwg@mail.gmail.com>
References: <20180705154452.GA32564@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705154452.GA32564@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Sean Wang <sean.wang@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 5, 2018 at 5:45 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
>
> Warning level 2 was used: -Wimplicit-fallthrough=2
>
> Addresses-Coverity-ID: 1463284 ("Missing break in switch")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied.

Yours,
Linus Walleij
