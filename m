From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ep93xx: Use devm_ioremap_resource()
Date: Tue, 27 May 2014 16:01:30 +0200
Message-ID: <CACRpkdYoE7W3n-yXhteOmgTe-rCdbbWKKt2oHgCMntaim10mOg@mail.gmail.com>
References: <000801cf7974$81763a50$8462aef0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:55706 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752337AbaE0OBb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 10:01:31 -0400
Received: by mail-ob0-f172.google.com with SMTP id wp18so9232905obc.17
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 07:01:30 -0700 (PDT)
In-Reply-To: <000801cf7974$81763a50$8462aef0$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Abdoulaye Berthe <berthe.ab@gmail.com>

On Tue, May 27, 2014 at 8:25 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Use devm_ioremap_resource() because devm_request_and_ioremap() is
> obsoleted by devm_ioremap_resource().
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied.

Yours,
Linus Walleij
