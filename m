From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Mon, 5 Oct 2015 13:07:09 +0200
Message-ID: <CACRpkdZBw7ayenkRTtpQH==G64TGNEXv6DgzdRAZxCCHJUZuRg@mail.gmail.com>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
	<20151004133742.GO4284@localhost>
	<CACRpkdaB=Sne1Vq=apQE5r8FDvfvQ-4w0nths-dVnuJvBaGDOA@mail.gmail.com>
	<20151005100147.GB25143@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33408 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbbJELHL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 07:07:11 -0400
Received: by obbbh8 with SMTP id bh8so125412109obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 04:07:10 -0700 (PDT)
In-Reply-To: <20151005100147.GB25143@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>

On Mon, Oct 5, 2015 at 12:01 PM, Johan Hovold <johan@kernel.org> wrote:

>> I think it is ABI-correct: it uses desc->name if that is set, and
>> currently that is only set from chip->names[] so status quo.
>
> Yes, but this work was aiming at generalising the hogs so that they
> could later be requested (and exported), right?

Yeah something like so... thinking about it we should indeed
takes the names directly from chip->names[] for this, so we
can use the name field in the gpio descriptor for the "real"
chardev interface later.

I'll revert the patch.

Yours,
Linus Walleij
