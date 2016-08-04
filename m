From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add missing pinmux data
Date: Thu, 4 Aug 2016 10:04:25 +0200
Message-ID: <CACRpkdbPsu=uhHW7N0GS1evMkbYUrA+465Ou5m0R-kOoDUtQ0w@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <3787651.qWyGt9oMl5@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <3787651.qWyGt9oMl5@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 22, 2016 at 3:51 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> The patch I've based my R8A7792 PFC work on had some VIN pinmux data missing
> and I  just  noticed that while adding the VIN pin groups...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This looks like a fix that should go in ASAP?

Geert, do you want me to apply this directly for fixes with
your ACK?

Yours,
Linus Walleij
