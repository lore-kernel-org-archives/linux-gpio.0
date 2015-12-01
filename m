From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: Add GPIO support for the ACCES 104-IDI-48
Date: Tue, 1 Dec 2015 07:57:46 -0500
Message-ID: <565D994A.8080002@gmail.com>
References: <20151123175450.GA16041@sophia>
 <CACRpkda7QAKB=7W6rVA8fh873wTy9wm=8ta+mKZmuP2Sj7rCHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:36112 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754266AbbLAM5t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 07:57:49 -0500
In-Reply-To: <CACRpkda7QAKB=7W6rVA8fh873wTy9wm=8ta+mKZmuP2Sj7rCHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 12/01/2015 03:57 AM, Linus Walleij wrote:
> This is a very nice and clean written driver.
> 
> Patch applied.
> 
> Yours,
> Linus Walleij

I submitted a version 2 of this patch with a minor optimization change
to the IRQ acknowledgment functionality. Should I resubmit that change
as a separate patch based on top of this commit?

- William Breathitt Gray
