From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Mon, 5 Feb 2018 08:55:15 -0800
Message-ID: <CA+55aFxdK3CJiAN_yytM7nYubYOeShvCNFGpEU9SR1HC0b8WiQ@mail.gmail.com>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com>
 <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com> <b82adbc32e4444debb947582d3a8291c@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:45043 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752738AbeBEQzQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Feb 2018 11:55:16 -0500
In-Reply-To: <b82adbc32e4444debb947582d3a8291c@AcuMS.aculab.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Laight <David.Laight@aculab.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 5, 2018 at 2:09 AM, David Laight <David.Laight@aculab.com> wrote:
> From: Linus Torvalds
>> Sent: 02 February 2018 22:57
> ...
>> I also wonder if there are any automated tools that try to find these
>> kinds of crazy things. I suspect a lot of our build times is the poor
>> compiler just reading and parsing header files over and over again,
>> and a lot of them are probably not needed.
>
> I've counted system calls during a NetBSD kernel build, I imagine Linux is
> much the same.
> Most of the calls were open(), and most of those failing opens.
> I suspected that most came from searching the -I path to find headers.
> Build over NFS and the cost is even more significant (every directory
> name in the path (used to) require an NFS message exchange).

I suspect that Linux is actually very _different_ in this area,
because Linux has a very extensive name cache for pathname lookup that
also captures negative path component entries.

End result: opening a file - whether it exists or not - doesn't
actually go down to the filesystem at all when things are cached. My
kernel profiles also show that very clearly, there's absolutely no
filesystem component to the build at all (but there is a noticeable
VFS component to it, and __d_lookup_rcu is generally one of the
hottest kernel functions along with the system call entry/exit code).

Now, on NFS the caching will be a bit less effective because we have a
timeout that forces re-validation of the caches, but even there at
least the "look up the same header pathname" will be captured very
well. So the most common case - of doing the include path lookup for
all those really core header files that _everbody_ ends up including -
ends up being captured pretty much 100% in the caches even on NFS. On
a local filesystem, as long as you have enough RAM, those lookups will
be cached even across multiple kernel compiles.

At least if you are like me, and all you do all day long is build the kernel ;)

                 Linus
