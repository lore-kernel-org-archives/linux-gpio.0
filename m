Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795794740;
	b=aqd5nnxI6fZF/YgZaUHQU984BPikROajGOAPBwJNlClY1xY1VaBLKoUhE1kC6skmuWCr
	 /B8sy9S+FJOyvp+hQE0SVP4XF7Nn1vaJaJW182feMlUdHFQlaIP7Y0pjlqsOkQTLmjoFW
	 ew+TJ2KbD5LQfVBH4n+R0jy7YTUbhigUnIFytIxuPfbpVcV3GDxCPaxQVASEFfouh1OfT
	 mUxoeTK4rLxMVrglKHP7E+VSv+rBO2Qh11W5mg5x97Ldl0EpvjMgFzEqCompmsqP0wnO6
	 ES7KBNNjVrc6CttIF7sVAMYxdfGPNapJrmvT2sgj6ICQe9dteEQFCOFwq6EnmjBBpYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
	b=gj062u57Y9tvGkVuTyW9xWxoxxMzCNdTmcbR1ZgGprRmpxv2pQz9Mplwxmzvjzz3dsHv
	 NE3ekJbNSyFOfc++AIapc19lERPuW9FM68ufAGQPGyRohXwq97YmYbnhOdzA3vYzyo8RR
	 PROrypmBc9HGxhIl5c9oD7Ymel+koIlkoQyntogmEPBpP2STx6/vGjHjVRQotUmeRAxuy
	 Dl9HRu77EozMj6aDw1U406/bT3bKVSX7n62ObnWMzZfSh07/wDMaZBr69/PPktjB2jenq
	 FDjsea39WdYLpSB1xE9O62qbAUulH0V8hvH65se66J045AIu6iGT9XeW84aNDF5lA5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G68bOQ7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E35606A31F
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 15:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G68bOQ7g
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso72036907b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 07:52:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795794739; cv=none;
        d=google.com; s=arc-20260327;
        b=UJpj/oyIChGwYSGU71DasY9RKEZhuspyWkwq518zWTQhASCRnQ0wMo6xHyc+OCwRPu
         2T97bf+eJXVq8v+wOBFPbzWk3QhJqNcivRNGc9I/mEiiojXM6v/BGpQwfPod2z/KmFrL
         iodPpINpAXVUmudPkY3bkvuQEVHAINOwi/hXHI9AY2ysA2YH5el5UyVkgBdT9G9UHgKN
         7PLbzKhcErLBGao9b/n2dYjXoHbrg5PiHnYdRioX9gh3dGZqI3fu39PRLh0hxZeP+LR1
         y5PfOJHl2GyLNXwFx1uu8cVbSUWUcwSmqnbaQDzrM40SqLE5h5PGrdN8UqmiOgPGGEqd
         Q71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
        fh=1l4LFu3T2ry1jqCRJsLmrZqTgrQHuJ9S1pJ9MxJCzk4=;
        b=lYXXnY1NrydXfEm34t7BDddQwWIvcGIC2cj0Z0yJj9k+J7a+UheARM6Pmihr3ZWYPC
         5qoAGvPfqWjCHhlL21CbNhQS9A0YjIuqYiZAoRhCnV8IC8cbch0QGasQ9aGGjbgjgQuw
         jUwf7zeMhA7lJGF4t+aPshlozN6YsTU+Zr2lAe2uVB2p7/Acz0gu+ARdAl32/dO5dZnq
         b1Qm7y9SIxA8ZhmXqMnbVXFqNap9El4JYIoavpl/inhFkA3XDMAocz0H/dhZQjrh63Ie
         McCxl5JnvTlVUtQ8ZOE0kzjt4Rj+3j+fQJGbQ3Yfma9a0WL8zZ2rP23d8RRfzCGprfcs
         5INg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794739; x=1796399539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
        b=G68bOQ7gd9fYWPs4vpitzktdodXkfO4IvTrwfu+V5dAlrLLn2uoo8t2lRb/yzgDlY5
         8cpPB1aymtLQVMlEeKvgLiiMRoft0rT/3tEX/XFmyzXvcqrG84KRnXZsjQQjcdPNnmJK
         x/ZS7oaEHm7uAp4NfSTZ3C25iUKc/+rI+TzV43zvtjsdh72tY3bC02mZhdHbu4KE/zNy
         rObHq7sQNICtIwbLA5ioZsO3UaIkq8MgW7+lpa0iG6FU7+NO8meSRyvMsUMKckcilW+7
         ezynRg9NfyhSgeLgLGLDQWYwZK4kzQ38bXEgtHrHnrPOHntMm5m0HoSXgg6YLllHn3KP
         T+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794739; x=1796399539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
        b=mUd3JPHDIwR945zj0pDW4mmm3aJWpoY7SYpGpxVSEk3f91EkooDVgMdz4hxkBHVVWb
         AD64/VKVRDvFGowH0cVSb0otX2RAIh5029thKvBwbRaRxaPzszn8YJ7MBVFE3jFUsJnn
         uPjgpF06F4D63bmb21XP5Stak+pvHvWyu241qplMB6+J6BPPMDxCoqer+tlY34s48xz+
         Nk20VXkh3p+Mmj8I1OkFfP4faqN89jTw3s+MI9H8PUeLk9HENopH9wTAZ51nQKyDkInt
         nd9mlnzRedJOiYHBcWwDRwxHWECLw6eJrr9G9FxDdOuQtwG/xtkyCvZdeVmjM5u9+O75
         RYVA==
X-Forwarded-Encrypted: i=1; AL+hErGYwOQojSLyM18sPCDx4DxXfXxQoas5HEcwgUmPCQkQUW6XuvTCzHOW8aLn42XroN4QMDfheZUnW/He@vger.kernel.org
X-Gm-Message-State: APuU4Z8eQ4fl3lQ7AU93nLdNBfN+WfXL4trPfCyc7DrOt2uSlwh7Pg56
	NjifzNxzkTm4rTRfxbfjwsaBNu/Pko0/ORHgdPdrZ/kHMCpl25O+A894cADwwnwP7V+HmH3rH4U
	3RSZcu3ErxRXGNcYL2vE5/aA3zByAtFE=
X-Gm-Gg: AZFdTZdwnFENwTwJUDjXiUPqNfYKVigjYx/8tP16pML0yPkJWIqMIbxcI/Z/22UfLIq
	AO27UWQYGbCVI/RZDrWrTTd3VbMzYlYXcyFqJbAIKhmvSKkUjOOFG3Bd0GcR/JAuThH0b6LvEUI
	zPi7YlwiOp5BI+ZCfCNPsdhH/VEHUaMlkSHs+QS1ufEq0pL/7MJ+ZqtiIVSBMabVMzRTOYrLx1t
	nh3HZzSqQMAg8ZmWxHJ+zbb3Viax5X+ERc+uWUzIxZ7+EnyhGIl3G4wO8OtgUTkIqB4jTZfYQ6v
	xghDYGOBtxx3jGylWZp38kDJLASgOoChJe2ZQP5Doy2fIZRI+bcKGMw3f6/96XS4v8LOd5sCcUE
	+b/H4ekRpBTNwI8/hNpUlt1MrZDf9cAK1p53Xq9Va33Ynv3txgmiYn4LeddxEzHD0hYt9+xynyd
	XXo9ncRp2y5sFp7Qs=
X-Received: by 2002:a05:690c:d0f:b0:8b3:5f41:3c1e with SMTP id
 00721157ae682-8b520456e2cmr101773017b3.15.1795794738916; Fri, 27 Nov 2026
 07:52:18 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123004501.1771603-1-rdunlap@infradead.org> <179544374364.72405.3233920081843026528.b4-ty@oss.qualcomm.com>
In-Reply-To: <179544374364.72405.3233920081843026528.b4-ty@oss.qualcomm.com>
From: jim.cromie@gmail.com
Date: Fri, 27 Nov 2026 08:51:52 -0700
X-Gm-Features: Aa3M54rm3kLJSfQuoGS-kB6ubBWCryZ8gHwyhIHj60l5I6g3JB7jIkv7hQ15H_w
Message-ID: <CAJfuBxw0ZC7=935bE0PRf9Xy5d+y-wA=5YMRJm0JmwHF7qq_dw@mail.gmail.com>
Subject: Re: [PATCH v2] chardev: GPIO common access methods: repair
 non-kernel-doc comment
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 7:23=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>
> On Sun, 22 Nov 2026 16:45:01 -0800, Randy Dunlap wrote:
> > Change a "/**" non-kernel-doc comment to a plain C comment "/*"
> > to avoid 21 warnings like these:
> >
> > Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
> >    nsc_gpio.c
> > Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
> >    National Semiconductor GPIO common access methods.
> > Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
> >    struct nsc_gpio_ops abstracts the low-level access
> >
> > [...]
>
> So this isn't really a header for a GPIOLIB-based driver and technically
> outside of my jurisdiction but it's also not seen any changes for 20 year=
s so
> let me take it and see if anyone yells.
>

Acked-by: Jim Cromie <jim.cromie@gmail.com>

as to your GPIOLIB rewrite, I have the board buried somewhere,
I'll try to get it back together and running, and test your rewrite.
just not real soon.



> [1/1] chardev: GPIO common access methods: repair non-kernel-doc comment
>       https://git.kernel.org/brgl/c/d4dc896fa2bdfd7d1a78911598a0fa3e3c831=
d92
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
