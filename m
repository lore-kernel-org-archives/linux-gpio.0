Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284789;
	b=pE4Qu52edS27KzqGI6hh5rKW1FrnzRlLnVlPHhU7mm65vDqD5VTNy5ZIZF97wRBiUy9V
	 CxGy3FW+datIS/j3713Vqvy1nOQVzK/HAMPv5drRU0JlataXZa+Vwv8tEdJ5H+bY/9R+3
	 V0YEMSX3aRfSLmk8M19B8PGGPlLpVefR6KsAqD3qcrbDiidBtf1gmO/MrthE0Kwkr3+S9
	 f+EEJ8gGUfyqwPgwsK3hCXXh0CfmCVtTfinoYgof3pibLLWGlvYyVp2bWka6fjy7JMiRJ
	 i14Sl9HsxoGdw9TlTvLjUr7UdfDwnRIRPHv+lzbn+tloo3OkA0TKdf75gsp+9Io0Bqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
	b=ZdGxuBmgv7COlQdrenwDKUwOW7itt8O+LCsr/WFfluNNofPp5Wm3h+UeJhWLojsmmgQN
	 HXT5TvqDORQ0OYkOIOo9/XdsKPBCT+HROzCC5+yTyviqSnzQq0ZGngK+/1KAAx0x6TD+1
	 m056lAKwx6lh9WB1B+WhN6GiokPQfOO/hAUGLPyLkY6b4ay5rAo9PwjF/yCLYd57HnIlr
	 mJoi6tUIT0U+EzPVDk3Zbe8snPieTMMT6noyH2Tc+ZQhMtWz9Vc7rxlpld1sth85pYYtv
	 LU3p5yKsYE4zaMiHr9NWX/Gf5ECnV86NzLbSyPUQO1jIIoybSq1Fm+heMOll0klfwMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA39606A323
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA39606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fc585291cso1992561c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284788; x=1793889588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=fPTlg3YKi8LCEYl7MWaRXbl+fOsMT8EooFaEX/qteZRl8FsZt88RyX9Nz4rh62atDU
         N2mi9nkHHOJC4qFeiUXhTHbjbhHQHXOF+NhhfCQK6iUf4J/Q9ypFok7z2wgCKAPn6EjK
         xZ9kY5ZnP4n+8lX6/VsHr77Tn99+eesUK7yOJOQntEtEMQGRE1D1vlqqCLeQI7lI9/6d
         T6b6GWLz4O6TATQ+xATuCOZzKNxV75JOEocPZj36+KoGY18UuoHpbDZjja7BkGHZcM0B
         8XE+KTQjlqXnRe4OF7u9IeoFkO5y9EWni2EDctTAKHudHO9Rp8OhbT05Vxxf/IOtY+cj
         QvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284788; x=1793889588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=Q7e7dz5rBB+JhamSbPih/6PXy8U2HmoTGugTlOVARBFhotVNkLqNjpqGj/ZKAEQ6e9
         B0AG2pI3QnS2brlqPemTjqHrwqBOrrS/tv0JxpD2M/GjAhOsyNJixKonIBjQRLOdss7H
         2MiSKpkIlOMX0eAOMVH5VB6qaeRXOgJI5jHRbpeCV/noreENqriYvvR5nX1sw11IOEXZ
         zcZ8Lh/PSuJ+IkihYROSEfB+84V6+aC68Ra9cjY8KJlGsr3akiRsJhBDZjGniDP/fxXA
         Rk7pIvfE14BBqfOYerLe+c8kH8M61H7OtYXgL6IjevXSZdPRSNo/cDoYZs3TZrpjjkFS
         V/9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwncJvtr/uhyJ8em5SirvYJKSl7Pa12OT+E30rDh1bu7OYGndwsyXufXAQ5166GFATtZDhPFGRGyEoA@vger.kernel.org
X-Gm-Message-State: AFq9FYLAIy5LNn0BtGAi5VQMHRyReIQq6N56h6NO/ia5qUQORcc8Vw5U
	3+aXnmWrDhUcSKbWgtrG53Eq/rnWHnLv6+c6Mwg7uRBU4PnoTgSSeaU=
X-Gm-Gg: AYBFou1laAHvFyxnWEHkR2FWhT4wyD6VSF8pqZTyLYjhygMZjtglFVrg4WHMOrnAZ+S
	PXrDnMQOSb/TC7OjbDT935TU+XlAlORx2YeHEIZBURRBx3obzD10GfmqsLlfKPkHJLPsK34tGKV
	eXREuKfHFvJIz5hEkshJuzvufH/oEbzZbXVQrUvLELQ1hIEO3sAdlnhJgWVs4jKW9n6x4LSKoGb
	MEc8VqUlZtdyTmBdDPJ+iPv1zh+nu/zpy3WBfK9VtQ77abu1Vrk/X9MHd09qZZNKithcG+WV07P
	rE/A6GR29wRAZAxM2OYSUcaEOkaG6ZEkUI/rMi1QCQA9oRw0IVfBZgAiba36K4zlWACXu0ensAQ
	DOTh65aePP/ylMJv1ueVFkGQyMizcogmuTziAtrwLY37HObdTIbMrp2wQVbSFScGN+dhNFtUgRq
	vJRpdnKq1rFqk2KZYVkLtZ7QrksLBWvcvrvPDYnrKoYRRvSh9BcAzCuId9YVtmhlySh92HV2Oy4
	uYMfxh+WxuCuc6iLpvU0iPiAFhrKELXRUjxUJovwt5Z4yM0deb75fy7AWs1Q++3GtelBNfOkScm
	XgnFUdJcw0ZS0n9mG/P4qt/t7EIASGwSqIuRvLNwNRzfQCIt6T6OK15Ux7eY0tMsMqM=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr7393000c88.29.1793284788293;
        Thu, 29 Oct 2026 07:39:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75cdd21c3sm15396439c88.4.2026.10.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:39:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: k@chaosmail.tech
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jic23@kernel.org,
	jmorris@namei.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Thu, 29 Oct 2026 10:39:26 -0400
Message-ID: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
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

> This should either be dropped from the series, or be hidden behind a
> `melt_my_mac`-style module flag, or switched to a whitelist approach.
> We do not know what keys will be introduced in new smc firmware
> versions, and there are already keys that should not be randomly poked
> at.

1. The patch is required, atleast on intel macs, as without writing GPU and CPU
	states to smc, the system gives PROCHOT signal under small load
	, and heats up a lot.

2. the smc dosent expose keys of nature that can physically damage the system
	it only exposes power/volt data, and the most you can poke is reboot
	keys and gpu/cpu p-states.

3. If a person is randomly touching keys, Its their problem and not ours.

4. There are a lot of things that can mess the system way more and permanently
	than smc (undervolting for example), but they are not safe guarded, why
	should this be then?
