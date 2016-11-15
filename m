From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: mxc: Shift generic request/free after gpiochip registration
Date: Tue, 15 Nov 2016 10:13:07 +0100
Message-ID: <CACRpkdatMwpQZd=0wQpv3LofDKKXEX5kASrRmxsaGD6ZVcHkLA@mail.gmail.com>
References: <1477418567-28347-1-git-send-email-deepak_das@mentor.com>
 <CACRpkdYg2nKO5i7_5q0Hp3rvqmGiPCkueXxp7JnGTsJ-Mb1wAQ@mail.gmail.com> <d7e3c21a-48ec-e654-701a-7e6b5556f03a@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:33739 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755479AbcKOJNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 04:13:09 -0500
Received: by mail-qk0-f181.google.com with SMTP id x190so127803423qkb.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2016 01:13:08 -0800 (PST)
In-Reply-To: <d7e3c21a-48ec-e654-701a-7e6b5556f03a@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Deepak Das <deepak_das@mentor.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>

On Thu, Nov 10, 2016 at 1:35 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> Originally the change is needed exclusively to cover the case, when IOMUX
> device node is removed or disabled in a board DTB, while GPIOs still can
> be requested by other controller drivers. The disabled pinctrl device case
> (pinmux/pinctrl settings are done from a bootloader only) is inapplicable
> to any boards found in upstream, so I would propose *not* to include this
> change or any its derivative fix to the upstream.

I backed it out already. It didn't even compile.

Yours,
Linus Walleij
