From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] GPIO bulk changes for the v4.11 kernel cycle
Date: Tue, 21 Feb 2017 11:28:34 +0100
Message-ID: <CACRpkdZC9Q93i2uKuswdiGdwFDYHM2k1akK9Sn_-+3q++zRddQ@mail.gmail.com>
References: <CACRpkdbSUycP1=1H+_JPZ__uwHJgRpV6GUK_aEy110zxP27U8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:34883 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbdBUK2g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2017 05:28:36 -0500
Received: by mail-it0-f45.google.com with SMTP id 203so102091911ith.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 02:28:35 -0800 (PST)
In-Reply-To: <CACRpkdbSUycP1=1H+_JPZ__uwHJgRpV6GUK_aEy110zxP27U8Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>

On Tue, Feb 21, 2017 at 11:14 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> this is the bulk of the GPIO changes for the v4.11 kernel cycle.

Hold on this one. Do not pull it right now.

Greg had a better suggestion on how I should fix the merge conflicts
in serial by keeping the old API around and remove it for -rc2, so
I try to make some reverts or patches to do that instead.

Yours,
Linus Walleij
