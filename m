From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/19] pinctrl: freescale: remove needless module.h include
Date: Wed, 29 Jun 2016 09:30:34 +0200
Message-ID: <CACRpkdafYJ_bnYu6HxSmtisheOgNZiJH=C-R+0M9-icrz+w1PA@mail.gmail.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com> <20160626024652.5081-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33436 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbcF2Haf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 03:30:35 -0400
Received: by mail-ob0-f172.google.com with SMTP id xn17so14048350obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 00:30:35 -0700 (PDT)
In-Reply-To: <20160626024652.5081-2-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Jun 26, 2016 at 4:46 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> None of these files have anything modular in them, so they
> don't need to be bringing in module.h and all its dependencies.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
