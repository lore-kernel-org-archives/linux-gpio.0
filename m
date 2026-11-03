Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722429;
	b=ivIrJNHWH9EPKKK5UqmtS5KRU7ckYeyReZ3eNddZvMNF0RfNhuUHzvnsIZDWAiDw1Flx
	 WuuSLYQLcNAJ/u3XEuxGiqoNs260WLHCr/iPxjm6d0TCoUadek4/vWFZZhUSVOK1LE2ME
	 fjjQboxeO+q2Nc5RqRbI0QteI1cYhfBBwUBlw5ORzqwICEj9vSQH6cC7YXtvfzl3iUj1w
	 hgMOztUhfpPS2ZgJ+AOiLxXPqiliboCzJOe7zO+r4hq7ndXFc5lKi3NtMNGu5ox5FVf3g
	 XAMX/eOoFNn6sKI43JbzoExyAALIXRkhx6rYGQCGD547MVVF2hsxxYRTbGoQKBnee3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
	b=4YMMbVzWAynYLJPw+UKlzTnQhg2PKjie/Ozuu8K0eUN42BrjE7bSMEJoGdt7UrjcOSWY
	 zv/X8Xowt9PdgsSsfVgjQYEQ0nioInVC4/9N3jv8vjXkICdtksMItnvMoJXgI7MKYsu/s
	 jPljmDmAPeoLcB+TU8C8VvbRgj5+pMU2tlEcCLjJ0EUTxi8p0qIpvti2IR2HoKhkYNxZ8
	 nVyc4oHHtlSBKdghyTnxMVAkg43Ile4s+pCB5SM39g5+KljVA8cb9gJTDuKPgOWBFNnsn
	 EA936eRo+5sZ8VTvBvHkBwO9WpOoIPFeEreMcdg1xR5atiwethmSXDiRod0BHDql/Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9d4b7Ef;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A2606A32C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 16:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4A2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9d4b7Ef
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so33225655e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722428; x=1794327228; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=F9d4b7EfncJF5ES2462x+Zjbhb4TYd33M/P+3Y0mSFXz0xngNNtM0a9BCDpY6aPyFn
         EccfZpdj51j50gsAn5T7iZGoF2czsnhL/CgXIRFFxaUQJ8AIy8hcQrohqa7xZ4IiyqZS
         4NOjesdM1xKIaKZRE1G5Cns2zp+BR0b0zP6LwIF7DN0YiH5hclwDOhZw1f7cUwtj1DvR
         d7GpzilbGp54raXH9QSRZdvcbKUMIbHdXFLMJKGuUnVlJj4pW78JqPgHT7fWZtj6D4e2
         +qENEHrrgxujIH3GBfoqRlRVbsXxPpJBnVFJ9CMZRaPj6XSd+FYZJhscJXOpj2oYJg8x
         0GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722428; x=1794327228;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=RIXnbPdtxoQO/F4HAoGURelvHB5AEVFUyy85E0R+avmus6HQodWY6YDs5y4q1+XH44
         Yus3qtXGBd6SjeTXT9mfGC3nn1Qa6WjXK4wipyZjRWsMXAZdUEVoGAk1wVGR4p2EkD8G
         AVeoCPJa90Cx7Fy8Ta6GmcBFByy+KgmSeEQGHi4ZoRU/Ncr2jqy4gM/HPuQK49oTiBsO
         P8zmiDA/vHwUdjaBlpVtCqe74RgyQQMRuA3ohjjfrvRBhHzeCaH2uGFTeC8ygP0NfcPw
         nXq1Q8veD0gW51B+qNxOxIqX+/6KhvVW4evWt8tQd+naLfY5IEDGOZp7+IcD/Pi+6vXx
         KCJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKi3Ihs0YdqOy0nhxCIJJpaD3zhnp8BNODhdDAw4I3XPBPXqKF7Aej0/2nBwDWatcg1MYJ6Q+T4oYf@vger.kernel.org
X-Gm-Message-State: APuU4Z8G7IPPMd0TpUI+gjuIHBeMbpAj2pZ8/u66zfOdKPzI87cS31hc
	fTUk6f5YTKSQqfWmEQgwg3F9vAmhojcyDGiH/7sg9wDJ29fU7tuQgbgy
X-Gm-Gg: AYBFou1aUa5wSHRtqc+dUd/Wk8Vx2SFovRh+ECsqmza7EzPScEK4TXnRy6CfQULyEIz
	lWnJAFyM2/WaQXN3Tsqa8J6kmdAmJIBt8/fXVzTfBYYKDEXclUvKZDDaPi3LfgluOcClFJgs1eD
	rQ9NVzTiHZJmUtzBVOA8eWorTT9hpf9gbz5at8hZanue9bKh56UYl6qAOG9dP9Sz60vZ+huCEXi
	aPbE7loBgm2HH27LdH76K0wsjzp4lMf2pS7QuXO7VDtwZBYp5Qr/lWeEPK9dvMn7CXSSwSJ+aSc
	GUuwM6Vhn3+boc0lt8oNi8lvnN86tzIONt/lveCeJSkVJvW2HUIxwi4ADNrqOhKkI4tC0NYZ9W+
	8CRwXnqjLkmbkhVBwk85J0y0ch9wJ5orNGxipFQ+AapekgAXbEmDXX63EPI3C+b4iWhdWrrw9AX
	VpqphX6aqdCc2XFAf/tyL/PVMv2ZMRtghsXijr+KLGfbJGhpWvYHfn/QjuJ/sL2MZYK3M+bEEl5
	MKwJ1naSH/pMBBcGzIg+LRuDphfst11Lcrpz4RNnES9b1A0Z+KCy8QNoSoAoVwUwCYM/RnonDDJ
	u2n98RmI3Yey3I1yruPOnn3y7ktujd/Rth4Ey4F6U679KJWoRsGM+ur07jq4eF71i1SysMdhsHp
	+xjAS1eC1PqlGqw==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr306531505e9.13.1793722427449;
        Tue, 03 Nov 2026 08:13:47 -0800 (PST)
Received: from [127.0.1.1] (ppp91-78-241-225.pppoe.mtu-net.ru. [91.78.241.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm24419506f8f.15.2026.11.03.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject:
 Re: [PATCH v3 07/11] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-7-181bb0d23f4c@gmail.com>
 <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
Date: Wed, 04 Nov 2026 02:13:37 +1000
Message-ID: <179372241749.1222507.6207957568716226558@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Guenter,

On Mon, Oct 19, 2026 at 06:46:41PM -0700, Guenter Roeck wrote:
> The issues raised by Sashiko will need to be addressed, or you'll need
> to explain why they are non-issues.

Thanks for having a look. All three are real and are fixed in the next
version:

1. cpus_read_lock() in the clock notifier (lock inversion with CPU
   hotplug through cpufreq): the driver no longer takes cpus_read_lock()
   anywhere. The armed state and the rate are published with
   WRITE_ONCE() and applied with on_each_cpu(); a CPU coming online
   meanwhile either sees the new values in its hotplug callback or is
   reached by on_each_cpu().

2. armed set after on_each_cpu() in start, racing with a rate change:
   the flag is now set first, and the start path and the clock notifier
   each have a full barrier between their store and their load, so
   either the watchdog is started with the new rate or the notifier sees
   it armed and reloads it.

3. Watchdog state lost in a deep idle state: a CPU PM notifier sets the
   watchdog of the CPU up again on CPU_PM_EXIT/CPU_PM_ENTER_FAILED when
   the device is active and the watchdog mode bit is gone. It does not
   reload a watchdog that kept running, so idle exits do not count as
   pings.

The earlier Sashiko points (prescaler of a watchdog left running by the
boot loader, rate changes, resume) were handled in v2 and v3.

As the driver is not specific to the Cortina SoC, the next version will
be a standalone patch to you and Wim instead of part of the CS75xx
series. It will be sent after v7.4-rc1.

Fil

