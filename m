From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: fixes non devicetree builds
Date: Tue, 22 Dec 2015 10:10:31 +0100
Message-ID: <CACRpkdYiiD2iFsWQq5qrmiD+wTD=wp+Bhagz1RGGwQJGB6KLDQ@mail.gmail.com>
References: <1450471240-10264-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35776 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932254AbbLVJKc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 04:10:32 -0500
Received: by mail-ob0-f180.google.com with SMTP id 18so140859219obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 01:10:32 -0800 (PST)
In-Reply-To: <1450471240-10264-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Dec 18, 2015 at 9:40 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> The commit "gpio: pxa: change the interrupt management" should have
> taken care of moving an ifdef to not englobe irqdomain related
> structures anymore, as they are used now for all builds.
>
> This repairs the broken builds where CONFIG_OF=n.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Patch applied, thanks!

Yours,
Linus Walleij
