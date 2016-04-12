From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: Return proper error if bank width is invalid
Date: Tue, 12 Apr 2016 15:59:42 -0700
Message-ID: <CADtm3G4=2Yokqfjcgti_tN10U6g8e6LmCgMGmH-Q=_hmv7wzxA@mail.gmail.com>
References: <1460283315.10702.5.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:34318 "EHLO
	mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758906AbcDLXAN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Apr 2016 19:00:13 -0400
Received: by mail-io0-f179.google.com with SMTP id 2so48421046ioy.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Apr 2016 16:00:12 -0700 (PDT)
In-Reply-To: <1460283315.10702.5.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org

On Sun, Apr 10, 2016 at 3:15 AM, Axel Lin <axel.lin@ingics.com> wrote:
> Return proper error in brcmstb_gpio_probe if bank width is invalid.

Thanks for catching that.

>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
