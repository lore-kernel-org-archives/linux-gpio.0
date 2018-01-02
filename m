From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: remove a redundant check in gpiod_to_chip()
Date: Tue, 2 Jan 2018 09:33:29 +0100
Message-ID: <CACRpkdZ4L_32A9dWsGQC4vqYKbBKyo0H5ngENSqB8wEvpi91_A@mail.gmail.com>
References: <20171221163730.6093-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:38508 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751759AbeABIda (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:33:30 -0500
Received: by mail-it0-f43.google.com with SMTP id r6so38683550itr.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:33:30 -0800 (PST)
In-Reply-To: <20171221163730.6093-1-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-gpio@vger.kernel.org

On Thu, Dec 21, 2017 at 5:37 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> This non-functional change slightly simplifies the implementation
> of gpiod_to_chip() function.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied.

Yours,
Linus Walleij
