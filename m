Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620664071DE
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397350; cv=none; b=bsPjVWxAzdVbf7fyoTd6SXiA//+EOsQVfFvYPHCAPRdGim0nKp7Zy08PeKEePIJgXePIfOPvMLhCxLRtNliLZmIhHH240tOaXnqZF59LtyPH0xbFde3VfC0LE7j8vhGzMejPF3nH5yhAx2/Vc/uUb0reUExvDRzAmMpkznfdFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397350; c=relaxed/simple;
	bh=dtESdVNm5Uyq+WsB5q7A+flDEcFfp0XndOYr6KOo+Nw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=h/VvAxE02uagV0JEr9e29zO2+5RxhCb0RxD+CDKcFS012W+ZZHdvutCXN9E9FY1OU4nOIEb7o/eQHpHdvxZki3Mh3OaNltCsQkwfTqVJ8DX0ZUiDxFTV0Qg8g8hBKNpS3c5TunSb8Dugy17flOPAcSUoBsUbiW9R9U04FHGhGjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOgMhH3E; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOgMhH3E"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e5d0ee1951so11851545ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397348; x=1793002148; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VGbRH8whTW1xe91pmC1KbquILe+PEXcyh5kpYwROQW0=;
        b=IOgMhH3EfLXdWxcQQJIFZ8NM90N3VshgbCyEgrwaEhGWyRD9TQjljb0tDqVdq+YccC
         p63fvhb9ypUkmot45JO0QjatKdEoUfEa7ddZPIL3q+klSRG39Hz082zIcmxPmOypSzyd
         gHisylMloMXHa7XAT4a1y93Pqw+lbghZ6C3jflzurHFaSA5Jt7Alv2JYPc/xEt0DFW/b
         IJTxf71FsQ4kh228sJ4JB/ivh/fbZrayzSOBpyauNiZWvOEaVfXBTDJA2eDYF0wYeuVU
         FDNXeuPqMQVQHrecREF2GJckOi5Zvl0VlEjGnSPRXA0xX0JLNdqT9pA9K74WUc8PjvfR
         tdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397348; x=1793002148;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGbRH8whTW1xe91pmC1KbquILe+PEXcyh5kpYwROQW0=;
        b=wkRT1II5n2UuXOT2t162zMZJ1XvaoFkguH4louGUbDUnDqDLxjcxXkN/J8LMGn3XNx
         iJW6BUgyjUD0tiER7fbs3isLs5H74pqnJEkUIdWzWMUZdXLaVeOLfKtJ8fT22vRJZ/Zj
         jxR8o3kRIcVUyZtdjvvdMZdPOdZ6dE+vYfQC9PMRZkYJrJeXNpTlu8LptUv+afHyyS9h
         pF7Po+tn96tOP9HMf7Fe3A8wHng6B+QsEaDiBl6Yuhj9+6UstLZ6aFj6iAW0PY30DdDT
         8E/wA7whsKIhgmicFH5nMWF4k876OHBKfgX2JNIhrotEJYNSMqudcYVJkMTKpRdlr0Zr
         qlrw==
X-Forwarded-Encrypted: i=1; AKwUvBzNel8YECIyfbHliJliWYH1QDru/AVrXnA7+YE20gV0zwhY063F86aDduOz8OuEC6KLhT7khA62ANeA@vger.kernel.org
X-Gm-Message-State: AFq9FYLEXCuMjZuh8W2/5HF8Ut0nNQ47ZLVk1eDFTfj3iz/J6PpsM9yZ
	krN+TFHdSZggODitonjhcQzUlFq5qAcoshkoD09ieZu8XaroVNlmp7Qy
X-Gm-Gg: AYBFou3gKLbyFssjSbPiUHPcPUCfJ+gupqqe+gDHfEG5Vb8tAfYYtL2ispNdLs4pXpG
	20t/Hjmt7d7uIZ2Rau/AIk1kKJCY2IjwUyHJ/EPkCuTOFhOBM6U4w72WGH8ChEI1JJgitJZdQi+
	fZKpFMrGQrMUU5Hwd+r+//2JdVEXRR25MIMw97Odk4hwk7+iXkvZ78LZz6uFs+k5W0y+oCruTZM
	aReXO2HKEo2rH+hd28ZZBi+TAWGJEYQ6Gw9bkgkt0K1ZAYEUfrSuyl5e5ySFtgje5vnn3wHBsib
	F/1wCrhVXLK7ogGNl6964W/h/CE14hnmErY9Yc158+C9NK4ZXMY7ioqX4rl6Kfg5vampjTYCH8Z
	R9V0cQ8naa9KjoWwh71sq7rnRvJAeIqJQeI0O3JBbQi/dgfJF5D/HjgoXw7AS5joWS/5hMu/h6K
	fvOaaMj8wJg4DRDmted427NQN6xgm/ehhgjDTsTz7AaAFzMpX3w6MKo4QzsB0HyNLlbZiF50HBR
	MxxEGX0IczAo5zihi+kAobpx9yIJYBNw26KKgAa0wZS64xaH7Z+xcFQlG3VdE3u9Aod05g34oJZ
	bJI3Y7l8lqKu6WgQJfkPtsZs2zXrScrum0VQPn1S9kgox75B
X-Received: by 2002:a17:902:d4c9:b0:2e9:66c4:1717 with SMTP id d9443c01a7336-2e9a735f740mr54440775ad.61.1792397347649;
        Mon, 19 Oct 2026 01:09:07 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::d63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e833f1asm35236695ad.43.2026.10.19.01.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 01:09:05 -0700
Message-Id: <DM8NTXCWM1GK.AA1YGD7D8E60@gmail.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Rosen Penev"
 <rosenp@gmail.com>
Cc: "Linus Walleij" <linusw@kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@free-electrons.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "open list" <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4] gpio: mvebu: fix Armada XP per-CPU mask register
 save/restore
From: "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018230117.23497-1-rosenp@gmail.com>
 <CAMRc=MeUt=dwZUybCx=JUvDs9ZWa8Zyg6DzJy_bxwzn_k=RgFA@mail.gmail.com>
In-Reply-To: <CAMRc=MeUt=dwZUybCx=JUvDs9ZWa8Zyg6DzJy_bxwzn_k=RgFA@mail.gmail.com>

On Mon Oct 19, 2026 at 12:59 AM PDT, Bartosz Golaszewski wrote:
> On Mon, 19 Oct 2026 01:01:17 +0200, Rosen Penev <rosenp@gmail.com> said:
>> The Armada XP variant keeps the per-CPU edge/level mask registers in a
>> second I/O window (percpu_regs) rather than in the main GPIO window.
>> The suspend and resume paths however read and wrote them through
>> mvchip->regs with the per-CPU offsets, which hits the global
>> GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
>> was therefore lost across suspend/resume, so a level line could end up
>> unmasked behind genirq's back and trigger an interrupt storm once
>> interrupts are re-enabled.
>>
>> Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
>> both the suspend save and the resume restore paths, matching the
>> mask/unmask handlers and the probe-time masking.
>>
>> Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>  v4: rebase again
>>  v3: rebase again
>>  v2: rebase
>
> Are you rebasing it on top of the gpio/for-next branch of the GPIO git tr=
ee
> as indicated in MAINTAINERS? Because this still fails to apply. :(
I cloned it, yes.
>
> Bart


