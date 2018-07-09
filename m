From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: baytrail: Mark expected switch fall-throughs
Date: Mon, 9 Jul 2018 15:42:13 +0200
Message-ID: <CACRpkdYODi2oNxqCmHtfev=NZ7S_T62B91S58kt=T84FCnnceA@mail.gmail.com>
References: <20180705155127.GA1458@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705155127.GA1458@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 5, 2018 at 5:51 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
>
> Addresses-Coverity-ID: 1292308 ("Missing break in switch")
> Addresses-Coverity-ID: 1292309 ("Missing break in switch")

I hope these special tags are accepted by the community at large.
Has there been discussion?

> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
