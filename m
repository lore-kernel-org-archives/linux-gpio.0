From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xra1403: Switch to a fixed upper bound for registers
Date: Thu, 12 Apr 2018 10:17:05 +0200
Message-ID: <CACRpkdYFTcEssOX+Tdof9LVa1x5wFGvMXzmojLKTvrz7=QqA8Q@mail.gmail.com>
References: <20180409210717.3852-1-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409210717.3852-1-labbott@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@redhat.com>
Cc: Nandor Han <nandor.han@ge.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <keescook@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-hardening@lists.openwall.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 9, 2018 at 11:07 PM, Laura Abbott <labbott@redhat.com> wrote:

> Geert Uytterhoeven pointed out that the number of register was a
> fixed upper bound so there's no need to use a dynamically allocated
> array in place of a VLA. Use the defined upper bound.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Laura Abbott <labbott@redhat.com>

Patch applied for v4.18!

Yours,
Linus Walleij
