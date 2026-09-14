Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07F40F743
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376819; cv=none; b=mszgcmWDyoKwLLT8wsPk8fQ3x/bbdBH6QSXnxZm3TRu383M7XyvuWi3ePun7T2buEcoaVTQr/nYT8FlgKW6dDYdVYZoIjqReLAjq8ZotYLOAHxYoAt86CEXtupVKc1H/Lx2K/W5cyOKXVcJgeJNirX+1lU5itW/ikyCF5rXr8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376819; c=relaxed/simple;
	bh=XXqdFfm2oi60CilFBpYaMXmU2C/cnVtVxjiWgELSSf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wq0rsV4M+66i26l199fI7+Oz3h+ZpN7OoKzNGqrLdBOekS17iJg2yk8eW2UPsam4emnXx+6TkH6UG94kqHCISNMYeIKq3w5FXV0exqQgwgIsayjQofFJBkqX03NFnXaiuNB9nxMD8rglZoAMeR5ISwuxnn5+ABROxezl1HcHU8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9CgMr9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9CgMr9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D3C1F0089C
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376816;
	bh=XXqdFfm2oi60CilFBpYaMXmU2C/cnVtVxjiWgELSSf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O9CgMr9a9PpnUA6uJDLNSprc5BQZ6BBNdbQ+CCidyW5qqIIccOCSQC6TAMDVtT4Th
	 JEadJ2pjqcR2OreerVqke/q5nM8OUyNRAEZhPlzGjd5Ce0rNrAyYYhHRgxPostUS6L
	 4pjtkye+HpP+sqEpgdfmdI126RTP5DtHlWMBNlE9vmHUP+/wQWSS1c28JoNoky667c
	 3LMaziHemqDsM/sYqenEg2l11Stgg9L20+as3M+0bdKRZLyM2xWzFt7rv7NkVKAMVK
	 zkl84kaXAoBRtJPrWXzmsgMVTzmBhGIf80HZMsSN/vGlNViLVfnwC2w5y2K2vy1w8/
	 b2uVLg35M8rTA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso3569609e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 02:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx1BjQL8N24GcJKA1qyt8BHe5FJGpK95QRNFpx/R2zWztdHWM9ukzpOKqp0DbEro+ez6vBlJITMtEnB@vger.kernel.org
X-Gm-Message-State: AFuF++lKwTjSzwVgqjW8pZMlts0UYFTw/qubvOgZjDXqzWmqaV4NTR8n
	a81TnI+dDQLssPWCyOrASvybRQJbskGA+WDZMTbwW78d2nakpjW3IV+r26gsJPhC5P6975Ofdec
	qFlfRfmVHEfRHWIR34axYkoCH8ntKqs8=
X-Received: by 2002:a05:6512:1293:b0:5b6:1a7c:aa12 with SMTP id
 2adb3069b0e04-5b8ae6acc3dmr453888e87.42.1789376815593; Mon, 14 Sep 2026
 02:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822-ti-pinctrl-palmas-v3-1-f92cd3b773fd@gmail.com>
In-Reply-To: <20260822-ti-pinctrl-palmas-v3-1-f92cd3b773fd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:06:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=TG8TQbDZhxDTsZXwR=WhxjF-H9eGDbtZd0qvtiE=MAw@mail.gmail.com>
X-Gm-Features: AcwNN1XDEoJDTBd-1-U2gQTcxDtwimIocXKyJkSK1zdIyDo_BPhYufwlnitpmMY
Message-ID: <CAD++jL=TG8TQbDZhxDTsZXwR=WhxjF-H9eGDbtZd0qvtiE=MAw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to DT schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 6:39=E2=80=AFPM Bhargav Joshi <j.bhargav.u@gmail.co=
m> wrote:

> Convert TI Palmas pin control text binding to DT schema. The legacy
> binding allowed any subnode name. Restrict them to standard prefixes to
> prevent the validator from accidentally evaluating standard integer
> properties (like phandle) as child nodes.
>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Patch applied.

Yours,
Linus Walleij
