Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016382;
	b=3b6lwX5SAaU1xtLem6EPOhPLZS8bHOWnO+MlnCGdfDJEcVnFJnj5NyydrWaszeo9CHKW
	 rf5hwSC+fP8AE8PLM0KVpJJl/vPFbJ989TGapLkyUEUsvfOjV0U+0YpuzN5A+ZJnYvUoJ
	 T7Q+TMaK6wTnXXMdrNLZQtZEvB60zXemUcNthqxsJ2x4peed7bqgktX9UA50p3xksf14V
	 k7v3WZjOP+cwRix3GOkqm78paNAYxqs+vCk8Kl2iBURHi20L+M3XMMNCqatdEvWR8phfo
	 rXRKsfIbH02YJSgqdGoT56pgwg/wTg4Fi3YEO/Hd49Ufmiuv/8kgbElPGVEZv452ogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5ax3Lipd+AcivWLlLBqoyKXnHoFVYuzVHK/u3oZQ3q8=;
	b=HkO+q3dpwGUYSEO9Z+ZXdc+rrSBEYkJ3DW6wrQwkzcjYvh8RxwRcU1SnOSXLLerWPJYs
	 59mxPdg+8cr339ajZBPyu9pjuRpm4R9FyO+qnn5octWuNp4fZBerrE7EI5glEy52GdVOP
	 cOyKP7xG0NOh4ZmPN3ZwDxZGoV2pLdQHgQeuPmg3V5Je1+tmFSnopw7OV4aH36pj7hsdv
	 dEPtANQtHvEG+CkUmsQJyg8Egg6dd7+WaAM8tuRdxNGbXxPL29jr+CXzf6sK3H7JKiuoW
	 dWWhxQBhM3cDa9XLRo8mwfqvjCMZSiL+mjX2fjYzU+u+TYXq1g3Lac+S72Zp4mI8EbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChN4RtDN;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157B60A2606
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 15:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D157B60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChN4RtDN
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8629ef8613aso457439a34.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016381; x=1795621181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ax3Lipd+AcivWLlLBqoyKXnHoFVYuzVHK/u3oZQ3q8=;
        b=ChN4RtDNL4FAZnfKWrkcqtZR9IwHiD412LxnId3JvdDhc10w9CNmIAgsuSll3tHp2S
         w3KfmBSLf8edMN/+2ABaalGwez79ruoZ/SLHAW5f8PboytQDbTeWW3KMmtPzNVcAS1XL
         LacFnrw01OSIW6IiBARxJfk2riKOsOXA2hPsu+tHeK7H8HqUZwqtrRDkUEh4+I3EVtAm
         KlaNLYjxxtrM5ZeDXLOKDL37vL6bOMnswIdnJehE7PBi4+/Tg7d7t/Imgru0kNALnnUR
         +pnmMFx/6a5ctuXYw9NsymB5Ipe0OBvr0807ptcZxoYCgpG623H5kq+8yLlmuu05TsF4
         /j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016381; x=1795621181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ax3Lipd+AcivWLlLBqoyKXnHoFVYuzVHK/u3oZQ3q8=;
        b=ElljWYP+lATFlZLMBPgMd+Cp4zLgEtPyvU/C9Tk4v49AZ+YMhbpB33pys2caIVoZOz
         xKdqlRfCCOadB9HGbogMqo1HHQ97oivRWZuc9jT8c4mK1EFPKdJnt8OLjaY/YX60i0z7
         qK/fzP/fm5sZrASVjPuZxqjFUemTUKiKmVcU/3Yp/Pz+r3JPAHRaTSxO+r/VVkLwub3m
         i0NfrCAWcCGa46/BwKUvyKRV2wlYFF11+CbF3d9sdZFBGI00cIm0UDiA8Uirr0GSBt+R
         zkM9H4xWlqJ5Y4eVRFMTngBPQVvV3/BhtEHddbIX6FJnIISgM/x1zQu1PAgu/frGC7ue
         9nfw==
X-Forwarded-Encrypted: i=1; AL+hErGUvjPChgtienxa6kEptbs4Dj3+cPlfRNcUHUDeomH2jkcJHNo2ZOW38tMgIW2xRau0rJCKYPcAlBfA@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z0ZEw2mxlXBa94Fd+0o3ZelI/eLpDvsCcJl9JphGhdWDYcRgs
	NzWrUZF7ymwUPbruAp/wqJAp+U3AWSUACHDVElKMsmejmbg4Yg5x8kiv
X-Gm-Gg: AYBFou2ChWQMNmJFxm1blV4GSKeQXxqyx3V2zum5hS6t6HmntkMcR3/pBg4QON2IVEs
	0KgeTDrNlicZ2NcpcnNVZXy6yNlyRF+AnQ1Evm4Iv6enVPoRvH5WpMGEgQ6m3U3UBfXvyLgi2xt
	1Et+trnl0uMDvLu/b/TpUFBnf5Y8rUTRakf3kakeXqwGVTu4JHP1h1X6iYQRFG29PN08VNjNz4T
	eWtN8fj9d4KDMKrhk9yXi3/RkiZ/zqeWMKQfAH/zK71ymvyhSFbK7/BMXlHR4HwPTIgdh4uN2Wi
	gvy+5EMYJ1qPnUxU8jRo4BbTSE0aE/yNEsjAHhDHksQQ+2JMAIZrwbBlTfklm1zcTzVOdSgKtkx
	vNBUK+Cfwss+JRLZ4lspGwI280LHpmV5f/Psdm7HhMNch9DN/GKnHxQLumSEVSDzRBLiR//y1BM
	/EGKQ3Z0qPxqxkwbxtgrJsOnO1w6qOL6GONVVXUVFC7LPWJxGYEvuHtDEzcyIC5N3R7hExxL66P
	nrgfF3oMaNozmnkXTdCtQV4YdiZewxo0+lwWU0tsZ6BUP4F6Hrfw7AX1Jm/sAAcScQCWw/ZI+au
	A92YDn77XHy5OndMQMIUjz69i9cXjZcC9YefpNlidNcdwUN9
X-Received: by 2002:a05:6808:220e:b0:573:f2e:2bee with SMTP id 5614622812f47-57741723566mr3647243b6e.37.1795016380749;
        Wed, 18 Nov 2026 07:39:40 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57775461e70sm1987291b6e.0.2026.11.18.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:39:39 -0800 (PST)
Date: Wed, 18 Nov 2026 23:39:31 +0800
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
Subject: Re: [PATCH v6 3/8] gpiolib: cdev: do not free line IRQs again after
 the chip is removed
Message-ID: <20261118153931.GA46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-3-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261116-gpiolib-chip-removal-v6-3-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:06PM +0200, Adrian Ambrozewicz wrote:
> Since commit ec8b6f55b981 ("gpio: free irqs that are still requested
> when the chip is being removed"), gpiochip_remove() frees the IRQs
> still installed on the chip's lines. A line request or v1 line event
> kept open across the removal frees its IRQ again on release. If the
> mapping is gone, that can touch freed memory, as reported with
> virtio-gpio; if the number was reused, free_irq() warns:
> 
>   Trying to free already-free IRQ 28
>   WARNING: kernel/irq/manage.c:1881 at free_irq+0x193/0x2d0, CPU#2: gpio-hold/111
>   Call Trace:
>    linereq_free
>    linereq_release
>    __fput
> 
> Stop edge detection from the device notifier that gpiochip_remove()
> calls, under config_mutex so that it does not race a reconfiguration.
> Free the IRQ there only if it still has an action, as gpiochip_remove()
> frees only those on lines flagged as used for IRQs. The release path
> then finds nothing left to free.
> 
> Reproduced with gpio-sim: remove the chip under an open request with
> edge detection, set it up again and request the same line, then close
> the first request. Every cycle warns; with this change, 100 cycles pass.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
