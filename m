Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707806;
	b=SctQgm/ScMFnpnwkFyhEqQUKcmIf3Mp/AkYAluOfistpE9zKaQUlLEHhXUgXCLNwNKJp
	 LzBhOiHpUC9GvP/gKyG5ZJBdlk5Oxk3/KN00KnBCw6DifGrwsSxZvhvKGrpc+BUm538GI
	 FTtJPAciKtFjwh3SxX4e2jrkMYdGDYbAjJZrd9XpiDxF2UNK5Xw8pt4z0tD4HkAyo3EhJ
	 /LzCjd7rXOwUbgzdrFRS3VPsUAyUTlzICp6wIEzdA+0W3O8RYtZPssapiqinYcOvWbuB9
	 pmYL05HS/ooEDrO/V0aUPgl2ISX/dQbgGV+C0TdeRhQQ6Pzqhw1hbFEQMW3tRduWamw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707806;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=JUvqpNIgWGDiQM2l62vb6EYFH2h8Uk82e+1HzRuepO8=;
	b=CkiFBQO3Ljm0LI7y83D/ZdcDlia1o6HjrpOZ5UdMnhNgKmpPddxd1BWdudc7fGGUhWz/
	 DsGMpZbs/5DTnaZ8JMFFblVQXIj1ao9YL2u77JMH6QTaegPOD05m15SoLs+M3vr5/FmRz
	 c8OQHVr2Rwiz8zh3JId+W8aNQb8FbE8cK0QMfrSDebVMJrtdDh6t5hgjEFNtYQGbtF3ES
	 mnIS8uNZx5DB2GV7NlC4XxwSgpsykqxb6xglP0nkc+K+wVoo1kcdwXwJ26OBv9ZrmKxKI
	 sunceOQkIS6XMf+S44IcLow7d/qjnCcxGDDNDH5awAhu30XAvYnsFUTSYThnPYQ6v9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PREHleiK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 25D0C606A327;
	Tue,  3 Nov 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PREHleiK
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 731C21F000C1;
	Tue,  3 Nov 2026 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793707805;
	bh=JUvqpNIgWGDiQM2l62vb6EYFH2h8Uk82e+1HzRuepO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PREHleiKIT++7bZkNKVhJ1ZcxJt/cIZIvZUhwh0KHts+TTpRvfDjdATvCvXQFaOhe
	 FGfkzduaLXsjT1U9IRbL1M1DnXy4lLLb1GrROf7E4DmwgmFAXac1ThzJ15CUg1p0s0
	 6L1A8tXse5NFmbkgn73hBnxQ0XHOo9S3SYMXcNYi8AsRwO+ylxbYxHgsDHz+6PEWe9
	 0+Uomuwd7wprW6GOwGPJQWkOGJvsK8iB+3SJ5tr3bSdNudc8pFfwN/zQ5v7q2MlhX7
	 KH69xvmsKihXiPMXj5l0xMH6G1tAXSW1DrHjDNl+eIq5AToea4o3KblB6SOd5K2fzB
	 JgQu9rmgJKmCw==
Date: Tue, 3 Nov 2026 13:10:00 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 5/5] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
Message-ID: <nrqb4zpe4pnbhodgqgxhukkvzxg3ytk4wwlrwstsbmjupnt4uf@kqyauxbqmwv3>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
 <20261102-gpio-shared-fwnode-lookup-v9-5-a1d6cc501098@oss.qualcomm.com>
 <sashiko-outbox-193473@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-193473@kernel.org>

On Mon, Nov 02, 2026 at 01:12:40PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] gpio: shared: use-after-free in software_node_notify_remove() on proxy removal
> - [Medium] gpio: shared: software node leak in gpio_shared_make_proxy_dev() on add error
> --
> 
> commit 8540cb961814db62ab8d7cec3ac6bee73e8c8520
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> gpio: shared: convert to using software nodes for GPIO shared proxy lookup
> 
> This commit replaces platform lookup tables for shared GPIO proxy devices
> with managed software nodes attached to the proxy auxiliary devices,
> allowing shared GPIO lookup to work via firmware nodes even when no
> consumer struct device is present.
> 
> > diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> > index 9d73a02e99890..57d8fd0bf2e1b 100644
> > --- a/drivers/gpio/gpiolib-shared.c
> > +++ b/drivers/gpio/gpiolib-shared.c
> [ ... ]
> > @@ -303,56 +303,70 @@ static int gpio_shared_of_scan(void)
> >  
> >  static void gpio_shared_proxy_dev_release(struct device *dev)
> >  {
> > -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > +	struct auxiliary_device *proxy = to_auxiliary_dev(dev);
> >  
> > -	ida_free(&gpio_shared_ida, adev->id);
> > -	kfree(adev);
> > +	ida_free(&gpio_shared_ida, proxy->id);
> > +	kfree(proxy);
> >  }
> >  
> >  static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
> >  				      struct gpio_shared_entry *entry,
> >  				      struct gpio_shared_ref *ref)
> >  {
> > -	struct auxiliary_device *adev;
> > +	struct property_entry properties = { };
> > +	struct auxiliary_device *proxy;
> > +	struct device *dev;
> >  	int ret, id;
> >  
> > -	adev = kzalloc_obj(*adev);
> > -	if (!adev)
> > +	proxy = kzalloc_obj(*proxy);
> > +	if (!proxy)
> >  		return -ENOMEM;
> >  
> >  	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
> >  	if (id < 0) {
> > -		kfree(adev);
> > -		return id;
> > +		ret = id;
> > +		goto err_free_proxy;
> >  	}
> >  
> > -	adev->id = id;
> > -	adev->name = "proxy";
> > -	adev->dev.parent = gdev->dev.parent;
> > -	adev->dev.platform_data = entry;
> > -	adev->dev.release = gpio_shared_proxy_dev_release;
> > +	dev = &proxy->dev;
> > +	proxy->id = id;
> > +	proxy->name = "proxy";
> > +	dev->parent = gdev->dev.parent;
> > +	dev->platform_data = entry;
> > +	dev->release = gpio_shared_proxy_dev_release;
> >  
> > -	ret = auxiliary_device_init(adev);
> > +	ret = auxiliary_device_init(proxy);
> > +	if (ret)
> > +		goto err_free_ida;
> > +
> > +	ret = device_create_managed_software_node(dev, &properties, NULL);
> >  	if (ret) {
> > -		ida_free(&gpio_shared_ida, id);
> > -		kfree(adev);
> > +		auxiliary_device_uninit(proxy);
> >  		return ret;
> >  	}
> 
> [Severity: Critical]
> As reported by Sashiko on v8 [1], can using
> device_create_managed_software_node() here cause a use-after-free and
> refcount underflow in software_node_notify_remove() when the proxy device
> is removed or unbound?
> 
> In gpio_shared_make_proxy_dev(), device_create_managed_software_node()
> creates a struct swnode with refcount 1, sets swnode->managed = true, and
> attaches it to proxy->dev. When auxiliary_device_add() registers
> proxy->dev, software_node_notify() increments the swnode refcount to 2.
> 
> Later, when gpio_shared_proxy_probe() registers the proxy gpio_chip with
> gc->parent = &proxy->dev and gc->fwnode = NULL,
> gpiochip_add_data_with_key() propagates the parent's fwnode to the child
> gdev->dev:
> 
> drivers/gpio/gpiolib.c:gpiochip_add_data_with_key() {
>     ...
>     gdev->dev.parent = gc->parent;
>     device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
>     ...
> }
> 
> When gpiochip_setup_dev() calls device_add(&gdev->dev),
> software_node_notify(&gdev->dev) increments the same managed swnode's
> refcount to 3.
> 
> However, managed software nodes cannot be shared across devices because
> software_node_notify_remove() drops two references whenever
> swnode->managed is true:
> 
> drivers/base/swnode.c:software_node_notify_remove() {
>     ...
>     swnode_put(swnode);
> 
>     if (swnode->managed) {
>         set_secondary_fwnode(dev, NULL);
>         swnode_put(swnode);
>     }
> }
> 
> When gpio_shared_remove_proxy_dev() calls auxiliary_device_delete(proxy),
> unbinding gpio-shared-proxy first removes gdev->dev, which runs
> software_node_notify_remove(&gdev->dev) and drops the swnode refcount from
> 3 to 1. Removing proxy->dev then runs
> software_node_notify_remove(&proxy->dev), where the first swnode_put()
> drops the refcount to 0 and frees swnode, and the subsequent
> swnode->managed check and second swnode_put() access freed memory.
>

FWIW this would be fixed by the patch I submitted[1] but in thhe
meantime I can switch to non-managed swnodes.

Bart

> >  
> > -	ret = auxiliary_device_add(adev);
> > +	ret = auxiliary_device_add(proxy);
> >  	if (ret) {
> > -		auxiliary_device_uninit(adev);
> > +		auxiliary_device_uninit(proxy);
> >  		return ret;
> >  	}
> 
> [Severity: Medium]
> Does this error path leak the software node if auxiliary_device_add()
> fails before device_platform_notify() is reached in device_add()?
> 
> Because device_create_managed_software_node() is called before the device
> is registered, the struct swnode is allocated and added to swnode_kset
> with refcount 1, relying on device_platform_notify_remove() ->
> software_node_notify_remove() to release it once device_platform_notify()
> has run.
> 
> If auxiliary_device_add() fails in dev_set_name() or early in device_add()
> before device_platform_notify() is called, software_node_notify_remove()
> is never invoked, and auxiliary_device_uninit() ->
> gpio_shared_proxy_dev_release() frees proxy without calling
> device_remove_software_node(dev).
> 
> [1] https://lore.kernel.org/r/20261029-gpio-shared-fwnode-lookup-v8-5-d15d75cd560f@oss.qualcomm.com
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com?part=5

[1] https://lore.kernel.org/all/20261102-swnode-only-owner-release-v1-1-ee4c9022a629@oss.qualcomm.com/
