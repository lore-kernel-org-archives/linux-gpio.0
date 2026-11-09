Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794233680;
	b=QinWtNIclKCHCPgG6OHddjDQrL4YsmXmMIcAG0iHsZGHYsfzsta1sgOuu/11R2dyhANT
	 ENlL/aU/lwvSIJcwe0aSvosR/CCGGmUx4794iRigeQQKnaDukI6jjgLgU5uGvOSsU3i2d
	 EhLkEtYUyCo0L7pUTxNmOxE3K6x61iDFpktZ1wnX4+7vPN7LQzaxbTpd6qFFFodO0m0WV
	 inkBLp/R/a587ST8sMOZBqAQMIRU0qVhgYiZnrpmSZv+7cfG+R2HhYms751O8+1IVc051
	 /RRydpwyljCQWkfSpNHhKDFjZ56n6HFdgqNeCVkeW+wOrgzdEt81oZd+OmZ1u4Kyvpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
	b=GYNhk9oJzhw/ug+dt1+u59HYLq8iFOYPKzqxUt4/WXEjkjT+r5E6pFiqPPrM/ePlfo6+
	 OW/fvF+gBEIS/DheUiJID+nuqS2az3I4v2aIC7c0CpuUG26A1HDYYz+NlfTlJCjf3Ul5u
	 nx/RUsoMWCfQVJZSdyxACF9SPVUrdnYGeieu2CQaBMI3qHNi3tSNcZwcBVQwaqXjitsRf
	 NQOeqmnke89QpKgzh1igU0VhM5in+v3/ja5IEiSfRRcEl2xb/3EqJG17f1RdLI2VRgMlA
	 ffmd6XWxurrJdiWMAVNahjRrjdYUmy3ZfmoymickueqhsVeHH5cPGJIcqnmlL+mL7RA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W1FZi+2c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1776E606A338
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 14:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1776E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W1FZi+2c
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ece6c1d1cbso253145e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 06:14:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794233679; cv=none;
        d=google.com; s=arc-20260327;
        b=fZ+0AKTL1IUzr1mxdrxkqDrIhgDrGNlFC2T/xeLI5NwR2nzuof777usMs69bpA9Sv2
         w6V11s1aG4XURNB3IXnSN3Tryun9OyrN8p/8wQf7xy+uReAna5ZrTUQ+QUD8pH68yFoD
         0hOobxc2m+l6nUweZsGq2iZAwZl8GwKdGeu0pUEL8SjaPh/Ur6VN6ip3tRrl7PGB5hCN
         T+/6fVcAEYPjy+DH7RQfiJIHB7i1xRBqvpfbi0Cpz7B8h5Znay2A8pbLF8S1DwxBweuk
         IO/IeeuJmV3bp6bKQwH4N4xJ8HBYcx/Xf5Pl5Hvp4pDSG2dG6wh9/iRusVkVxrBk3EWe
         YVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
        fh=UoglCS9OP+NVL6XSbDU/fD17NfdOhesbEQSlA19tSm0=;
        b=FjxkeH2lUaQG7gQjDqksoygb0MSxP3vO7PYB3ZH2EIAdaJRAua+yWCBmvgRlOmiJ6+
         IZzhYXVyDeJEyxNBcZhNtryI5GuS0FJ/Dfis820rXrY+8Ut2J8L1dbDzuv6am4KiBZuG
         YLgZY3aIyV16npflVVii36uoWE1E3XJvuhBMCwuR3vCph6eCTPs3sq3TKb2YD2Y/gHAF
         CHYsVrbwWAvyg0akKGrRLC9An5FzL9K7F1K86gcNwXdIlXJNMR17M/+HQTSQeIokO83W
         fiDiaz1/Lxa8wecB6i4XKddJc2e6LIx5OT0L76HWA1ZoberslXMr+iYhQxk4V93oWs3j
         g9kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794233679; x=1794838479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
        b=W1FZi+2cjuJ/Pd5UY7IKO1Q2TxqG6+Wimax/h1l7sNRrlCVEqwNPHbl8D/GreBLxU6
         /v9GOPr60u+hW2mo9LBUmFNVLSUC4tKj0E3UCldtVynb3rtpfoImhFCbCJJCCFSvaNCm
         3ycJwOCfXjuy35io4Y5gAXXa+/DH1w6XAgtTqbNrLuOlrwxy023k/ZG2GgIYD6jjxmfh
         9d43WO+UNJ2n4dyEqsQlcDCt5CPhTISBP0G+J9HpaI58Drjw9tHvPX7zzGNETTF+FZPR
         5PVnzRi+Id6uR9XjSfimvZDbqFIB2/jgvV0Dfd+sZRAh35KWVtWjPJIY1spbfSkcqJFb
         Jrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233679; x=1794838479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9mUjzXalHv94qx96P0J3reYmh+gRnmsVzt8eaOGm78=;
        b=Y7Sdy/pAIOAGCnbKKViMQwqBeiZjTN/HNfRD+1G+WEGKCcCPbFp+0kOcBqLiNYcFal
         BB5I77de7cJU190YL704VaD4V06Dhyqeio9dPjjAA1kxERVclR7Set8DZJHfWjj6bk2d
         IiqZJirvkzJp/kAAAnGFwJ3DpGP9lpEwcjIvk5XJNxJDaryVA1NS3sTvEbemnxaVi66G
         ASWexGdBbwc9JDElKWLPHIKcBTX+Eluby9YVUuF3be2CEYCok6H+ZFGfuxsWOOk5tcIe
         7KE4sND2wZZoKfHOKxr749pgfgiYtOXUj6hwEVAH43sD5mdm78scTWLU+dkTukKb/A+r
         cfOA==
X-Forwarded-Encrypted: i=1; AL+hErHEnDchK0XX7+MFACSnzVtK/kJLBAwcN7KpDaSH0QpfFk0kM/0r8K6CkkYf4AU2eyspxwNoHubeN3XH@vger.kernel.org
X-Gm-Message-State: APuU4Z91mPoiiE9ur8taGAqmNKDz4EzRCw6MVwQHL6fQpGAGNlAR/qsy
	u4hMaUM6McpMgAtDIh09YjmPt9idstQf2ksuwndITP7UendLXWwQbOGlhpuRl2LkYXzhbcQboo/
	wQ3UEBsdEIFvAOBEpji9u8d+2Xc3CUCxnqKl3ekk=
X-Gm-Gg: AYBFou30QFH2MQCr77sxI77mq/amLY4d7rtuT9SL8ooNX40Jfpf4DP3FbR7NE3XLkFf
	1KDSoa+CI53WAv/bdnQQQ4E5YQ3GJPJit6VjHZalUnP9ELTmCWz3L3K+yEYMC/urKPzDimjqyv4
	lTrNpvUnBDw705MDd44swiSGXdsmEdLOr7q4XwqmW93v2xzlVhtjnxu2TA89KRr3WMq3QgnbIen
	nPxSDpqWhy1ixLZj5sHe8d+O06/QE7ABNZGXJPmOiCmHzgmHDpifLoP/ac6UqdD8SFrhkqrjaTH
	8MuEDzuRShU+rDpxWCpS4XKt+13uj81n0FfrpvCUhzg7SHv6f8aaWg6bZBX9vy+r6vbo9L7imx7
	PvH4ieYiRNAEhN0qMHg/FrkoTr5V/mHm3Dy3CLxRmrn2gIW+IIB7DDfFV2UTaLQs+4QSx+6WrrF
	17sCwOBRftyE/85o4i4HOCxRM=
X-Received: by 2002:a05:6122:20a9:b0:5ec:b4ec:e93f with SMTP id
 71dfb90a1353d-5ece7248b4bmr1176604e0c.10.1794233678355; Mon, 09 Nov 2026
 06:14:38 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <20261002124226.435265-1-morbo@google.com>
 <kcqbiis4m7zqlm6nzpacx6fkbycyy5gjz5nnhtlxlhzxn3tklb@d7j7ciafnpew>
In-Reply-To: <kcqbiis4m7zqlm6nzpacx6fkbycyy5gjz5nnhtlxlhzxn3tklb@d7j7ciafnpew>
From: Bill Wendling <morbo@google.com>
Date: Mon, 9 Nov 2026 06:14:22 -0800
X-Gm-Features: AclHuK_MqeRDtoqTOgbcQ-UKaELZDMLvDZbLcqrG79GD9Nb9csHUyVNFVw5OyLA
Message-ID: <CAGG=3QXfNQtgp1CqD-56x-nvnqZumcejBKqcgeaNZAj=ftz1Dg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 1:21=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, Oct 02, 2026 at 12:42:25PM +0000, Bill Wendling wrote:
> > The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> > with the 'size' field, which represents the number of elements of
> > type 'struct acpi_gpio_params' allocated for 'data'.
> >
> > To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> > CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> > attribute.
> >
> > Analysis of allocation, assignment, and access points shows that the
> > pointer is never accessed before the count is set, which guarantees tha=
t
> > this annotation is safe and will not cause runtime panics or
> > false-positive bounds checks.
> >
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
>
> This can be dropped now.
>
Okay. Do you need me to send a new version?

> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Undefine "__counted_by" and "__counted_by_ptr" in the EFI stub
> >     library as it doesn't need it and Clang is missing a flag to
> >     enable them.
> > ---
>
> Plase, don't send new versions of patches as replies to previous
> threads, this confuses tools (and maintainers).
>
The "v2" is NOT the version that should be integrated. I said the
original patch. "v2" was sent as part of the discussion we were having
how to solve the issue that cropped up, and not meant to be the
defacto version.

-bw
