From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] gpio: 104-dio-48e: Add support for GPIO names
Date: Wed, 1 Feb 2017 16:03:22 +0100
Message-ID: <CACRpkdYdyds7s7khKVXQwGx6Yko-yx5vuCAHxBv8yVdy6e8XKg@mail.gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com> <b375422dc97206145d69f2773799bb090c6ede71.1485800977.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:34061 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752169AbdBAPD3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 10:03:29 -0500
Received: by mail-io0-f175.google.com with SMTP id l66so158451358ioi.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 07:03:24 -0800 (PST)
In-Reply-To: <b375422dc97206145d69f2773799bb090c6ede71.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 7:32 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> This patch sets the gpio_chip names option with an array of GPIO line
> names that match the manual documentation for the ACCES 104-DIO-48E.
> This should make it easier for users to identify which GPIO line
> corresponds to a respective GPIO pin on the device.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
