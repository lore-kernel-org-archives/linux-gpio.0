From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Support A31/A31s with pinctrl variants
Date: Mon, 6 Feb 2017 10:57:03 +0100
Message-ID: <CACRpkdZfiwPzqH5BGi77WB_890_=P77=saQovwV1hM4X8wW9qA@mail.gmail.com>
References: <20170201162547.24232-1-wens@csie.org> <20170201162547.24232-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:35300 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdBFJ5F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 04:57:05 -0500
Received: by mail-it0-f41.google.com with SMTP id 203so51160204ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 01:57:05 -0800 (PST)
In-Reply-To: <20170201162547.24232-2-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 1, 2017 at 5:25 PM, Chen-Yu Tsai <wens@csie.org> wrote:

> The A31s is a trimmed down version of the A31. Some hardware blocks
> are removed, thus not available for muxing on the external pins.
> Some external pins were directly removed.
>
> This makes it easy to support the A31s pin controller with the A31
> driver. We just mark the pins and functions that were trimmed as
> A31 only.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied.

Yours,
Linus Walleij
