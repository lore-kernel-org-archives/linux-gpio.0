From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] gpio: ws16c48: Add set_multiple callback function support
Date: Thu, 26 Jan 2017 10:58:07 +0100
Message-ID: <CACRpkdYRFbGfnKoML_dUSi-ti8m7yw4PA7MfO8dK1Qw+Wy=FFQ@mail.gmail.com>
References: <cover.1484838095.git.vilhelm.gray@gmail.com> <2b5658acecdc3e8d922ea8e299bd488e6ee18e2d.1484838095.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2b5658acecdc3e8d922ea8e299bd488e6ee18e2d.1484838095.git.vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2017 at 4:05 PM, William Breathitt Gray
<vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The WinSystems WS16C48 provides registers where 8 lines of GPIO may be
> set at a time. This patch add support for the set_multiple callback
> function, thus allowing multiple GPIO output lines to be set more
> efficiently in groups.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Patch applied.

Yours,
Linus Walleij
