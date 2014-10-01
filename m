From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] mfd: remove use of gpiochip_remove() retval
Date: Wed, 1 Oct 2014 09:45:48 +0200
Message-ID: <CACRpkdZVyxN+W_8s3Hvij0wu=bE-tyAFhJPVKumRvDkpUDuncA@mail.gmail.com>
References: <1412086542-1662-1-git-send-email-pramod.gurav@smartplayin.com>
	<1412086542-1662-2-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:39903 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780AbaJAHps (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Oct 2014 03:45:48 -0400
Received: by mail-ie0-f179.google.com with SMTP id ar1so259688iec.10
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2014 00:45:48 -0700 (PDT)
In-Reply-To: <1412086542-1662-2-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 30, 2014 at 4:15 PM, Pramod Gurav
<pramod.gurav@smartplayin.com> wrote:

> Get rid of using return value from gpiochip_remove() as it returns
> void.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> CC: Lee Jones <lee.jones@linaro.org>
> Cc: linux-gpio@vger.kernel.org
>
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>

Already fixed in the GPIO tree.

Yours,
Linus Walleij
