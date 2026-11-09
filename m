Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213065;
	b=vaDDdVfnOEB6tyOP6Nlm+FymKFdbzABjYTUsvz4R37eOcYr5aaWgVViLppXDVD2j7KC5
	 ccPpxY1lbKR7IGA8F/vxJ+x58HJPEWTczyxcfQftbpVF1oSHWly2aKX043vmr1JCV02DW
	 Kaxjw8jtH2IrQQPRvGRbCnjR1wDVP0ICEufbWLRUoiPB/NUF0UmMbIb9iIFsvZ4HU7b/i
	 j2gRG1Bo/7TnKp6p4xrR3bHnU3CxgaZXHSFwU9CcwQlN+sqbxczh8mkZDoxw7AbsDvrPw
	 ur5R4x+XVJCTF2Nu300xoQOl0S1y2zD5jkquCXdKNW3akXBZS55LkcE45Of6GrZd2XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213065;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gNdwW8qWuPBS5JDfkp9FCyjV79KuaT8n6PecilCZ40Q=;
	b=QefTWXv29W3dlZLONKKZWvBL7icB5giJqRkx+1QInhP1sxlwzSupwDWeP8hklhl7P1cD
	 m/8uZH7fhP89uAoBs0FbdAnx0bzDZAsFq+XwFkjCAFwvMSA1V+gUgJrg95R7Vt9LN2QnN
	 fDM4iW/Onihizev/WnG+4kNur9htpqcuuxf7I7kr7dvyTVyb2oL7lzrrC5wX3izACbeKc
	 jJLacnRUbZN9hQHX8wgzEQ183YMD+PQtcjdWsXVt9rM4LKO3hNIyCViPNrPKX6mey29O7
	 StXGIL8td0SN9XzWUxWL0N7Juqj5L7nDjM0ONZ/hwC/PvKwQKGDR03wdH+IS9SNV6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW0LHdpf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0B6EA606A322;
	Mon,  9 Nov 2026 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW0LHdpf
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 033741F0089F;
	Mon,  9 Nov 2026 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794213064;
	bh=gNdwW8qWuPBS5JDfkp9FCyjV79KuaT8n6PecilCZ40Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JW0LHdpfEx1zYEGHqlJ+/7SG5egJFctpCz5nKdQpop/i7uXjxk3zks48cp1Hl8aPQ
	 pfDY9mzc876PUAX6HhN93qaVOA3HDUKieFrxWcUTZJho9kmNB9lTNiabVkc+83n9a4
	 +NpH336Giq4u1MxFrZLUy4pWsIYXE1s8htCiZauIM3l7tnyju0dLqw5aGefcEwL8lZ
	 YRfb8G3KqKmfaZUqD+xEUMewNG983j+rdEZqn0fZ22xYI96Jb5pTo8YVV9VR54snUi
	 ZEXRa9JNWa8DL26CoZQksLg34wyyF+8dF73Oe6pnsUS9DvkTsnJccMRHYlRAEXHdr7
	 YhQZbQ27sp5XA==
Date: Mon, 9 Nov 2026 09:30:58 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: fix interrupt leak and UAF
Message-ID: <oktwo2pnmsa6vpeinmsarq6vdh72spa5fgibbd5ruzjfdvubc2@sk2nax7pbngt>
References: <20261106-gpio-virtuser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com>
 <sashiko-outbox-201721@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-201721@kernel.org>

On Fri, Nov 06, 2026 at 03:43:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] gpiolib: race condition and double free in desc_set_label()
>   [1]
> --
> 
> commit 4879168b8f1f80dbe315c00e833ecc347918f4e3
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> gpio: virtuser: fix interrupt leak and UAF
> 
> This commit serializes access to the virtual user interrupt state using the
> per-line mutex, prevents duplicate IRQ requests, and registers a devm action
> to free the interrupt on device unbind.
> 
> > diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> > index 185c1be39b277..21b4bc64d4d34 100644
> > --- a/drivers/gpio/gpio-virtuser.c
> > +++ b/drivers/gpio/gpio-virtuser.c
> 
> [ ... ]
> 
> > @@ -635,7 +635,7 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
> >  	if (ret)
> >  		return ret;
> >  
> > -	scoped_guard(mutex, &data->consumer_lock)
> > +	scoped_guard(mutex, &data->lock)
> >  		strscpy(data->consumer, buf, sizeof(data->consumer));
> >  
> >  	return count;
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can concurrent writes in
> gpio_virtuser_consumer_write() race in desc_set_label() [1] and double
> enqueue old->rh via call_srcu()?
> 
> Just above this hunk, gpio_virtuser_consumer_write() calls
> gpiod_set_consumer_name() -> desc_set_label() without holding data->lock, and
> desc_set_label() replaces desc->label without any update-side lock:
>

FYI: There's a patch[1] on the list that fixes that issue too.

Bart

[1] https://lore.kernel.org/all/20261105-gpiolib-set-desc-label-corruption-v1-1-fa84726ceac0@oss.qualcomm.com/
