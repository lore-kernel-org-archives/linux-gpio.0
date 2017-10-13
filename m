From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] bitops: Introduce assign_bit()
Date: Fri, 13 Oct 2017 14:44:35 +0200
Message-ID: <CACRpkdYwoYQcyiSwycE3xRwc_x_kAmVVTLmXMBRBv84qi=Rygw@mail.gmail.com>
References: <cover.1507797496.git.lukas@wunner.de> <2ca70faf07383482eed6263c00cf9141f930653b.1507797496.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:46094 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753258AbdJMMog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2017 08:44:36 -0400
Received: by mail-io0-f179.google.com with SMTP id 101so8825527ioj.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2017 05:44:36 -0700 (PDT)
In-Reply-To: <2ca70faf07383482eed6263c00cf9141f930653b.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Theodore Ts'o <tytso@mit.edu>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Denys Vlasenko <dvlasenk@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Oct 12, 2017 at 12:40 PM, Lukas Wunner <lukas@wunner.de> wrote:

> A common idiom is to assign a value to a bit with:
>
>     if (value)
>         set_bit(nr, addr);
>     else
>         clear_bit(nr, addr);
>
> Likewise common is the one-line expression variant:
>
>     value ? set_bit(nr, addr) : clear_bit(nr, addr);
>
> Commit 9a8ac3ae682e ("dm mpath: cleanup QUEUE_IF_NO_PATH bit
> manipulation by introducing assign_bit()") introduced assign_bit()
> to the md subsystem for brevity.
>
> Make it available to others, specifically gpiolib and the upcoming
> driver for Maxim MAX3191x industrial serializer chips.
>
> As requested by Peter Zijlstra, change the argument order to reflect
> traditional "dst = src" in C, hence "assign_bit(nr, addr, value)".
>
> Cc: Bart Van Assche <bart.vanassche@wdc.com>
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Neil Brown <neilb@suse.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Denys Vlasenko <dvlasenk@redhat.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

This v2 applied with Andrew's ACK.

Yours,
Linus Walleij
