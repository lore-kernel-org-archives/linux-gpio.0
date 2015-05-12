From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a73a4: Remove obsolete
 multi-platform check
Date: Tue, 12 May 2015 09:26:53 +0200
Message-ID: <CACRpkdZZ_=x7=2Ae9VPAo6dPvD2D_2MUDwNjCF-jxSp075X1hA@mail.gmail.com>
References: <1430216072-31412-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430216072-31412-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2015 at 12:14 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As of commit 9d07d414d4c33d86 ("ARM: shmobile: r8a73a4: ape6evm: Remove
> legacy platform"), r8a73a4 is only supported in generic ARM
> multi-platform builds.  Hence CONFIG_ARCH_MULTIPLATFORM is always set,
> and the check can be removed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on Simon's branch r8a73a4-ccf-and-multiplatform-for-v4.1

I guess I can't merge it to pinctrl then and Simon will take it?

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
