From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: use builtin_platform_driver
Date: Tue, 22 Nov 2016 09:58:04 +0100
Message-ID: <CACRpkdYsjdrkpdSB9uAqo4auKOnJ3QdzhL2yNcvoeDa48y7tNw@mail.gmail.com>
References: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
 <910c70b66426b79a3c045d17c9fea8dbf80b6ceb.1479457288.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:34558 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752439AbcKVI6h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2016 03:58:37 -0500
Received: by mail-qt0-f175.google.com with SMTP id n6so6626101qtd.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2016 00:58:05 -0800 (PST)
In-Reply-To: <910c70b66426b79a3c045d17c9fea8dbf80b6ceb.1479457288.git.geliangtang@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geliang Tang <geliangtang@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 18, 2016 at 3:12 PM, Geliang Tang <geliangtang@gmail.com> wrote:

> Use builtin_platform_driver() helper to simplify the code.
>
> Signed-off-by: Geliang Tang <geliangtang@gmail.com>

Patch applied.

Yours,
Linus Walleij
