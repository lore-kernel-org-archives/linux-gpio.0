From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: syscon: fix a possible NULL dereference
Date: Tue, 17 Nov 2015 12:01:58 +0100
Message-ID: <CACRpkdZLVN0PA_jcP50sXe1_dGRHH1=03O=16BV4ettM_Bm_xA@mail.gmail.com>
References: <1446739355-25849-1-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:34508 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbbKQLB6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 06:01:58 -0500
Received: by obbbj7 with SMTP id bj7so3594353obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 03:01:58 -0800 (PST)
In-Reply-To: <1446739355-25849-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Nov 5, 2015 at 5:02 PM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:

> of_match_device could return NULL, and so cause a NULL pointer
> dereference later at line 199:
> priv->flags = of_id->data;
>
> Reported-by: coverity (CID 1324140)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>

Patch applied with Alexandre's review tag.

Yours,
Linus Walleij
