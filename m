From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] gpio: 104-idio-16: Add support for GPIO names
Date: Wed, 1 Feb 2017 16:05:08 +0100
Message-ID: <CACRpkdZ49KbYSdmSREPcvF6fMLNhSrhG+JynvJ-=1xuXXj__-A@mail.gmail.com>
References: <cover.1485800977.git.vilhelm.gray@gmail.com> <5ab304050d7a9b849bd2585df8718f6d16aa6096.1485800977.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:35568 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbdBAPFO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 10:05:14 -0500
Received: by mail-io0-f169.google.com with SMTP id j18so158244072ioe.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 07:05:09 -0800 (PST)
In-Reply-To: <5ab304050d7a9b849bd2585df8718f6d16aa6096.1485800977.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 7:33 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> This patch sets the gpio_chip names option with an array of GPIO line
> names that match the manual documentation for the ACCES 104-IDIO-16.
> This should make it easier for users to identify which GPIO line
> corresponds to a respective GPIO pin on the device.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
