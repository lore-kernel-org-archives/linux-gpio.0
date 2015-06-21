From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Sun, 21 Jun 2015 21:44:30 +0200
Message-ID: <a35f48994dedc061b54ca9ea255fdd4e@agner.ch>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
 <20150620234957.25729.qmail@stuge.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150620234957.25729.qmail-Y+HMSxxDrH8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org, hachti-c1YPqJpaggmzQB+pC5nmwQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On 2015-06-21 01:49, Peter Stuge wrote:
> Stefan Agner wrote:
>> libftdi requires to detach the kernel driver to get access to the device
> 
> Control transfers ought to be possible without a detach.

Good to know, thanks for this input. The detach is probably a default
behavior of libftdi... Will have a look at that.

Having kernel level gpiolib would still have advantages: It would make
the matching of the GPIO's and tty device easier, since with this patch
the gpiolib device is a sub-node of the usb-serial device in sysfs and
the user would have to use kernel interfaces only (no libftdi)...

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
