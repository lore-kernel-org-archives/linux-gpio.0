Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC8137B3F2
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 22:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511079; cv=pass; b=Ha31T7+Yn2lj1kiKSphVIWYKufoa3smzAt13LVyU1iL5cHO2yAX+rv9T1FfmkZlIAprKO/lskAPjp73AvxpoNJaVR0sH/G2+yNxT7GKnJO6VBaTUKODylt7RrF0IXcvgyH47dKelFUCa4yQ9I5QkCAWokmOacnLTAbsrlXIswqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511079; c=relaxed/simple;
	bh=glk4hLZeB8BNV8FJN1ZJEgfUHPNFsCJRMeqWRnKIk5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXTHQk60jgDnEC0BIhUXRDlPNfASpAX6TSuI6qIuMMnrCnY7K3g+vRoLr9m9rpLuaUCUYXV4WYDpMgNJdCK5utvnqT/8k9MZvw1qQJ8Yo0j70QRcB4F0l+Ojj690QIqMW5sB3yjzqat9y8ouXTRdpBX5gZ0MgjtRq3V7HjYHAZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmS+vzDh; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmS+vzDh"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so465454a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 15:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789511076; cv=none;
        d=google.com; s=arc-20260327;
        b=TDci/tEQEoGu8iEuNV1Al/lvndwcNKwZ3/by0KMRTRNejnBpc1KcNywF2oaabNxFX+
         7ZRKivfl7WqvGtpR6352k/uVsYa2NI2aPD3BDoO5HeDy8mXqnEPNhEgkM+U0gI7LLZv0
         YSf5TE12Fqx+Uq7HLw17fmi281IAx18yH1HuwDVuBCQxZOlp0z76ctsaL8uhP+5PfmNV
         dORm7LR0ecFJMeJqUt7FneXbKJ77LXv/RrYdAUh1MB4F0mLRVwdFP1oduenjBq3bkPKC
         AoRqWZy0P5coE1tuLbJgpWY3p1EQ5up5k0jZ3IUWhyRxhmM/e1DEaZe1q0hPQwmRAmGh
         hjAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLnNBMG5QZIWbGY+kDvGdV9CDFonw3WRgIqwznl2sBU=;
        fh=k4EbfWxYJ5aMdkKyZEK6w1n9hQJznp4+9c0GiwNcjNs=;
        b=q+m3yb41vs3zDluvdIbeOGGEN1JBKAkHq6QDBzPaEzJ4ZMBldrWqL22D+kr6MM6nBG
         R5dbDMI9dddIUIRwcA1eTlEopf4NBbygDDqNvXTpcdULi9N+ebxJM+aNAHNUl274qUK/
         7Yvj23lbAvL4MBTHn58tkVuBAx1oRKJYnCH1vt5DcJvx402yRXFNQZ53OvO/Wsmx9sKT
         /99HTaYsqegetan0Un9GG/VST0C2YPvrS9cOjbM4QrXokWrlFZKT9z2n52IAzcvFHwPt
         Mqvc4uFDlTPJXMJboDeem3IfsD0sCUNvFB/VeVXjxGt++7lYyGHYpx2FSCXvdGar9S6C
         qZ+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789511076; x=1790115876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLnNBMG5QZIWbGY+kDvGdV9CDFonw3WRgIqwznl2sBU=;
        b=WmS+vzDhtKSAP1T3o2albshqftmO4o34Wgl03JMuAY41BGbogAxhIp6Cm36PUjS5Ou
         e9t4JqZC92WqM+jGcIlEMR/eGDSh/1arQhwcjUiZXMHzz0QYoI4BYp3rKBHzLvNnMiqO
         jSarpH1uE9vr/ZJKZnAnbe2T0bv6qpQ7+sLreL7tqlTzA/XGnhOt4LlMNG64xVuz9z2/
         OWJL1ssYBgtMUlPUpYMdbh1V/zdJHRGk8woav+nD8v8j2EBkBzGUHyb6lobGLbjNGE27
         iN9zP86GzVKQ+U1pPK8Q90V+WQb+oRNdJaB6PLhgUzZEJ+3If8Uj0Y8pvNj+5euwFeO+
         C37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511076; x=1790115876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLnNBMG5QZIWbGY+kDvGdV9CDFonw3WRgIqwznl2sBU=;
        b=NWM3vmPcpdtTIHKsYuxyjza08Fs3IeE0PSe0VvY5US2l3s1xLSN5NjuKR9V4d/nJDT
         KhVmvefdVrqxaiccX/pt/LWkIOeZpij3x2ytfLDFtJUT7DYz722SOO1FhSLQKUR3w+Uq
         f3ykmPQWApnqRDoGuDmVmL12CO48TIojoQxXtH0/Lg9h2zGTvHwYIZklQDavtrT+rm7M
         u8Tfw57qF91mdDpUViMQHt3Sb1vVmKGY7VLZzmBB3ycBcUpWEZrxb3YdYN5TFtZFx4hA
         EHOGvhkRisO/bsWD/ZHSWxjvfy2EdiOG+cF8GbJCe/YrhMzrCf1FvFIKfXGIF0VZGGK/
         mJsw==
X-Gm-Message-State: AFuF++kqMRTFyy1fhP4UuEKrxbhpjDxr92MMywt9t+vasQyJqMuLtfDQ
	rWK3iLokV8zectKyDMmA5X4/GFtgEjiMbhJiRUOGICoVqLR6ycmREUppUE0M8Ts2Vj6joohZMpB
	zjXifL9pb+MdBTdItZVj0BTcRZ0PZUiY6eKJJ
X-Gm-Gg: AYBFou0vpOkzoB9AlFHpyuSjo4ohpIfTqZLnqjDCaWtZ+Vt1WZtBm1tPGH4osar6Pca
	YUopP36GwQINLkjG+hbnwWbifDmCTMru5bFrlDJAOJQGg5QELilJpCbcUJ8p9Zv8UBJdUc8AD8N
	+161NJCk+nOL9vrnRmeFq8RKyMsUDmq92OAer8dQeUd2nEXaZJVYiUUfHsFuJJ8h7yw398l9RLK
	HSdFw3C7n97fSLNRMeWUqkR7gJ9cyZoM0LxP8IuuvKcUMNog+f/6wRWRbmThSfloFFQimmLASNy
	O4QnPRExdX/GpcG52OVvxHz48OkCHVW74n+AINmcH8MC21d/iSwCbXQEaCefal/RQP/137NXttj
	v9VZAMeDBTNcmWQsOkfwfzYpPzmZn+t0N7b4tDx/NwbBIpGUDDSAkg+hvyF3hvr+F4eA0XTpNfz
	9rqt9OC3CQKW2mRefr+70ROpcV3ClNBl79KkJmwg9nDI68YB/Db3NdBU7Y5I2sQJSpAOsllg9yc
	CzX
X-Received: by 2002:a17:907:d26:b0:c29:c356:6984 with SMTP id
 a640c23a62f3a-c29e51dbfdamr6340166b.8.1789511076181; Tue, 15 Sep 2026
 15:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915004406.115230-1-rosenp@gmail.com> <20260915064352.T4HiPnt_@linutronix.de>
In-Reply-To: <20260915064352.T4HiPnt_@linutronix.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 15 Sep 2026 15:24:24 -0700
X-Gm-Features: AcwNN1UmrBuelDzySu3Or0uOP888_AzAr6sVGxMbhPLw-5AZIgjqW0vcNetLvrU
Message-ID: <CAKxU2N_+H50zy7V0FR-_4KiyAG8+_x4kg2QZBsumHEXgdwmqKQ@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: keep resume masks within the irqchip cache
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:43=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-09-14 17:44:06 [-0700], Rosen Penev wrote:
> > mvebu_gpio_resume() writes the edge/level mask registers saved at
> > suspend time straight back to hardware, bypassing the irqchip's
> > mask_cache_priv.  genirq skips mask_irq() for a line it already
> > considers masked, so restoring a bit in hardware that genirq thinks
> > is still masked leaves that line unmasked behind genirq's back.  An
> > asserted level line then has nobody to ack it, and the moment
> > interrupts are re-enabled the chained handler storms, hanging resume.
>
> Why is the mask value changed after suspend?
In order to keep genirq and the hardware in sync.
>
> Sebastian
