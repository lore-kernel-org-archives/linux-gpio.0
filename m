From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: sta2x11: use devres for irq generic chip
Date: Wed, 2 Aug 2017 13:38:13 +0200
Message-ID: <CACRpkdbb=0p0TTP2ThYTi+7fYdJnmUptSnnhi1712DnxPty5aw@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34078 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752335AbdHBLiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 07:38:15 -0400
Received: by mail-io0-f174.google.com with SMTP id o9so19393612iod.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 04:38:14 -0700 (PDT)
In-Reply-To: <20170802075126.17637-2-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 2, 2017 at 9:51 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Use resource managed variants of irq_alloc_generic_chip() and
> irq_setup_generic_chip().
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
