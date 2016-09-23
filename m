From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: axp209: Implement get_direction
Date: Fri, 23 Sep 2016 15:13:36 +0200
Message-ID: <CACRpkdaexqE+HiEbcYBsFLNH38bWpwFnGbqbRG4XzRzp_zwPeA@mail.gmail.com>
References: <20160921205122.29800-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:32866 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758963AbcIWNNh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 09:13:37 -0400
Received: by mail-oi0-f42.google.com with SMTP id r126so133506136oib.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 06:13:37 -0700 (PDT)
In-Reply-To: <20160921205122.29800-1-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>

On Wed, Sep 21, 2016 at 10:51 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> Implement the get_direction callback for the GPIOs found in the AXP209
> PMIC.
>
> Due to the way they are implemented, in the same register you have the
> muxing options, GPIO directions and GPIO values. Since you have no control
> over what value is there at reset, simply use output as the default.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Patch applied. Thanks!

Yours,
Linus Walleij
