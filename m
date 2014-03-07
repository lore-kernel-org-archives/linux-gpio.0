From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-pl061: Use %pa to print 'resource_size_t'
Date: Fri, 7 Mar 2014 09:21:14 +0800
Message-ID: <CACRpkdameG4w7HdCxNAT1JFbZ+kukZEi46P1+uG27m6J4e8yig@mail.gmail.com>
References: <1393413157-29667-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:48785 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750924AbaCGBVO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Mar 2014 20:21:14 -0500
Received: by mail-ob0-f179.google.com with SMTP id va2so3507664obc.10
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2014 17:21:14 -0800 (PST)
In-Reply-To: <1393413157-29667-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Feb 26, 2014 at 7:12 PM, Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> The following build warning is generated when building multi_v7_defconfig with
> LPAE option selected:
>
> drivers/gpio/gpio-pl061.c:358:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat=]
>
> Fix it by using %pa to print 'resource_size_t'.
>
> Reported-by: Olof's autobuilder <build@lixom.net>

I love this guy.

> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Patch applied.

Yours,
Linus Walleij
