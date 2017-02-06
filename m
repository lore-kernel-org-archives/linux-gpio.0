From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: Remove redundant A31s pinctrl driver
Date: Mon, 6 Feb 2017 10:58:42 +0100
Message-ID: <CACRpkdZtS3gS9aoA55gTDNCkhoudAMhGs8SqbRdZHO4dJoWP+w@mail.gmail.com>
References: <20170201162547.24232-1-wens@csie.org> <20170201162547.24232-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:35805 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750950AbdBFJ6o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 04:58:44 -0500
Received: by mail-it0-f53.google.com with SMTP id 203so51182713ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 01:58:44 -0800 (PST)
In-Reply-To: <20170201162547.24232-3-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 1, 2017 at 5:25 PM, Chen-Yu Tsai <wens@csie.org> wrote:

> Now that we can support the A31s pin controller with the A31 driver
> using the new variants support, the independent A31s driver becomes
> redundant.
>
> Remove it.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied.

Yours,
Linus Walleij
