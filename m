From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: Introduce the strict flag
Date: Tue, 31 Oct 2017 09:44:40 +0100
Message-ID: <CACRpkdavwWk4LBEzm3=0K1kMx2Nc4SoYE0kZw3pqDcfr9-st+A@mail.gmail.com>
References: <cover.3e8ef5cb08d0164375d7644df0548e5f39b0fe66.1507582414.git-series.maxime.ripard@free-electrons.com>
 <c764ce12c83daefabaaea6a2df293c68f078c5e2.1507582414.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:55465 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751378AbdJaIol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 04:44:41 -0400
Received: by mail-io0-f193.google.com with SMTP id p186so33278957ioe.12
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 01:44:41 -0700 (PDT)
In-Reply-To: <c764ce12c83daefabaaea6a2df293c68f078c5e2.1507582414.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 9, 2017 at 10:53 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> Our pinctrl device should have had strict set all along. However, it wasn't
> the case, and most of our old device trees also have a pinctrl group in
> addition to the GPIOs properties, which mean that we can't really turn it
> on now.
>
> All our new SoCs don't have that group, so we should still enable that mode
> on the newer one though.
>
> In order to enable it by default, add a flag that will allow to disable
> that mode that should be set by pinctrl drivers that cannot be migrated.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
