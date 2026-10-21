Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581476;
	b=g5lOTzVECsHpwbmqsI1i1sui7JoUf3tPkFfi0GzzZ0ScAhMQaz5Ay9Dcw041hgAMBA8+
	 WkqXfUmN4O5wGrQvhs1ta8g5CzeRRrRPYDpKlvpDjDyca3ihKnyEht1s/MZFCX7mtepA0
	 IR41OEb4zUyX2hk3BCEEGm+EKOTGCFqAHTZl6fnwm67Mo3RQ2h3Z8CFirD6+5VuZKP+qI
	 SEV3C+/pZQbIeDiHUz3mAW5sU5XWtMQ8+3Zf36CmE+ii6SWQ2fWLMSEGhQxHcJCFgJYZf
	 AqhKFjAF7TN4gUBoU6n60m9eZYNZaIHrgRYT9HAayiYgi8mr3faK7DOd5IFNzEPHlfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581476;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MeYqPKfQxEx6TFtkBA+2c8TC2QaEZR/ygqS6gSHIr68=;
	b=Aj+slbLrANxBjL9/XFRqO8nqzJv1CFeEQENdxwHNcUjBUkVCsY3ZazipxozVLPKKtiEL
	 lXA32kRP9+kF9wPaVhxJtupmg1lTKPo5h1jHoC7LgdxE7/l9qrIFdmZIrY/s7zhzi7r/j
	 5GC8uQHOSK0icKJizkTXMRz0RUGdJt2Vmj2c0m8UPI3nWDYwOe3MiGhTgl+gVpRvfU7/a
	 5tvuOI/qVZyxO2ihNvveT9TKwPV+WEdN0xnCF3P5av9tteCVyGpHQQOUPdNeuJ4oP6+ir
	 qXAB0lY+OfYiichh0nZ1HhmBChNEyv/yLiDE5hM06E0zwngqigcLZemKt2nJP4qN+7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YlW2bSE9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="f+i/gQ6q";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2AE606A319;
	Wed, 21 Oct 2026 11:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E2AE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YlW2bSE9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=f+i/gQ6q
Date: Wed, 21 Oct 2026 13:17:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792581474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeYqPKfQxEx6TFtkBA+2c8TC2QaEZR/ygqS6gSHIr68=;
	b=YlW2bSE9pIYM6V5iAr0tM7cx7LxEQtg4FlEJbKDa9Vto0cNKzn+wQ6E/nqW9/s96r8JOUW
	ei7a7r2zwQWBuX9CsDfr8VUryz0qDNF4/3+BfQUConMstBUxQfK5ZNU4Mo8wMuD5DJ4Jnd
	dfRB1eOtUrL1UTW5YNEp7r2fP0xb8g29PjLaUZQt295V80D4JSCYrfKEEA9IAlQ/iLFKNr
	ZvLvpi7lg7cG00Bn/IMmWhF8Z9E8L3maxc4koMRkG2OL52ZpZUmlrArD6IwHps97RhCvnE
	V6m4+2w38eHLPele7VAiAtCjks2MM9ulTvkE7x44tmypoKbymTAb2n7gVLF44Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792581474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeYqPKfQxEx6TFtkBA+2c8TC2QaEZR/ygqS6gSHIr68=;
	b=f+i/gQ6qv3TrI8JBs0j5LKp3zGUt5sp+FASgpVXZ+WroaTvPLTZSb+D2yQ+rhoRyuGLguh
	CqFkBG9MPBxwl7Cg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: use const APIs for legacy sysfs attributes
Message-ID: <20261021125252-51f1f0a0-46e9-4a10-92ab-46cd099c108e@linutronix.de>
References: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
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
In-Reply-To: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 12:47:25PM +0200, Bartosz Golaszewski wrote:
> Replace the deprecated non-const sysfs attribute APIs with modern const
> variants where applicable. This leaves out the attributes embedded in
> struct gpiod_data as this structure contains fields that are modified at
> run-time.

Leaving the dynamically allocated attributes with non-const signatures will
make it harder to remove the non-const APIs later on.
Would it be possible to switch those to const signatures, too and cast away
the constness in the store handlers?
I see that this is a legacy interface anyways, which might be gone by the
time we want to remove the non-const APIs. But that applies to the
currently proposed changes, too.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The code looks good.

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/gpio/gpiolib-sysfs.c | 37 ++++++++++++++++++-------------------
>  1 file changed, 18 insertions(+), 19 deletions(-)

(...)
