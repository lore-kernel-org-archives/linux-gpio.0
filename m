From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/17] pinctrl: uniphier: introduce capability flag
Date: Tue, 31 May 2016 12:49:16 +0200
Message-ID: <CACRpkdaGqCfNYcqNbWwLzcBngqrPX23JDOyQfeeBO+5ngxd1gQ@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-11-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33562 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023AbcEaKtR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 06:49:17 -0400
Received: by mail-oi0-f52.google.com with SMTP id k23so295199127oih.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 03:49:16 -0700 (PDT)
In-Reply-To: <1464681923-7469-11-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The core part of the UniPhier pinctrl driver needs to support a new
> capability for upcoming UniPhier ARMv8 SoCs.  This sometimes happens
> because pinctrl drivers include really SoC-specific stuff.
>
> This commit intends to tidy up SoC-specific parameters of the existing
> drivers before adding the new one.  Having just one flag would be
> better than adding a new struct member every time a new SoC-specific
> capability comes up.
>
> At this time, there is one flag, UNIPHIER_PINCTRL_CAPS_DBGMUX_SEPARATE.
> This capability (I'd say rather quirk) was added for PH1-Pro4 and
> PH1-Pro5 as requirement from a customer.  For those SoCs, one pin-mux
> setting is controlled by the combination of two separate registers; the
> LSB bits at register offset (8 * N) and the MSB bits at (8 * N + 4).
> Because it is impossible to update two separate registers atomically,
> the LOAD_PINCTRL register should be set in order to make the pin-mux
> settings really effective.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
