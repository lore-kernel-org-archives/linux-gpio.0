From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] pinctrl: imx21: include linux/module.h
Date: Wed, 6 Jul 2016 10:15:41 -0300
Message-ID: <CAOMZO5APrVUAi+QbnLVJ61T_oJRQQDF_eLi8_HeqK=L+aVBzwQ@mail.gmail.com>
References: <20160706125254.1663066-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:35047 "EHLO
	mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753703AbcGFNPn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 09:15:43 -0400
In-Reply-To: <20160706125254.1663066-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Arnd,

On Wed, Jul 6, 2016 at 9:52 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> The pinctrl driver includes a device table, but the macro used for
> declaring it is declared in a header that is not visible here:
>
> drivers/pinctrl/freescale/pinctrl-imx21.c:328:1: error: data definition has no type or storage class [-Werror]
>  MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);
>
> This adds the missing include.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: e2756baa4217 ("pinctrl: imx21: make it explicitly non-modular")

I think the correct fix here would be:

--- a/drivers/pinctrl/freescale/pinctrl-imx21.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx21.c
@@ -325,7 +325,6 @@ static const struct of_device_id imx21_pinctrl_of_match[] =
        { .compatible = "fsl,imx21-iomuxc", },
        { }
 };
-MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);

 static struct platform_driver imx21_pinctrl_driver = {
        .driver = {


If you agree I can send a formal patch.
