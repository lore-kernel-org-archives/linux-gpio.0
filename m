From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] emev2: GPIOLIB: Enable support for OF
Date: Thu, 19 Sep 2013 15:34:34 +0200
Message-ID: <CACRpkdZ1-ANcQpAsVZcbXJPoVYiK20G0j2MpXs84T7GvQ0uSOw@mail.gmail.com>
References: <CACRpkdbeCU_WG4xXvoh76RZ-9UtbWJvB4PqYhSpTXSF4Hodf2A@mail.gmail.com>
	<1378136695-23203-1-git-send-email-ian.molton@codethink.co.uk>
	<1378136695-23203-2-git-send-email-ian.molton@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:40831 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751698Ab3ISNee (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2013 09:34:34 -0400
Received: by mail-ob0-f178.google.com with SMTP id uy5so9962981obc.9
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2013 06:34:34 -0700 (PDT)
In-Reply-To: <1378136695-23203-2-git-send-email-ian.molton@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ian Molton <ian.molton@codethink.co.uk>
Cc: Simon Horman <horms@verge.net.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Sep 2, 2013 at 5:44 PM, Ian Molton <ian.molton@codethink.co.uk> wrote:

> EMEV2 is now a DT platform, however the GPIO driver cannot be used
> from a DT file since it does not fill out the of_node field in its
> gpio_chip structure.
>
> Signed-off-by: Ian Molton <ian.molton@codethink.co.uk>

This v2 version applied with Simon's ACK.

Yours,
Linus Walleij
