Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F87373BF2;
	Sat, 12 Sep 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216742; cv=none; b=nnMu5KW2ic1FzEd00kF1rFzxk8zumCIgyyPO11sAt/jGxbSeOZhKuMxl2/7l2btpsZ7krYM7jPHIFUbuvByjimVxcQXCZFOlbQB152DCe0i+0uSw3k7Gq7C34vtaYlN2IxiLlo7zZHMnX8SrDh36mSyIEMVhJhU7hjuu6P6Mp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216742; c=relaxed/simple;
	bh=A6/3MCg9R79ckuXy//FTcJ984yL2uDU8Tu77/oKLL9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGOlVUT4+iYKbIvK0qZp4RCdwn7G1H62uMHBvL3CEv+Gm9bp0dm4ChS6wxThx1PWxnQ5TnRqU7JjPcNj6MMw4nF9WgYUDAT1g80OdYO+ct6UZfb/DzhkaluI45K1lwQ48mQSM2WwqFqnXPJw4TAsKAFVjmdfR9ILhtGSIAAc1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OU/qQOMZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OU/qQOMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5EB1F000FF;
	Sat, 12 Sep 2026 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789216741;
	bh=f7BZbyDY4BGxf9J7NMaAvN3pKH3axxWfzqLfVJA35v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OU/qQOMZrx3Zfqb5o9u572FP0my6GnkeeCUTqpIb0ST/RHPATM0Moxl6lszbMkFDP
	 O9SQzueAd87sGWu3/t4q+zCik7MFb/iLfZqO1TtuezOql9f+ROwJSSg7qKhIrSrVe8
	 66+fqXkNO2UDPb9l++ZXDS1ffyB1BvyRNZQdFCl55pS6afvAOJhbzJydCAlsAxPOD5
	 5WcMZKjPGMF7Bv3ijEyvUgHT3vsVamb2Q5aAg1A7LeKzXni6lefcIfxTUY2Euk0Jxo
	 BSBzBswY1Ng/whLpV4+0FNH3XTo5DhxUszNayfGVP518mTc/yPk1SQxvIq/FGQx642
	 Sn5mm3mXZ6TIg==
Date: Sat, 12 Sep 2026 20:38:56 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v12 3/3] gpio: Leverage revocable for accessing struct
 gpio_chip
Message-ID: <aqVH4Fl7pew8PKf1@tzungbi-laptop>
References: <20260908134223.13638-1-tzungbi@kernel.org>
 <20260908134223.13638-4-tzungbi@kernel.org>
 <CAMRc=McssNYy09bnzUpf9LEB94UOWimyVZNOrKRPn1EUVF8iTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McssNYy09bnzUpf9LEB94UOWimyVZNOrKRPn1EUVF8iTg@mail.gmail.com>

On Thu, Sep 10, 2026 at 12:32:48AM -0700, Bartosz Golaszewski wrote:
> On Tue, 8 Sep 2026 15:42:23 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > The underlying chip can be removed asynchronously.  `gdev->srcu` is used
> > to ensure the synchronization before accessing `gdev->chip`.
> >
> > Revocable encapsulates the details.  Leverage revocable for accessing
> > the struct gpio_chip and remove the `gdev->srcu`.
> >
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> 
> Could you address the following issue pointed out by sashiko?
> 
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 66d2325bfae87..a7d3c4d9018c8 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -898,10 +897,10 @@ static void gpiodev_release(struct device *dev)
> >  	synchronize_srcu(&gdev->desc_srcu);
> >  	cleanup_srcu_struct(&gdev->desc_srcu);
> >
> > +	revocable_put(&gdev->chip_rev);
> >  	ida_free(&gpio_ida, gdev->id);
> >  	kfree_const(gdev->label);
> >  	kfree(gdev->descs);
> > -	cleanup_srcu_struct(&gdev->srcu);
> >  	kfree(gdev);
> >  }
> 
> Could this cause a use-after-free crash during concurrent device removal?
> 
> The revocable object chip_rev is embedded directly in the gpio_device struct.
> The new access cleanup pattern drops the SRCU lock before dropping the kref
> on the revocable object.
> 
> During asynchronous device removal, revocable_revoke() executes
> synchronize_srcu() to wait for readers. Because the reader drops the SRCU lock
> first, revocable_revoke() will unblock, proceed to gpio_device_put(gdev), and
> gpiodev_release() will execute kfree(gdev) while the reader thread is still
> active.
> 
> The reader thread will then attempt to call kref_put() on the chip_rev that is
> embedded inside the now-freed gdev.

While callers who use embedded allocations should properly pin the container,
the revocable primitive itself shouldn't rely on that.

I have fixed this in v13[1] by caching the flag locally inside the handle,
ensuring the teardown never touches the container's memory after unlocking
SRCU.

[1] https://lore.kernel.org/all/20260912123529.7951-2-tzungbi@kernel.org
