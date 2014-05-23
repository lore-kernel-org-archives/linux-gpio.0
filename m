From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: generic: add request function pointer
Date: Fri, 23 May 2014 14:33:07 +0200
Message-ID: <CACRpkdZksLN1bX99TB7gDoKsvK7LKR5FihLxDSnLB_9LjQ-v5Q@mail.gmail.com>
References: <1400521754-4480-1-git-send-email-anthony.fee@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:34017 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751406AbaEWMdI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 May 2014 08:33:08 -0400
Received: by mail-oa0-f47.google.com with SMTP id i7so5548158oag.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 May 2014 05:33:07 -0700 (PDT)
In-Reply-To: <1400521754-4480-1-git-send-email-anthony.fee@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anthony Fee <anthony.fee@emutex.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, May 19, 2014 at 7:49 PM, Anthony Fee <anthony.fee@emutex.com> wrote:

> gpiolib will require all gpio drivers to expicitly set the request function pointer
> in future. To encourage gpio driver developers to adhere to this standard
> gpio-generic.c now sets this function pointer.
>
> Signed-off-by: Anthony Fee <anthony.fee@emutex.com>

This last version of the patch applied with Alex's ACK.

Yours,
Linus Walleij
