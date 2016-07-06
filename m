From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro
Date: Wed, 06 Jul 2016 15:43:14 +0200
Message-ID: <58236814.6S4JiTMfPK@wuerfel>
References: <1467811517-20187-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:55723 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753516AbcGFNkJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 09:40:09 -0400
In-Reply-To: <1467811517-20187-1-git-send-email-festevam@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linus.walleij@linaro.org, paul.gortmaker@windriver.com, linux-gpio@vger.kernel.org

On Wednesday, July 6, 2016 10:25:17 AM CEST Fabio Estevam wrote:
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
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
