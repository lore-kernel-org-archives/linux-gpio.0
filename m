From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add bias pinconf support
Date: Fri, 1 Jul 2016 12:05:21 +0200
Message-ID: <CAO3366x8NpaDF9sjq6hyYioQkYC-qV0tnJZc3ERGQMVn8tdmQw@mail.gmail.com>
References: <1467216364-27235-1-git-send-email-ulrich.hecht+renesas@gmail.com> <CAMuHMdVh3E3qf7q0T1A3stVtbgA4m_FBwRz_KFTNE4HpeObG4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVh3E3qf7q0T1A3stVtbgA4m_FBwRz_KFTNE4HpeObG4Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2016 at 9:45 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Ulrich,
>
> On Wed, Jun 29, 2016 at 6:06 PM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
>> Implements pull-up and pull-down. On this SoC there is no simple mapping of
>> GP pins to bias register bits, so we need a table.
>
> Thanks for your patch!
>
> This covers bias for pins that can be used as a GPIO only, just like the
> existing drive strength support, right?

Right.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you!

CU
Uli
