Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020014;
	b=qgRslZ/ZsS47M7a9B6ohee4FJ4N3TE/ltgRjJgHs8CyUB5/5ClwbVIZfglSbpF9KtWvk
	 FdZXNx80Enig8+UWj5qUuKr4dV6eTihqC28qsGWtoZUl4V2x4ftvUaOwG+wdglRMhXkEf
	 Wnj8QappSLjV+STiwxqzmJDQWXE9Y7WsTMBMxTxvm34oAFnh+hsGXEEzNvL9k3oRAiB7T
	 W5QqzrFKWViijS7c3DuCD4EWUAPHTPWyFEEYDDi5vbQKpzCkled74H8rbZ+r46pqLeXPd
	 73nvx4RK3Sw5vuk1VctCcnvNj5UC5wzwK5zjR9eY5yeiITw0468JszPn9+fIJbl/fDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i+3+UkuuTd3PtMb87HnGpsXm1NEacz3pju9b62z1nDU=;
	b=cisPACYltLfsnMCy2CZmVR84XerB8W9yPAAYWpdB7UdCmUEffAOHHVQBYMBpeMpfwZEg
	 aWZp8GrFfYOd1+uHn2Z7t+i3jBymgyEWq9HtlkEtKMj3cBUrUUZm6abVl6/z0C8KaZCy0
	 MGaSfFLRDHBP19i6fDSi43yDsp3UFW+CCyvy13+ZNaQfn+biJurVsxwMgnJNp1UjEXaXW
	 ud0qylfkSaZcYydUVHg5LzjrzCqCSLS2PFbGpsosCnuJQMtFTnTz8VPiqccQq/xSy+vzL
	 Vs9vSeLBZ77PYcJTUoTgVW33J1QE0UVkTiIqs8MDbL0Xa4z9XK8MNmS7G8iKLzf3kKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4U9mTZD;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929E606A33B
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 16:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2929E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4U9mTZD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so6268095e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 08:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020012; x=1795624812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+3+UkuuTd3PtMb87HnGpsXm1NEacz3pju9b62z1nDU=;
        b=E4U9mTZDlIksJjVDWFzuHLbz7qz+H6X/WuZ+ANBvE5aFdUKR8wGJnCGbI38Iz/2/Am
         DcYffqId9bYDRaceSRCjX0vLa8N2I1YNW8Nj1qZQ3GuZ73h9A9UTkhDsV3iQxJvUqloo
         1qMFUUlT9Uexndc0moK7CkwofIBYGR4tJyD+emRsHapyfy2d+KrUNsMeTIWGDmfsN9A8
         n0Sr1ChhOkJCtqcwuL0MKUD9rqm1bq+5vNOmBkoyrmnodDxhRqx2TCVJVvvt7P3+SNGo
         Wu5SygkvVbJnpy7Ekh/QhM6Qt7MKP3IelqkgrWCVRnNLdHHFr4gSD62k/UvxKTiQFyLW
         u3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020012; x=1795624812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+3+UkuuTd3PtMb87HnGpsXm1NEacz3pju9b62z1nDU=;
        b=g4DgT3RoJ5AKLHfRCg/9zxQ6soZUgzmOTWx9XjpSH/Cb5CKw3lYpz1F4LhmP8eoDr0
         0v6yHDvSW+CTD3jtwZE9s3zDZOaL4OdQaQhfyh/NdkUgdydvLeyz2Cl5oC+Nn9pJROBd
         v2cKosMnHdXurxtWUcETGG3J9xiyEYsORrg9SiFeu6LSFEKel+rc24cZi7BBF96MAPmo
         ln9IXKwwIxoTh+cS8+XptM51+HIU7fO9WurfF2ADT4nBxvup2Cylw71c2biFogwiXxq2
         +v9ILxz+V8pgyZk4znkbQ9t0c5E2kqCY6O6Qm+rpkLhaVz3bIqQmU02a2rDALONZTMUh
         h5yA==
X-Forwarded-Encrypted: i=1; AL+hErGJYedaHhFGH4+pXxxjq10MHVgJ6kb/O6y567pgBq9XnY3z6QO3USEtvB6BHQcEiupJ0RSZgMKk+Aql@vger.kernel.org
X-Gm-Message-State: APuU4Z/l4k6TV4W+Fey0nrBVB3CPw8PVWTN/cEUpmgyI9rb8A7vlBwXs
	0tVB6LkSmLY9rKidhN6+Dt0P6zqjr2xQEe4I9c4qgZnha17BBeukxJmw
X-Gm-Gg: AYBFou2ZKxunynJv4BMm/oDgItVWEhHa1z21m4KhdMbb5mg/kYCSLJkgcVakf0vjilT
	6Ww6PkpUS8koPq2Xupg6xM4Yk6p3S+2wN5zlPtf/nQQTVa/Dq5J19CYP5HfPbUkuMUeHYz6wefW
	w0BxtjauXNL3ZocrZRk/TgTuMynFbUpYh5DweOEx+2iFQa+QbKpdTvL3vF9EHcadkLVuXS59fzp
	300Qma71AqpaIekHXYUycDq4s/CobC+RBNYbZ22obi3VLb5z803vUe+dxzH33OMJuFvL85hw7Du
	wVJuUfn6W0hsALIb6dFia2/7QRDsbUynWejIgvAajgGAbnmvnX747xz7bAKRi+zSajVOYUXQ9Je
	nR4F34nmUKARiof+KnXGAKMBzcvRrdIg0yI8H+JDEma2Fah9ivo3/yn8sPDrctS4x7nnjB098Am
	hDFISKJlpQ36MS8dvcUZSMtlnfHvp3bpBZY6UHwq95m5WdaxSJO3JX/Px73MC8MmSYJFPFU6yhZ
	4L4vE2VW/J1B//lVoOhqgQcavYM8kEunvZpk+PUHs67DERe+X17t0Rt18gsE5GZnKTIPa6yEajx
	kMUQl5akufSOgYeocKLtzyaZ2EWA
X-Received: by 2002:a05:600c:4715:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb7da3d288mr60167565e9.34.1795020012419;
        Wed, 18 Nov 2026 08:40:12 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430918sm137986135e9.13.2026.11.18.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:40:12 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Maarten Brock <Maarten.Brock@sttls.nl>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/16] HID: ft260: uart: add modem pins control via ioctl
Date: Wed, 18 Nov 2026 18:40:03 +0200
Message-ID: <20261118164004.28739-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <BR0PR05MB0491322068606AA1720DCE14C0837B2@BR0PR05MB049132.eurprd05.prod.outlook.com>
References: <BR0PR05MB0491322068606AA1720DCE14C0837B2@BR0PR05MB049132.eurprd05.prod.outlook.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 11:56:36PM +0000, Maarten Brock wrote:
>> +		if (value)
>> +			gpio->vals |= !!value << offset;
>
> Odd choice of asymmetry: !!value == true, then converted to int and shifted up.
>
>> +		else
>> +			gpio->vals &= ~BIT(offset);
>
> And here you choose to use BIT().

Thank you, you are right. Inside "if (value)" the !!value is always
1, so the set is BIT(offset). In v5 both branches use BIT(), here and
for ex_vals.

ft260_gpio_set() from patch 3 has the same two lines. v5 changes them
too, so the driver sets these bits in one way, as ft260_gpio_pin_set()
already does.

Thanks,
Michael
