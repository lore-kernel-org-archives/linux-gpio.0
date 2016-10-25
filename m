From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: GPIO_GET_LINE{HANDLE,EVENT}_IOCTL: Fix file
 descriptor leak
Date: Tue, 25 Oct 2016 14:01:02 +0200
Message-ID: <CACRpkdZNOsOBOOvUeudxDGxDqhbeXr6-yj=RjrLVvQfbdOY9Hw@mail.gmail.com>
References: <1477310355-16878-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:33585 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933859AbcJYMBD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 08:01:03 -0400
Received: by mail-qk0-f169.google.com with SMTP id n189so258203738qke.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 05:01:03 -0700 (PDT)
In-Reply-To: <1477310355-16878-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 24, 2016 at 1:59 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:

> When allocating a new line handle or event a file is allocated that it is
> associated to. The file is attached to a file descriptor of the current
> process and the file descriptor is returned to userspace using
> copy_to_user(). If this copy operation fails the line handle or event
> allocation is aborted, all acquired resources are freed and an error is
> returned.
>
> But the file struct is not freed and left attached to the userspace
> application and even though the file descriptor number was not copied it is
> trivial to guess. If a userspace application performs a IOCTL on such a
> left over file descriptor it will trigger a use-after-free and if the file
> descriptor is closed (latest when the application exits) a double-free is
> triggered.
>
> anon_inode_getfd() performs 3 tasks, allocate a file struct, allocate a
> file descriptor for the current process and install the file struct in the
> file descriptor. As soon as the file struct is installed in the file
> descriptor it is accessible by userspace (even if the IOCTL itself hasn't
> completed yet), this means uninstalling the fd on the error path is not an
> option, since userspace might already got a reference to the file.
>
> Instead anon_inode_getfd() needs to be broken into its individual steps.
> The allocation of the file struct and file descriptor is done first, then
> the copy_to_user() is executed and only if it succeeds the file is
> installed.
>
> Since the file struct is reference counted it can not be just freed, but
> its reference needs to be dropped, which will also call the release()
> callback, which will free the state attached to the file. So in this case
> the normal error cleanup path should not be taken.
>
> Fixes: d932cd49182f ("gpio: free handles in fringe cases")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Patch applied for fixes and tagged for stable.

Yours,
Linus Walleij
