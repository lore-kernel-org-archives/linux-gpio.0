From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-mcp23s08: correctly handling failed allocation
Date: Tue, 16 Feb 2016 16:36:44 +0100
Message-ID: <CACRpkdaZnU-s8iv6d3X=8sTxUzrj7dN+iq6Hojqguhod1mYQFA@mail.gmail.com>
References: <1455589197-6576-1-git-send-email-wuninsu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:36046 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932530AbcBPPhD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 10:37:03 -0500
Received: by mail-ob0-f179.google.com with SMTP id gc3so162408199obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 07:37:02 -0800 (PST)
In-Reply-To: <1455589197-6576-1-git-send-email-wuninsu@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Insu Yun <wuninsu@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, taesoo@gatech.edu, yeongjin.jang@gatech.edu, insu@gatech.edu, changwoo@gatech.edu

On Tue, Feb 16, 2016 at 3:19 AM, Insu Yun <wuninsu@gmail.com> wrote:

> Since devm_kzalloc can be failed in memory pressure,
> it needs to check and return -ENOMEM
>
> Signed-off-by: Insu Yun <wuninsu@gmail.com>

Patch applied.

Yours,
Linus Walleij
