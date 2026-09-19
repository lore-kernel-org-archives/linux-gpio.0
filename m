Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901939A81B
	for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789819941; cv=none; b=J5POpIAtNPLfImw9yHda8+FuxPG+9kA1rPQpkmzDlknpPwJfgvh0q+7BKGNMYxcSTOO9fIKAaX0QoRfkKpWg2HsZ7pZ1jqlgsLQ/S3eT7NhEG7n/N5Wp5qh6N0MubbXjuRs9oMr9pa4iCyfFvoDG5d66U1rd6L/bSlvjpF5PCCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789819941; c=relaxed/simple;
	bh=/dP6Foxr2cz/VRSoJWfh8xjp9pExqYsiAGiqghEOIt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpdUsZAXZIcD35gHMJmLOYI0lJjTcACVmwNKcirPKL4YHdLPKIyE9CNYrze98PVFr4gGttCFpJMTUJq9SpGOxaZVW5GaL0gYPQfhvfkOyQ3fkYyOr+ecil51G2Yi9tNCZBUUmvd4cGDBwqrMVQdsHi+sndNqzbhP+cs8QTY2/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1/cMQpc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1/cMQpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F461F0089D
	for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789819939;
	bh=/dP6Foxr2cz/VRSoJWfh8xjp9pExqYsiAGiqghEOIt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b1/cMQpcJhsKytJuM7JEgbI4KeqNnmBBLuDK879+NBS/Nh2o3m0mMqrYeZJk/C2C+
	 lZRiFM9yIqrGcfpMY/sihNgO5tXvF5Fk2WmI/Mz/U/fbQHj1S317FFiAon8W3aPY3h
	 uY5iIJthzfA6r8pFZIdTcKkXxfVsLKKIzs6V2EbxrPIIs9emjhHSHoUoi9PhgP4gy/
	 QuOFuGauxiRiAHB86al3r3TxUwuPGeNRM3f+dmQfhAhDBoS8Znr/sclOkza3XODS5v
	 PCrJiVXOmeAeXuinPi5clzMDvIk6YZgxFbKUyz6o0596BF+OGcPblxq2h/xS2oICuA
	 0M4R+s1e2zncQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so1354791e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 05:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQa0aWDEX5OeoHq2NSe07tnNPd8hDeSuhCgBsCkE8IwbjhENOyN6/65VaR1trcmvnl2xPJqQ+hYzwT@vger.kernel.org
X-Gm-Message-State: AFuF++kh82qe45MzzON4DJtIiKRu+Ke/J6a+cPfd4Teul4zHufHm8YYa
	22HSrYBFhzAq+oDbDTYAtV3Vce5AjDPhSwRseFIE0HxVZrUdnI2uWkRlz2hpHwkMsNDGYuHKb2N
	l81J5/FUsSzEG4vcTLQ8HrAhxF11+8iA=
X-Received: by 2002:a05:6512:641c:b0:5b8:c225:80cc with SMTP id
 2adb3069b0e04-5b8c22581cdmr1498495e87.34.1789819937701; Sat, 19 Sep 2026
 05:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919083655.586922-1-enelsonmoore@gmail.com>
In-Reply-To: <20260919083655.586922-1-enelsonmoore@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 19 Sep 2026 14:12:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
X-Gm-Features: AcwNN1WcbEa5s45pl8xKokl0F87v5ydLmBxQXHepFYy0K13mjtIq3kJABiaLKa8
Message-ID: <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio_mouse - remove driver that has never been
 used in the kernel
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andres Salomon <dilinger@queued.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 10:37=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:

> The gpio_mouse driver was added in 2007, but it has never been
> referenced by any platform data or DTS files in the kernel, and it does
> not support ACPI probing. Therefore, it has clearly never been used by
> any users of unmodified mainline Linux. Remove it.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Why though? It is fully modernized and probably has a value
for people like "makers" who just want to connect an oldschool
mouse to their random Raspberry Pi.

I think it's better if we focus on removing code that is just
using platform devices and hacks and is hopeless
to maintain. For example the OLPC...

Yours,
Linus Walleij
