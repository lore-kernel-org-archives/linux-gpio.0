From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1] pinctrl:pxa:pinctrl-pxa2xx:- No need of devm functions
Date: Tue, 27 Dec 2016 13:49:06 +0100
Message-ID: <CACRpkdY8mwHD1yyHZSHsDsJNPjrgLTfEok38FNons6oabn5ZPw@mail.gmail.com>
References: <1481207730-6332-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:35762 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754909AbcL0MtI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Dec 2016 07:49:08 -0500
Received: by mail-qk0-f175.google.com with SMTP id u25so208168951qki.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Dec 2016 04:49:07 -0800 (PST)
In-Reply-To: <1481207730-6332-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Dec 8, 2016 at 3:35 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> In functions pxa2xx_build_functions, the memory allocated for
> 'functions' is live within the function only. After the
> allocation it is immediately freed with devm_kfree. There is
> no need to allocate memory for 'functions' with devm function
> so replace devm_kcalloc  with kcalloc and devm_kfree with kfree.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

I want the maintainer Robert Jarzmik to review this before I do anything
with it.

Yours,
Linus Walleij
