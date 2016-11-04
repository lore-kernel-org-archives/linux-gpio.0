From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: make bool drivers explicitly non-modular
Date: Fri, 4 Nov 2016 23:27:06 +0100
Message-ID: <CACRpkdbDk33ffD=S39KjgPh6bcY6QrjCs6gpyC6TherO4kv-4Q@mail.gmail.com>
References: <20161030000030.9394-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:36108 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752196AbcKDW1I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2016 18:27:08 -0400
Received: by mail-qk0-f178.google.com with SMTP id n21so4528893qka.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2016 15:27:07 -0700 (PDT)
In-Reply-To: <20161030000030.9394-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Patrice Chotard <patrice.chotard@st.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maxime Coquelin <maxime.coquelin@st.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Oct 30, 2016 at 2:00 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> None of the Kconfigs for any of these drivers are tristate,
> meaning that they currently are not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.  All
> drivers get essentially the same change, so they are handled in batch.
>
> Changes are (1) use builtin_platform_driver, (2) use init.h header
> (3) delete module_exit related code, (4) delete MODULE_DEVICE_TABLE,
> and (5) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We do delete the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of each file in the comments.
>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: Fabian Frederick <fabf@skynet.be>
> Cc: Maxime Coquelin <maxime.coquelin@st.com>
> Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>
> Cc: Mylene Josserand <mylene.josserand@free-electrons.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
