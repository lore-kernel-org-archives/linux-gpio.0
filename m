Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890643;
	b=qEPLR1d0+dq65003GwSvK7ivAZ5M9O2NeHP71yW4LAUkgbALqudhu6igDL7YbsUH1oL5
	 jwh0frHzy0ZMDUUw1F/id3SyzkX39dDYWCqAlMVY+k9rihhCmTgpavj4Rwy1x+bmTYqnV
	 ush1t//PKQc2zNUu4OjE1OtZt3QcN/2dzwYfeq/EQbj2O8SjTfRTsnJbTuAzixdNJryvi
	 LOyTI2AKs5GXkZNWRS2175pSMX/vazjzVgCi2ppQnM1U2rbK56QivkgTyJ7JElnyAskCE
	 t8Vw624eboGfWdPR581PlhLy0C6MshAUNkiGT7plrUjv1izDRBhCtH+laMcG2LWDsNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LAh+fHBX5S66jM7YRVkD+ulSCs8XeJoMda5fYkmtiaE=;
	b=NPsD0kxDCmhq02Y2StI983G79mxpqgfIy8a0RSz0yZOrCpl3m7UNw6BKaXALCdFVJgXa
	 fWU3GEyzp/8RdtHD0rc2Sgo4hfI/N9SMu9pekH5hmV1V37c9wFXPwfFGntPTQQzYfBsWc
	 W+XgoKl5GPFrNDJafuOelEubCXjvZSnKAbrpIAFlpjnW6/Xh7tT85PQs6jOb3ae8srM3z
	 rTk5GljBTvP47XSMHdJHdfH2JXbftnVdR8diFNlTnhxsjDXZDBVvtd4a+WRNWSINzozC0
	 jK9y3ihdz7wRHmQzr4mn/GvQlGY6tSL14hCCWiq7GOuplHr3x5BdtSYwS9MBpezroMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFicVFFG;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73146606A328
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 14:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73146606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFicVFFG
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a1947498bso5594875eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 06:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890642; x=1794495442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAh+fHBX5S66jM7YRVkD+ulSCs8XeJoMda5fYkmtiaE=;
        b=FFicVFFG28O7DsFqcOvD49oFjNd+LS/7lAbf58ZGjBb/ARluIGEWnFD6Q2Y4X4frcq
         oYLDDZWVdImMpDkRCoTa+Obj4Oda/YGU5FfIyOd97AbrxpvgysKXTsFZfyNhN5/dTsWN
         bwsW70Zc8DDZh0BxIWQNyHuqk+3ihGVMCJ2AzXv+zzB7wHE2ir9g3VlcPAyYK4VNkOfo
         7zfMXGKq7ruZuazM2bjmZatE+7Ya5JoJCZtUJ1p7/9arTLOjUOqlE5qw5ZZROIcnHj9u
         XP+vba7vEW2rCDBgPYs65sFjmi3d+X6TW4yl/9VESaBUwFc1AGHWIXTXRTscx2OilQme
         7s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890642; x=1794495442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAh+fHBX5S66jM7YRVkD+ulSCs8XeJoMda5fYkmtiaE=;
        b=Akqu9J19EKtO5cuGN8J4mdJMj5emNcjzvB1ohXwB2f+13cGqsZSkgq7foBRPVyghNI
         zdNHFoqzpop8Qfqv+NOGuzGrxtBE9FHPPXdqbi5ZuDrnmKRiqfsbsaFnRKXQpjP+TwcC
         I13bBWm2y9xJKDP1ahKb4nSkDnIOU3bUkj7BcV1s7GZk1GQph3FZ8tkL8opplCBO0cZW
         vITCmnHXAf5EbiqjMwUrpD8anE0IoekylApYbw5l+S61YI5JwPgz0MqbeXnlj4gcBaCG
         1wpdqugZZcONKNRJeo2vVg6KpSatz32s/U6cJ8I3BlYiM9kItfsBG/09saR0hZqSej+o
         d1sg==
X-Forwarded-Encrypted: i=1; AKwUvByzryICOosjaNZBhgsVmuhlUQYOkIjHVTCpE0UW6zMdhi7WWpDMv5ODM69bvVBN2U0fyxvDCJ3EGw3w@vger.kernel.org
X-Gm-Message-State: APuU4Z+DN+MVGw0dPTx826ejOWrj5nhMmvMnxelVdJajB6AP0YgXvbBD
	Bl+k4zJlqQvrGiY/TV5AE0irjaeP/GVccZ4iPOyeg7FKuwdelWNHrBUD
X-Gm-Gg: AYBFou1XLOuiY/doSkkSZSdvhGwJsfFz+UMxhDEpSEewz1MBEyH1/n5oD9C128JBSkP
	KToED9A483IjY62C6br5MQicArA9xSSHTkkdk/76epexs8Uuf9aPZP/JzdaVIe/H7R5n6+XTLWp
	PL6udPai9ZYzmpSR3kNc9n/et17DNfn1nJrnN0E7J56h8MuXbVS8KMGwAUdrmmOKNda1q7nWxXk
	kYoxdAB4DFniiJ1NjaZoFkSyp3HINiqwy5KTwrGwiOliApiuQJfXTCyQMrSzU768528+CWVswTZ
	hb0Wu7n3+p4qkNOJV1ZqEpUW6/E/tvnpXmAHubOWoLt3K9CcoGKJ1g3GGzpBRHk0Fz6wdPosfQS
	SBlHCIpaVObpUetwRygBXHNdZ/niJm38W+BS1gQOWg2bIe6MTJmcojsrOLrb6vLQGAWvDoFWYTc
	PAqjQ1XG5U7fBQ6ZJOymFAV9pbUgjl7b2E98YUHx1SdNhKKg/zl48J1vkeLFhSkYv3R7+nitfml
	/AWVgyNlJ/wcD+eKc1UsF0XdGe8MrjmRxaHhsdNBwrrfGXflcjNzbcndUSTtNrH0koscXVLxzH2
	MqF1vKyhjWjqKj4XKNMAX+AyZYDIL6DfN6xeogoIy5t1LPCt
X-Received: by 2002:a05:693c:6393:20b0:369:f291:49da with SMTP id 5a478bee46e88-36a4243f71emr28876543eec.40.1793890642366;
        Thu, 05 Nov 2026 06:57:22 -0800 (PST)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm23369977eec.27.2026.11.05.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:57:21 -0800 (PST)
Date: Thu, 5 Nov 2026 22:57:11 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: cdev: fix waitqueue deadlock on chip deregistration
Message-ID: <20261105145711.GA92894@rigel>
References: <20261105-gpio-cdev-srcu-deadlock-v1-1-6047117030ec@oss.qualcomm.com>
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
In-Reply-To: <20261105-gpio-cdev-srcu-deadlock-v1-1-6047117030ec@oss.qualcomm.com>

On Thu, Nov 05, 2026 at 03:47:59PM +0100, Bartosz Golaszewski wrote:
> The three calls to wait_event_interruptible_locked() sleep while holding
> gdev->srcu. In gpiochip_remove(), synchronize_srcu() runs before
> gcdev_unregister(). The latter fires the waitqueue wakeup events from
> the notifier callbacks, so a reader blocked on an empty FIFO never leaves
> its SRCU section and the removal will block forever in the former.
> 
> Since rcu_access_pointer() is a plain READ_ONCE(), we don't really need
> to take the SRCU read lock. We don't access the chip structure after
> checking it. Remove the lock and instead make the waitqueue aware of the
> possible chip deregistration. Keep the initial gdev->chip checks as
> removing them may change the error codes visible to user-space, for
> instance in cases of a non-blocking read on an empty fifo.
> 
> Ideally, we'd factor out the common code into a dedicated helper but
> there doesn't seem to exist a clean way of passing a kfifo as argument
> so let's open-code the three call sites.
> 
> Cc: stable@vger.kernel.org
> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I've had it on my TODO list for a while. I vaguely remember someone
> reporting it to me but can't find the reference anymore. Please feel
> free to add a Reported-by: and Closes:.
> 

Isn't this the same as patch 4/7 in Adrian's series[1]?

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/20261103-gpiolib-chip-removal-v5-4-aambrozewicz@nvidia.com/

