From: Peter Stuge <peter-Y+HMSxxDrH8@public.gmane.org>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Sun, 21 Jun 2015 01:49:57 +0200
Message-ID: <20150620234957.25729.qmail@stuge.se>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434838377-8042-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org, hachti-c1YPqJpaggmzQB+pC5nmwQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Stefan Agner wrote:
> libftdi requires to detach the kernel driver to get access to the device

Control transfers ought to be possible without a detach.


//Peter
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
