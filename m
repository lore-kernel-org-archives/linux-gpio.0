From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio 4/4] drivers: gpio: use (!foo) instead of (foo == NULL)
Date: Wed, 8 Apr 2015 16:56:59 +0200
Message-ID: <CACRpkdZkzxoswsi7fajZKoRGCVAJmbxZzauZtBgRLJTtUCEfsg@mail.gmail.com>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
	<1427775551-6908-5-git-send-email-varkab@cdac.in>
	<CACRpkdYR6RDfvK0t=EfLPw9FhW_GOoO9atY-AE7eBe74WvucBA@mail.gmail.com>
	<CAAVeFuKU0di4qSqb4BXUSJ6FZ0R4hFUxMmaOYmBnBPuJsP3S2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:38506 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932253AbbDHO5A (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 10:57:00 -0400
Received: by igbqf9 with SMTP id qf9so40431157igb.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 07:57:00 -0700 (PDT)
In-Reply-To: <CAAVeFuKU0di4qSqb4BXUSJ6FZ0R4hFUxMmaOYmBnBPuJsP3S2A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Varka Bhadram <varkabhadram@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Varka Bhadram <varkab@cdac.in>

On Wed, Apr 8, 2015 at 3:50 AM, Alexandre Courbot <gnurou@gmail.com> wrote:

> I wonder, is this any better, or is there a recommended guideline
> somewhere?

This construct is used in Chapter 7 of
Documentation/CodingStyle

Though the use is not commented on.

But it's fairly common & compact & nice I think.

Yours,
Linus Walleij
