From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Fri, 1 Jan 2016 18:29:15 +0100
Message-ID: <CACRpkdZsQc_Jug1dy-qist4Dv7HTDDx-fBjXTxj+s7W0sgJSuw@mail.gmail.com>
References: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
	<CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
	<20151230172212.GZ16023@sirena.org.uk>
	<CAGS+omA9AarzE2sp1Ry3RuOt8EOa-sL=DL1iDA2OeVVdjn=xgg@mail.gmail.com>
	<20151231220712.GD16023@sirena.org.uk>
	<CAGS+omDesPTYHhVLv_EtQsYxa6MNuSi06MwcXz6RcY=uAcEtnQ@mail.gmail.com>
	<DBFC9B9B-5E81-44FD-9E26-8B50545004C1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DBFC9B9B-5E81-44FD-9E26-8B50545004C1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabio Estevam <fabio.estevam@freescale.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 1, 2016 at 3:27 PM, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On January 1, 2016 3:56:01 AM EET, Daniel Kurtz <djkurtz@chromium.org> wrote:

>>> It's fairly clear that there's at least a case for simplifying the
>>> existing practice here, for example by moving everything into a
>>single
>>> (perhaps aliased) initcall rather than by randomly picking a level
>>per
>>> system or by actually fiddling with the link ordering if the case is
>>> sufficiently clear that pinctrl in general ought to load earlier than
>>it
>>> does.
>>
>>Nothing above sounds like a reason not to merge this patch, however.
>>Why should we block useful patches that use existing tools to fix real
>>architecture-specific issues until new infrastructure is merged that
>>solves general problems?
>
> I think what Mark means is, that we define some pinctrl_initcall which
> is a macro to subsys_initcall (or arch_initcall or similar). We apply this
> to all pinctrl drivers including the one from Mediatek. This way at least
> we have a common method and changing the behaviour in the future is
> easier to handle.

That would be pinctrl_soc_initcall() in that case. Just pinctrl_initcall()
would assume it's for all drivers and there is a bunch of them that are just
fine with simple device_initcall()s.

Yours,
Linus Walleij
