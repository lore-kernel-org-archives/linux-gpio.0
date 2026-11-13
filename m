Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530164;
	b=SxPobbB3TqyIkzZwsax6+awIMy5oI89vwhAgL+XPVV63TYNo9xUOgn5SuC2ZPR5rwJ1B
	 Dw3ybVYQV7OmI+5oelYHO84UVhvRO9ZBTtbJCiGiZvk5WIgUzh2pvLCgOxj+yn8Vdumbb
	 eY0VwYc07fESePHfCNWu5DYrQoIcDidAuv8VdWrqvlE7buFYPXdJexbawMcRw+B23T+wb
	 RG4ZesoiS+W4Hndh+sg6OYjq7aUzOVaJuX2u2mU4Kz2fAsN4W2LqpqnQwTCb4lJrpqlZs
	 gt9cuHKw1NUWUHQtd6id8QgZlZ4dKYnSks5p8ZjBj3NsmJF3Qm+PkSEXsyOGWswTFVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
	b=XKkL8qKsbhQiN9FOb6YVy+AAlL3oRRIUqEB68EWxu4PgzjcQv+BBh6ivQHllniFWxipA
	 2vWGBZlvhN3HGJdkE/zXZBswhOLjUx1RuGkNXrch12YD41/blpUzDyItoooDTv1nomaoy
	 Wp3bk8m14eMVzvqWe2h2KMdOwabTtX2ncUcehUlSsxlpsUM1Z1yAlaeZnFOXViR5wiwj2
	 Idq/JK51LYVOYylJwIJS/1wKA6KnQcypt0KJVWdnqpvTALnBdGt+3FnpteHlFXlR20Izy
	 JyFTj0Bt+8ddtMb5m8ZUP6LK2BDGtcDb1rTS03NlY+XmxA8bdKNSp2DBRAoY6ou10tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nCsxS/12";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636B9606C27E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 00:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636B9606C27E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nCsxS/12
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2663765e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 16:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530163; x=1795134963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
        b=nCsxS/12HM6zIm2voL6T0fZN9ba/jyGuCSu6/T0qOz6MES+nue9pT69TRSZHygY/6G
         Zuommhdrv7QntgQjMhS4SdD7u9ir9BR2ccu62h+LrEhRixUlvkilIxUpyuUilN9tGQ9h
         oEh6/KXSG1xXfYP3zVqD5GdeL6mRoUpc/HGayhc5xozEP05w7y9qs4NbW0IQRCBJKQaD
         oJUTgVvfXRglAMwiunYL47KNTvK+JK+BEMIzcsFnYQKG7oDKO89NTglKVk6nQpRe7q4e
         /QYG+WAeNqCnqctcBN5vFJKg3dmvrBo96jCrkwZiAOCRMbc6zYnm7S7aoNs+6F7keeSb
         2N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530163; x=1795134963;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
        b=e652UJd7OX+Kr0kroS/vkf0Dsh+nKP/T+0F+L4Fh846TjOdtXjt8P6NTegW4+EzQ6q
         lE/HNUyJZ5mwDxH/chivDDe4aasbg0QWlMtdvb9FfXB7+DB6ZcnwVpLdbz3QyC+qgWO5
         UVZBSI2XjUzACeQdWNms8CIFTomDKBgm+GxPe/Bq25fTBP3sFMEK29EXzVY9uE2WLq2V
         hyWvKnAYY+KNKn/Q2kjrca8JVJaTLBlJanaUxQxYDTSAej9YQiG965llpq+EtdJIb6Pv
         Vw9Ag9mPps3rHYDeLaNHMsnaACe+Tmnamxgu2Xj0/hweRnSdYxWj1suDKwjXPh36TJY7
         LrUQ==
X-Forwarded-Encrypted: i=1; AL+hErFavmMxIONgxYJ5BBZg49vfl7C+gqq3ZRsqx+SM7AXbBH4bgupivMJkwTvXPn6nEhfYrNiLDDoS+XXe@vger.kernel.org
X-Gm-Message-State: APuU4Z8WcZuX66wU24pL3DL5goXnCb26Ny7S8pzqgGEYVbGeIXcT4POf
	ZnFzpcXv5NoEnZ8ioEL84TWNuRfF3rRfwORNt2Mt2w1LnkgRWMvUnixc
X-Gm-Gg: AYBFou06FLrFM6/6HRm9mndW9vY+MmGhk9iHINBvTEpfwy0dnG/XKxGx///Z6/iwNjL
	gufutk9WfxlIX3Lul/amjkv29bKDgTBEhyuHXn7LjC2z9BwKLvfYXsLozf3J3mxfviy9+qMgDSb
	w+w3fPgm+UwlIfQHxdjzaAgUrXHkyOPg7VLCuLAS/C1qS05FTNAbNbU5Iu87pjFfy1DAwzIRB0g
	S9VCcCHbRAl8TL3r3HvmuaejBBlVDwkcCFG/e4MWv/K0N+uUxhWbaYI6GWnhrSvnhPRoug+7GT1
	oN+3WX/vtz/swuwhAgpoX95GsMg6CQxY7lv9UwjGKqAbXTDGmogNV8SxOp+8G38rPs0gZCFTGhT
	lhxaGanrHL1HZN6FkcNHN4Pnw/D98Bixn8bm6suGAiIDUcy5d+N5xLDBdjlJ6BGei/GfMLxythB
	15FcvwOdjYHR4oO8S9x9mlEiasWHwVQMvI69M/+IA0QOGZJdXrhGAojrkfHs1RYuOst74pU2sR6
	MqdSPgbyaBWEvkkqVwb+LcSuThpXIF5nwqi7PhJWVhavXJGQzOdRCMOtZ8iLgXpdWG4an+kwbaa
	9QBWQA81r9Dqq2cteNSChQwYMN6J35pZKIgo0kQiE/GD5U7lul7qPOjQBhTbXyvnNpZn443l+Cg
	9HVRderj9bF2SPAPu6CANKD1uFyDcJNV/ehAVmxf6gUNGvH2JYJb5KlS/i3N16i+lDiKEXjpL5q
	agx2x/qGsZF7N8TjnT7Q==
X-Received: by 2002:a05:600c:870f:b0:4ba:495c:3798 with SMTP id 5b1f17b1804b1-4bb55af1377mr17409355e9.35.1794530162764;
        Thu, 12 Nov 2026 16:36:02 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm2145402f8f.6.2026.11.12.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:01 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:36:00 +0000
Message-ID: <20261113003600.3661907-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com> <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> Fyi, there is also Documentation/devicetree/bindings/gpio/gpio-mmio.yaml,
> which allows you to put this directly into the DTS without a driver shim.

I looked at it. gpio-mmio.yaml has no clocks property, and on this SoC
the GPIO bank has a register clock gate in lsp0crpm. If no driver holds
that clock, the clock framework turns it off as unused at the end of
boot, so I would rather keep the small driver.

The other open question is the IRQs. You and Linus talked in the RFC
thread about whether this GPIO block has working IRQs. I have not
tested that yet and will reply in that thread once I have.

Best regards,
Navid
