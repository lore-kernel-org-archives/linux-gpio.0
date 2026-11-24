Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540251;
	b=U/5yvZYTbMoR4qlwxihboFyMBA7CYjCUneX4foh438yG+nPl4GIsEMA4o0bH7uzTqnVx
	 64CCPwHnK88hODvMFOdMKZLGRFFCjeJDNH1ZCptk4G+qR0UZd7O6Gl8R8S7GJIb8djhGF
	 VC69eC1kA3ZWIyVjwusDITQ3U9Baly6M4Z7H6Iy3R/M5q3+Ra5RxMhgdz77O+Y6qeP6cD
	 1CuGsd9LgEAAxCdLLS5x9DDZ9hvSw0kJwZnwLD7TOwJJ2jVSDlQWP4MKkrp8JToKKL5ZY
	 /UC/gW32Ecg9RTrUCROiJEk7NHKJ2NNZDjMH5WNEF6Ngr1Lg71Bak+ydouJ6gitpH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=u8kv2zYNDRxVVHOiDhvZgUHGX0zKQbtOrLo9540hpuo=;
	b=QJXR1/+u1CtBTlUV6d4uKa6Q6rOcA0+82Y19oCbLljXl2nPOcZP8637/6ha01ANczEFL
	 7dEdMZaSDhAkXANJrRvkqNLLB8DkJouJ9cqhVlvoSnU6b9uoyaRKRWE8TXIBOw1d2lpD/
	 NMxXa4zPeSs0t9FLuJ6sl0cmXJ74U7IcshnKHVBufU5ntP2Uf9QEw/60vmiN8YReZoJiM
	 M4xQkJsXURGIVX7b3QFFVAJn91SreQc8vJ1gLt4xErH69QjPsUBtA4Ic7pYWYPqg3W0Pe
	 iv3MWqrDpCsMQbEeqpXbqfxWR63QuEC7SO29PvT+MnegKEbhIJ104WZXpsCAsmxP7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESCI8Weh;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA42606A681
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA42606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESCI8Weh
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843cf077f10so6633380a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540249; x=1796145049; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u8kv2zYNDRxVVHOiDhvZgUHGX0zKQbtOrLo9540hpuo=;
        b=ESCI8Wehg58uJN9SHkEiE+nEdgJUZDkWTjGDxOa+lqjLHEH89QsNf9J6d5OM+7eVdF
         IHuj9QNzXnI9dRKVMjaHDnDUID7et+aws4Nhglh33DnRaW+UIHzVLqiKWGh8H7MBz7GP
         +z8+4O8/xRbljkGGIe3JWjKOGes8xdiX3gqIeva2m+PnbI6QhQg2FvtmBcQdkuOAJy/f
         QLDXB8NaaS1Bd9HukZy8yWzx4YnWjiwzNuIdR2BpfwdKZYHREEM19K5fxzIc+Y9TXINb
         xK2/o78SgOxzGjcPoCKnlzM9vvpt2ZQK6inEam5eSUIaMQhZddsQL35LukCAcpXwz7xe
         8nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540249; x=1796145049;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u8kv2zYNDRxVVHOiDhvZgUHGX0zKQbtOrLo9540hpuo=;
        b=PIBRQMxnfD4x23QG0ndAfk6R860bmzPM2jwyt2uenn3Po03q4P/TeyYe2bTpedXMh6
         j+5zzM9NgyeyVFWCKHtl5/DM9Wii7+QG8rxJucZcF7Xh9gYWKDWn45qoxSPWpWUbIzNu
         A5fyESTup4iuRXQwilxzppo31QGkiInQ1PDmn7s8ryfeiEfN85gEfSbimF8YsBPwb/2J
         ksm5QgPqfOFpu9DMEfOy7UnraW9QsCONgYd8sHwzRjwfHR7aBSK3hNeP8lviL4h9eIDf
         HdJ3hVjfW1NtfghV3CeX32/TGW+1pqzKkobgHCzJiYfv0F1MGBdk9FV4Mu8crqzuMvok
         zn7Q==
X-Forwarded-Encrypted: i=1; AL+hErF1M5KSxVNrBwE8R9HVWAeG3BHhah6qdtqlHj7pdYMiQvRLqXOdSdyOQOvXvnK0jXKhcOPVidVj45GQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8ljTTWDJvF6N0WON4ZQilXgZqAJBAKDC8VZ7m7eWXQFD2s4zFd
	+f4Pm3/+ShKQGe+e8e8v1jcDDCEgTcuKfdCy6LGfIuoV74vlRYld0M/O
X-Gm-Gg: AZFdTZdbrAXAdrS1rAye7a2s2sXMsdzrlpJL9n2Q3Ho+4hcCj6DediqRZpiny/VWZkD
	R5AEvmNXTCM61glntkGQDOQ6x3h0me6kjKUmBRZGuGLASZs9Cnz7g/QLtsmNniTYnjDV1yJKinq
	IXoENSFQYYb7KSX9SQJtoyt6unPCpGnlFqPJZAzymZySAzVFl1L6moFiWe/6eS7ZfcT+n7cZzJr
	G+Oq3Y1I+sLR/Gdyfrox4fdTPLBNzFcKpBwctxhS0hcbVSPwz0t6fhiPLH8L2zb6uDoaDyuJa+1
	+mxfkPywUC8w4PxTgZ3o3p0HKkWD83x3WoeDRkXovvwBBvy4s0Gb+WaOeY950SV/Q0alfQAUYFC
	PuvJX7gJNYlA+OLeqve/3pVR2nCB7UgjfS5ZpYXWHQuoOs6z5eMQK2FIOQf4C2J6szShFAEyxJy
	blYBoIBNg0Isb8hKIo+xM6JOryNJLU40anv3rUCORHSOQrUFNp/4IXXeFxCMPHbgvZJuyzyebmv
	NTx8t/7Hd9uU3YHLOra2d6CH0hHFEMjXkQVhksWDKDQObTZ2lSGk6v2G9utT3xzb0pGctenCS7M
	wnHt2SreMMdKjiY=
X-Received: by 2002:a05:6830:6411:b0:81f:8a6d:7b52 with SMTP id 46e09a7af769-8631593a1cdmr16409262a34.24.1795540249576;
        Tue, 24 Nov 2026 09:10:49 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:10:49 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH v2 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
Date: Wed, 25 Nov 2026 01:10:34 +0800
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArFBWsC/5XNQQ6DIBCF4as0rDuNoKLtqvdoXCCMOokKATRtj
 HcvNfEA3c0/i/dtLKAnDOxx2ZjHlQLZOYW4Xpge1NwjkEnNRCYk56KAxbVWeQOOZh39CMoYoDl
 qnpXVeSCExTnrI2BdtUWGPJdlwdKm89jR+/BeTeqBQrT+c/Ar/31PKf9TWjkI6EQuhLpzWUvz7
 CdF403biTX7vn8BM5i6TuoAAAA=
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Add missing groups and functions in Tigerlake & Alderlake & Meteorlake
for INTC1055 & INTC1057 & INTC105E.
Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000".
Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
on the AANT0F04.

The pinctrl-upboard is provide additional driving power & pin mux function
through native SOC pins->FPGA/CPLD->hat pins for flexable board level
applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

To: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>
To: Linus Walleij <linusw@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>
Cc: JunYingLai <junyinglai@aaeon.com.tw>
Cc: Louis Chen <louischen@aaeon.com.tw>
Cc: BillyChou <BillyChou@aaeon.com.tw>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Gary Wang <is0124@gmail.com>

Changes in v2:
- Add missing SoB.
- Fix CPLD I2C pinmux-select by good method and update commit message.
- Link to v1: https://lore.kernel.org/r/20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-2-f2322a91686d@gmail.com

---
Gary Wang (5):
      pinctrl: tigerlake: add ish_uart groups and functions for INTC1055
      pinctrl: alderlake: add some groups and functions for INTC1057
      pinctrl: meteorlake: add some groups and functions for INTC105E
      pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mode
      pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP boards support

 drivers/pinctrl/intel/pinctrl-alderlake.c  |  40 +++++++++++
 drivers/pinctrl/intel/pinctrl-meteorlake.c |  32 +++++++++
 drivers/pinctrl/intel/pinctrl-tigerlake.c  |   4 ++
 drivers/pinctrl/pinctrl-upboard.c          | 108 ++++++++++++++++++++++++++---
 4 files changed, 176 insertions(+), 8 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261124-upboard-pinctrl-add-intc1057-intc105e-support-e87b40e13654

Best regards,
-- 
Gary Wang <is0124@gmail.com>

