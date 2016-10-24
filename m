From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: remove unused gpoup_index field
Date: Mon, 24 Oct 2016 02:18:21 +0200
Message-ID: <CACRpkdaT2mxCGsBq1Ap8PwbwkVNzVpgUnosJ-zaaYoFjJ08Amw@mail.gmail.com>
References: <1476830832-5389-1-git-send-email-vz@mleia.com> <e81b67ed97d078889e7df6c309917570@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:34822 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756012AbcJXASW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Oct 2016 20:18:22 -0400
Received: by mail-qt0-f174.google.com with SMTP id f6so121363818qtd.2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Oct 2016 17:18:22 -0700 (PDT)
In-Reply-To: <e81b67ed97d078889e7df6c309917570@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Philipp Zabel <p.zabel@pengutronix.de>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Robin Gong <b38343@freescale.com>

On Thu, Oct 20, 2016 at 10:17 PM, Stefan Agner <stefan@agner.ch> wrote:
> Hi Vladimir,
>
> On 2016-10-18 15:47, Vladimir Zapolskiy wrote:
>> The group_index field of struct imx_pinctrl_soc_info does not serve
>> any particular purpose and its usage can be safely replaced by
>> a preexisting local variable.
>>
>> Also Stefan Agner reports that the usage of the group_index field
>> without reinitialization may lead to an oops on a repeated driver
>> probe, this is found with DEBUG_TEST_DRIVER_REMOVE option enabled.
>
> The change is a good idea, and it works for flat pinctrl configurations.
> However it does not work when there are multiple sub nodes (or function
> nodes).
>
> I am all in for the new flat format, but we should at least make sure
> that all device trees are flat or have only one subnode. If that is the
> case, we also should add a warning... All that makes me wonder if it is
> worth the effort...
>
> Also added Robin Gon which added the field not long ago.

I think I need Shawn's or Sascha's input here before applying.

My opinion is certainly not very useful, all of you know
these systems better than me.

Yours,
Linus Walleij
