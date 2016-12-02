From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: chardev: Return error for seek operations
Date: Fri, 2 Dec 2016 13:37:10 +0100
Message-ID: <CACRpkdZYrrCKFJp5kHSWeJNo7HCxqZcfZ331Rzepo2DQj6tF2A@mail.gmail.com>
References: <1480507521-17766-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:34973 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752008AbcLBMhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 07:37:11 -0500
Received: by mail-qk0-f176.google.com with SMTP id n204so277099749qke.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 04:37:11 -0800 (PST)
In-Reply-To: <1480507521-17766-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 30, 2016 at 1:05 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:

> The GPIO chardev is used for management tasks (allocating line and event
> handles) and does neither support read() nor write() operations. Hence it
> does not make much sense to allow seek operations.
>
> Currently the chardev uses noop_llseek() for its seek implementation. This
> function does not move the pointer and simply returns the current position
> (always 0 for the GPIO chardev). noop_llseek() is primarily meant for
> devices that can not support seek, but where there might be a user that
> depends on the seek() operation succeeding. For newly added devices that
> can not support seek operations it is recommended to use no_llseek(), which
> will return an error. For more information see commit 6038f373a3dc
> ("llseek: automatically add .llseek fop").
>
> Unfortunately this was overlooked when the GPIO chardev ABI was introduced.
> But it is highly unlikely that since then userspace applications have
> appeared that rely on being able to perform non-failing seek operations on
> a GPIO chardev file descriptor. So it should be safe to change from
> noop_llseel() to no_seek(). Also use nonseekable_open() in the chardev
> open() callback to clear the FMODE_SEEK, FMODE_PREAD and FMODE_PWRITE flags
> from the file. Neither of these should be set on a file that does not
> support seek operations.
>
> Fixes: 3c702e9987e2 ("gpio: add a userspace chardev ABI for GPIOs")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Ideally this gets added to stable as well to get a consistent ABI
> throughout.

Thanks Lars-Peter, I applied this and tagged it for stable.

Yours,
Linus Walleij
