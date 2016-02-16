From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: tpic2810: Make tpic2810_direction_output set
 proper output level
Date: Tue, 16 Feb 2016 15:57:59 +0100
Message-ID: <CACRpkdYudEL5xNxfF26HODoZcYQOFd_=M0FkNBaWo97safabKw@mail.gmail.com>
References: <1455538154.9793.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:32833 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754418AbcBPO60 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 09:58:26 -0500
Received: by mail-ob0-f180.google.com with SMTP id jq7so77537399obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 06:58:26 -0800 (PST)
In-Reply-To: <1455538154.9793.2.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 15, 2016 at 1:09 PM, Axel Lin <axel.lin@ingics.com> wrote:

> The .direction_output callback should set proper output level.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Obviously correct. Patch applied.

Yours,
Linus Walleij
