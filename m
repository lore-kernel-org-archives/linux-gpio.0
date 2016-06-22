From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: as3722: convert PINCTRL_AS3722 from bool to tristate
Date: Wed, 22 Jun 2016 18:09:48 +0200
Message-ID: <CACRpkdaCuKCsNAM+3vMhfXGSCdj+1wjD8Qn_YnOVP6QDnaibvA@mail.gmail.com>
References: <20160613211022.32033-1-paul.gortmaker@windriver.com> <20160613211022.32033-3-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36671 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932194AbcFVQJt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2016 12:09:49 -0400
Received: by mail-oi0-f50.google.com with SMTP id f189so29191421oig.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2016 09:09:49 -0700 (PDT)
In-Reply-To: <20160613211022.32033-3-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jun 13, 2016 at 11:10 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> config PINCTRL_AS3722
>         bool "Pinctrl and GPIO driver for ams AS3722 PMIC"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> During an audit for non-modular drivers using modular infrastructure
> this driver showed up.
>
> But rather than demodularize it, Laxman indicated that it would be
> prefereable to instead convert the driver option to tristate.
>
> This does that, and confirms that it will compile and modpost as
> such.  However, since I do not have the hardware to confirm that
> no new runtime issues exist when modular, that remains untested.
>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
