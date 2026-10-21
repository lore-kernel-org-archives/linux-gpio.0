Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585739;
	b=PwtAumehOsoH2M0dD1cheL2A3MYQWX4Jtt7Ln29CMOB5LRAxQTdZb8mOlM5KnEO3yMKZ
	 KOwxKKQKhhQxYxigzikPgBG7JnARRlq/qxK9RrbUjVBGN/DY4oWp+YHBcIvPPhcFbWufU
	 hm7K+3UqHxMDgXtq0M6w9LB3ZKBDrArd31qwL8B0Jnzbe9VYA3q5n9zv0xQFiNS2dNLYj
	 Bm86QHkX9QHWwxS/+74yhjEqDiGx+QGUK5PCHZPQEmJ7M6eCoTJRJqz1xrYZtoI32DlXU
	 hjAs1HeO9D/Ysa+3RQEj6y7qA6WEITB8JfJFYvJixbOZJHSu1fU6TtdzCN1hEDZsVOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585739;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=s3WxgvdUEFJ6GHTrMzFGV8FdssmgGqL1hZNPX+C7OH4=;
	b=LpO3ncQFOA910jqTxpDrXXY9YXiGMzjdcPDd6KlKmLSgXkezwQUC21f9exPsUC2ih7Nz
	 rmRbKC2OVlL4upQ74AUuvwEMoPsyXBG1MStnxf69moO325SqwMhin+z61wpWY8txY4JrM
	 lM9m0SGev2oMG/Cbdm7ALItI+mBl5q+Cnu9z5l1Uolvh9B+wqCC8LeVD7vd1Ex19XKXn7
	 4yj7nzzbbX+zMLqVqhhNQY6oFc3hwoi47/nn7JMDQzkR80rtH+n8muJca7csVyMrImuW0
	 ghikdcjGinWD4Xl1aeFYOl/7PJ5rpu3pLlQbO6vZWrasq3MxLpgssizMUXwqGAElwvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KYh4HceC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YX4tGLsX;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC726606A31E;
	Wed, 21 Oct 2026 12:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC726606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KYh4HceC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YX4tGLsX
Date: Wed, 21 Oct 2026 14:28:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792585737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3WxgvdUEFJ6GHTrMzFGV8FdssmgGqL1hZNPX+C7OH4=;
	b=KYh4HceC4GbfH8wnN/62Zzulk6dSPFGR82sEElB2tnUcW9MFzwBROnQzFmleK2q1oIGnL1
	gwRRDedbqhFwDkbsy6GHv4NkK8IfOz+0hsEEx3XVj2nXhHrjMa/ymdUbARAELaQxF7XWHI
	IOz7oC6+IN0UO8TQ133eW7LEcrnUV9KCrKKot2KB6dedDhgil+8/wrsmlV3h5X4PHufL3A
	bv/nn30b8yGpIXvqK0lZyHH4fgNrT8eMj30IPk2GjjWuNbGfXrWs/v2Ai7mzC/lhVnlNM3
	2vvyczV66Zf0itqkhXQoMlOvIscClH5/iFPCOzE3w5IvOafibYEF9ad4/D9W0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792585737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3WxgvdUEFJ6GHTrMzFGV8FdssmgGqL1hZNPX+C7OH4=;
	b=YX4tGLsXTRnmLhHoBKC8CsrGP7HUXz05NThVof2N4vpt4pM5davW9fORoiaUdaqh1OYg49
	rD7Palv9ITZJkRDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: use const APIs for legacy sysfs attributes
Message-ID: <20261021142431-83ac35ae-17cb-461d-9661-945c1edd7bbd@linutronix.de>
References: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
 <20261021125252-51f1f0a0-46e9-4a10-92ab-46cd099c108e@linutronix.de>
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
In-Reply-To: <20261021125252-51f1f0a0-46e9-4a10-92ab-46cd099c108e@linutronix.de>

On Wed, Oct 21, 2026 at 01:17:54PM +0200, Thomas Weißschuh wrote:
> On Wed, Oct 21, 2026 at 12:47:25PM +0200, Bartosz Golaszewski wrote:
> > Replace the deprecated non-const sysfs attribute APIs with modern const
> > variants where applicable. This leaves out the attributes embedded in
> > struct gpiod_data as this structure contains fields that are modified at
> > run-time.
> 
> Leaving the dynamically allocated attributes with non-const signatures will
> make it harder to remove the non-const APIs later on.
> Would it be possible to switch those to const signatures, too and cast away
> the constness in the store handlers?
> I see that this is a legacy interface anyways, which might be gone by the
> time we want to remove the non-const APIs. But that applies to the
> currently proposed changes, too.

If I understand correctly, the dynamically allocated attributes are only
necessary to retreive 'struct gpiod_data' in the attribute registered on the
*parent*. Those registered on the gpio device itself can just use dev_get_drvdata().
Instead of registering the 'direction' and 'value' attributes on the parent,
you could use symlinks pointing to the child attributes instead.
This would make the code a whole lot simpler.

Currently it is not possible to create symlinks to sysfs attributes, but I have
simple patch for that locally. Let me know if you are interested.


Thomas

(...)
