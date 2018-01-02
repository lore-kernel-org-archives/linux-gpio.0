From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Change ISA_BUS_API dependency to selection
Date: Tue, 2 Jan 2018 10:29:30 +0100
Message-ID: <CACRpkdbBA0DX22ZGSkQxi+euTSROPzsmLTvSPwY8peg6+7igFQ@mail.gmail.com>
References: <cover.1514578085.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1514578085.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LINUXWATCHDOG <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 29, 2017 at 9:13 PM, William Breathitt Gray
<vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Linus, please pickup this entire patchset through your GPIO subsystem
> tree; a recursive dependency error is present if these patches are
> cherry-picked (see https://lkml.org/lkml/2017/12/26/235), so they should
> be merged together in the same tree.

OK I just need a bunch of ACKs so giving subsystem maintainers some
days to come back on this.

Yours,
Linus Walleij
