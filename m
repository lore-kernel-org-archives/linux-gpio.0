From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] gpio: sysfs: fix attribute leaks and races
Date: Thu, 15 Jan 2015 17:33:33 +0100
Message-ID: <CACRpkdYuC7P0Mhv8dqkhMnem8atH7nu98TjqaiGjPRE6HT52gg@mail.gmail.com>
References: <1421150406-20255-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421150406-20255-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 13, 2015 at 1:00 PM, Johan Hovold <johan@kernel.org> wrote:

> Here are three more patches for 3.19 fixing some long-standing memory
> leaks and races (with userspace) in the gpio sysfs-interface
> implementation.

All three patches applied for fixes.

Thank you for daring to go into the sysfs mess, noone dares to go
there but for you. This interface was merged when the GPIO subsystem
was unmaintained IIRC and has serious design and code issues.

> The memory leaks are marked for stable, but I'll need to backport the=
m
> to pre-3.18 kernels once they are upstream due to commit 0eb4c6c2671c
> ("gpio: move sysfs support to its own file").

OK we'll run into it. Just send them to Greg once this is upstream.

> Please note that these patches will cause a conflict with 3511ee7b331=
2
> ("gpio: lib-sysfs: Add 'wakeup' attribute") in gpio/devel, which adds
> yet another device attribute without ever removing it. Unless the com=
mit
> in question can be reverted, that leak could be fixed as part of the
> merge resolution, I guess.

I took the patch out of my tree.

S=C3=B6ren: can you rebase the patch on top of my "fixes" branch or
the next linux-next and I'll apply it once I can merge the next -rc
into my devel branch.
Include Johan on CC and check the leak fixes in this patch series
to make sure we don't add more of them.

Yours,
Linus Walleij
