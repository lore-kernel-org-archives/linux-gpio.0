From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/17 v6][RFC] pinctrl: sh-pfc: Add R8A7795 PFC support
Date: Wed, 26 Aug 2015 14:33:28 +0200
Message-ID: <CACRpkdY9-BO5XMhCmQP9M+9Uzd1r7GfbrA+0OHXxsy51YhCgeg@mail.gmail.com>
References: <87oai2b9rj.wl%kuninori.morimoto.gx@renesas.com>
	<87io8ab9jj.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34741 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933235AbbHZMd3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 08:33:29 -0400
Received: by oiey141 with SMTP id y141so120163635oie.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 05:33:28 -0700 (PDT)
In-Reply-To: <87io8ab9jj.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, YOSHIYUKI ITO <yoshiyuki.ito.ub@renesas.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>, Yusuke Goda <yusuke.goda.sx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, TOSHIAKI KOMATSU <toshiaki.komatsu.ud@renesas.com>, Gaku Inami <gaku.inami.xw@bp.renesas.com>

On Thu, Aug 20, 2015 at 11:24 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Add PFC support for the R8A7795 SoC including pin groups.
> It is including EthernetAVB, DU, HDMI, MSOIF, SDHI, USB2.0, USB3.0
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>> Linus W
>
> Becasue this is very large size patch, Maybe GPIO ML (SH-ARM ML too)
> can't accept it (?). but please review it.
>
> v5 -> v6
>
>  - new patch

I would like Laurent to review it first of all of course, so include him
on postings.

Yours,
Linus Walleij
