From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/9] pinctrl: digicolor: make it explicitly non-modular
Date: Mon, 13 Jun 2016 08:34:53 +0200
Message-ID: <CACRpkdYEk6GKcf+rd0f+rrES_d0-nO2X+DtF+zDR-cyJ9-zRNw@mail.gmail.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
 <1465267388-17884-9-git-send-email-paul.gortmaker@windriver.com> <20160607061317.GH2425@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36430 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964808AbcFMGey (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 02:34:54 -0400
Received: by mail-oi0-f48.google.com with SMTP id p204so193758606oih.3
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2016 23:34:54 -0700 (PDT)
In-Reply-To: <20160607061317.GH2425@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Tue, Jun 7, 2016 at 8:13 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Thanks. In addition to that you can also revert 8b2b3dcb343b (pinctrl:
> digicolor: add missing platform_set_drvdata() call) that is currently in the
> linux-pinctrl tree.

That must be discussed in the context of the offending patch,
not in this mail trail.

Yours,
Linus Walleij
