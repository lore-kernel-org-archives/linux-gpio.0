From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: dt-binding: fix generic pinmux/pinconf examples
Date: Wed, 18 Mar 2015 13:16:00 +0100
Message-ID: <CACRpkdbwPyuthWPswEY_BX5N=nFAgA+0A-tnW=dFT2zRC0XR6A@mail.gmail.com>
References: <b6effc6c0cb6b9488145b873dc01fcba2a4cd1df.1426402515.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36846 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755785AbbCRMQB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 08:16:01 -0400
Received: by obdfc2 with SMTP id fc2so30144239obd.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 05:16:01 -0700 (PDT)
In-Reply-To: <b6effc6c0cb6b9488145b873dc01fcba2a4cd1df.1426402515.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 15, 2015 at 7:55 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> pinconf_generic_dt_node_to_map() scans only subnodes of the pinctrl-0 pahndle,
> not the referenced node itself. Change the example nodes to match.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch applied...

>  state_0_node_a {
> -       function = "uart0";
> -       groups = "u0rxtx", "u0rtscts";
> +       uart0 {
> +               function = "uart0";
> +               groups = "u0rxtx", "u0rtscts";
> +       };
>  };
>  state_1_node_a {
> -       function = "spi0";
> -       groups = "spi0pins";
> +       spi0 {
> +               function = "spi0";
> +               groups = "spi0pins";
> +       };
>  };

But that is a bit insane. We should fix the parsing code to handle
either case instead.

Yours,
Linus Walleij
