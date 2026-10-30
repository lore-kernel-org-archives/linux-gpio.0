Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367302;
	b=4074klFN+evjw39NNkOsEaCSIxl3ifWA5TdRJ+X8bKvWJzJF/U+nZ1GWD6aZbggFKlR0
	 IfdOu2rnvx4KXWp4rK37RW4xokdECTK8eZJDDp2JH2MtOIfNGdHMlmSZzekCfA7yBfu/Y
	 FqChi/wCoKC72ab/CPgHU+jdzHgEHmEwUW+DQuFzNf2A66qKQfpkqzh38hdgsxKWOQ5ec
	 94k4k1er/M6sk0DnLca5H4ewV7AC8rKQp5pedKuUk+4up2WYajRr/XUfWtHC3gJ4vDvFa
	 6/01QNagoPg+ZOywAmKTATeiSIvCIGCGOvqpMJsHZoMkEBJmGg4TV62WHPK8mlGzecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367302;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uHhs2Frapb+ViGH4KaTKr8YXy+CDqz7jwoVfgAxpV0s=;
	b=oxG+6+vk5MThYJpY6RfayuNnWQ970WoTF/IDe5j6tc8XBbqIUATI1T83Eowu/QLvyGL0
	 KmEUlNz7v5YBeUrJe5XA511GWN+SZ1M9q/MTw/1m2pxNWAv23PB576a4rf2XhGjMKtFpM
	 GbMph3MED5ugJiewmWIjN0d02f09xFpUSiYANuzkE4+20a7nFZcvLEo2p3CEHIb9HX5DP
	 HGwE6I5M+zbDTrfdl1NyZtF6hHKSuR86IRSAntl0Faip9h97Q7GtrJfqQoHPhwTPsvRu8
	 UVO60rQJjxSjHPgFNKo+oGpzz8eDDKEOuq7F5Ucd8Ff7ZaheS3aHxYLT0jqSvx9thYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ke5rIw78;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AE606A31A;
	Fri, 30 Oct 2026 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ke5rIw78
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C18D1F000C1;
	Fri, 30 Oct 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793367302;
	bh=uHhs2Frapb+ViGH4KaTKr8YXy+CDqz7jwoVfgAxpV0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ke5rIw78lG2+y4r3vmmGq5CBbNux4s6fwlQZ0NTP5Qxu5qDonWDDXMOWQ4RB5QtIK
	 9HRE/E7RF+chc4O4M203eIhPPFVHFSPML0WyoT81HwIojNlv6TFTzu0G3nxg7VqvPp
	 PyNLrEf7YxQk9SXJXhrZlgrlh4o8m7WT6+3pDq634yVAaa0YdaiXz1EeD+sb+jcViW
	 dst2fLKFrpqi3GT9BnLK0/JmOQKFWvUyzpKYorYpfAkqGtMlaY93GIR2dXsw5MXEN9
	 SpgNX5aWa4HBnst7dcduLZoibMHV2K9PBT1XyKUaa2Vm2pxjxtnz/4RDG5IyoL11L+
	 ZEfuC9UY5u03g==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xMml1-00000004hHd-3tNd;
	Fri, 30 Oct 2026 14:34:59 +0100
Date: Fri, 30 Oct 2026 14:34:59 +0100
From: Johan Hovold <johan@kernel.org>
To: James Clark <jjc@jclark.com>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device
 probe
Message-ID: <auSdA8MfolA8OhdM@hovoldconsulting.com>
References: <20261030114705.3159093-1-jjc@jclark.com>
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
In-Reply-To: <20261030114705.3159093-1-jjc@jclark.com>

On Fri, Oct 30, 2026 at 06:47:05PM +0700, James Clark wrote:

> At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
> what causes the problem. The driver has generic_subclass set, so
> usb_probe_device() has already run the generic probe, which configured
> the device and bound the interface drivers. Each binding is a
> deferred-probe trigger, and the driver core re-triggers when a trigger
> happened during a probe that then deferred. So the device is re-probed
> straight away, reconfigured, its interfaces bound again, and so on for
> as long as the platform device remains unbound. This is not specific to
> shared GPIOs: it happens whenever the platform probe is deferred, and
> briefly whenever onboard_usb_dev is a module.

This is indeed a bug in the onboard_usb_dev driver as a driver is not
allowed to probe defer after it has registered devices for precisely the
reason that it will trigger a probe loop (see commit fbc35b45f9f6 ("Add
documentation on meaning of -EPROBE_DEFER")).

Any USB driver using generic_subclass that may probe defer is currently
broken.

I guess you can look into replacing generic_subclass with having the
onboard_usb_dev driver call usb_generic_driver_probe() itself or
possibly adding a pre-probe callback to usb_device_driver.

Johan
