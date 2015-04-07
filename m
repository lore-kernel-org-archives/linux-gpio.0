From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinmux: allow exlusive pin allocation among GPIO and
 peripheral funtions via flag strict in struct pinctrl_desc
Date: Tue, 7 Apr 2015 16:17:34 +0200
Message-ID: <CACRpkdZBFfUi=C_1xy06sVdn_e8fz+dnrMHuR0i2S89y74jQVA@mail.gmail.com>
References: <1427771763-18673-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:35218 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755656AbbDGORf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 10:17:35 -0400
Received: by ierf6 with SMTP id f6so47528254ier.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 07:17:34 -0700 (PDT)
In-Reply-To: <1427771763-18673-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sonic Zhang <sonic.adi@gmail.com>
Cc: Steven Miao <realmz6@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Tue, Mar 31, 2015 at 5:16 AM, Sonic Zhang <sonic.adi@gmail.com> wrote:

> From: Sonic Zhang <sonic.zhang@analog.com>
>
> The blackfin pinmux and gpio controller doesn't allow user to set up 1 pin
> for both GPIO and peripheral function. So, add flag strict in struct pinctrl
> to check both gpio_owner and mux_owner before approving the pin request.
>
> v2-changes:
> - if strict flag is set, check gpio_owner and mux_onwer in if and else clause
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
(...)
> +++ b/include/linux/pinctrl/pinctrl.h
> @@ -132,6 +132,7 @@ struct pinctrl_desc {
>         const struct pinctrl_ops *pctlops;
>         const struct pinmux_ops *pmxops;
>         const struct pinconf_ops *confops;
> +       bool strict;

Also add kerneldoc for this struct.

Also augment Documentation/pinctrl.txt.

Yours,
Linus Walleij
