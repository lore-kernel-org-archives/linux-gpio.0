From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] gpio: pch: use devres for irq generic chip
Date: Wed, 2 Aug 2017 13:39:47 +0200
Message-ID: <CACRpkdYGGvCAbrCm=A4RdXAeJNcUqq4pVf8aPcq0c_waj60=Tg@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:34824 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752983AbdHBLjs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 07:39:48 -0400
Received: by mail-it0-f51.google.com with SMTP id h199so22319952ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 04:39:48 -0700 (PDT)
In-Reply-To: <20170802075126.17637-4-brgl@bgdev.pl>
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
