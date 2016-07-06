From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro
Date: Wed, 6 Jul 2016 10:38:18 -0400
Message-ID: <20160706143818.GG26134@windriver.com>
References: <1467811517-20187-1-git-send-email-festevam@gmail.com>
 <CACRpkdapf3uLXU9gWfVc_DpHVPVbiDozEvbpaRxOu8G9tLGiQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:36737 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753825AbcGFOi3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 10:38:29 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdapf3uLXU9gWfVc_DpHVPVbiDozEvbpaRxOu8G9tLGiQg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

[Re: [PATCH] pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro] On 06/07/2016 (Wed 15:42) Linus Walleij wrote:

> On Wed, Jul 6, 2016 at 3:25 PM, Fabio Estevam <festevam@gmail.com> wrote:
> 
> > Commit e2756baa4217 ("pinctrl: imx21: make it explicitly non-modular")
> > missed the removal of the MODULE_DEVICE_TABLE() macro causing the
> > following build error:
> >
> > drivers/pinctrl/freescale/pinctrl-imx21.c:328:1: error: data definition has no type or storage class [-Werror]
> >  MODULE_DEVICE_TABLE(of, imx21_pinctrl_of_match);
> >
> > ,so remove the macro to fix this problem.
> >
> > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> 
> Patch applied with Arnd's ACK.

Thanks and sorry this one snuck through.  I'm going to add walking all
the various defconfigs to my build coverage akin to what linux-next does
overnight.  It seems the allmodconfig builds didn't hit this file...

Paul.
--

> 
> Yours,
> Linus Walleij
