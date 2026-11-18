Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016450;
	b=D4S+4sNUuYRpkJyAon/1dDoPsr1ujbBT8GiiisvGSj61RDFSmU59ssJ0gioBm6xq/h6N
	 wNf/CutLDSlVei0K/ak4PWv7apjWRT5teF3jDj4LbY3um2FqDSRUSAL+ZvlZM9gc0m5Iz
	 DfRWxBM9tMlFYzn/1JSroscMzXUL9ayWv/OkfM05i1VqJ9hgNQUJ0CA/rXgO0UC9mYOFA
	 VeoTJUb1HaPxC/R3uVzjrHml89TSNr55zTdEDlH7VTqBVwL5gjtcyDw7COX4Rvny8rJYk
	 l9EOKDKLY4oDECgHqrf94N0pfM8drdj8xZhpb9RF8b0A2+HNRMGVzkrmkdeF4HyJTvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tm6dB1EUYOThFG6qE8KMMgbho+/lR/6Gk/9spMdJzlU=;
	b=0//bxR9sDHOt6rGE5rBBJ0upupwPR6cLiafetwjRva/OyIDGZvotKfFiOzonqhNXZyKi
	 icKsDQnHoCbw44XutQU3cwxCauDy2FM3kIKojPlZyV3+/QaGL1MKqPFYkKeGIbmYnLQTY
	 bnHfnSdrNr1RCr+pkAIBWcTpcGuwIa3YTQ30KH4SlU5J9dfrsXSeioohDBZpgpEwuTgf+
	 Xiee5tlrtLJ3PJHPHlkO/J9h/CHncNMZAJWXRCLGMd7hGq9zxxPay8YiGiF+621nmJA9e
	 /oB/u1D8mRt3gAjnHhi8dlcQV2t9ffRVzvCYtEzbKC1bNgoQbPTXQ0lNNcUFTaDBFqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/T+wXSc";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3C606A331
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 15:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D3C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/T+wXSc
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b2f59de176so1040901b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016449; x=1795621249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tm6dB1EUYOThFG6qE8KMMgbho+/lR/6Gk/9spMdJzlU=;
        b=F/T+wXScP9Zgh1uofVaMqzOlFgqfmKgwCctq1qXcplNMa+wjBVSQAc7SSMeRLdzPB0
         aZ1GrJrH5iye0o4/LLMI2fA25rH7UfxV1ehkUE7OC99in1a0QZS4q4fUT1mZWt1NMlya
         gIwScpx9+n0G70Q0jOcfxLy+AeOQGv591C0uGFyEAHz9ZnLD0ZPavJuDzCS5ZaYKLAvn
         6pxQ0tEw9NUG7Dmh4UdLTFYgD1RdG/Yy3r4oDl+vYou7NUVAtvVOSdOwQBIm1lDnzDne
         iwJ1y8JgjfqQy1FPn6+euDTe3FiV8I9E4eClxfNeRAuzzroJEQOGh0/mIeVlCC2JDxXj
         qTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016449; x=1795621249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tm6dB1EUYOThFG6qE8KMMgbho+/lR/6Gk/9spMdJzlU=;
        b=WvMndtNSIONCmYN1/9mFfszNcH5x3YAPz68SskXXBZdsTazQjU/4XiDO2lwPdDAnf4
         pw2gnnIGdG4r/a6KnvgvEHyKXPeb3GCWQS7ywH+Z3rOM3xk8ANSZFtyXKypsPlD3g3ka
         BMAolMbckIP2BSS5qkxAXFFykeojQhRslsjWSM0KROz5GRVaxKzrkbr5bXZHEaz/R9Pd
         MvlYZHjebxpDYS2s9QG4yTmIiV34J7wiAKg7BpUvbTUjh10mriqe9JDa9P5mIms5YfEl
         TomFi2tjbUYmIr1AIxZSUZssiSkCiT4/yfZahI+NRskbYqlvC/wH6ECBvZqFpwd+tt3W
         qPnw==
X-Forwarded-Encrypted: i=1; AL+hErEEGqlKy1iKnxCtLaJHaPsWE0rbO/2enAAi4cnkRjQPF3obN5OYdZC+t7h/wcBjMwjVjgmU4GrvMos8@vger.kernel.org
X-Gm-Message-State: APuU4Z+uwUqGEsnGuO2xNpdn6w/h9oH3xcLyQ3Ofoq1nED4KVuos+kpJ
	epaydBbrovOxJEJ/PGFohi/R2t3ZS3bCQZfxC/zlregiyX1IQv76gxAV
X-Gm-Gg: AYBFou3kF5WmooPIzsts/62TgZetI86LCacS6R3PCpZtQca+ieoK+xmVl2z0woyDbpi
	jCRQfi9GtbI3Xy965Aokty1ImcOuogrcpTK2WEBrn49+HPPYaXLzotJxW9jceZJ9ZqQPJF7z2Bt
	Q6lLWX5C+SNcE3SlxEPYm1bTChd8l7tP7HQDhoyDpgFDQ9IxT5rwgnqLPfblhkR4i0wFhokzZN7
	bBMorlp5kuavdONlJeLij/dXMAPht4xdaN8BuWUf1kB6utJWJiwtOWCRMA3m1A99R0S9ZuOfLRo
	IYVdq2RIL4NGWQatnRRtWl0tdO2PrhceQAnkwEYIA9TUzz6IWKZNPqKpocToP6sfKH0v63xWZAJ
	QroD1cTnR0bJPmVT0MfcAv5/nA/r9V4t1tM4E4+irIL1dCUZv+VFNHJj8uU3KL1oOJ5gGHyzDsU
	RQ/ChbJ9FrMTv6dzEBD385W91KjIj9MR9a/VY+ILdXVCfvcHTRYwMa+e3vtbeauh57piw4GWml/
	fHnLkonzGXt8UJsk/BvMyPa4cqluamOjpsMMlk7vDb1XLPD9GJkVslh9zBMWzqD5Fj9q0FBfyjl
	peEElGXikVMcRlEz2pZZFGVXdoGqjxWHP4nF/kg86k/f41s8
X-Received: by 2002:a05:6a00:a244:b0:892:e080:4ed8 with SMTP id d2e1a72fcca58-8c5d48d82b8mr2645070b3a.47.1795016449055;
        Wed, 18 Nov 2026 07:40:49 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm1421203b3a.20.2026.11.18.07.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:40:48 -0800 (PST)
Date: Wed, 18 Nov 2026 23:40:41 +0800
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
Subject: Re: [PATCH v6 4/8] gpiolib: cdev: don't sleep in the SRCU read
 section in read()
Message-ID: <20261118154041.GB46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-4-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261116-gpiolib-chip-removal-v6-4-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:07PM +0200, Adrian Ambrozewicz wrote:
> linereq_read(), lineevent_read() and lineinfo_watch_read() stay in the
> gdev->srcu read section while they sleep waiting for an event, so
> gpiochip_remove() blocks in synchronize_srcu() until an event arrives
> or the reader is signalled. The device lock is held meanwhile, which
> also blocks device_shutdown():
> 
>   task:init state:D stack:0 pid:1 tgid:1 ppid:0
>   Call Trace:
>    __synchronize_srcu
>    gpiochip_remove
>    devres_release_all
>    device_release_driver_internal
>    platform_device_unregister
>    gpio_sim_device_deactivate
> 
> Check the chip in a scoped SRCU section only; nothing after the check
> dereferences it. End the wait once the chip is gone, and return -ENODEV
> if there is no event to report.
> 
> Reproduced with gpio-sim: setting "live" to 0 hangs while a reader is
> blocked in read() on a line request; with this change, the write
> returns at once and read() fails with -ENODEV.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
