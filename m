From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: amd8111: unmap ioport on failure case
Date: Thu, 9 Oct 2014 15:48:52 +0900
Message-ID: <CAAVeFuK2WGsBJnPr=v3wyD+od3qUZrMqsVZj+PZ0RdhQuRfASA@mail.gmail.com>
References: <1412157780-32219-1-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:44911 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800AbaJIGtM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Oct 2014 02:49:12 -0400
In-Reply-To: <1412157780-32219-1-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 1, 2014 at 7:03 PM, Pramod Gurav
<pramod.gurav@smartplayin.com> wrote:
> This change unmaps ioport when gpiochip_add fails
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>

Yep, looks like you need this indeed.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
