From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Wed, 9 Mar 2016 17:30:56 +0700
Message-ID: <CACRpkdZZFwn_nNx_7QWEemuJF=RkK3fpakHH8sAJg=h4gZHo5Q@mail.gmail.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
	<CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
	<56DDDE6E.6090908@cogentembedded.com>
	<CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
	<56DDE5CB.60204@cogentembedded.com>
	<CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
	<20160307222131.GA1391@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36729 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752080AbcCIKa5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 05:30:57 -0500
Received: by mail-oi0-f50.google.com with SMTP id r187so31906580oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 02:30:57 -0800 (PST)
In-Reply-To: <20160307222131.GA1391@katana>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Mar 8, 2016 at 5:21 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> Perhaps the of_have_populated_dt() check should be moved inside
>> pinctrl_provide_dummies()?
>
> Hmm, the kernel-doc for pinctrl_provide_dummies() says "Usually this
> function is called by platforms without pinctrl driver support...".
> Is "without pintctrl" == "no DT"? Linus?

The primary example is a platform with one pin controller and
two identical GPIO controllers, one of the GPIO controllers
is using a pin control backend.

Since the GPIO driver has to call pinctrl_request_gpio() etc,
it needs something to hold on to if there is no backing pin
controller for one of them.

Yours,
Linus Walleij
