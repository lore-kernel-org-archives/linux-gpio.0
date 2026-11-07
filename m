Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082779;
	b=CjHW0Ua5ogsF0aP9BOc7PuoY7oumTYznvihBH5I9jXohNGathesduxhFtZ2KSnXeJVtx
	 VTVJ4djUXGFdU04kVkP1S14hegeE0lY1XotZJvMT4u1gPXTAyMLeYNGKOshhZAHM6VqIC
	 Kmw70Rr2yikEPTefsqx+jS9eiMNWnrbjdkXTqydZ8tctbVP1UPwKnKnkU0GzrLD2Kb45r
	 QWJ0X4hNIIEFnxOFDSTRa8vJEAYkfi3ZHpilGGUFnTxUYWHZEgJneclDVVf5w86a0KsA8
	 ZiX5PCBI3KWos4Acnof1JHGTL6aHoUNbzUfbjxoUD4MMbfhDwvblfr0Iq5cpwiPEMxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082779;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=g/QILAHardkuFuxTC3XF586hCYVEuecrYiA7fYdJbpk=;
	b=zQ7NXUpNpaS9cKoJSe9Zk97ixxzuR0pc7mBXwDunE9mP41k2O3QqCoyvqiqOR5TzUnIM
	 60kgs4gqc0/5uF/JTA3vuR3LxXG4iDZuX0K4lkGyLqkDrD7Bq3H6jf50f9Yjdwmho4OyK
	 1rHPIdPGiNXoprlNw0la7c2+ou6UssPczgwN2dfwJASDDIqWf1I9LKkulsgaeQMcsPiT+
	 FWaItrjPJLRiZWz31ajjcoY6wLbybdK2Qy7TEoFOkVhLhojwvBCRUKvr/ACg/qXq3ag8Q
	 JC5MtTUxV9yQYhCS0aV2qcOOADpPHRci6GMmoiVS83e9WD9IdpOWH+Gc82VpdjNU+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=njRbfbTZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E468606A331;
	Sat,  7 Nov 2026 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=njRbfbTZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7C21F0089F;
	Sat,  7 Nov 2026 20:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794082778;
	bh=g/QILAHardkuFuxTC3XF586hCYVEuecrYiA7fYdJbpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=njRbfbTZNMSIk/ax55AGM6ZF4XptiK3yoC1xJuRlNGy9OvBF7Zw+SObdqNIDnFFTU
	 QVEKXkyMTENfbWPBsWbEFGwPHQM/tmL4ZWn2LgkPCZMDyTyPFLrsPVPXqVMiHnFfGY
	 ADy59urmjwe/vCKLI35K6XuCZHROQ2jWz1QIwxqBQ+PqiGbjOWo9k/Ii4FQtR/9Jhs
	 Jbveo1nBe8l6VUqPv/gMRViXGhSIZy5mt04QDeEgTHFa2LWCDcQHXh+72S6P04q4dJ
	 7bYdpoktEHuuRNCS4hO6sBU0gxVFvPFS5DRPbm9Ti8JTmxUIrx0pXmc+hHPpigv0OI
	 YN/0uRUFT3GAg==
From: William Breathitt Gray <wbg@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: William Breathitt Gray <wbg@kernel.org>,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	geert+renesas@glider.be,
	andrew@codeconstruct.com.au,
	opendmb@gmail.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	jelonek.jonas@gmail.com
Subject: Re: [PATCH 3/5] gpio: 104-idi-48: fix max_register blocking the IRQ register
Date: Sat,  7 Nov 2026 15:19:31 -0500
Message-ID: <20261107201932.4159230-1-wbg@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107161255426IYcq8bz4WVHRTuqOH1BUA@zte.com.cn>
References: <20261107161255426IYcq8bz4WVHRTuqOH1BUA@zte.com.cn>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=wbg@kernel.org; h=from:subject; bh=xR8tJq+hCRn4xscrzTvmOAfByBzYqw+SWQEGfsStx7Y=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFnv24/tfvCCKc/0aaiVm3lKjUmU9Lkkn61xz7tyNf8Xl t2+GLe+o5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZjI2t8M/+y2KLetnnC2wnH1 LWvZWMbV2wKj5I4ZXXf87P96Ko9MkxAjw4xpdxt2XH6+eM4ZqZPfpr5PihVcs5rlZ514cPUS9ba IfgYA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Sat, Nov 07, 2026 at 04:12:55PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The regmap config declares max_register = 0x6, but the device's IRQ
> status/enable register lives at offset 0x7 (IDI48_IRQ_STATUS /
> IDI48_IRQ_ENABLE, also listed in the readable/precious ranges and used
> as status_base/unmask_base by the regmap-irq chip).  regmap_readable()
> and regmap_writeable() both return false for any register above
> max_register, so regmap_read() of the status register fails with -EIO
> inside regmap_irq_thread() and no GPIO interrupt is ever delivered.
> 
> Raise max_register to 0x7 so the IRQ register is accessible.
> 
> Fixes: e28432a77365 ("gpio: 104-idi-48: Migrate to the regmap-irq API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Acked-by: William Breathitt Gray <wbg@kernel.org>
