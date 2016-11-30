From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] gpio: chardev: Return error for seek operations
Date: Wed, 30 Nov 2016 13:13:50 +0100
Message-ID: <27bad702-d02b-e9bf-f14f-b978c3e24a7c@metafoo.de>
References: <1480507521-17766-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:48319 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755114AbcK3MN4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 07:13:56 -0500
In-Reply-To: <1480507521-17766-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On 11/30/2016 01:05 PM, Lars-Peter Clausen wrote:
> ...
> noop_llseek() is primarily meant for
> devices that can not support seek, but where there might be a user that
> depends on the seek() operation succeeding. For newly added devices that
> can not support seek operations it is recommended to use no_llseek(), which
> will return an error. For more information see commit 6038f373a3dc
> ("llseek: automatically add .llseek fop").
> ...

Arnd, on this subject. As far as I can see FMODE_SEEK is only set if the
file was created using sys_open() or a equivalent operation. Files that are
created using other system calls (e.g. like pipe(), eventfd()) or IOCTLs
(like for the GPIO line and event handles) do not have FMODE_SEEK set. If
FMODE_SEEK is not set vfs_seek() will ignore the fops llseek() callback and
always use no_llseek(). Many of these files that don't have FMODE_SEEK set
still use noop_llseek(). Partially introduced by your commit, partially
spread by copy and paste.

Since the llseek field is ignored for those, what is your recommendation
here? Drop the llseek initialization or change it to no_llseek? And if it is
the later what is the reason that it should not be removed even if the field
is never used?

Thanks,
- Lars

