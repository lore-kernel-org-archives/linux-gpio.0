From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: f7188x: use gpiochip_get_data instead of container_of
Date: Sun, 18 Sep 2016 13:35:28 +0200
Message-ID: <CACRpkdZUH_=wTYDDyXNQg+9mBYxRDzMNAgBPS6Kx8vRCMi6FiQ@mail.gmail.com>
References: <1474045133-3892-1-git-send-email-singh.amitesh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35096 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932674AbcIRLf3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2016 07:35:29 -0400
Received: by mail-oi0-f42.google.com with SMTP id w11so159619996oia.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2016 04:35:29 -0700 (PDT)
In-Reply-To: <1474045133-3892-1-git-send-email-singh.amitesh@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Amitesh Singh <singh.amitesh@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 16, 2016 at 6:58 PM, Amitesh Singh <singh.amitesh@gmail.com> wrote:

> gpiochip_add_data is already used to add data pointer and chip.
> Lets rely on gpiochip_get_data which is getting used in other
> gpio_chip functions.
>
> Signed-off-by: Amitesh Singh <singh.amitesh@gmail.com>

Patch applied.

Yours,
Linus Walleij
