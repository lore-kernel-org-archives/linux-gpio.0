From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: drop references to "virtual" IRQ
Date: Mon, 14 Oct 2013 09:01:59 +0200
Message-ID: <CACRpkdZSLMomx9O3Uy=nLb_mkHRjTam_veGz_+28b-0=6JHQFw@mail.gmail.com>
References: <1381513489-8044-1-git-send-email-linus.walleij@linaro.org>
	<1882093.YGqDmvRXf2@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:36463 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133Ab3JNHCA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 03:02:00 -0400
Received: by mail-ie0-f169.google.com with SMTP id ar20so2678054iec.28
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2013 00:02:00 -0700 (PDT)
In-Reply-To: <1882093.YGqDmvRXf2@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Magnus Damm <damm@opensource.se>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

On Fri, Oct 11, 2013 at 9:48 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Friday 11 October 2013 19:44:49 Linus Walleij wrote:
>> Rename the argument "virq" to just "irq", this IRQ isn't any
>> more "virtual" than any other Linux IRQ number, we use "hwirq"
>> for the actual hw-numbers, "virq" is just bogus.
>>
>> Cc: Magnus Damm <damm@opensource.se>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Acked-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

> As you maintain the GPIO tree, I don't think there's a need for me to take the
> patch in my tree and then send you a pull request, is there ? :-)

No, I'm applying all these renaming patches today.

Yours,
Linus Walleij
