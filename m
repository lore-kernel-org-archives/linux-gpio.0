From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro
Date: Wed, 6 Jul 2016 15:42:15 +0200
Message-ID: <CACRpkdapf3uLXU9gWfVc_DpHVPVbiDozEvbpaRxOu8G9tLGiQg@mail.gmail.com>
References: <1467811517-20187-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33185 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754414AbcGFNmQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 09:42:16 -0400
Received: by mail-oi0-f43.google.com with SMTP id u201so270396987oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2016 06:42:16 -0700 (PDT)
In-Reply-To: <1467811517-20187-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jul 6, 2016 at 3:25 PM, Fabio Estevam <festevam@gmail.com> wrote:

> Commit e2756baa4217 ("pinctrl: imx21: make it explicitly non-modular")
> missed the removal of the MODULE_DEVICE_TABLE() macro causing the
> following build error:
>
> drivers/pinctrl/freescale/pinctrl-imx21.c:328:1: error: data definition has no type or storage class [-Werror]
>  MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);
>
> ,so remove the macro to fix this problem.
>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Patch applied with Arnd's ACK.

Yours,
Linus Walleij
