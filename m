From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio-pca953x: Add set_multiple to allow multiple bits
 to be set in one write.
Date: Thu, 10 Dec 2015 23:58:53 +0100
Message-ID: <CACRpkdafaZ_Yu6eu9zNOXKC8v6Q=TyoVoE5URNjnmT5gOGqp9w@mail.gmail.com>
References: <1449215550-61730-1-git-send-email-preid@electromag.com.au>
	<1449215550-61730-3-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36110 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753310AbbLJW6x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 17:58:53 -0500
Received: by oiww189 with SMTP id w189so55068827oiw.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 14:58:53 -0800 (PST)
In-Reply-To: <1449215550-61730-3-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: "linus.walleij@linaro.org gnurou@gmail.com" <linux-gpio@vger.kernel.org>

On Fri, Dec 4, 2015 at 8:52 AM, Phil Reid <preid@electromag.com.au> wrote:

> Tested with TCA6408 / TCA6416 devices.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Nice stuff! Patch applied. I'll have to fix up my refactoring patch but
I can do that.

Yours,
Linus Walleij
