From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 1/4] gpio: userspace ABI for reading/writing GPIO lines
Date: Wed, 29 Jun 2016 11:43:56 +0200
Message-ID: <31233738.EiQ4DLngM8@ws-stein>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org> <2026706.RhdqQzbNxG@ws-stein> <CACRpkdbRG3w+=GvnJUN9b+Nbej7gfDR5duTwjmdxTLc-p03O7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:60280 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751449AbcF2JoD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 29 Jun 2016 05:44:03 -0400
In-Reply-To: <CACRpkdbRG3w+=GvnJUN9b+Nbej7gfDR5duTwjmdxTLc-p03O7w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>

On Wednesday 29 June 2016 11:05:49, Linus Walleij wrote:
> On Wed, Jun 29, 2016 at 10:53 AM, Alexander Stein
> 
> <alexander.stein@systec-electronic.com> wrote:
> > On Thursday 02 June 2016 13:51:26, Linus Walleij wrote:
> >> +     fd = anon_inode_getfd("gpio-linehandle",
> >> +                           &linehandle_fileops,
> >> +                           lh,
> >> +                           O_RDONLY | O_CLOEXEC);
> > 
> > When will linehandle_release actually be called? When we explicitely call
> > close(req.fd) or when application exits and all FDs will be closed anyway?
> 
> As far as I understand: both.
> 
> And I don't think anything else makes sense? If an application is
> terminated, the operating environment will close all open file handles as
> far as I know, at least that is how I always thought it works.
> 
> But hey, it's userspace so what do I know...
> 
> Anyways if it doesn't work like so, there are a bunch of subsystems in
> the kernel using it so they would all have severe problems.

Fine, just wanted to make sure.

> >> +     if (fd < 0) {
> >> +             ret = fd;
> >> +             goto out_free_descs;
> >> +     }
> >> +
> >> +     handlereq.fd = fd;
> >> +     if (copy_to_user(ip, &handlereq, sizeof(handlereq)))
> >> +             return -EFAULT;
> > 
> > If I'm right above doesn't that then leak lh until application eventually
> > exits? Userspace won't receive the newly created fd. The same would apply
> > to patch 3/4.
> 
> I don't understand....
> 
> The userspace application reads the .fd fields of the handle request after
> issuing the ioctl() and it then contains the new file handle.

There is no valid .fd if copy_to_user() fails and immediately returning
-EFAULT. Thus the previously kzalloc'ed lh (well anything linehandle_release 
frees) is unaccessible. Userspace has no .fd for neither any ioctl nor for 
calling close(). This allocated memory will remain unavailable until the 
process exits. I think something like this should be added:

> @@ -486,8 +486,10 @@ static int linehandle_create(struct gpio_device *gdev,
> void __user *ip)> 
>  	}
>  	
>  	handlereq.fd = fd;
> 
> -	if (copy_to_user(ip, &handlereq, sizeof(handlereq)))
> -		return -EFAULT;
> +	if (copy_to_user(ip, &handlereq, sizeof(handlereq))) {
> +		ret = -EFAULT;
> +		goto out_free_descs;
> +	}
> 
>  	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
>  	
>  		lh->numdescs);

I hope this could make my concerns more clear. Opinions?

Best regards,
Alexander

