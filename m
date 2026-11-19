Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100932;
	b=Qo7vDFVqfLI/nz9JrhihghT0YjOyaGwPjQSpmnhm6qEP3k5A75GoLZaSyDOQRHmW/CcF
	 adCXTVCwjAQ7cQKJAyHLrCVAnbdny/FfvRitUlHo2vbf022QEkOixLbPHMDoYuQ9ljHZw
	 vCA60xCneG3oyter9Rvl21/qVaWD+FjS8shQegvDCig3YNF+VyEdF/cFNQvrKO2W31eIF
	 sB9zG4yJwDjgXcWfKXwpwmKAbX0HblGB97jrvhv7rX6ftOWzwfGfjldU+Q2lQJCDF0Hkh
	 g8WrGYa2JvG0wYFND03vsYw0yKEj33HuWDSdHYyDNz1TVhZd/BNGzaGnCRT70fQAHBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
	b=Gl9xfbyzyna63b12KEmvUs6wug26Hkab2UvU/PNvWt7/kZpTwN8fGB1vXQlc851nfedy
	 vMncfsqzS+zhNQvB0dH9JCdzQKyu9Eg6vbvZwOP7yCwfQTbKyJ5PxxtV3ZQ3PNULvX8Xr
	 WEmvVeRW6i+uoDoCgMHt1x8YpbyKbE3Scy/tBrytpbDcKc+dnJKG+dYohEEmkSyzLIgGz
	 8hGm3HntV8gbT0+mfCPIzwpWoqkcRL4766b9gpf2UlOJMkeYlYZLp+LNidDjeJjR2BYES
	 VXbwX/YPSt0+12bjQlJcAEWA4g/Ez8FZKZw2WHxrXFPfBa7yBwGn4wbEBdXJpVuYb0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Ly+rnE;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4156E606A32A
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 15:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4156E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Ly+rnE
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso4746001fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100930; x=1795705730; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=P6Ly+rnEbtb3B56g4DtN4Fx71CgoOhCEXnaEgUpHcKAS8z6q+OC9aofCeJlbWWx72+
         2lws9UULc+V1eCneSwRN4OOY4fGNgcjG5NzKfldBMjScI+0fzgEW7m3wmru3i+luxMYU
         UkCQaJ2cNA+h9J6K8+GfHL1NUszyiAqzanMK66aR1kQs1oLx7VMaPzMFD/6IMeWzCs9X
         1NXG/laty78FQvJvWaYERAfgw9fN1LHBaG8CfM/lUuhqS6bbgozHduRlKicmrh+VX4Cm
         F3CKFwNzWc3GSHWCcnDVmiVmNDcy3GoBvqrHvR2UMkSKVnNSyVS1LRI+QAF8q2vjUOFH
         oR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100930; x=1795705730;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=o7GUD41jpYv2R82Rhn51QOwVqqPxmZnqryP4tVY0OpIe5sYEbtveE3Du5f1AgcacPu
         uH1GN9DAmcpfwSDGnqjkhdA/W/TzstmQp3T/6U/HaugGoYMoumXUtbECXR4eQ/aGLEjY
         a2VvfECYvUxr9mv3Q0olNmF/djNZlZ4KUfBeIYhytdxNOtPRtB97Uh3rZySQEeRa5Tqv
         2wlAEiBwS/Rbxmg3XeKm7q5FKBsLYJJnYVBr7Biif2I2sCY79mVpOcVJe6bzHMB4/PDF
         hihZTuH1hn6i6H7l0x5TpBy7JxBduILt0h50h6RGVl+//JWCvKKCAkIJ6Dksaxe26dtl
         TvyA==
X-Forwarded-Encrypted: i=1; AL+hErGNFTZH0fEP37LYCEZ0w8Q1l34311yboUQTEdMBuZ28ZPx8c/kozN/z5TZs2TYfCVonQpyL4NlWSCjY@vger.kernel.org
X-Gm-Message-State: APuU4Z9gJvV1thX50K5TpzBCIZ8gKLIw6jK6m8JfZYNj5e3CpLH/za9O
	buDhjPbtFNt7YzPwBUzBytZVYXq9z7xdslPgOQQ+DTz/AEGywZ8D+tYj
X-Gm-Gg: AYBFou06nEJyAGDNmVQFyKWjBLBs8QhY8YkmErUE929olZuveC19RnGLWObxxqT6yhs
	nXyNSpatr44K8MfupNzFEbXAbkL5VG7pqY2otF32ziNDkeJ4jHF2+/Y2c6JqLTIvGhL0Zf67Ems
	/KrmpEk46C+SgCLDFwULifI74jomdfPw/ZnvX4MiPtJJGTNMB1Y471vmhNUV62q6Py7UkOP9avg
	F9LD5Dgi6bi+D6OwYXSHQEK6tcgwYpZo9oL4P4rxdjw5GsNrFOPLPOQIzHxAtQkQMJyeTNsMXRA
	CyRYsqK5qgIoag0u+2xhTI+ENpfo4k8qFKXjUixnASrg4AEFCnkICCm+MLqJZMZhQV3xkokhqKT
	jR6AGoacY/p2RnxFX4GvHwg7LmkGb9fYTM3TJvWjwsiFK5p6C0lRuROFDJy3YAbXfnMKzi7EVRS
	sQaqSeqEcHQBHhLpmRZcSi2xnsCtMDKDzqQWJ8hgnnfJ9ukvxQ2T4QQVjFlqA7mEuM2ySVZRvzL
	cekExR5/X3e4uVow9yct0DIiXRacK2F7kf106Lk3LipaVEXlDHNHsGb5QEk+sr7nX2/BgIyLc59
	unjvOyqVtisBWeBt7EgxYegGn5ACxpQ1IEAlZ5tTdUDwQxr8Kk3N3D8=
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id 38308e7fff4ca-3ae7f9da258mr961291fa.11.1795100930127;
        Thu, 19 Nov 2026 07:08:50 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebef2d0sm11809841fa.37.2026.11.19.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
 <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
Date: Thu, 19 Nov 2026 18:08:33 +0300
Message-ID: <179510091368.5.7008617353574583652@gmail.com>
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

Hi Bart,

On Thu, Nov 19, 2026 at 02:42:27PM +0100, Bartosz Golaszewski wrote:
> The driver looks good but I cannot pick it up while it references a
> Kconfig symbol that's not upstream.

You're right. I have replaced ARCH_CORTINA_ACCESS || COMPILE_TEST with
OF. The driver only uses generic MMIO, GPIO and IRQ APIs; HAS_IOMEM is
already required by the enclosing MMIO GPIO menu. There is no need to
keep an architecture-specific condition here.

I checked built-in and module builds on ARM with GCC and x86-64 with
Clang, with OF=y and COMPILE_TEST=n, using just the GPIO series on
v7.4-rc1 without the CS75xx platform series. All four builds passed,
including vmlinux for the built-in cases and the modules for the modular
cases. The GPIO driver code is unchanged.

I am sending v6 with this Kconfig change and an updated cover letter.

Thanks,
Fil

