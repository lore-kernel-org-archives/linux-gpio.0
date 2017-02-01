From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/5] gpio: ws16c48: Add support for GPIO names
Date: Wed, 1 Feb 2017 16:06:42 +0100
Message-ID: <CACRpkdZv-aRLWc-z0P=ztw=_R6g0mi2z0RYsDKshebf+3ZOERg@mail.gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com> <1aa948dddef882ff00b8e92aa9abb50ae74c92ab.1485800977.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:38896 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752295AbdBAPGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 10:06:43 -0500
Received: by mail-it0-f41.google.com with SMTP id c7so19178296itd.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 07:06:43 -0800 (PST)
In-Reply-To: <1aa948dddef882ff00b8e92aa9abb50ae74c92ab.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 7:33 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> This patch sets the gpio_chip names option with an array of GPIO line
> names that match the manual documentation for the WinSystems WS16C48.
> This should make it easier for users to identify which GPIO line
> corresponds to a respective GPIO pin on the device.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
