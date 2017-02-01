From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/5] gpio: 104-idi-48: Add support for GPIO names
Date: Wed, 1 Feb 2017 16:04:19 +0100
Message-ID: <CACRpkdbk-7mY-Zo0pJKfvo+BjrHdF_WhMe9sSbhb22b0_JmhUw@mail.gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com> <eee939f965371621d2803a6292c006d5355c372e.1485800977.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:32930 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751087AbdBAPEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 10:04:21 -0500
Received: by mail-io0-f173.google.com with SMTP id v96so62097563ioi.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 07:04:21 -0800 (PST)
In-Reply-To: <eee939f965371621d2803a6292c006d5355c372e.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 7:33 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> This patch sets the gpio_chip names option with an array of GPIO line
> names that match the manual documentation for the ACCES 104-IDI-48.
> This should make it easier for users to identify which GPIO line
> corresponds to a respective GPIO pin on the device.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
