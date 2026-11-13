Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589223;
	b=pTTkge6MlijKPC1bgABvSPb6Lvh/YbroejCTKd8sVsGlNB2M0jRyFMriMTUvw7kWnD00
	 Kvf5vQpXP7uQCUe5nMl9e5JLHYJCp3iZfQM7r7FQ7RD9Yfrs0YrQqnkoF8pF1GBhOBhNk
	 WkQSH/BWxObacrewpL29rdnlZOr2eWROCiL/E/gzqDH/dXr0+bOrIz3AxrgBmgK5avK4E
	 ce+TAsawTcVcX2YOM2rjcOhEHDg1ZNrErhsCvOm+gT/sWOBFhHEqUI+ASOFnkeCpcDqLx
	 B0KAUya7iwocK7ISzaZU3/SyhiSnW0zdrKYgPVEj3gXQC4XmR44lm8ZkdiWrh/rHsZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1bQXyVqVkKDD+UDSio32D6i/c1PAQ3TYrQsw3SnHkYE=;
	b=TyySN4jL73QpUnHXqiPCRAFugPTAubm2SyQZuWlFrb7BJurPVJiU1MoIlko5GgaQJoIh
	 dIKxgG9G1v9lY8aRR2ZyGc2bLjn2hBE+qU3Zt3Usd4g9aR0o6OOhIWOY47d2kCaGQ9T5s
	 oOSW4JmwtEHivAX+jFrD462u6lLUOm/HFmwH1/GBCgADwVzgJZLw9XW0tfBOqePD/rkpr
	 wAyinFKt+rfjbN1TmVYf0/i4S+BceuZ3OdGXm3cdmrFoNLxbVxtx+pZKbdcaTPZlZfmlp
	 ZAeIamp1mXlvIxb9JwFjguCcJejtivVN2eAXUgA3HiiRq0Rz5oQ0Qa2393dG2M5jNGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D93606E1D2
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 17:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D93606E1D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b308fca7c3so11482407b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 09:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589222; x=1795194022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bQXyVqVkKDD+UDSio32D6i/c1PAQ3TYrQsw3SnHkYE=;
        b=QdsL/1PcSBiVVM/6/RrNZ7CTsuYFf46lgeQT8qO07cSOmqjeuJn08Qawva1OY9+1/U
         uvwWeQLd/un0D7/99GOppJ/slSWfqVgSE/DC3LX4Q0JrvQXIW6JX2rJ5amBaAZZLkUwY
         36DWPaGwtQOozImxWxuFsswoWUoeiG/dBSp/HKv8EBdMZmQS6UZpwpHoXvlhAkZ3skrT
         4V7nCwxfirzgwkaZxAlH5qX1FBpUx21XrY1DiRSncTpP9Ty84DOgAmAPzD1dLYXBodaP
         k3+RCSdm3sCTTrwBrwyHJmI/oWOxcuO/R1ra7vkvzbxMRqxSsCEfSCZ5UAgi2NiuapGZ
         lCxQ==
X-Forwarded-Encrypted: i=1; AL+hErHdaop1bWshTDG/Hp16msOv0x/16M4IYTXvs9XnoKkKa9pZjL16rf2Sczk4G5INa0YRjp0uz43vS+6t@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qz+4q06BIR1jpt2FznXBYZ9GA3/euIqNCyRnTWmpjajEHd2h7
	Ytp8AuY71qV9+sd7v8zSOwgwQOy5tTC36hLpRwfYRUYo/huPxOKKoujN
X-Gm-Gg: AYBFou1qV0d/RqOJqER+H/JogMVwX/cd7LzqbiXkT3GcF94Yqze1vShf2BjvdpHmK7P
	eN5LR6UvTbmeW7PcxTsaCtcUl7VNZKNt6GnxQ3Ir/7d1gyZLesiRsgvptDholm35C/ZA37yo4ES
	/J3EGTKhoR0TXN6/6CV5gLD6d+Z7HchRuFeXjIrVOw4lYDQpzwtZQFxEJlkZGRupsolCIQ1Rl+4
	Ous/Vi7izl4bP1BcYV7bH7tKZoRNDKJciNPPcUBwM4tuk1NAz8erK/YISS2e6kozFwPKm8nSVap
	2Y/EJmzhYdEN5HMOsgCfWfNHrHnkBevkr17MsAnofpMKSSHDYOzoRCTCDG4gjR9zO9mE1MjGgso
	+zlrA7MdoueNihNdlqeqfljlHyWIzy3KvfSv/48CEo9Cof89ESnDM1uiG4Of2+S+8E4R5/MBiCw
	TxiRQeroCUpHvG59oCsIiZ1028QLqffiCU03wqKaG6WQBHcPm2sSNcLvFl0UXZI0QQjySUFsXdf
	mGJrK2IBD1gyfOn9XwNhhmS8LgzHaIFwHRthPB/oaBD1z9MRwFbKlNwSqWf1D4n/6s8NnEZgDHA
	nVY+jrLildVS7m6ZREurUg==
X-Received: by 2002:a05:690c:7:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b4aa0d0fb2mr20304817b3.7.1794589221869;
        Fri, 13 Nov 2026 09:00:21 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:40::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa96b441sm24729017b3.23.2026.11.13.09.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:00:20 -0800 (PST)
Date: Fri, 13 Nov 2026 09:00:19 -0800
From: Breno Leitao <leitao@debian.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, catalin.marinas@arm.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] gpiolib: fix leaked descriptor labels in
 gpiodev_release()
Message-ID: <avdBln4BCz_FJjFj@gmail.com>
References: <20261113-gpio-label-leak-v1-1-c6c00f8ebfff@debian.org>
 <avcs8emo3oWpYGBG@ashevche-desk.local>
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
In-Reply-To: <avcs8emo3oWpYGBG@ashevche-desk.local>

On Fri, Nov 13, 2026 at 05:29:53PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 06:38:28AM -0800, Breno Leitao wrote:
> > We are seeing kmemleak report a leaked descriptor label on linux-next.
> > 
> >   unreferenced object 0xffff0005d420f280 (size 32):
> >     comm "gpio-cdev-uaf", pid 21987, jiffies 4297166145
> >     backtrace (crc 7ff222d9):
> 
> >       kmemleak_alloc+0x40/0xd0
> >       __kmalloc_noprof+0x300/0x670
> 
> Unneeded in the report
> 
> >       desc_set_label+0x50/0x190
> >       gpiod_request_commit+0x1e8/0x358
> >       gpiod_request+0x88/0x290
> >       gpio_ioctl+0x7e4/0x1b48
> 
> >       __arm64_sys_ioctl+0xc10/0x1360
> 
> Ditto.
> 
> As documented in Submitting Patches, leave only significant lines in
> the backtrace.

Ack, I will drop them in v2.

> > The test requests a line, removes the gpio-sim chip under it, and only
> > then closes the request. By that time gpiochip_remove() has cleared
> > gdev->chip, so gpiod_free_commit() skips desc_set_label(desc, NULL), and
> > gpiodev_release() frees the descriptor array without the labels still
> > attached to it.
> > 
> > Free those labels in gpiodev_release(). No reader can reach the
> > descriptors once the device is released, so they can be freed directly
> > rather than through call_srcu(). gdev->descs is NULL there when
> > gpiochip_add_data_with_key() failed to allocate it.
> 
> Hmm... There are so many patches are flying in this area. Can you for the
> starter elaborate which Linux Next tag you are using?

Today's tree, aka next-20261112. The splat comes from a next-20261112
kernel running the gpio selftests (gpio-cdev-uaf.sh). The patch is based
on that tag, and with it the leak goes away.

> ...
> 
> > +	unsigned int i;
> 
> It's okay do define it inside the for-loop.

Ack, I will move it into the for loop.

> 
> ...
> 
> > +	/* Lines released after the chip was removed still hold their label. */
> > +	for (i = 0; gdev->descs && i < gdev->ngpio; i++)
> > +		kfree(rcu_access_pointer(gdev->descs[i].label));
> 
> Sounds to me like something that Bart addressed very recently.

If you mean commit 82028344caee ("gpiolib: synchronize updates of
descriptor labels"), it is already in next-20261112, and the leak still
happens with it. That commit serialize concurrent label updates. 

This leak is different: once gpiochip_remove() has cleared gdev->chip,
gpiod_free_commit() skips desc_set_label(desc, NULL), so the label of
any line released after that is never freed.

Thanks for the review,
--breno
