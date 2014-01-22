From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PULL] GPIO bulk changes for v3.14
Date: Wed, 22 Jan 2014 09:12:00 +0100
Message-ID: <CAMuHMdX1uv99YeD78gwXMsrvdz5aGOD9nJrZpN-hCtRP9QBiZA@mail.gmail.com>
References: <CACRpkdY8Dk=i1-=rKU6gTM+3YHQ286r1u4z2WhLDQtcqLpyM2Q@mail.gmail.com>
	<CA+55aFzpF87hNgpFDsqLXYyiuTADe1xB2KUhOVd=atYASOLNFw@mail.gmail.com>
	<CACRpkdacFJYCbkqxe0wTK7DU_Mba3iriL42sFK+W31K+PpOWYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:42008 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753578AbaAVIMC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jan 2014 03:12:02 -0500
In-Reply-To: <CACRpkdacFJYCbkqxe0wTK7DU_Mba3iriL42sFK+W31K+PpOWYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lars Poeschel <poeschel@lemonage.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 22, 2014 at 8:54 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> The fact that it doesn't even compile makes me doubt your statement
>> that it has been in linux-next. It doesn't even pass a basic
>> allmodconfig build.
>
> Hm I rely on the zeroday build, and didn't get any angry compile errors.
> I'll double-check with Fengguang to see what's going on here and
> that branches get proper buildtesting.

There may be some delay. Sometimes it's a few hours, but last week I got an
email about a build failure I had in one of my branches since at least v3.9.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
