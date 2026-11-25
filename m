Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606013;
	b=U+TS4XUoCa/XCYO8AMUPnnPYasSBI79maaBoOULfWp3ig7+BCJTpSjayBitIRaH/G1Xq
	 V1a2qfLMEVSBcs37n9JFucqxS6Q+HaiBxQ23WkrWzwUaJqm8RLjPV5U0OwxNpyDnGmWNW
	 vS2O4Aii8QQBzkUSDLxRokqTGnqOQgLjVOpdUo7MFTzQ19LVYK14EnQ0p9+Bpr1V0Akb+
	 qBnpai4CqEVh5ADhu8d/79f+nWBDY0sEV6WlJhOB17Ms/pwFsp7aVZzfUOYPBiEbFtM9e
	 lpw7jO4XE5lQDeGOwh+cxuc2XuZqkSPXtNBAqMEH2Kk8uXId4ImOhxSxYeL93qpULRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
	b=0hZxZvbFBxsrdyVsMOpvYTaahN1Vc6sdBZTiSMEbQBxWlmK1Duh16U/2JuAnY2GPu4Yo
	 1uJltnV0yxcF34WuUcGMwMRwWxwAUFa8TBYL+59oCK2i4b1PGPgsPM+2+ndkz8nvExall
	 jASln4KQKefSzuinUGfU2uocdSFz0xB8ZAutH4i3Eih5Ci1/F6NqS3eijiq7TizKZk9el
	 l8QwMO69Ftft52nFxDtaQkjlFb/HRuiQz3YdwigUJYqf8erfa5l9DWm4IetTiAOrWTEyX
	 qnBOAV1RF88qSw8mOsXexr9LpiRBaBdX2LvWvSEHemJWdViEuX0KV7rR9WEOUiYkp7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E44606A330
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E44606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae854fd0f5so42181871fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606011; x=1796210811; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=jyGKAlovcwZSdrD0MngFnWQGCgbR1bsNB9jg7IqxSmLK0XzoVhx8RwgXCJFWbH91hG
         dlLvGqU0Ihq4/jX4SM6J0XYFj1elFigqBzomfWLEQ/aFm/f+wJFvfrrja5wACD50Bsee
         ZfrnMhBo9IsKKG35FUjvaF6cSWSoFpkmcd+tLlvjNOn6TqYjwqTb42gMU5RJEaMSosHD
         ClXTTley3jUlB5UwPfbQADiM+1xHBP57dQtvUL4QTDI/vji0BuUmXPtUOHeFgvmoZ2Zp
         vOzd1ZTu/5FSppLJJD57ABv+WATKIGZ5Ex2mJoFfcPj7HAPaNlX8poONISTTeBAxgnY4
         vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606011; x=1796210811;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=AKsDI3+OWBZ+q4tOgI6D4gc0ePFoNgtpJ60+VFvPuA3Me9yeRpGl1Xuo+1g6cRuYz2
         znT7s6+5bGNYU9ZfmX4xy4UNIIQiYOONrAyavKguLDJMxfSkVq8W8QnScOBW04PHv1d3
         vjuEHdUwdkauNgKh/THqlwXz4+dI8YGnOD0lEIYw7rwSJ17JQlIl6XDk0TH1GUl8ZAbi
         AVRW0m+jo650qWLWizg0KL87hCBVCCIPfqx53feIfKKYG/YpiwCitgF17JgY+Mix+gnv
         Qi03ye1EAML4vNDxK/K0oKfd4oA/2WJOfQ9jdzoAqs/1FYcwfeKpibe0sBAm7fKLgT95
         X6mg==
X-Forwarded-Encrypted: i=1; AL+hErE9nC8tVLpEG0NnXYISx05iy4wVzinxa8wpuzXe4gWy2M68A/5QfmGB53BtxJe2nLdqnt1mOetVCOS7@vger.kernel.org
X-Gm-Message-State: APuU4Z/BpG7Ru8UCukx9OxRexOng+xo2TUJLb1+PBjco9asKEeHskr9/
	eOGo5aZkq9RqlntiGDffZ27PeTyf3PG0oPRLuOSjhe/5u0vU4Tl/ks1A
X-Gm-Gg: AZFdTZegEtRgHtBEGieRAiHi7/MzveXqMLSnDk3x9SQnN/msx/K7hoSSFFnUxv8D/S9
	qOF7D0gpkC7a7xUELeMfGB2sUo60Oh1i9a+wZkXQwuAp23zAVgjkIqW6495ugGkhyH5ltyIjF/4
	+jN1wMxpzaPXEinx0wPxjenxOplPQ26hDUI+Ssf0SxeCf9vO6xwEm3QpOJBu/QAxHPseB468dEs
	jaIGUb6r/cflti9LDB50+rZUK7NnQTYwmwyNhTyZuhMf6qxCt+oQAdMWJ6cVbn8Jj8xHmnHl0c0
	hxvwRhBjtGPuqdOHI77xurlV7DAuJAh/uwZfCqmfHVF3LrHcIs00WT2lZw3eacCmQ7ysie4OB9R
	9vQbMFTcLnu1Dv6Hzi8UhiQ+2l2QjpprNogfSp4GkcbOrBQEywgXzrVl+IyCRNHxavcXQqfuKUR
	OM+L3Dkd3a0BsM3edk3cezZME6x8xvXcICPa2v3Jj90x0IlPyvRcy44PymJsGOUVdfBDiAiLB9i
	75GDeS3xYwa3q5Un3hxmgmUxGq1Rb+7pkuntiafWXe0s+c+hstxZOk1BIzFKhz3MsKflR7CZEat
	p9IsYA9elFbSoH54N3RjhDAv/pDqx4VD2lc0b5rQ/72sfr4G2RywBPw=
X-Received: by 2002:a05:651c:b28:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3ae7f9a073amr54848531fa.4.1795606011279;
        Wed, 25 Nov 2026 03:26:51 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e3c4sm46556431fa.4.2026.11.25.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset controller
Date: Wed, 25 Nov 2026 14:26:28 +0300
Message-ID: <179560598858.3.3579752078270188660@gmail.com>
In-Reply-To: <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
 <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Philipp,

Thanks. I've switched the allocation in cs7542_reset_probe() to
devm_kzalloc_obj(dev, *rst) for the next revision.

Best regards,
Fil
