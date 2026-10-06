Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D3448A8DB
	for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299919; cv=pass; b=IsBJB9jycinxIvKEBW8fv/dM5go6QSFEPcYzV8vIeJOMQebiR9ewV2IzvDneXkl0y3A864QuilVr/Nvp1rzE491AKec8fLt7OHB+K/BCXs7z4aFxzBG0XkQxkM9hKsCoF25TzdlUt1wGHWRWJc86gW3finB0dKSTlbeHnhUGiqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299919; c=relaxed/simple;
	bh=Z6WbsAnp0/k5TRam8CoApQG5u2b0ang3JjfGRsR4/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5vYT/WAjvm3Q4owQUPHkIbQHcMcIzCmlTkPtbDsdljdWi/cGCYqr/3k9lTpw41FGLLhZty8jy923G6a7JHNls1OAfpYzIg1TAVoNhebHrRI6LFTjOMVSpp1wRsOS52D2Xn5GIxAI6U1p5gRBSfmL5OHHB6xA7/KbIvjHkqa6U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vinJemxj; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vinJemxj"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so4221792a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 08:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299916; cv=none;
        d=google.com; s=arc-20260327;
        b=hXP3WQfNAZUcfVaPCEPgAtfQhdNhWpWK3jwI/6rEr1EsxxUmE6GTJnI8LfkW4OLnRf
         bit88DUqXdR018S8r7gPpo7oaP07P1+hDeyMXdL2pUsQ+j8HKynf4Nvf4lYFRf+xHEsn
         rjHzf6WFFEGnpuYfXnkNFjvfltrSiBBzllseHAiwZu5AJ7KaXRevearafJesjWpxlWiN
         n8u8sOY/6kkRFw4HX/fx6eETUkUUqeIsQSyIruU1sDpKTJ01ieirAKQIm2bB3dSVd5VO
         3n29W4iHH8F+suUH5yWYbN+Egxp5l+k1b42UeFoHYEFTNJ0qgAqFOvHKmwy45k6MAVC2
         nZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        fh=iq6BKR/1Rvyx31I6g3l9RNf0VvjhIgxrdBqCIrdL36E=;
        b=UcZF5RtEFZ158tSV5AcBzXsvOm0ioJK0ceoMMWujGZZPabQ1HyefTM2gUbQOjxduFZ
         FsZ6p7mj1c/By/kRala5XwBMoGbojGXEA3h1MsYtmLSFEuIzpRIjFoDsuzS2o/Nj/b6f
         n2gbnv8goe40aqbgJQGfi//7qM+ZihSijAaXjjZuIKA7TIMlfjPbiCGhZ4v/1GOz9Iqq
         QbrodS5+6ujh87pCVWbqMrRolhWq3lsCmZ2Pp7c6zffuEe3m2B3YkKSIBoxeRyd3x5kF
         UlQ/PANhdhJkKlGXv4FE9pJRqnw+xX1RGXMP6bWD+GQB4cWZhGr5sI2yl6ewIR7ngJS3
         Fu8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791299916; x=1791904716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=vinJemxjfo0wtpRpFAgFolIEmK5h1JEjPQcX/AMCwCwhdtc+zvrWlULgduJ50Pr9VO
         xJX9/pmQZFWu0hcikEmrYOWlRLmLDMxRZuf60EZ+XAlxd8fuVz7tyIxfQcxqxTAOq021
         qh0RQqMV161mW7VccuYWu+k8wFFtFyKkK5sgM0yybLeW5h0iOBx/RmkZyTLDOY0segSM
         +24sbA92JaazYatCvTIfx3KBp2ZyoGvIwavOILBdB7oYuVHNCayu1x3d7J4dP02weV2z
         N99S/vtuJlv34K4IhkZSwh8a/JPfbU8CbQGg1p0CTAJLX0L4vsAGNozXrFWsb9OngU22
         h9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299916; x=1791904716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=0xrRKgJ0RiXGcPaFH1wAxAHxlH/Qx/YlLTqMhSlT+Djlh1MTJIX5q1cCCv9bzzwd2s
         wz8PCEY4WVmtjeUngu8KQ08j04Is0NPlxZJ5qfhiYtxLlpP7w1SKl0r0hSqAZ2rA04yb
         RFphd0jfif0l8MStG1U2iM9x2vaeFBO0QNVMxeD84FiRbMxKQQHelWJ6ur3hKBVbfUih
         O0K9TAS7pQnuqfinAETkDPZrmaNHrEjqbDrzaW2EHzrO/fjAFiOPTcD3rYzlMsIDTVE3
         Dtsd1yIFcZc6UYFnYsYjRsv3aPnW+sdzjo+S84UXqRmZk2InPcnEWEVqOumvV/Y5vXFf
         GGzQ==
X-Forwarded-Encrypted: i=1; AKwUvBznv90xdE+SS/PJ+tl2P5e78k2TL82sgj2KpZbJHMgl/eUUxa/eRbl3SoH5uek7jEl4skN8hh3wNZ2u@vger.kernel.org
X-Gm-Message-State: AFq9FYKfagHe3xDfU74MGpzx1N7J/bimO83/hBSjezgCGOdY0b7m29/0
	bomwzBav8CXlex5c4Msw4AfuDVvlRsvtPwU671m/il32vW6jOwDv6MOTX3S5rY6T9eH3YGZ/tsk
	prTYsM4iePC91NJnTcIc1m2wN5qUKLJsmS3I7sX2gpg==
X-Gm-Gg: AYBFou2SlJBlUSXNge8+CqMx51qBds88ARFLrdJZcc2WbMm2gyzFI6HOxPHXhUDH4Tt
	GkWa6HHmoM1oVl9zkgotft48k9iyc5ZHvP0ULJcfmbvVU3G0Z0xFZUeV1a4uNhYD0ND2MC8Y9Fc
	NB1USy09xdnwf0Q/7ZA1VdlksfMMi2G7QVhAFKhN3EIaUwFsqbbzcsO+TEmR7XYEEBRhtCPSVCR
	IQAay+aZPqzDeIjjKa+eS2Obza1RW/YebQNhBTh0T94WydrekBWs0k+IaGuzXCChh1FX8lgED9C
	OmI/kqXS/DjMqxYUG7CdGvanuX02NtbJYsiQCcjY2r7HyMTpZSgydA==
X-Received: by 2002:a05:6402:52d2:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6afad731ef8mr8879468a12.3.1791299916262; Tue, 06 Oct 2026
 08:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com> <20261006030739.GA3457522-robh@kernel.org>
In-Reply-To: <20261006030739.GA3457522-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 09:18:23 -0600
X-Gm-Features: AclHuK9X3bTaGpN7i7UclAS_3sT01qVYKxTd90Hh58vpFwo0cpRNFUaLVMAbBaM
Message-ID: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for their
> > consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG channels
> > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > individual RPMSG channel. The name of each subnode corresponds to the
> > channel name as defined by the remote processor.
>
> Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> then 'gpio'.
>
> I still don't understand where the unit address gets defined. 0 and 1
> look a bit made up. I'm sure you explained it before, but *this patch*
> needs to explain it. When you define a second protocol, the 0 and 1
> addresses are taken already, so you can't have 'clock-controller@0' for
> example.
>

I had a conversation with Krzysztof about this here in Prague.  We
have decided to adopt the bindings proposed by Francesco in this
thread [1].

[1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/

> Rob
