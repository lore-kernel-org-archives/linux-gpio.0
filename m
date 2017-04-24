From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: core: Make pinctrl_init_controller() static
Date: Mon, 24 Apr 2017 11:11:00 +0200
Message-ID: <CACRpkdYDf9fD_iXR9Ka5LnpUnKkr7iP3JF-ZfEzJy4yC-QwfNw@mail.gmail.com>
References: <20170327113709.65527-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:34226 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1167430AbdDXJLB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 05:11:01 -0400
Received: by mail-io0-f172.google.com with SMTP id a103so184231640ioj.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 02:11:01 -0700 (PDT)
In-Reply-To: <20170327113709.65527-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 27, 2017 at 1:37 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> pinctrl_init_controller() is not used outside core.c, thus make it
> static and prevent compiler to warn.
>
> drivers/pinctrl/core.c:1943:21: warning: no previous prototype for =E2=80=
=98pinctrl_init_controller=E2=80=99 [-Wmissing-prototypes]
>  struct pinctrl_dev *pinctrl_init_controller(struct pinctrl_desc *pctldes=
c,
>                      ^~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
