From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ts4800: Drop redundant code to set already
 initialized gpio_chip fields
Date: Thu, 25 Feb 2016 10:52:33 +0100
Message-ID: <CACRpkdaVOoVLW1192d+9p_Z+S3X9pMcXDevpogx7MvAjwzi+mg@mail.gmail.com>
References: <1455949366.14139.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:32881 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759989AbcBYJwe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 04:52:34 -0500
Received: by mail-oi0-f48.google.com with SMTP id j125so36758159oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 01:52:33 -0800 (PST)
In-Reply-To: <1455949366.14139.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Feb 20, 2016 at 7:22 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Both chip->base and chip->label are correctly set by bgpio_init().
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Julien's Test tag.

Yours,
Linus Walleij
