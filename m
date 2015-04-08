From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH gpio 4/4] drivers: gpio: use (!foo) instead of (foo == NULL)
Date: Wed, 8 Apr 2015 10:50:03 +0900
Message-ID: <CAAVeFuKU0di4qSqb4BXUSJ6FZ0R4hFUxMmaOYmBnBPuJsP3S2A@mail.gmail.com>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
 <1427775551-6908-5-git-send-email-varkab@cdac.in> <CACRpkdYR6RDfvK0t=EfLPw9FhW_GOoO9atY-AE7eBe74WvucBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:35572 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213AbbDHBuY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 21:50:24 -0400
Received: by iggg4 with SMTP id g4so28239766igg.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 18:50:23 -0700 (PDT)
In-Reply-To: <CACRpkdYR6RDfvK0t=EfLPw9FhW_GOoO9atY-AE7eBe74WvucBA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Varka Bhadram <varkabhadram@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Varka Bhadram <varkab@cdac.in>

I wonder, is this any better, or is there a recommended guideline
somewhere? Testing against NULL at least highlights the fact that the
variable is a pointer, this looks like valuable information to me.

On Tue, Apr 7, 2015 at 11:22 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 31, 2015 at 6:19 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:
>
>> Signed-off-by: Varka Bhadram <varkab@cdac.in>
>
> Patch applied.
>
> Yours,
> Linus Walleij
