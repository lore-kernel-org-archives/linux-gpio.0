From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [ANNOUNCE] libgpiod v1.0
Date: Wed, 7 Feb 2018 16:52:20 +0100
Message-ID: <CAMRc=MeEMu8cm=6F_7GEgGcJZgavYnsum+BuriOP1B8bkYbWAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:41048 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932180AbeBGPwV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 10:52:21 -0500
Received: by mail-oi0-f50.google.com with SMTP id m83so988666oik.8
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 07:52:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: SZ Lin <sz.lin@moxa.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Linus Walleij <linus.walleij@linaro.org>

libgpiod v1.0 has been released and is available at kernel.org[1][2].

I eventually decided to keep struct timespec in the public API as I
will probably not use ctypes for python bindings anyway since there
are more structures in there that would require careful mapping on
different architectures. Instead I'll go with hand crafting C
extension modules. It is also always possible to add new routines
which would use a different timestamp format.

I've included other remarks from recent reviews.

A brief summary of changes since 0.3.2 is available in the NEWS file.
As mentioned previously: this is a major release and the public
interface is not comaptible with the 0.x.y series. The command-line
tools however work pretty much the same.

Best regards,
Bartosz Golaszewski

[1] https://www.kernel.org/pub/software/libs/libgpiod/
[2] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
