From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] GPIO bulk changes for v3.14
Date: Wed, 22 Jan 2014 08:54:48 +0100
Message-ID: <CACRpkdacFJYCbkqxe0wTK7DU_Mba3iriL42sFK+W31K+PpOWYQ@mail.gmail.com>
References: <CACRpkdY8Dk=i1-=rKU6gTM+3YHQ286r1u4z2WhLDQtcqLpyM2Q@mail.gmail.com>
	<CA+55aFzpF87hNgpFDsqLXYyiuTADe1xB2KUhOVd=atYASOLNFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:53879 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590AbaAVHyt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jan 2014 02:54:49 -0500
Received: by mail-oa0-f45.google.com with SMTP id i11so41977oag.4
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2014 23:54:49 -0800 (PST)
In-Reply-To: <CA+55aFzpF87hNgpFDsqLXYyiuTADe1xB2KUhOVd=atYASOLNFw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lars Poeschel <poeschel@lemonage.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 21, 2014 at 7:11 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:

> The fact that it doesn't even compile makes me doubt your statement
> that it has been in linux-next. It doesn't even pass a basic
> allmodconfig build.

Hm I rely on the zeroday build, and didn't get any angry compile errors.
I'll double-check with Fengguang to see what's going on here and
that branches get proper buildtesting.

> I see that you tried to fix it in commit 01d7004181c8 ("gpio:
> mcp23s08: depend on OF_GPIO") but screwed up the order of operations.
>
> I fixed it up properly in the merge, but please try to figure out how
> the hell this passed through the cracks.

Argh, thanks for fixing. I see the problem now.

Yours,
Linus Walleij
