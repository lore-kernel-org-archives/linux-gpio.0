From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 0/2] pinctrl: uniphier: one fix, one addition
Date: Thu, 24 Sep 2015 21:27:49 +0900
Message-ID: <CAK7LNARMWa+p6OazVRVQkqZaUqnZXUObLOTL+nS1C=QR=Q_ceQ@mail.gmail.com>
References: <1441964010-6885-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:41930 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755077AbbIXM2F (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 24 Sep 2015 08:28:05 -0400
In-Reply-To: <1441964010-6885-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2015-09-11 18:33 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>
> 1/2 is a bug fix, but it is not very critical.
> I can wait until 4.4-rc1 if it is a hassle.
>
> 2/2 provides some more pin-mux settings.
>
>
> Changes in v2:
>   - trivial.  Fix a typo in git-log.  s/value/values/
>
> Masahiro Yamada (2):
>   pinctrl: uniphier: fix input enable settings for PH1-sLD8
>   pinctrl: uniphier: add SD card pinmux settings
>
>  drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c     |   5 +
>  drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c    |   5 +
>  drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c    |  11 ++
>  drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c    |   5 +
>  drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c    | 230 +++++++++++++------------
>  drivers/pinctrl/uniphier/pinctrl-proxstream2.c |   5 +
>  6 files changed, 148 insertions(+), 113 deletions(-)
>


This series has been superseded by v3.


-- 
Best Regards
Masahiro Yamada
