From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: mxc: Shift generic request/free after gpiochip registration
Date: Wed, 26 Oct 2016 13:29:50 +0200
Message-ID: <CACRpkdZ355k9JytLjeth1T-Ub6dPA=_01HF6xSW_FcOtAkrABQ@mail.gmail.com>
References: <1477418567-28347-1-git-send-email-deepak_das@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:39280 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754623AbcJZLaN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2016 07:30:13 -0400
Received: by mail-qk0-f172.google.com with SMTP id i34so3482411qkh.6
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2016 04:29:51 -0700 (PDT)
In-Reply-To: <1477418567-28347-1-git-send-email-deepak_das@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Deepak Das <deepak_das@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Tue, Oct 25, 2016 at 8:02 PM, Deepak Das <deepak_das@mentor.com> wrote:

> generic gpio request/free should be added after gpiocip registration
> to validate mapping of gpiochip with pinctrl subsystem.
>
> gpiochip->pin_ranges list contains the information used by pinctrl
> subsystem to configure corresponding pins for gpio usage.
> This list will be empty if gpiochip fails to map with
> pinctrl subsystem for any reason.
> For Ex.:-
> generic gpio request/free should not be used if IOMUX pin controller
> device node is disabled in device tree.
>
> This commit checks above list and skips adding generic gpio request/free
> if list is found empty.
>
> Signed-off-by: Deepak Das <deepak_das@mentor.com>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
> Changes from v1 to v2:
> * Rebased on top of lwalleij/gpio/fixes.

Patch applied.

Yours,
Linus Walleij
