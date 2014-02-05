From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Question about non-boolean gpio sysfs values
Date: Wed, 5 Feb 2014 14:46:10 +0100
Message-ID: <CACRpkdb-aP6famfv-POe90OXjozORa+B-q2HB8oJx3o=C+DGig@mail.gmail.com>
References: <52ED84A5.3050102@contactless.ru>
	<CAAVeFuLX5Bynin71fRGgThR36kCHszNupx+XJzc+7Kwnoihijw@mail.gmail.com>
	<CACRpkdaEMYmPx+qM-dcAW7QDwV8FpvRrYgGdZoA-uN4aMnr_fQ@mail.gmail.com>
	<CAAVeFuL2=jqz6hnOJ4E8mLk3Ucnxvsr1y9yNk0-VgKCs_vYBeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:55496 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750918AbaBENqL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 08:46:11 -0500
Received: by mail-oa0-f49.google.com with SMTP id i7so428188oag.8
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 05:46:10 -0800 (PST)
In-Reply-To: <CAAVeFuL2=jqz6hnOJ4E8mLk3Ucnxvsr1y9yNk0-VgKCs_vYBeQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Evgeny Boger <boger@contactless.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Feb 5, 2014 at 2:24 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Feb 5, 2014 at 10:06 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> Maybe we should even retype the function to a bool, atleast in
>> the driver-facing API.
>
> Agree with the bool retyping, and while we are at it let's also change
> the driver function's prototype. That's probably the shortest way to
> fix this (yay to implicit type conversion!) and to make sure this
> problem isn't reintroduced in the future.
>
> Shall I make a patch for this? It will change every driver around, but
> shouldn't be too intrusive.

Yeah hit me with it, I like that things are moving.

Yours,
Linus Walleij
