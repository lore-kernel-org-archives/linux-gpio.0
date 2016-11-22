From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mb86s7x: use builtin_platform_driver
Date: Tue, 22 Nov 2016 10:16:40 +0100
Message-ID: <CACRpkdaBtwQyN54FEMzq+-NK4RVwkHah9-OJaWsZSF0mLcmo7w@mail.gmail.com>
References: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
 <368a15a27c8422e6e6b588a136241255c8fcefbb.1479456895.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:36486 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932273AbcKVJQm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2016 04:16:42 -0500
Received: by mail-qk0-f179.google.com with SMTP id n21so14159315qka.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2016 01:16:41 -0800 (PST)
In-Reply-To: <368a15a27c8422e6e6b588a136241255c8fcefbb.1479456895.git.geliangtang@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geliang Tang <geliangtang@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 18, 2016 at 3:12 PM, Geliang Tang <geliangtang@gmail.com> wrote:

> Use builtin_platform_driver() helper to simplify the code.
>
> Signed-off-by: Geliang Tang <geliangtang@gmail.com>

Patch applied.

Yours,
Linus Walleij
