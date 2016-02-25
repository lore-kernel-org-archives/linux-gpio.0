From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: Add missing H3 R_PIO
 binding documentation
Date: Thu, 25 Feb 2016 10:27:55 +0100
Message-ID: <CACRpkdaOpjhqUBSvYrCcZQgtTtFs79FwvKO5f4z07CCzNA44PA@mail.gmail.com>
References: <CACRpkdbfNeh7_=3ReQtJc7OxkkQEn+BUhZ0O0SKnFsRD=WZiUQ@mail.gmail.com>
	<20160218194931.GA16393@box2.japko.eu>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBHESXO3AKGQE63CHDDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160218194931.GA16393-xLeyfSbClftGit24Ens98Q@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Krzysztof Adamski <k@japko.eu>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 18, 2016 at 8:49 PM, Krzysztof Adamski <k@japko.eu> wrote:

> allwinner,sun8i-h3-r-pinctrl was added by
> commit ba83a11104ae ("pinctrl: sunxi: Add H3 R_PIO controller support")
> but the patch was missing proper binding documentation. This patch fixes
> this issue.
>
> Signed-off-by: Krzysztof Adamski <k@japko.eu>

Patch applied with Chen-Yu's ACK.

Yours,
Linus Walleij
