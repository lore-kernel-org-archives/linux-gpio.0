From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] drivers: pinctrl: add driver for
 Allwinner H5 SoC
Date: Fri, 30 Dec 2016 13:55:44 +0100
Message-ID: <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ@mail.gmail.com>
References: <20161223125001.1176-1-icenowy@aosc.xyz> <1280f095-ab03-93f8-14d2-99d13ba1ce55@arm.com>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDE6RCFOWIARBUNSTHBQKGQEH4GR6UY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1280f095-ab03-93f8-14d2-99d13ba1ce55-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 26, 2016 at 3:33 PM, Andr=C3=A9 Przywara <andre.przywara-AbSShOkvfpQ@public.gmane.org=
m> wrote:

> So while this patch technically looks correct, I was wondering if we
> should really explore the possibility of making the whole of sunxi
> pinctrl DT controlled.
> I brought this up a while ago, but people weren't overly enthusiastic
> about it, though their argument weren't really convincing to me[1].
>
> So:
> As this "driver" here is basically a table linking GPIO bit settings
> (the actual mux value) to names and every pin we care about needs to be
> enumerated in the DT anyway, why not just add something like:
> allwinner,pinmux =3D <4>;
> to each pin(group) in the DT and get rid of this "driver" file here
> entirely?

I'm open to that if you can use pinctrl-single which is in the kernel
for this purpose only, and is used with both OMAPs and HiSilicon.

It recently was improved and will be improved more in this cycle,
see for example:
commit 42124bc598f64f84b3335d5a058304207695b84f
pinctrl: Introduce generic #pinctrl-cells and pinctrl_parse_index_with_args

> (...) Also I guess the common sunxi
> pinctrl driver code needs some significant rework.

I would guess is just needs replacing with pinctrl-single in that case.

Yours,
Linus Walleij

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
