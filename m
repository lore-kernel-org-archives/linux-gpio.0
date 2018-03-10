From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] Move most GPIO documentation to driver-api/gpio/ and ReST
Date: Sat, 10 Mar 2018 12:50:46 +0100
Message-ID: <CACRpkda=5i-j=W8+yosF9WiZRKFF=iRC-djja7MJE+k6b1xtaQ@mail.gmail.com>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 9, 2018 at 12:40 AM, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The aim of this patchset is to move the GPIO subsystem's documentation
> under Documentation/driver-api/gpio/ such that it is picked up by Sphinx
> and compiled into HTML.

Awesome!

> I moved everything except for sysfs.txt, because
> this file describes the legacy sysfs ABI, and doesn't seem to serve much
> (non-historical) purpose anymore.
>
> There are still some rough edges:
>
> * I think the API documentation (kernel-doc) should be moved out of
>   index.rst into more appropriate files.
> * The headings are arguably wrong, because driver.rst, consumer.rst,
>   etc. use the "document title" style, even though they are part of the
>   GPIO chapter. But the resulting TOC tree is consistent, and I did not
>   want to change almost all headings.
> * Some of the files could use more :c:func:`...` references and general
>   ReST polish.
>
> But I don't want to make this patchset too large.

It's fine, we take it one step at a time.

On Fri, Mar 09, 2018 at 10:41:20AM -0700, Jonathan Corbet wrote:

> Anyway, I'm happy to take these through the docs tree or see them go via
> GPIO; Linus, what's your preference?

I might have some doc patches that could collide so I can take them.

I take it there will be a v2?

Yours,
Linus Walleij
