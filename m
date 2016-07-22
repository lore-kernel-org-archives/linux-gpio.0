From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: add missing dependencies on CONFIG_OF
Date: Fri, 22 Jul 2016 17:09:57 +0200
Message-ID: <CACRpkdaLqQ=xLB7YmLG-p1ykk8uOTCWFs3odqq+GApWxA5ZLOA@mail.gmail.com>
References: <20160716171617.6745-1-jeremy.lefaure@lse.epita.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33131 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317AbcGVPJ7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 11:09:59 -0400
Received: by mail-oi0-f42.google.com with SMTP id j185so166660940oih.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2016 08:09:58 -0700 (PDT)
In-Reply-To: <20160716171617.6745-1-jeremy.lefaure@lse.epita.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?SsOpcsOpbXkgTGVmYXVyZQ==?= <jeremy.lefaure@lse.epita.fr>, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jul 16, 2016 at 7:16 PM, J=C3=A9r=C3=A9my Lefaure
<jeremy.lefaure@lse.epita.fr> wrote:

> These two patches fix a missing dependency on CONFIG_OF for
> PINCTRL_CYGNUS_MUX and PINCTRL_NSP_MUX Kconfig symbols.
>
> Since these two changes concern two different drivers, I split into
> two commits:
> [PATCH 1/2] pinctrl: cygnus-mux: add missing dependency on CONFIG_OF
> [PATCH 2/2] pinctrl: nsp: add missing dependency on CONFIG_OF

I got a similar patch from Arnd Bergmann which is already merged.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
