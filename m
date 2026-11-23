Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466394;
	b=5i4x8jgihCWsGCy4LZi6y0sfa9KQhYf97IAxMKu1WqcFmvoGoA1rwAR/JK9PauOdhSzz
	 K5ipOhWDYkuez2BlxIeZzXgXydMRDTIo82ePXoUK8JpX661vhhhR7qK07zXy35VHGqKRG
	 9yKg76ehz0mRyU8HnuM/KfH0g0AuYozSQujShI6qnsp2UI939R5p/UyBX0BwNKcMBePPe
	 1Q5B/jyRo5Kmhun3DeeW2BnHv7Gat4GVzQGPksruksFUEm+Ylz8RpFVLjVYCiUNI7635I
	 1RsqfLvkAhuS3tIlc0stX4FwI0zTQfq7Vm2U4cylNFnXDdJyzWjNPvXr1t38IzkkOEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
	b=viFu5G33f93cdoS9zXQAb9MisN2ofWMKo91U/kK+vEGqrmtgRkN6/oA5Ofe0cWlFQM4n
	 2IK+FAwYKIOzaELwsKbDByV44fj5ZZ/cRfsPANPUT1pS7p4Kx3XRmP8YrfRVxKCPjsAuR
	 ep4Q89FZO/pp29ZLDam7xclVOrG0vT/SRwSyAabjzJCzvnm3K1kzBGSs3OCih7yjHA8xH
	 H7owRricl18JBUe2IcH3JRiSBdJwZLjBIt+FkUHuD4nr+AQ1KMoFlJLMm6QOHaYvER84W
	 3F6IrJKuF8qPCAFr+bCYItLQ8wE0WqPpET7uAjz+VZOHsE5Ywe6hgO6RjwphG6IndmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xyho0CaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF4F606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 20:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xyho0CaO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so47721775e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 12:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795466392; cv=none;
        d=google.com; s=arc-20260327;
        b=l1jp9zpAQFLo251lnHri43D8XgwmSk0oEA7pqv6Rt3Hf8mfPVcT6lvW3zBG/gwmujM
         nTfptw7dRK13St2UH39yFvgk0zs12AShEh7u15oDRUEoi5jsTAWX3vI3vR4N75XVX+Qk
         gjz7WbS9AY5kZIwzvaBrlJQYaTR4TAIhChqa/lHY3Jks3spM/OShBSwte/3wxT2SNlif
         NiEXc/iacCV4qNuaYk0fMZzVodQxvakAoRVQwXFAWrEwgA7oMEPbRuis/PNbTNOav6BT
         uHeHsmQjVxEgHex8VvyBRWp88U1ymxbRTUYmujonvi+z1/VSTzcBN9rARix0M9zdK48E
         GWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
        fh=fJDKM6eQiqrXlEy9flTt7ndN1V6Mph+8wR7xii8olQ0=;
        b=hL43O9DNlno8PNGA4pXoQidnzR1x4dnjFpUWCcQ0r7OS+QiaXQXKk/YYTqq24Ct3kw
         W2EEk0AdQQBGLPZYU8a1Hvx5YhXRX280TQtddq3gQ+0JhjG3SylD4FVSI9oB8uGGjKUk
         T2kC4lWyhPPAyfXRnlPsbrjDzxcE0LgFswSX1SJQ2K8oaxc7Kobh9uH4pOtLo//53rDA
         g5FRtUBfEv+xaif+RF55m1uoW/EME3Ntjzkup4u1ZpdS/weuokrAfY5hPOZnS2HywZKG
         ChfEbeEkVjF8T+Fzf55Fn5lJemsq4FI3tpPPV+KvvSsxab+JoqwlJRUBxIm9NiYBZYJz
         QJ6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466392; x=1796071192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
        b=Xyho0CaO9ajf+CZo2ue7LaRGM1afwxl+5LXe5Ql/Y+CA0QzR0QQBDuSW9pn/klcz5i
         dO0A7l1p9qyq/N16q8UL56mBsa4XH71zxHkkEs9iDBxnkXgIloz5WDHGf+9n/Jl8yzaA
         LI0UHXF0/tBtbqHumvMNAGiubC0/o+TPaXMb/YlhxumFz48uDdv3oL3vUiPAi5nPfqtk
         dsKvuZZF9o8E/e8vvgAIcCZ2Tw8YFbE8l8H7f1PqBqeb/y/sEWUKJVO98kuwMaKo0jfr
         QAIiM1iJplZcrW6pTsSqEp2jS1NN4YlhBiB41KgIK8oC1XaR6HmuKNVrwo7r1uhUVofc
         E9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466392; x=1796071192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMl2tg7zBR1rlQ3Z80sjydvjC1TlhDIEJG7iv6AnATU=;
        b=BfKAoc45DXNSrXL4dzXHWEAXCl2XQMQX66I6vfiF09ddOeN1ASb/+k+QRe5hAjc/pY
         EWg9TzyPNqdKEmyt1YdYH7+TWbhmn12O0BuLwl5rd9C1A+Gntr6+xSJOO0/qt1HP4SNW
         AtKpinGJMVhmjBU7hQyEqzzJRkOkoHPD+zdmhtOMHWdrohzkJfz4bnk21SB3eAmCEVP8
         IZ8D4iJ1tMpAMhlFf7JATTqeq7gmNCsiMgn0qayjmYzVSEvUK7nhdqzU8yffhbGbcNWP
         +SDn7zg7AxLZrLnAbmscgWg0CN8/kE67p6lqMKuofHh7jqkleCzr/WriIZT+G8hETPDI
         gRPw==
X-Forwarded-Encrypted: i=1; AL+hErGcAnIxoBrmucTUmd9Axf0u8g67DYznXAmYl7xjavrGd3g1/gYDFokbtQnSKIgBAoUpRLAr1uVrOfb1@vger.kernel.org
X-Gm-Message-State: APuU4Z8eZ/l+xmTDnLmzPV8AbvJkcnZ+2NbUUVjk2l87acw4E++RksaA
	C57hKFigdF/pEebcNXEN8lXEItmOPy0Y7t2ZLhvFDUtabDz5Hp12IAY0IU1e9EDR57ZLwGP9lai
	amkL5MnciJ5QCfVr8YHZFJBmXzvlH/Xw=
X-Gm-Gg: AZFdTZfRxgSSbLCFSYe53HorA8x605PnR3wX4uoW6TUrxk7RdASvI8W78+HuXdSpiCu
	64Y5toHWD/Nmgpl2M9PZIiC6PqGvj6Siqcw/fqMeg/9/LD2XTIJ1X0SuCHrXH2f/VPnoRYgIyEj
	k/X6ufAHujVVqFq8Azoo3LKO15MnD1vzVBNg6UNI59g8aQbR9J4f1kXpdiP3OB3ssQTNK9kdpp2
	4P6b5QgxKa/zMJytb9ZvG9VPDB2bsOspA+HDmbLNNQLyC9GUSlJUEAj7p3m9VXeXj2F4VAsYKqj
	VlNegrgFRRhMQAec6z2GLXfM+7tAhO95rGfD/a/vsDiRNvsyMBJK70KR0H6czGMt9OxgBE+NVNO
	oCgVQUrMh8BlPAbCc+BYWVdhnmrI7RDK/zH+CiTc=
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4bb887ca0dfmr280208775e9.4.1795466392388; Mon, 23 Nov 2026
 12:39:52 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
 <awSbkAjWErc0ac_n@ashevche-desk.local>
In-Reply-To: <awSbkAjWErc0ac_n@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Tue, 24 Nov 2026 04:39:41 +0800
X-Gm-Features: Aa3M54pW8nTndfc2YkE4XIoHXj50vEdpBOxgCjgICpgYwVEehODt65XRpbec5kM
Message-ID: <CANYHO6qir4Zb9TBG+JP36=tCpQdf+uUiOwv5XurP7XGRz5GnSg@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO
 OUT not function mode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, BillyChou <BillyChou@aaeon.com.tw>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:01=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 23, 2026 at 11:16:17PM +0800, Gary Wang wrote:
> > The CPLD I2C pin mode setting following uart & spi used modes array
>
> UART
> SPI
>
> > on device AANT0F04.
>
> > CC: stable@vger.kernel.org
>
> Should be better Cc: (CC: works, but looks non-standard).
>
> > Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP b=
oards")
>
> You need to read the AI slops, test them and add your formal SoB.
Tested, but I'll check AI slops than add SoB.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
