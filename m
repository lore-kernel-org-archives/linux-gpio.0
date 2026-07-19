Received: from mail-wr2-f2.google.com (mail-wr2-f2.google.com [74.125.225.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3142391829
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784458397; cv=none; b=I0ENZKSE8eAmVxVNFzZeZ3LojECqYqRtx2piRXSbIdJRF/ZbCd0Ph42yiYzsnh9ohWyvBrv3035PUWoaaBCdAM4+ag0LJPfDgBsHEYuvinbEc9W77f/OEPc5rrFkQ3Skhd8oyBFhtEkX6vlbkVtnAIvuDglfyJgq3p+LADnrLxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784458397; c=relaxed/simple;
	bh=MTmnte4S6UYOUnm3zY8MP0s6uJEXNbI1TcU1jv9yttM=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Subject; b=XofNxKkl9kWi27+rKikJseJk0XjcnBk//lBt4n8IYzY2qKzfdkJ2ePAZreECbecWlc964xuC4CAYyBd+o0hAyQ98uN4tAvjTjF3T7jfW5PaX8fRRhSwbCO6SxYwF3EEWoxBLGUTWT8U6W4o5GhTx/kqbxK8ljgVky31ssJiab80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlikNVQL; arc=none smtp.client-ip=74.125.225.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlikNVQL"
Received: by mail-wr2-f2.google.com with SMTP id ffacd0b85a97d-4705f607bcbso333489f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784458394; x=1785063194; darn=vger.kernel.org;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTmnte4S6UYOUnm3zY8MP0s6uJEXNbI1TcU1jv9yttM=;
        b=RlikNVQL/WTftt1jHSjO35k+aEWhT5vm2nvKB80YtYywW7fFQqqE2JtBfFtHWUwTuT
         dwtagjzrEt+E0EsvYiV4ryCUrLRMCIIKzWIwutdX52vIfwp2Oc0/hVBpR5tNWCKKAGpE
         9KZMeUy+QnXKry5zkV8A12jdRm9X5mNHGhVN++t88KFE6BhdeQu3geDqZc+l1GKUnBPI
         8i3x53l39qi5NXmHr7gnNMQPFX/Tqv5BmR/KPli9bUoQOUGWMErMujTXyDfIxsio3/gp
         m0IVPm4zu8TLSh9hzthIe662ZDdNag8W93gU9o4+W1n2ExAjZWGZxtij5C1YsnARoJok
         OdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784458394; x=1785063194;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTmnte4S6UYOUnm3zY8MP0s6uJEXNbI1TcU1jv9yttM=;
        b=N2p6r3ApcEl9yPx27vqOkZUKPWLhPsurKU7GWgS0QZGYIWH4BW+sPASAjFKNT1Lj7e
         DH4AvM7UkjNjAn9cNLWQZXpp4jfsh5ey2JYCIQaCjDhrW+fx9FtOW1FooPUPkA8FK1sa
         K3NuQ9ZVtue23L4HMqizB1RohhyCcf6gdS/55A/M2Kk6zAlRK8d/JYoawEzZKiEWoOGQ
         4s0zoj64FfZXGec/VlBGQm3DgQqDaWqvPooankB1eXAKfNbcGgvJmouI/sY3OB2m5UWP
         f8eyvTlzAdKKt+6RqynsrLOo2++oLLCUhfCGEJoq8+S2VZA5OCtqGPhFdtj1vbDNxAGj
         rnrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3WxayKbhVooJI+rgsrrM6N6zNKMkytOyMlJSzsxHw+gkVChafRSYEPzq2gA9TPLOxx8OzG74F69aK@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjaI8a+uEA2BQEulLuZLDq98VE2uQlMXAeBFwrfT4mxYLq9eY
	3pepyhq31R6qR2LpQWrMxPHFuFSq4ti6GecJEwy06Ltxbc5i+yRvg+TK
X-Gm-Gg: AfdE7cmP5pec+uhTFSimA/thd0lhH+JxFoW58O0Q9CJyJBqMdQNrL1zrfoCeEk4qTnc
	5lcUTWO0KKvEuRDz758Mpij7eO8A8BNE6g6Grl9iFDgeU9zVCB+xexPKfKLYEtkACUlxf9KzS0a
	yr0oNfGbt+XXP/pP3umr3kNy8AgBIdvl8d8kWWZM9WUebfdkC3y9Du4IRM1BIvEa2zaf2H2RYqn
	N6ERh/w9PrBWrwxYobOBoaMwzNyHMXHdN4VIArG3AmgU/cCYo0H/IEt6MTzakhbc6AGBmyy6rIo
	fKLKZujoXmxiLpzvnSw8evzBgKpbE9E7BZpuIp+k+ClWSgpTq6KeDpWBI45zXpg9cCKoTA6KNJK
	cPyKR1Yv9x+uTDFY+oJ/TTGcwhlUv72jKudClHxOk4BRK+xQILpyis+t6iYDyrJ4Og1gPuGtDmJ
	xT63E=
X-Received: by 2002:a05:600c:e548:20b0:490:ec79:3046 with SMTP id 5b1f17b1804b1-4954a38c438mr40676245e9.0.1784458393740;
        Sun, 19 Jul 2026 03:53:13 -0700 (PDT)
Received: from [127.0.1.1] ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e075d4sm141919705e9.1.2026.07.19.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 03:53:13 -0700 (PDT)
Message-ID: <6a5cac99.b39440a8.65068.2901@mx.google.com>
Date: Sun, 19 Jul 2026 03:53:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: =?utf-8?q?Metehan_G=C3=BCnen?= <metehangnen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org
In-Reply-To: <2026071855-booted-filth-ff9a@gregkh>
References: <2026071855-booted-filth-ff9a@gregkh>
Subject: =?utf-8?q?Re=3A_=5BPATCH_1/4=5D_include/uapi/linux=3A_add_gxfp=5Fioctl=2Eh_f?=
 =?utf-8?q?or_GXFP5130_fingerprint_sensor?=

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTE6MDg6MDZBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBXaHkgZG8geW91IGdldCB0byB1c2UgIkciIGhlcmU/CgpJIGRvbid0LiBJIGNoZWNrZWQgRG9j
dW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL2lvY3RsL2lvY3RsLW51bWJlci5yc3QKYW5kICdHJyBp
cyBhbHJlYWR5IGFsbG9jYXRlZCB0byBtdWx0aXBsZSBzdWJzeXN0ZW1zLiBJIHdpbGwgcGljayBh
IGZyZWUKbWFnaWMgbnVtYmVyIGZyb20gdGhlIHVuYWxsb2NhdGVkIHJhbmdlcyBhbmQgcmVnaXN0
ZXIgaXQgaW4gdGhhdCBmaWxlCmluIHYyLgoKVGhhbmtzLApNZXRlaGFuIEfDvG5lbg==

