Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4B4A99DE
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 23:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686871; cv=pass; b=u/DDRH0PLPB6jcUb4xaEHu1NPjelLCn9DhdPvcr9fXAv044EGF4lwyAB4x0kn/mQCrr0RNL0qAYKGRcVlHV8Z2oGsCAO/7URG6/4UKLvwDhGCxWfzRtXecY3F+Z8hl0yrllb7yQQwl9fZk7lcpg7NMmP1XPdoB4FIUTPrZmVnGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686871; c=relaxed/simple;
	bh=UFVnKLmRNthZe/OMD8aBRH7cExiAA+7lFKrEVyJSMFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2bEN/ClMnREohYT8cX1w+LgHylBpetePDWNJ7kcgaTcobKxGvz24reqrqjBtZeSnVvtFlOTZ+rsUDktDGN0rbk65aRtNIuo0S1ru3jFpXWc7S599qbYxSEdo8tY+R0gccWYRzNEctC5WS8x4UVnlcTUUkTpphFAAb17haaHODw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pekX7eGd; arc=pass smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pekX7eGd"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso173672a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 16:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789686864; cv=none;
        d=google.com; s=arc-20260327;
        b=mnu1Ct6XRSaNr/BT0nkKcZSWhfDDLI+qGlX9O2irytAjGsSNM4kmCXkyoqBVwVGFdp
         leQEpwOd7P20uDqxT+nJiHPVWvzhVzizhBbibV9ZJjNfTGtKArVmSPuuDtZyPSH8snF9
         kZkfKJsZ4RFQ2fsmp3VfP9ibbw7V/+FtjpwMrww85oXhhOJENWAnMwL7d6ox+WiIxdb2
         6FgfMCq/v620f3qRBA/la3F/o5Pvv14H8o9t9538+GLFVgg16nH7qWt8Dr8J3b8jWOeY
         DMgG+qP/qIfJN3bpsPHec8b3ybGNiGk++u4+AZ6ygTtaZE4W2VVcplR55On8TXH+3Kdo
         3Z7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCrPUYkHN100Be0rJWvwG/WLDMRSEYT5rdHDdeTuTGI=;
        fh=VdXm116MxKa9RQBSHTpxbPb9zj/eRnBYA/RHz6wpJB0=;
        b=q8RIGS3yplRpf8Q9nAdQT6Zutvp8I2fTIW1pAKhpAmmeNfSapKze0Slya3+F5A3i8a
         +BS+oYmwJ39qiQVdNYNmTUG7AfGC+07VDh98zY8F43VMTMr8cc9v31zQeWz4M2VgfNjY
         opxo7Q/UZX9xas59/fn1ANj+cTvqXMSI2/sszcXiKHfwWsEzS8t+vo1KgpVjrGKJFGrf
         Nt/G4++3/YJLnJSzJcVErF2h/K60zmkDnX4Pnh9GOSNLzySBG8CSvRJyGccwPUXhFB97
         780RSgOSYLeD1SBd2TQNJtqVEtpMhp/QXjAB5oH4IvYl4NncdNdkOnvqGJ0sTpdJy4sY
         MMhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686864; x=1790291664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCrPUYkHN100Be0rJWvwG/WLDMRSEYT5rdHDdeTuTGI=;
        b=pekX7eGd7tkwOKVHs+eVAZIXZKEv1d2LfcwN2Nx57/R+k55nEFT3LGJwm0qzl056Kz
         iUOoFSiWi7dZAb+D5eQ6saTqJHM2kpU5OBhF5AuOBkIpK7XsTDV6has5D3vvPj4+tR+d
         NuEhDubjQBSybaZQ1wKrNGkJoazCpLKTBQkWesOFDBlbLVkc3SNu/cFiTjvMJXuwUaw0
         OQtWm4mbnp3QNroiJGE+Ew0lnV8PR83Q156PAHedqJw57KA0ryocSS2b8b1YbFg40KO7
         kTllVmbSZcTxtFKt+zW32MFeIUUtqAXnXoD8DG1gVLz/ORjI/0MSGC1qTbVynF4Ulmke
         Cn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686864; x=1790291664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCrPUYkHN100Be0rJWvwG/WLDMRSEYT5rdHDdeTuTGI=;
        b=FZg6Zlx1421mBopPkkA6IjIu2wwb5eIWU/FmIah5dFvlQJYvVWkv4cuPNMXMaf+dDZ
         IXFxATl7YmS/GEk8LJTU3Fj4bW6i657I0dZjGsUml69XWkVw0lHan48ulA/rbrh4fu7M
         UFcGdu4dar8IVM6kYLcQadxwEMhwEQ8qIlxvvIU5Yk0HfqDUGrgcgicaJMYCnrpmwYst
         LaGtrbowFzUpJJ1b8bdAegin6bq7+pQ7m01pnxXCM+aY6ucLPRjFG+sa8CXKK/xs1F99
         zOHZmJFkXyKlEJJUZgSFgJ2MzwDSBKLcMNMjuIIXFLnrqLfy+mCjmfFvLQeSg3klD1vG
         4a3A==
X-Gm-Message-State: AFuF++l2EVbBR2aH9LyJM+8MTLnsTXSjs5evfIac+YPvhdFgQxjLvHOg
	Mz+RGR6a4wB8774PJMlOyh1UdNUDsiVhXt69Jl74ElaEctg1KwvToxbRHBR2h9Mk21bZyY081TN
	gyOXnZs/MtJ1Nnrc8FH0rbmwyonwb9CXcgA==
X-Gm-Gg: AYBFou1g7SHU7wZHXGZlTyRjsPhYLC7ZxGxnF5TI4Wv2NPSKKpijWoddp7K06k4t83u
	E+7FPi9SbzFMcPGL386bwXMs8W/KsWj8nXWMCI0xFVAHBKQmIhjLIIrHIWZqUXz6XO7kIy3SzRa
	4CpZ4m/CuNaj+DcvO0A5SgvvQB0KSQPkg7f+bvCjM3OsEuN5kQEeXVwT9I/0L7QP0DvRPaYGsCH
	3FRN/H29BkmOR4VANIDkUVxl0zxmEZZyPfSAl3Id9JbW2t3dkrS3c4hYDAPRW9rt7mIHerukieD
	yRiQUv6GacmfqGlGXlbkqyrRGOvufl4I2F2MXn2x4NQ8U4ih24yL+Bs3kqKr0AM5walu8xYx7Qy
	u3K0W5WrN7xwxIi+y8sDWDvGmAJ5AdWUKRDx8tD1X08UVurd5hafLHXBFDEBPbXpS9CkXtxrC2t
	25+SK/uxSQYMu8mEcjLPH1U2H9UXMO54bvxMveFv5RTyq10u6bFkOviRhRxdVp2MZy5w==
X-Received: by 2002:a17:907:7243:b0:c29:d522:b4fd with SMTP id
 a640c23a62f3a-c2a1569a29dmr71257866b.4.1789686863785; Thu, 17 Sep 2026
 16:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915004406.115230-1-rosenp@gmail.com> <178963874726.7902.8784965092061133801.b4-ty@oss.qualcomm.com>
In-Reply-To: <178963874726.7902.8784965092061133801.b4-ty@oss.qualcomm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 16:14:12 -0700
X-Gm-Features: AcwNN1XHKFMSTs1rl2RD8k1sqDGvHySVlRMJaCZsDUk12Qjnpdg1iBIpXWDNCU8
Message-ID: <CAKxU2N93W=fPCBiB9zDZOYNT8JwN7LNOcftBfY5P_LFRYtWu=g@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: keep resume masks within the irqchip cache
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>
> On Mon, 14 Sep 2026 17:44:06 -0700, Rosen Penev wrote:
> > mvebu_gpio_resume() writes the edge/level mask registers saved at
> > suspend time straight back to hardware, bypassing the irqchip's
> > mask_cache_priv.  genirq skips mask_irq() for a line it already
> > considers masked, so restoring a bit in hardware that genirq thinks
> > is still masked leaves that line unmasked behind genirq's back.  An
> > asserted level line then has nobody to ack it, and the moment
> > interrupts are re-enabled the chained handler storms, hanging resume.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] gpio: mvebu: keep resume masks within the irqchip cache
>       https://git.kernel.org/brgl/c/02af7eac17bc62a72335c1fc8c4af4471654f=
6cc
hrm unfortunate. I had a v3 ready for this one to fix sashiko's issue.
I guess I'll send it separately.
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
