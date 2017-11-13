From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [bug report] pinctrl: gemini: Fix GMAC groups
Date: Mon, 13 Nov 2017 22:40:05 +0100
Message-ID: <CACRpkdYMUagJSMYkfhYsdqgfQsd+8ucTe+-LxnDcNY2xB9DFjQ@mail.gmail.com>
References: <20171113111357.4nxo7cgawpwdhkoq@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:57145 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751356AbdKMVkG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 16:40:06 -0500
Received: by mail-io0-f175.google.com with SMTP id t11so2992790iof.13
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2017 13:40:06 -0800 (PST)
In-Reply-To: <20171113111357.4nxo7cgawpwdhkoq@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org

On Mon, Nov 13, 2017 at 12:42 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> Hello Linus Walleij,
>
> The patch 756a024f3983: "pinctrl: gemini: Fix GMAC groups" from Nov
> 6, 2017, leads to the following static checker warning:
>
>         drivers/pinctrl/pinctrl-gemini.c:2190 gemini_pmx_set_mux()
>         error: buffer overflow 'gemini_padgroups' 21 <= 26
>
> drivers/pinctrl/pinctrl-gemini.c
>   2180          /* Print changed states */
>   2181          tmp = grp->mask;
>   2182          for_each_set_bit(i, &tmp, PADS_MAXBIT) {
>                                           ^^^^^^^^^^^
> We boosted this from 20 to 27
>
>   2183                  bool enabled = !(i > 3);
>   2184
>   2185                  /* Did not go low though it should */
>   2186                  if (after & BIT(i)) {
>   2187                          dev_err(pmx->dev,
>   2188                                  "pin group %s could not be %s: "
>   2189                                  "probably a hardware limitation\n",
>   2190                                  gemini_padgroups[i],
>                                         ^^^^^^^^^^^^^^^^^^^
> so we need to add more strings to this array as well.

I'm impressed by this static checking, thanks a *lot*!

I've sent a patch to fix it up.

Yours,
Linus Walleij
