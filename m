From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: artpec-6: Add smaller groups for uarts
Date: Thu, 1 Mar 2018 17:04:43 +0100
Message-ID: <CACRpkdb3gDBfX+05mSBk3h4Mm-0jvHebT4LbU9p1Bw2Y0U4=tg@mail.gmail.com>
References: <20180222132705.18314-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180222132705.18314-1-niklas.cassel@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, linux-arm-kernel@axis.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 22, 2018 at 2:27 PM, Niklas Cassel <niklas.cassel@axis.com> wrote:

> From: Jesper Nilsson <jesper.nilsson@axis.com>
>
> Add group configuration for uarts that are cut down
> variants, the standard being full, i.e. all signals,
> flow control, i.e. rx/tx and cts/rts, and rx/tx only.
>
> This allows us to be more precise in which pins we're
> actually using.
>
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

Patch applied!

Yours,
Linus Walleij
