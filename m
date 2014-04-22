From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove()
Date: Tue, 22 Apr 2014 15:42:50 +0200
Message-ID: <CACRpkdYcdbJ24Kc9RM1H=fZzxTW8GcM+S=1VoTYNjs++q4awQA@mail.gmail.com>
References: <1397460641.23515.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36341 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756290AbaDVNmv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 09:42:51 -0400
Received: by mail-ob0-f169.google.com with SMTP id uz6so3309804obc.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 06:42:50 -0700 (PDT)
In-Reply-To: <1397460641.23515.3.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Juergen Beisert <jbe@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>

On Mon, Apr 14, 2014 at 9:30 AM, Axel Lin <axel.lin@ingics.com> wrote:

> From f52622585aeb4cf785c78548e440993a1e9625b1 Mon Sep 17 00:00:00 2001
> From: Axel Lin <axel.lin@ingics.com>
> Date: Mon, 14 Apr 2014 15:20:15 +0800
> Subject: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove()
>
> The memory for ts is allocated by devm_kzalloc now, so the kfree is not
> required.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with all ACKs, also fixed up this weird commit message.

Yours,
Linus Walleij
