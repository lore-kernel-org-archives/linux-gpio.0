From: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [PATCH 04/10] iio: stx104: Change STX104 dependency to ISA_BUS
Date: Sat, 9 Apr 2016 16:51:31 +0100
Message-ID: <20160409165131.4d4a109b@lxorguk.ukuu.org.uk>
References: <cover.1460040201.git.vilhelm.gray@gmail.com>
	<783be62acf68b35f3fe4785a2cedfe017624688b.1460040201.git.vilhelm.gray@gmail.com>
	<20160408004503.GB10211@roeck-us.net>
	<20160408123158.GB18202@sophia>
	<5707AF91.5010704@roeck-us.net>
	<20160408150922.GA28058@sophia>
	<20160408182801.GB7083@roeck-us.net>
	<20160408192723.GA31687@sophia>
	<20160409135814.359e24d6@lxorguk.ukuu.org.uk>
	<20160409135050.GA10418@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160409135050.GA10418@sophia>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

> It looks like I'm in quite a pickle. Even if the patch for the PnPBIOS
> driver removes the errors and warnings, there may be runtime bugs in
> other drivers expecting X86_32. The only way I can see to prevent that
> is to audit all the drivers which depend on the ISA option -- a behemoth
> undertaking which would be far too impractical and error-prone for me to
> do.

I actually wouldn't worry. We've got lots of other drivers that don't
work on all the platforms they should because nobody has ever tried them
out.

At least if they compile on the different platforms people will be able
to try them. It's not making anything any worse - it used to not work and
it still doesn't work is the failure case 8)

Alan
