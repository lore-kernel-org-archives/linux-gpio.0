From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: Use list_for_each_entry at appropriate places
Date: Sun, 21 Feb 2016 16:42:59 -0800
Message-ID: <CADtm3G4aUh2W+enoTydS3=1JWngmsXh2C_=CxNyvfp_QfAnnQg@mail.gmail.com>
References: <1455933037.31674.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:33976 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296AbcBVAn3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Feb 2016 19:43:29 -0500
Received: by mail-io0-f180.google.com with SMTP id 9so162629724iom.1
        for <linux-gpio@vger.kernel.org>; Sun, 21 Feb 2016 16:43:29 -0800 (PST)
In-Reply-To: <1455933037.31674.2.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Fri, Feb 19, 2016 at 5:50 PM, Axel Lin <axel.lin@ingics.com> wrote:
> Use list_for_each_entry to simplify the code a bit.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>

Thanks for the cleanup.
