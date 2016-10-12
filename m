From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: stmpe: || vs && typo
Date: Wed, 12 Oct 2016 10:43:02 +0200
Message-ID: <CACRpkdbxemFszSPUceuMvpqcyzuuDCTYSA5uvA=sgyp==hw8oA@mail.gmail.com>
References: <20161012062520.GY12841@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:36322 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932346AbcJLInE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2016 04:43:04 -0400
Received: by mail-qk0-f177.google.com with SMTP id o68so65533862qkf.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2016 01:43:03 -0700 (PDT)
In-Reply-To: <20161012062520.GY12841@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrice Chotard <patrice.chotard@st.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 8:25 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> && was obviously intended here.
>
> Fixes: 6936e1f88d23 ('gpio: stmpe: Write int status register only when needed')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Patrice's ACK.

Yours,
Linus Walleij
