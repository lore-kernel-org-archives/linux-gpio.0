Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A10347BD1
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771442533; cv=none; b=XkqT497CfkcKyVQKiJaZHJz+lQBk/lvmp23ni9B9eJwJi5VTcV4ArDYLrulSe9NzEYkf71JqiopgYwtM/NuYc5kpQwkSrPbMprvE/cVo+X0v9yP7OX6c397ut9EaAnO6OF/v3mnY6fbsj/8TtRITH5dEmvC7QnvLeGNwy70I9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771442533; c=relaxed/simple;
	bh=Y97geHjVcrcYEcs0vfPqLkYCKXlSwtT6AcvJibIAB8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qglx86fe0q98EjqLCdgluSLNGp0anNKYRKZAHHzjQGPg6W12iX5hGYmbqKoa08S56nFrHep1i84syC1sKZQZuHIi/uCTzDogP2kyEe2el2P8yU3XTbkcLxfNiv6RS13FWtUlmtFaAkLXK0JXLMU+CukWkQAXfLqc5z3yU1Z2D2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEi4sK6+; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEi4sK6+"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2ba9d13f10eso225234eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771442531; x=1772047331; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXpFum9A9wQIMqdk0cZgJ9d4OSsuynAtiaQ9sICIi58=;
        b=SEi4sK6++TQ39ln2ayVpkD2yGJG7oF//J4eYMRNPMPhJ35wKeDAPw/iU2Rp+Y079Y6
         shgVl9c1gISfi/jXdOvI8uIWaMBL2rVxrOcPBSBwEbaacsz3jNQbd4gzdZYT15fmtcPm
         lj8zIGXJq62dWWphviHrHMUBrYPzZ/+ZHBWib3/4JF3ABx3bBiShPKlyh0xFwXqpicLU
         GOoDMoKrbbzQ48aUxqAFEp4AW02Nj/h4apD08G1VEz37BM7ZmYJK3BEl3NnN5cSggFuW
         T0VnjP8cJU2/CjxAf5o2knmQluoy7Uqd8fqBmwaB47P2EB3M6JI7CUd4jHxDiFcSuJrR
         sQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771442531; x=1772047331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXpFum9A9wQIMqdk0cZgJ9d4OSsuynAtiaQ9sICIi58=;
        b=U8BQcZM58HrHGU5KkdtBShHTcIeWMwfLk+osfTFgWnBd4KIUFT51UIAI/8EHYsiSw5
         P77f8n6flqF0GCtEtVhPQVfZmIOzNGqBYguydLYM+gyr/rWDxM6n4v1/t7iYyA8nsLfv
         +TIzqUUOoow07bwu9TkEsd2v+srEdU1MxBTyGMfIbXLoqvx/lQ1e3zygrqgggmdAf/2m
         /fCeg3I+hOGJsHjbrEm4NO4rCvevbmgK6Ln8yx2AKZ8/vXb5vZ0jvXgT1uMyzryBDoPt
         TupFvzA3Cp7HQXyPSqUJtLhlPnetiwvyQo+F5Oi0g3yOeGO1aycpJBE60FcZnQNwEK8q
         Tu4w==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZfKtAvW98uhYTrIT1NtJ9RU6KoOcp+Mt2I99IJ5jRDxRFpCQM6NSscY3nuzj3tFobzukQskNCoLk@vger.kernel.org
X-Gm-Message-State: AOJu0YwFduefy3UnAzT7X2aSOUl8OZ1/WjB0tngRPHC5D1qkI3xVyGG9
	TkHmeVEJKaMwlFtDPK4R1b+cnyyLMdEE/OMdm2N95pGYD6LRzEI2cgov
X-Gm-Gg: AZuq6aLut3/ETBS+yZyxWDocjXx3QI6+w+n5Iti/O8E+fznFEjUz+krxRkfYknr1Awh
	LU3Ac+LAZ7qPyAI4jbSTxjcNFq/2WaPP0Vq6y5wsv9o6WoSWTz1Tby4kjrdiyUUJHG6de2suPQg
	3CTKn3Ni2M/VGW+iVWzyZfCi7hDYhjq6iMY7CkqbLsAntt/NHPE4IPjZAKOunCxnkH8Uu/Yn8kH
	vAceLgBeabZolb3sdu91NI3DgMBxynQH7cS/LkIN8ubIqLrXpbzAAoH6RVEo4JSN01DUdwyMgnW
	7qIaHvLBEoHJDEv3ku9UXyOYR0Bl29oKR0KfHxMfYBbU80pV3mid9XY+jnq7BtiVSwbRYfyWkC9
	+aQfkwNvmYdngOqZM9HoJq0WwSLZDE0X35gGHCxm80G+n3wR3ZWBsOM0ys3BHaiRKUaYCEphZnA
	clG0EMGdcTaEBpJAOhHBnFTuE+NFaT1WKIZuuHrjLK0nC/e/t3fLbqzhWGrCkAWtJo
X-Received: by 2002:a05:7300:e426:b0:2ba:9ba8:5af4 with SMTP id 5a478bee46e88-2bd5b3c7c53mr304026eec.22.1771442530638;
        Wed, 18 Feb 2026 11:22:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66bd17sm20129642eec.28.2026.02.18.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:22:10 -0800 (PST)
Date: Wed, 18 Feb 2026 11:22:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the
 swnode-name-against-chip-label matching
Message-ID: <aZYPv1_kWQd9OdHD@google.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
 <aZUIFiOYt6GOlDQx@google.com>
 <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
 <aZXyPjIjIDKCBLvs@google.com>
 <CAMRc=MdQmR-_Yqdh4TiHSzjmGVJY+0guDpFEM6F1QD_SJ2+T0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdQmR-_Yqdh4TiHSzjmGVJY+0guDpFEM6F1QD_SJ2+T0Q@mail.gmail.com>

On Wed, Feb 18, 2026 at 07:08:22PM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 18, 2026 at 6:15 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Feb 18, 2026 at 09:42:28AM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Feb 18, 2026 at 1:31 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> > > > > Using the remote firmware node for software node lookup is the right
> > > > > thing to do. The GPIO controller we want to resolve should have the
> > > > > software node we scooped out of the reference attached to it. However,
> > > > > there are existing users who abuse the software node API by creating
> > > > > dummy swnodes whose name is set to the expected label string of the GPIO
> > > > > controller whose pins they want to control and use them in their local
> > > > > swnode references as GPIO properties.
> > > > >
> > > > > This used to work when we compared the software node's name to the
> > > > > chip's label. When we switched to using a real fwnode lookup, these
> > > > > users broke down because the firmware nodes in question were never
> > > > > attached to the controllers they were looking for.
> > > > >
> > > > > Restore the label matching as a fallback to fix the broken users but add
> > > > > a big FIXME urging for a better solution.
> > > > >
> > > > > Cc: stable@vger.kernel.org # v6.18, v6.19
> > > > > Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
> > > > > Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> > > > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - check if gdev_node and gdev_node->name are not NULL before trying to
> > > > >   match the label (Hans & Dan)
> > > > > - use the right link
> > > > > - collect tags
> > > > >
> > > > >  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
> > > > >  1 file changed, 19 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> > > > > index 21478b45c127d..0d7f3f09a0b4b 100644
> > > > > --- a/drivers/gpio/gpiolib-swnode.c
> > > > > +++ b/drivers/gpio/gpiolib-swnode.c
> > > > > @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
> > > > >
> > > > >  fwnode_lookup:
> > > > >       gdev = gpio_device_find_by_fwnode(fwnode);
> > > >
> > > > By the way, should we extend gpio_device_find_by_fwnode() to use both
> > > > primary and secondary nodes?
> > > >
> > >
> > > That's already done on a higher lever for all fwnodes in gpiod_fwnode_lookup().
> >
> > How exactly? I am not talking about checking secondary node for the
> > fwnode that is used in the reference, I am talking about secondary
> > fwnode that might be assigned to the gpio chip and you need to check
> > both primary and secondary if they match with the fwnode that you call
> > gpio_device_find_by_fwnode() with.
> >
> 
> Right, I didn't quite get it. I was surprised to find out
> device_match_fwnode() - which we use in gpiolib - does not do it
> already. I'm wondering if this is something we should change in device
> core or only locally.

Yes, I think so (change in driver core). There is only a handful of
calls to device_match_fwnode() that they can be audited to make sure the
conversion is safe.

Thanks.

-- 
Dmitry
