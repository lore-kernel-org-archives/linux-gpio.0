Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795236437;
	b=BeP4YMAkRFKVz/S3W8AkZX7xn5xCT9DFmLSxR1FIYcEWLyBwWUO/TEzkr0OZfnpcd7Um
	 I34qO6GEtZLlyeL415rewlJEOFW0Salo8Z/+PNTqvVEDB1wCLnXf2IxNVZh23R0SJ070n
	 njH6Laq62Z13f7NuLylzu11nRWCe69xsrIOH/5MNoxdzrkOn7wAAn0ohbbJiurAK5ZRao
	 HhW1cstDJCwM9gsLxrlZiit92Z/YkSslwjnezH9LKZ9pGCUUN3JgxU6w+J2NXaV5UhwHx
	 lqiKJjcDaEE6QV/YoPV+Le557JMgj6N3A+qXgnSDDnKa5rByoS857+w2mcFOIFOZAhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795236437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TKS3/Pf4zfqMdy6L2c4CbTel3Q9nSiZwM2cv9aIwwZQ=;
	b=wQ6vxk49Zfd0XFBiMo9M1N3dK7DFR3TF80zb0wn+DuoRuEgrySG9NIan1Grml0SNU7qL
	 9F45++Wc/BBwBoBOmoLUS6qFZaboo53Q0VAVBC1typTelEzXhecj5UcnOcGEd9GIfbP7m
	 NU2it/p1q/DfIGJKB0Zv5uPHuEWoe8dux3C1p5Dw9yOubClp+f/JtGJOhzqhOSbVU9dxj
	 aE0vx5a1URBAlp5hNQNBXzOdSVqbgIvsE2ijQNqO+EyLhbemk9Mmunxg3SwppqGig2kIK
	 m9q5osTTetAlIbalozkSzpN3XoOfPJnTxZ+m95F22w4sFcc+Jrz+81ygCIJ7qQ0vOLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q86qFYKx;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02228606A6B0
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 04:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02228606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q86qFYKx
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso836975a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 20:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795236429; x=1795841229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKS3/Pf4zfqMdy6L2c4CbTel3Q9nSiZwM2cv9aIwwZQ=;
        b=q86qFYKxONhQ1/NZxv2vQ6vlQ+KQUtpuKzFqAjG+3Vrr/H/1sWHMm5YelBh9Nupnjt
         nVnbmzLeiEekkl9Wn5Sao2wAESMvGwnONAEky6RxNaol/cdKUd7aoRpXkPQ9v6r+2uDC
         y+Q37nTsMWjQNvtW3zDi/yNGwJ4/FNi92y/btYc7Yt7K/xYAGiYonefnzYv2k/iV2pE6
         cE7NwC7MJpv8MMqxtmI4K/sNgWMKg2H7KDztYQtHhzS2tKss3sWeljvoGfdcaBStue0o
         vpI8Ls6AW1+sx2WohEBZPFAadFhv23f9n3ztZ1lFqiCPDJBUkQcPYq6xLeU5kBTiEKUj
         Qn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795236429; x=1795841229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKS3/Pf4zfqMdy6L2c4CbTel3Q9nSiZwM2cv9aIwwZQ=;
        b=SxVrSoTBV0D6/CJRqhwEaQQ4XdvPZ0/UbOHz0fq4j42d4KotTNGDxf5QwHFjWk//Yl
         s81tnNeNgyCm//Mjk0OV56ZjpQuXOGpP3h4SDtU2OyMeykTLh8Nk+qgIMmzUm6zxW1mn
         cJKMbReJm1VDXUNzx87aSesOn0i8pzmHkQ1/JVSx3lYpCy73zaXZDhrroW+xS8USq0u2
         KXC8aiPR7va9nufFM7AFbK1+jKNm9+2RdZlZIurX3yYfTXEwJuyf2mJk+Zr6XlkAgM+O
         gI9t5p8GncD51PZ1j/t9Co+bmi7LrgmpfViiPMOL1h0CRjb/+8/MCi1jTaxM6IgP39Kn
         ByBA==
X-Forwarded-Encrypted: i=1; AL+hErE/WmLMIHpx43ud2S/nYTUzsYXLhnDslVPtKgdrhQrKHdRsoqtLT2e3IaeO+LPJ9t+eHc8NCWSjC80p@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZjfBaST7lhRAbKkwifAS1KBtZoSzeMwAzeJFwwD47dULY+W3u
	dEl9gVeRVVHqJFTIidVzAew4kvuk4fO+AOhSXSzxuXarTxO5sjhKRMAB
X-Gm-Gg: AZFdTZcQO0yXojrT2MDKp6zpzZdWVMldntK/p6Nb1j87zV6/qvdw0mBgjzhzzLjHW/B
	qJX5QnV8yFIeW5UvL/rxIc6n9T28UbafChrXwOLmxm7hlhDzy4ZYv5llHi9D6nf79xB1cOa0fbZ
	fM/5uxmGZmwWJuowLarTXDkAMjsrUWpPDmQiYCSoNUlhtvtTpRkvuKLZwzUyYLWQpqvg9Xkb7ht
	rG+uoHSI3bY1EO7McZaxZyjAFxsRxWLcdVUsS0yXhmgoVHK1nERxHH2aGh84mNh9XCpKne/Ka3V
	xXnTq0rYh8TPp4b8QSGitWX2ErPZmtHgEmUnYmN05KGkHfgSr5r7hh4c2fi9TSGTScgiHoA1zJ1
	C/FB5uoiE/pZK9rCy9kSJPfeP+hr/CNu14/HVEtZRqY7zNjo7Jx79QtGdUSXj4f57LWS5oV6h/P
	gTGitbTxaAPPoljiwtFF/eBgUpyzSvIbpvDMXxvZ0k5EgL5vgn/QthPD+yHHs6+hk88W+lKWLuq
	e8mMin6PxZUb9bVJXrSgKnUW4j6OZfcdUJKtnf5g+rOIehpSVC40yZlXb1dzK+XC78cSwnMl4SM
	+N+D1BdVMQVxk6Fq2OTTnCDngBLgrQNNp1Eb8ugcP3miPbxcVA==
X-Received: by 2002:a17:90b:3fc5:b0:3b4:166a:27cf with SMTP id 98e67ed59e1d1-3b41c902ba8mr5025493a91.21.1795236429159;
        Fri, 20 Nov 2026 20:47:09 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm6815488a91.8.2026.11.20.20.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:47:08 -0800 (PST)
Date: Sat, 21 Nov 2026 12:46:57 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 7/8] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261121044657.GA17013@rigel>
References: <20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com>
 <20261120-gpiolib-chip-removal-v7-7-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261120-gpiolib-chip-removal-v7-7-aambrozewicz@nvidia.com>

On Fri, Nov 20, 2026 at 10:13:59AM +0200, Adrian Ambrozewicz wrote:
> gpiochip_remove() force-frees the remaining IRQs, removes the irqchip,
> and only then calls the device notifier on which the character device
> frees its own IRQs. The character device can then free an IRQ it no
> longer owns: after its mapping was disposed of and the number reused, or
> from a release that races gpiod_free_irqs() and
> gpiochip_irqchip_remove(). free_irq() then warns "Trying to free
> already-free IRQ" or uses a disposed descriptor.
> 
> Call the notifier once the chip pointer is cleared and the SRCU grace
> period has elapsed, when no ioctl can request IRQs any more, and free
> the remaining IRQs after it. Have the release paths free their IRQs
> before unregistering from the notifier, under the lock its callback
> takes (config_mutex, or a new mutex for v1 line events). Herve Codina
> first proposed calling the notifier earlier [1].
> 
> IRQs that in-kernel users leave requested are now freed after the chip
> pointer is cleared, when gpiod_*() calls on the chip fail.
> 
> Reproduced with a test-only chip on the hierarchical irqchip: both races
> warn in all 30 cycles; with this change, none does.
> 
> Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/ [1]
> Fixes: ec8b6f55b981 ("gpio: free irqs that are still requested when the chip is being removed")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 37 ++++++++++++++++++++++++++-----------
>  drivers/gpio/gpiolib.c      | 28 +++++++++++++++++++++++-----
>  2 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index d829f7d00b5e..ceecce572a52 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1590,19 +1590,25 @@ static void linereq_free(struct linereq *lr)
>  {
>  	unsigned int i;
>  
> +	/*
> +	 * Stop edge detection while still registered for the notification, so
> +	 * that gpiochip_remove() does not get past it until the IRQs are freed.
> +	 */
> +	scoped_guard(mutex, &lr->config_mutex) {
> +		for (i = 0; i < lr->num_lines; i++)
> +			edge_detector_stop(&lr->lines[i]);
> +	}
> +
>  	if (lr->device_unregistered_nb.notifier_call)
>  		blocking_notifier_chain_unregister(&lr->gdev->device_notifier,
>  						   &lr->device_unregistered_nb);
>  
> -	for (i = 0; i < lr->num_lines; i++) {
> -		if (lr->lines[i].desc) {
> -			edge_detector_stop(&lr->lines[i]);
> -			gpiod_free(lr->lines[i].desc);
> -		}
> -	}
> +	for (i = 0; i < lr->num_lines; i++)
> +		gpiod_free(lr->lines[i].desc);
>  	kfifo_free(&lr->events);
>  	kfree(lr->label);
>  	gpio_device_put(lr->gdev);
> +	mutex_destroy(&lr->config_mutex);
>  	kvfree(lr);
>  }
>  
> @@ -1673,6 +1679,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  	if (!lr)
>  		return -ENOMEM;
>  	lr->num_lines = ulr.num_lines;
> +	mutex_init(&lr->config_mutex);
>  
>  	lr->gdev = gpio_device_get(gdev);
>  
> @@ -1690,7 +1697,6 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  			return -ENOMEM;
>  	}
>  
> -	mutex_init(&lr->config_mutex);

What is the rationale for relocating the mutex_init()?
Looks like a gratuitous change, and if this patch is going to be
backported then it should be kept minimal.

>  	init_waitqueue_head(&lr->wait);
>  	INIT_KFIFO(lr->events);
>  	lr->event_buffer_size = ulr.event_buffer_size;
> @@ -1790,6 +1796,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>   * @eflags: the event flags this line was requested with
>   * @irq: the interrupt that trigger in response to events on this GPIO
>   * @irq_label: the name @irq was requested with
> + * @irq_lock: serializes freeing @irq on release and on chip removal
>   * @wait: wait queue that handles blocking reads of events
>   * @device_unregistered_nb: notifier block for receiving gdev unregister events
>   * @events: KFIFO for the GPIO events
> @@ -1804,6 +1811,8 @@ struct lineevent_state {
>  	u32 eflags;
>  	int irq;
>  	char *irq_label;
> +	/* release vs. chip removal notifier */
> +	struct mutex irq_lock;
>  	wait_queue_head_t wait;
>  	struct notifier_block device_unregistered_nb;
>  	DECLARE_KFIFO(events, struct gpioevent_data, 16);
> @@ -1839,8 +1848,10 @@ static int lineevent_unregistered_notify(struct notifier_block *nb,
>  	struct lineevent_state *le = container_of(nb, struct lineevent_state,
>  						  device_unregistered_nb);
>  
> -	free_line_irq(le->irq, le, &le->irq_label);
> -	le->irq = 0;
> +	scoped_guard(mutex, &le->irq_lock) {
> +		free_line_irq(le->irq, le, &le->irq_label);
> +		le->irq = 0;
> +	}

The lines removed/guarded were added in patch 3, so note that this patch is
dependent on patch 3 in the description[1].

>  
>  	wake_up_poll(&le->wait, EPOLLIN | EPOLLERR);
>  
> @@ -1920,14 +1931,18 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
>  
>  static void lineevent_free(struct lineevent_state *le)
>  {
> +	scoped_guard(mutex, &le->irq_lock) {
> +		free_line_irq(le->irq, le, &le->irq_label);
> +		le->irq = 0;
> +	}
>  	if (le->device_unregistered_nb.notifier_call)
>  		blocking_notifier_chain_unregister(&le->gdev->device_notifier,
>  						   &le->device_unregistered_nb);
> -	free_line_irq(le->irq, le, &le->irq_label);

The line removed/guarded was added in patch 5, so note that this patch is
dependent on patch 5 in the description[1].

>  	if (le->desc)
>  		gpiod_free(le->desc);
>  	kfree(le->label);
>  	gpio_device_put(le->gdev);
> +	mutex_destroy(&le->irq_lock);
>  	kfree(le);
>  }
>  
> @@ -2101,6 +2116,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>  	le = kzalloc_obj(*le);
>  	if (!le)
>  		return -ENOMEM;
> +	mutex_init(&le->irq_lock);
>  	le->gdev = gpio_device_get(gdev);
>  
>  	if (eventreq.consumer_label[0] != '\0') {
> @@ -2836,5 +2852,4 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
>  void gpiolib_cdev_unregister(struct gpio_device *gdev)
>  {
>  	cdev_device_del(&gdev->chrdev, &gdev->dev);
> -	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
>  }
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9832f755312f..e0ba17a73c4b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -854,11 +854,22 @@ bool gpiochip_line_is_valid(const struct gpio_chip *gc,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
>  
> -static void gpiod_free_irqs(struct gpio_desc *desc)
> +static void gpiod_free_irqs(struct gpio_chip *gc, struct gpio_desc *desc)
>  {
> -	int irq = gpiod_to_irq(desc);
> -	struct irq_desc *irqd = irq_to_desc(irq);
> +	struct irq_desc *irqd;
>  	void *cookie;
> +	int irq;
> +
> +	/* Called with gdev->chip already NULL, so gpiod_to_irq() can't be used. */
> +	if (!gc->to_irq)
> +		return;
> +	irq = gc->to_irq(gc, gpiod_hwgpio(desc));
> +	if (irq <= 0)
> +		return;
> +
> +	irqd = irq_to_desc(irq);
> +	if (!irqd)
> +		return;
>  
>  	for (;;) {
>  		/*
> @@ -890,7 +901,7 @@ static void gpiochip_free_remaining_irqs(struct gpio_chip *gc)
>  	struct gpio_desc *desc;
>  
>  	for_each_gpio_desc_with_flag(gc, desc, GPIOD_FLAG_USED_AS_IRQ)
> -		gpiod_free_irqs(desc);
> +		gpiod_free_irqs(gc, desc);
>  }
>  
>  static void gpiodev_release(struct device *dev)
> @@ -1439,7 +1450,6 @@ void gpiochip_remove(struct gpio_chip *gc)
>  	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
>  	gpiochip_sysfs_unregister(gc);
>  	gpiochip_free_hogs(gc);
> -	gpiochip_free_remaining_irqs(gc);
>  
>  	scoped_guard(mutex, &gpio_devices_lock)
>  		list_del_rcu(&gdev->list);
> @@ -1448,6 +1458,14 @@ void gpiochip_remove(struct gpio_chip *gc)
>  	/* Numb the device, cancelling all outstanding operations */
>  	rcu_assign_pointer(gdev->chip, NULL);
>  	synchronize_srcu(&gdev->srcu);
> +
> +	/*
> +	 * No new interrupts can be requested through the character device now.
> +	 * Have it free the ones it holds before forcibly freeing the rest, and
> +	 * both before the irqchip and its mappings go away.
> +	 */
> +	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
> +	gpiochip_free_remaining_irqs(gc);
>  	gpio_device_teardown_shared(gdev);
>  	gpiochip_irqchip_remove(gc);
>  	acpi_gpiochip_remove(gc);
> -- 
> 2.43.0

Cheers,
Kent.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes

