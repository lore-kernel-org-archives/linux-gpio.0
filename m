From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: lpc32xx: remove unused platform data file
Date: Mon, 12 Sep 2016 14:24:29 +0200
Message-ID: <CACRpkdYcAzED2XgAq8S6x7y2fd_=i2KvKsANcVyrz362xwd+_w@mail.gmail.com>
References: <1473292712-8061-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36687 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754615AbcILMYa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 08:24:30 -0400
Received: by mail-it0-f51.google.com with SMTP id o3so7328312ita.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 05:24:30 -0700 (PDT)
In-Reply-To: <1473292712-8061-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 8, 2016 at 1:58 AM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> ARM LPC32xx platform is device-tree only, there is no need to keep
> a file with GPIO platform data structures, however some of macro
> definitions should be moved to the driver code, which is the only user
> of the removed header file.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied.

Yours,
Linus Walleij
