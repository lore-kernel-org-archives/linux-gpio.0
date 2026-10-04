Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F7747142E
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141696; cv=pass; b=dqxPSKwLBApedAFVmf9cgqD75MiRiMoSBf/Y/5Wpexv9k0WBNO4JB9T3HM2KDdvQa5F4qjP0pXuJHYM19V9hB+jEcZj3wN+CRsakUAQWJ+3Y2cwdyuNxylcV6heMAW1pEKnm9tO5TowtPYBTDA873wpzWv/Xu6I5jFWYTdID9Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141696; c=relaxed/simple;
	bh=anqUzSCvMyf6ofquk9+HHp9dh9/UXqbFF9xnCdBnaC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLciS08lkQKL8jCP1VYTwmBbiW98zESQenfi7LanlJYonlZFKknfrWbM8e0rbzWs9O2oOjkCbze+I9hvF7azrGy47dGXO65PqYpX+EiIfL1xZvkI43RZttnn6yKMr+jM3Br23gxiu1zO3s2bF4c4cAuAHqtg/UlQzemEtP4/nsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8Yr5/gy; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8Yr5/gy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2a25dfbf5fso186618566b.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Oct 2026 12:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791141693; cv=none;
        d=google.com; s=arc-20260327;
        b=O13aaa2rEizvNw8zzeI8m5jYSz5wZPB5B1EPHvR+wc42zZ2/0lmy2mSp6ERrVdy0lO
         ZKTmLb3CPCNnplyUU2ASJJVwden/YlFx10gsLml4JnDiPVMd/nA8x0fNCzmz3Mb9H7qF
         vxHZQp2ZtuIAVu6Z88EjIWId9Jq+Cyz91idM5+SJWdI9RI4Oe7Fs4k05AfyOk4TLIRV0
         +EVeNR+0zqatJrNri22fs6WIGUgsTI+vHkb3YFamSs38xASF5Lmq1kydLmWukIGPkGJN
         gQoiZfooVvWq0+szI/miwXbFhpNqPk1f6HwfE/g2DagJLQX6PIa71so3fBfHDYEUIzbG
         A4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        fh=IitbuTMN+OOr1FdD2AyY8YEDU4M8bD1CoNIcejN071M=;
        b=NLeIUemJxdYyKIhhjyXjnZ0/3mQsn9fuEqIhrH638AMU+l6M62qUNBM37cGNe2PpGe
         EZ5OJ7rSJ+xm5fvJGZTj9z3qzCmCUec/GFhLaIWBZSQxa8XlkysoXgVPaVKVLnfksXnL
         wxwG+52dL+sMoZfHFc+3+lAOgzrNBElg12aTwfctVJyU/OTkktHmjPdDDPoLMSaUZgBR
         Lza1mjOZI0uBAqBuvqC2fVu3xV3JRnX75VNT6kJmPpFoQpHVwlYNRvsrUWlmEpmMSOOd
         3MOWbPgLqlnFDY95pSE504a0VrazAAWwY+r7N7dKUDLsfA6L/n30ib+pTCTf3IxHG8E9
         btTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141693; x=1791746493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        b=p8Yr5/gyikxjJwPsxHCCfJQhMBwqgIxI8YqKhOGUuQr59QoUdOdwIQ5SrJMbpM8S52
         mW0/a/2crhWiWvsR8U1MzuPWXmLC5QgkARzoe/EoZOCr1mHfvRgVDV/xlC+Nr9LmpxUG
         PN21rZ8c2HA3mlBCHUVixoHZxFeAAwvIEmFtnWF1QI8Kw5CVB9DsXpheiKKmIkzV3q17
         V8ei+/7hME67OPR7crCEIDXlM0kDOyWea9LjRtrKu1RukqWc1hQNjq4MVRgqVedA0K9L
         8unGxzIjxAQVJDw4y7+zxk+64PFSLR4Zcqg9jaRFA1yRUHWohtHiFH1GDX79PuGNdKh4
         gqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141693; x=1791746493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        b=1r+NjRMQ/PIXSeGt32Q4o7aYoA48xHsujBWD9mX78ikwF1QUQp7anHJF0oYbGCnW1z
         o/e0DD8J6z0itLqmqCAoZ4b8o/UuOKYFNzkS2sUKiVIx6M6iDkIBKXIu62w8eJoDtPKT
         CHtvWDptbC1FcrKKN/oKEI/MHkVS+9VW5KD7dgrP7NKIOlg35EiackJhsxUYwSWv1EJw
         G899hVuDlEdsD/bvC5Oe4IFr6tkbVd5u5oO8yECrWmJxk9Tfgc9kwCy34usU9WO9PrQ9
         h9o74Nd/U1I4GCOkgYjrIPgZrqq6Nx/UloKThhpNRLCCPv4ao8s95guxh2eop11Q+Vo3
         FgzA==
X-Forwarded-Encrypted: i=1; AKwUvBwdlngrXKg9/N05KkTSHuxesqp9FzGaiPzV8IAH4yR/wYGcmksrKHMqfeou/+pcQnPh7aDceoH+dSVn@vger.kernel.org
X-Gm-Message-State: AFq9FYKyzePP5JbmQ14IoJAL4vb0uOppiLWNhdVvK2Bu5W5xgfnNRAAz
	Ha/3MEZt067UeB4Pfpe9QqfIxFqpP6RNT1MKdFhH/1UdOGaEu1TwHf84GE2+v/VtKr3kPqumFWO
	OrX8t8j8ZTHjgvvUpPMjNXS0QoDwoYZk=
X-Gm-Gg: AYBFou2jgfBXqGj5LmQ5DMx9L7mrhgC7fTzv5n7AY95H6mep2nQOOqMn0NtSxt+WCMg
	eBme0MWl5nsle3JNKtymOXdhA8Owo95uLYyxTP8nHZaDc03Xrs+bTZk8GTlEhmlMWaQXvDNJZ+I
	aZbf+lI/sD/nSEQUDZPn513Nrs3X/7IQKyvRWYQQ90PP2kBt1qQBDvr/apgrm9pCIVojnoxJuy9
	T9EpykDVQmeSKPO3voL9V2NmSnCAUEBpnQWsSw/wweMexwZssXZOT0hJzi1rrnAY+EKWzK7hgrD
	JWkA6+SW7JpJiND05D/s9duK7hxEKHJq+PkMU1fdNdI82OQ/b9owvCSmlehmV+6/xMjr5LXb766
	pDDM/fYbHuUtf6a8iWwyEneKEsKFe0VutJTTW7paJGVEDdJhORdB6lL/knPHYa7ByZSUNcTu0Qq
	sOuwf1xyTvltqzOPEXA2XHOTaIrhWVPfWI7LK9JmXu+xq/KG2DjeRBx+TZ5KdXXU0zbA==
X-Received: by 2002:a17:907:3d05:b0:c29:ab1d:b5be with SMTP id
 a640c23a62f3a-c2e6ed68587mr418879466b.27.1791141693253; Sun, 04 Oct 2026
 12:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004191042.143713-1-rosenp@gmail.com> <20261004191730.247471F000FF@smtp.kernel.org>
In-Reply-To: <20261004191730.247471F000FF@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 4 Oct 2026 12:21:21 -0700
X-Gm-Features: AclHuK-r6TZQaG6dalsSO0XzDLOu9FRKbJFkKWkwYe1BsjdoeuJOTYI5Pv6Cjc0
Message-ID: <CAKxU2N8D4y+MC_S8qnho2xYJNQ3Ft83qpBo_vKQe-yY=UXC+_A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: commit message falsely claims in-tree DTS usage
> --
>
> commit 7b4c1f570780f70afdcc949de9998c051c2323e5
> Author: Rosen Penev <rosenp@gmail.com>
>
> dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
>
> This commit documents the onnn,pca9655 compatible string for the On Semi
> variant of the pca9555 16-bit I2C GPIO expander. It adds the string along=
side
> other standalone entries without a fallback.
>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610021617.AlVUa9No-lkp@i=
ntel.com/
>
> > The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
> > expander. "onnn,pca9655" is already used standalone by in-tree DTS
> > (armada-388-clearfog, armada-388-helios4) and has a dedicated entry in
> > the pca953x driver's OF match table, but was never documented, causing
> > dtbs_check failures.
>
> [Severity: Medium]
> Is this claim about in-tree DTS usage accurate?
>
> Looking at the armada-388-clearfog.dtsi file, the compatible string appea=
rs
> to be only used within a comment:
>
>         /*
>          * This is how it should be:
>          * compatible =3D "onnn,pca9655", "nxp,pca9555";
>          * but you can't do this because of the way I2C works.
>          */
>         compatible =3D "nxp,pca9555";
>
> Because the string is only present in a comment and the active property i=
s
> nxp,pca9555, it would not trigger dtbs_check failures. Could the commit
> message be updated to reflect why the binding actually needs to be added?
This is outdated. 6dfda79476538a9aad1d2dac45453e62c6939522 in
linux-next fixes this.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004191042.14=
3713-1-rosenp@gmail.com?part=3D1
