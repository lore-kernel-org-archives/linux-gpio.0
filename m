Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F096305E3B
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828754; cv=pass; b=aiQ1w0bjhpE+XErd1+XXJ6C8MIs5Wk+xOeZFM6iTyb6wI18+pzuw+kW9ppL4opFSyuqnfMXBjxlr1Er+0YxXXamDXNkQgcTNsIO3QEvolcaZPJ6GlYfFWHsJVKg8EFu2sART8G72+uvTjnuLpK1XkkxljRy02mKRDsxagP93qWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828754; c=relaxed/simple;
	bh=7G1fzJ+ZFmJWx+DHty2ag2OS3/pzbFUo3QxyCPb9IQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnsNmUudYc9UcLMnloL7i10zgqB0pXB/sPxKxspN2Vo3H8Ar5RGtb4PlFRcroCD8YfSM2Zh4GjjT9Js8OJ/EtCj1NG56LTpV7s+cZ+kgyqci33zPC6QFvMCB75pwkZhGlZP7ZItyWKhfKwXFzFg5W6mQK9zI6rVYgtLaYIBjYAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNvbT3oQ; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNvbT3oQ"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-139f3eaaa49so2273805c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782828753; cv=none;
        d=google.com; s=arc-20260327;
        b=Ydjx+ZFEK57jVJgo2yU+TmdPP4jwV7SO67/yJr4QU27/o54NPg9Ow+jZAN5a0kUacR
         B2u7s1sREUUuWUzf8OwcE5a4Mhx5RaaXwvh1dUIdTooY1PYCXQlFhNJilLODC//gjkse
         qE3B8E3duHvWmBXvPXm+cPLcssCbujRqEub7rrqa4Ar1erxgOPzl1as1GO/mRdLjtp1l
         P1cHMIrcNbMQwAwEqcWnv+8d8uXMFUC+yoNVulBV/078AsNzZHPywby1GFPl0YjFPxuf
         uEwBzRMTwn9R0eCfCviv4HKWkqwA6/XGrycs8mrnLOaRyjYvlaQQY7RAtBM571TgnVIw
         cHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aqnGlzePkR0MOksxq+t6vlXeWc2XPb6gxKt2B/nD+Cc=;
        fh=jyoBd23lBOJA3tjbzUiimPi9i/ZZ0HmImZkH4fV/PV0=;
        b=BGjTvCvDOaYeDsASo+nj08tma/6IRmkPIidUnQfFEKE4l7Ly8oiqO+5ne806xHUQ3P
         O4jNZ83OjwEmz2CXvq1N4ZVpA5fKC12LAgseAZ/DhRA17WGDbP84zVu2x6l+jQ0EuRzZ
         MOj0SU5r74gO1+12yhW2HEYTltbSP59CwiqIvdMJY+F+xERlHYqcAsoWYMKWaG4NkCOc
         5aKsU3D4/aCq7TbDk7yK7k6ZhbBK43yxW3f0yMDGqmkqEzNVynyupAO1oGxdeZT6uqyj
         0jeU3IQ7RhEz6xThWL/Ky4/8q9E85BsETi1CTVINKnSGUcYabMkVBLzs17eYYA9H6+c+
         XfdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782828753; x=1783433553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqnGlzePkR0MOksxq+t6vlXeWc2XPb6gxKt2B/nD+Cc=;
        b=ZNvbT3oQP/YuOhDZMFlHRb0Gd5T2HO/TuQtCLVzWI7ZzS75uulTa00uWwlIxY/DuSA
         DpNRiviydScPT9T4v0kqvAmDGe1wVHbZVsF0dpEsAizUB478rYqp4UbA9PnEuGWctREd
         cRP3FIgiwIwaPI/uCq7mHLlcccNmDr+kqkaBvOufJr4EerYELonHG9q321XHtzidC+LI
         I6VWjiAcO7wtt/avQDhtSwhHTgOL3f3rQb3my1Ad6OMutQJoBh0towfEDenxN1kWY8ri
         bYuXvICLnvHvsZ/0g4bTZUurdr8WNX1Kd8x+VhG8F5mMxpW944OXN02VHkzW35aBch/r
         5m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828753; x=1783433553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aqnGlzePkR0MOksxq+t6vlXeWc2XPb6gxKt2B/nD+Cc=;
        b=lz60JnL26pAzeB2k2GRr2ExsVc+0+9QiVORxHuo/eL7x78xQcKDPSJpa40hDFiI5Qz
         1cntYj5baforwsz5qTCY5NR5wYcN6qirB7Qe/liigC21pAl025SmjwPln33hbIU3z3Qy
         0P/1YolS2ozicl591mc+Q+OYcrtprdbP7O+1J2haEOpdzM4m1bi3yVIZgQQDMXTh9BqY
         7oKhaeLrPAAl1Evsa1mg/jy0Kwpd98b8iNo549ISSalSAM/sJz4hJoVfzh1qhtO+eKGx
         59lBIFYh+4XPWA4Q7fddNKqyR4dhHMcOxxPyPf/n8TUgRT1QtdzBdhpiVGuHBa9niD2M
         noHw==
X-Forwarded-Encrypted: i=1; AFNElJ/3GDxpVyjJvirF0WcYV3ROtTW2feV0aKxySN48r+/UtK0kdpShtmTUhPSaViYlU4Anm/NTlahfKLtu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt4UxABXBlkQyShyc4OHHZxG3bSx/r5EjQ6MmKZfdScNxcrwk9
	yL598fICRI/W2Cqn22oH9+wISMIfR4lohHho9CPLMqU202ghOe6bIPBO30YNFg/lYFj5tgsUmiC
	tSlsV/Z+oRvKzl8y8DWhu4SenuwssqLY=
X-Gm-Gg: AfdE7cmXd6pysKosdlTylyfy/JYmCTDeJpF9Phq3PCllqri+/zsj+c1ZwOtaV58VDab
	SYKtKQXeyr+oO0VB8tyHbss0Hv19oYNsj8DOzAZFqcOj8aNWKz4xHZk+81X2HQjPG31Fg1PrXOz
	MbfgsHt0zX0YdWj6tHSBguDLCHO6P7g50E66ZKHCDWxpm/tF5aWsKlTJwMW+K9et+8EPQWY6XPb
	1EdGju/Aa9uvBVEBbx7U7umqsUShuMoxfBQqdLaQ/vfhLjjKLhG207K05hPTmvnK+JXOQ==
X-Received: by 2002:a05:7022:ead0:b0:139:ed5a:eee8 with SMTP id
 a92af1059eb24-13b3158ab71mr419877c88.39.1782828752619; Tue, 30 Jun 2026
 07:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
 <20260626060112.2498324-4-sergio.paracuellos@gmail.com> <CAMRc=MfiSePgA+Vc2GHz_5QUGZWFhnPrXPZoCV+32b9RJos5xg@mail.gmail.com>
In-Reply-To: <CAMRc=MfiSePgA+Vc2GHz_5QUGZWFhnPrXPZoCV+32b9RJos5xg@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 30 Jun 2026 16:12:21 +0200
X-Gm-Features: AVVi8CfEorQNyXoLCQb249d76lXmylw2Q4EtfkIwDk77XwEpQDExqE5pXUQ6zGk
Message-ID: <CAMhs-H-BByK-Oc54WZ+HtqcZCSJVntiW1bPwmZpjwK59CvkPkQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: mt7621: be sure IRQ domain is created before
 exposing GPIO chips
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linusw@kernel.org, vicencb@gmail.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, Jun 30, 2026 at 4:06=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, 26 Jun 2026 08:01:11 +0200, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> said:
> > Function 'mediatek_gpio_bank_probe()' registers three GPIO chips using
> > 'devm_gpiochip_add_data()'. At this point, the chips become live and vi=
sible
> > to consumers. However, the IRQ domain isn't allocated and set up until
> > 'mt7621_gpio_irq_setup()' is called after the GPIO chips setup finishes=
.
> > If a consumer requests a GPIO IRQ concurrently 'mt7621_gpio_to_irq()' c=
an
> > be called and pass a NULL irq domain pointer irq_create_mapping(), that=
 can
> > corrupt the mappings or cause a crash. Fix this possible problem seting=
 up
> > irq domain before GPIO chips setup is performed.
> >
> > Cc: stable@vger.kernel.org
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Fixes: a46f2e5720f5 ("gpio: mt7621: fix interrupt banks mapping on gpio=
 chips")
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
>
> Seems like sashiko still complains about this one. I'm not overly worried=
 about
> this path but since the commit's purpose was to address this very issue, =
do you
> want to rework it further?

Previous complaint was about the IRQ mapping being NULL because
mapping was not created when gpio chips are set up. I think that it
made more sense that this new complaint about the reverse order. So I
would maintain this PATCH as it is. Thus, I don't want to rework
anything here.

Thanks,
    Sergio Paracuellos
