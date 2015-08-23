From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/2] FTDI CBUS GPIO support
Date: Sun, 23 Aug 2015 01:52:53 -0700
Message-ID: <20150823085253.D9178C40941@trevor.secretlab.ca>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
	<20150620234957.25729.qmail@stuge.se>
	<a35f48994dedc061b54ca9ea255fdd4e@agner.ch>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a35f48994dedc061b54ca9ea255fdd4e-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, x-linux-XAdK+dDVA0n/cwiKa4OQEw@public.gmane.org, hachti-c1YPqJpaggmzQB+pC5nmwQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Sun, 21 Jun 2015 21:44:30 +0200
, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
 wrote:
> On 2015-06-21 01:49, Peter Stuge wrote:
> > Stefan Agner wrote:
> >> libftdi requires to detach the kernel driver to get access to the device
> > 
> > Control transfers ought to be possible without a detach.
> 
> Good to know, thanks for this input. The detach is probably a default
> behavior of libftdi... Will have a look at that.

libftdi is built on libusb. libusb detaches the device from ftdi_sio and
binds it to a special driver for userspace access. There may indeed be
another way to do it, but libusb doesn't know how to do it AFAIKS.

We can't avoid the detach on current libftdi, but I do have a patch to
libftdi that will at least reconnect the ftdi_sio driver after userspace
has finished. I'll be posting it to the libftdi list in the next week,
but I've attached it below for anyone who wants to play.

> Having kernel level gpiolib would still have advantages: It would make
> the matching of the GPIO's and tty device easier, since with this patch
> the gpiolib device is a sub-node of the usb-serial device in sysfs and
> the user would have to use kernel interfaces only (no libftdi)...

NAK on the sysfs interface. Don't add a new ABI. gpiolib is the right
way to expose these pins.

g.

---
Subject: [PATCH] Automatically reattach kernel driver on close

The built-in libusb auto detach feature supports automatically
reattaching the kernel driver when the device is closed. Switch libftdi
to use the libusb auto-detach code so that we can get the Linux ftdi_sio
driver reattached automatically when finished with the device.
---
 src/ftdi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/ftdi.c b/src/ftdi.c
index 68489ea096be..0d043690aeca 100644
--- a/src/ftdi.c
+++ b/src/ftdi.c
@@ -548,7 +548,7 @@ int ftdi_usb_open_dev(struct ftdi_context *ftdi, libusb_device *dev)
     // Likely scenario is a static ftdi_sio kernel module.
     if (ftdi->module_detach_mode == AUTO_DETACH_SIO_MODULE)
     {
-        if (libusb_detach_kernel_driver(ftdi->usb_dev, ftdi->interface) !=0)
+        if (libusb_set_auto_detach_kernel_driver(ftdi->usb_dev, 1))
             detach_errno = errno;
     }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
