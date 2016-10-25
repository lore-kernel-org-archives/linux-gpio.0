From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxc: Shift generic request/free after gpiochip registration
Date: Tue, 25 Oct 2016 14:05:05 +0200
Message-ID: <CACRpkdZf92ott5F8ZO7=b9btJkw5V89MpJjgKCiJn3vH+RtZ-A@mail.gmail.com>
References: <580E3457.7030809@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:37739 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756438AbcJYMFG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 08:05:06 -0400
Received: by mail-qk0-f169.google.com with SMTP id w69so18260325qka.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 05:05:06 -0700 (PDT)
In-Reply-To: <580E3457.7030809@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Deepak Das <deepak_das@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, vzapolsk <Vladimir_Zapolskiy@mentor.com>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>

On Mon, Oct 24, 2016 at 6:18 PM, Deepak Das <deepak_das@mentor.com> wrote:

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

Could you:

- Rebase on my fixes or devel branch in the GPIO tree. This doesn't
  seem to apply cleany on any of my branches, have you tested
  v4.9-rc2?

- Indicate if this is a regression that need to go into fixes/stable or
  not?

Yours,
Linus Walleij
