Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576987;
	b=MI5KcW8I8NboGgGMB6Tn08RSDZyFqk6H1KIRJM4Gh3TqktXaKsda97VvPRtb6lHpKU9V
	 E/Dm87DmGcInZZdZu2DKB9jSYaPSeSvjjXNbz35vFOYmABlUMyYpGlnb6ApGE2/Aqsg75
	 kpEin8zk7CL3SQWkdyAVE81gQcs1uvchXT6w+Y7mn9dahGHpFshtF+SNVMiqsypgoV0jt
	 2ZLryVHrAbwuS7N2VhAGVk6hQkjmHIZi55k3aOxWWNmYkKYNmvGyP/RfvHdnYMgy0Q+h8
	 BuFRYPXQXV54Y8L67xo9wWHGs7IOG0NEftfqhDDm/WsZLT/2zMpwkYzwq0rBhXJCa2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576987;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=p33Ny/DxG61d+hMSeiqFibGGUCsuG0QUySszEB6RuX8=;
	b=paNUApQGCR7TzVKkJd7Xq23L6r9sAOa+4pFBXl1emL7jyMXwDtaULzfMBH2Ru/MlnxZA
	 Gcm/7e6/+DqBBqIpJozNC7D8iT3OXPu4ZV5Icb5TbLzSanzbC/FJ+bRYCooxNs8zp3LxO
	 r9jo5/M+TUemnsZmyZ8NmsbY3ERFGCEd8ZAMIwaQfgOihbZKQkiTvrEXSBVNtLzcu55zX
	 yRSv2YU+k209uwPfyTpt7D5xjsf2m0LwNxtwpawPU/sK6y2fxUGOKkzsKSnPs6zqsd9dX
	 fPplPOR/HZ561zZ6jB5XIHsLg0ioObrRO0QCYW3jiPgB3FouWZXFqCXIF2eggK4sm0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5sz6+04;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451AF606A322
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5sz6+04
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B9F1F000D0
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576986;
	bh=p33Ny/DxG61d+hMSeiqFibGGUCsuG0QUySszEB6RuX8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Q5sz6+04Asgx5UV2auY56H/FUVzn9imqTQyvH7GlBw7yKs8Ybwon/HDtP3AQzd4iG
	 8wWzzsGlBy2TzsJUcD4eVu4JK1nAXl/pgj7I1ZSzsgMzHqZYGC0pOkgzIh3hRmsbHV
	 WjPn4hsTGGUt2x/fJvYWgHPKVcarOi5rghZcKanHJc0RCOHjzr77XOZOr2u0DMEqie
	 WoOpj4hy9H9F7BNzHZRhQ5b16yalz/jTKOO/00pWdGyXxNb6HJPkn2khblPtK7HdMK
	 fCLxmFuZiUqUl9qH8R7Sllh90BdKWRiFeBpW96QDkR4z3WqsTpjvXDhrOKQrb2huvr
	 GdHQD9SUgDcMA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so4616481fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:03:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGGnFpr26yEhcs8scUOGbJw+2jfJaCo5cwDWmYXEA/w9Hf7/dPqII+w1Fj3U2Sg1GjonmWhhMy6yrr@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6PJdeo763Lf2DkxiFHElSRuK2XZMrX6/qNBJIf7x7AkNP/Fmp
	suPfhthzXE1dwM7n61SVAE/AMc0ct8SfMIwbY95p1gD8JORBCh2QkoNBkFG6vVzCB2JJcuYv5PS
	qtEXekfbJoG+dDev2e/bxCBJtwsURk+8uVACz6knySQ==
X-Received: by 2002:a05:6512:10c1:b0:5be:4904:d2c4 with SMTP id
 2adb3069b0e04-5bfa1cda959mr632847e87.15.1792576985379; Wed, 21 Oct 2026
 03:03:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:03:04 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:03:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021095551.3283369-4-aambrozewicz@nvidia.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-gpiolib-chip-removal-v3-0-aambrozewicz@nvidia.com>
 <20261020-gpiolib-chip-removal-v3-2-aambrozewicz@nvidia.com>
 <sashiko-outbox-179011@kernel.org> <20261021095551.3283369-4-aambrozewicz@nvidia.com>
Date: Wed, 21 Oct 2026 05:03:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=McoRt46Gee=mX0TEbSM2EKjUdNjiDTx30bFwjV0T+JZQw@mail.gmail.com>
X-Gm-Features: AclHuK_jOBtk9vyJPROdyRJTd0s_7D35ArxyL6KVSe39JQXtKQmyUX3pnCxYfVw
Message-ID: <CAMRc=McoRt46Gee=mX0TEbSM2EKjUdNjiDTx30bFwjV0T+JZQw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] gpiolib: free the label of lines released after
 their chip was removed
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 11:55:52 +0200, Adrian Ambrozewicz
<aambrozewicz@nvidia.com> said:
> On Tue, Oct 20, 2026 at 01:19:01PM +0000, sashiko-bot@kernel.org wrote:
>> Can clearing desc->label before invoking guard.gc->free() and before clearing
>> GPIOD_FLAG_REQUESTED cause a concurrent for_each_hwgpio() or
>> for_each_requested_gpio() caller to pass ERR_PTR(-ENOMEM) to kfree()?
>
> Yes, but mainline gets there without this patch: gpiod_request_commit()
> sets GPIOD_FLAG_REQUESTED, calls ->request() and only then sets the
> label. Reading /sys/kernel/debug/gpio in a loop while gpio-sim lines are
> requested and released oopses gpio/for-current in kfree() within
> seconds:

Ah, the good old sashiko pre-existing issue.

>
>   BUG: unable to handle page fault for address: ffcc73074355ffc8
>   Call Trace:
>    gpio_sim_dbg_show
>    gpiolib_seq_show
>    seq_read_iter
>
> Before commit 35b545332b80 ("gpio: remove gpio_lock"), gpio_lock
> covered both the flag and the label.
>
> Bartosz, Linus: as this is in mainline, I've added you. Below is a quick
> draft of how the fix could look, on gpio/for-current: return NULL from
> gpiochip_dup_line_label() when gpiod_get_label() gives NULL, as for an
> unrequested line. With it, the test above runs 100000 cycles without an
> oops. The order in this patch then doesn't matter, so I'd keep 2/6 as
> it is.
>
> Should I submit this as a patch?
>

Sure, please do. Looks good. The rest of the patch looks good to me.

Thanks,
Bart
