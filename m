From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: Improve pinmux macros documentation
Date: Tue, 27 Oct 2015 11:18:33 +0100
Message-ID: <CACRpkdYDZ9SZ8qTx4Ly3QtnKfwkxJc-yRHPeWaGjVE0Nqpy12Q@mail.gmail.com>
References: <1445368482-24278-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1445368482-24278-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niso@kth.se>, Koji Matsuoka <koji.matsuoka.xm@rms.renesas.com>, Magnus Damm <damm@opensource.se>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2015 at 9:14 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Fix some s/ispr/ipsr/ typos in macro parameters while we're at it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Clarify same width vs. different widths,
>   - Mention GPSR for PINMUX_IPSR_DATA(),
>   - Document NOGM (= NOGP + MSEL),
>   - Fix s/ispr/ipsr/ typos.

Acked-by, I guess you're continuing to collect patches. This one
could use Lauren'ts ACK.

Yours,
Linus Walleij
