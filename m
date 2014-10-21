From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Switch to using managed resources with devm_
Date: Tue, 21 Oct 2014 10:52:12 +0200
Message-ID: <CACRpkdZ1XM4ztKBO1aKWmFtQHp+6j9jJL8wuPVJ2mvQWR2cM5A@mail.gmail.com>
References: <1412160393-5848-1-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:63916 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750AbaJUIwN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Oct 2014 04:52:13 -0400
Received: by mail-ie0-f172.google.com with SMTP id rl12so732779iec.17
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2014 01:52:12 -0700 (PDT)
In-Reply-To: <1412160393-5848-1-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 1, 2014 at 12:46 PM, Pramod Gurav
<pramod.gurav@smartplayin.com> wrote:

> This change switches to devm_request_region to request region
> and hence simplifies the module unload and does away with
> release_region in remove function.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>

Patch applied with augmented subject.

Yours,
Linus Walleij
