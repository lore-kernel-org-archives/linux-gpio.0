From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: fix a typo when merging A20
 support to A10 driver
Date: Thu, 28 Dec 2017 15:06:28 +0100
Message-ID: <CACRpkdYKrL+eBB4AdvRcqRTvejLqAK9hBpFwkdO7YNmiTpJ4ig@mail.gmail.com>
References: <20171228132009.12839-1-icenowy@aosc.io>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDE6RCFOWIARBZPUSPJAKGQEZQZG4MA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171228132009.12839-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Kettenis <mark.kettenis-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 28, 2017 at 2:20 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:

> When merging A20 pinctrl support to A10 pinctrl driver, the I2C function
> of PI3 is wrongly written as "i2c3" (it should be "i2c4").
>
> Fix this typo.
>
> Fixes: cad4e209c102 ("pinctrl: sunxi: add support of R40 to A10 pinctrl driver")
> Reported-by: Mark Kettenis <mark.kettenis-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Patch applied.

Yours,
Linus Walleij
