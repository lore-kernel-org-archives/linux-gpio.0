From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: rename R_PIO i2c pin
 function name
Date: Mon, 31 Jul 2017 15:33:15 +0800
Message-ID: <CAGb2v64M+FqOeXMOyGQmUiZGw2K9+oRW8ADy=aeUAXVUn0BfQQ@mail.gmail.com>
References: <20170730053618.44781-1-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBU527PFQKGQESCOPNJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170730053618.44781-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jul 30, 2017 at 1:36 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> The I2C pin functions in R_PIO used to be named "s_twi".
>
> As we usually use the name "i2c" instead of "twi" in the mainline
> kernel, change these names to "s_i2c" for consistency.
>
> The "s_twi" functions are not yet referenced by any device trees in
> mainline kernel so I think it's safe to change the name.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
