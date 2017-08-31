From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: constify amba_id
Date: Thu, 31 Aug 2017 13:58:21 +0200
Message-ID: <CACRpkdarsU-3kkqg-oyNvEYWOjFZi41hGaee4iePoWjDxCtSPQ@mail.gmail.com>
References: <e3ea7773c305ca105b8564821028f91fb529087a.1503504813.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36328 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751701AbdHaL6W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 07:58:22 -0400
Received: by mail-oi0-f52.google.com with SMTP id t75so3500414oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 04:58:22 -0700 (PDT)
In-Reply-To: <e3ea7773c305ca105b8564821028f91fb529087a.1503504813.git.arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Aug 23, 2017 at 6:15 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> amba_id are not supposed to change at runtime. All functions
> working with const amba_id. So mark the non-const structs as const.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Patch applied.

Yours,
Linus Walleij
