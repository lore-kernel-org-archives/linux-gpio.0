Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7541337FF43
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526791; cv=none; b=OjqEa/hwS20fYBPMdUrD11VLLZh0pNipe4CPm6qfihxHPNMSVoY99N/HeRFfgbUpQoiTt2hdFcZ0/74SBms0lmFjSGRZWLJUrDgaHtgoM0dHd7XL84W07vQmEseJ+U55CRF2xN5lJSEyeChu526KhIpcusw2dRnUPtBb5DUJT38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526791; c=relaxed/simple;
	bh=qbX/u0YvILlswAD20c2Nb16wHxkRKuf6rWkIOztP9mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnk1Y5zRMMbSsqgoGcvoUrtm2lnsPaH08/uJNvgJ2Xydmhv8VIYHnG5h5PEuMoWEQuCyeAc4yotvSvj9fyVvgqHckMrp7MUlKVo0LxWSH04ef1aIneNtPm2M0YKBPmiSCbSfVk09Nc250TChIrO81f518LmRQP/iNI5iuycH0G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sh97Pd4r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sh97Pd4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B7F1F0155C
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526790;
	bh=qbX/u0YvILlswAD20c2Nb16wHxkRKuf6rWkIOztP9mg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Sh97Pd4rC9Iw7hEt+aYcJxtxh3NCQBnvhR2MNf3CpOy+/pYI4LijnchZCBTUaGlEA
	 t10izqgfqkncdc+rUWlHo8gaM98FryM/Uh3CgCpeR4+RymfjXRr3xlJzdndLG4cpCH
	 3KECiAVgoq/PQcUmBMo0tYpoGq3wGSfjplf27AkrJ5kEXgcbBAOjt7uvI0+vvKUPbo
	 XBuBbtc0Y4R1kv6BJ5eEnaq1qAcRxIDk5hGEUQrq4L+TfcIut9oxX/GbEn8s3hWVr9
	 mIzyPN7yNmOXU8ZCGKiyWc5Lmn5/bkd30L4KBk2YgcffzgbiPAZuCfaxHNmaYRNd0U
	 iDiiXyja5GkkQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a884815606so9075179e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 01:59:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+UjDt4BN7Qtjvg+riDnj2gNADI9kkfQxQV6StXBpBGEoyONty37iY4AEvFoUL2WrVOku3i+CUvcCy8@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWK0QQ5c0xCHQ4KzuPB+AwFxifq5sJynnkC9yCfv32scJRKc+
	OcZFVp17yTclgLIbTaa6ON3f4kk1o4KlBl3K0RGDougjgBVlaSpHA7nwJBNIP5dBzgB/Mm6G2gi
	P27QcHnnVihyUO+5qj1qS48TScNzz9eI=
X-Received: by 2002:a05:6512:10c5:b0:5a8:9756:f6b8 with SMTP id
 2adb3069b0e04-5aa323cd97emr2082906e87.35.1779526788895; Sat, 23 May 2026
 01:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com> <20260512060917.2096456-4-shubhrajyoti.datta@amd.com>
In-Reply-To: <20260512060917.2096456-4-shubhrajyoti.datta@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 10:59:36 +0200
X-Gmail-Original-Message-ID: <CAD++jL=iCJpKirfc0GqUuKjrLjeEyWMvcmDx26+hTFtcYz0uPw@mail.gmail.com>
X-Gm-Features: AVHnY4JF7lnezv7m1tQlOKAjlmVpjnjJD07jbsl29OKRAreK5EuKH4xjhiad3wk
Message-ID: <CAD++jL=iCJpKirfc0GqUuKjrLjeEyWMvcmDx26+hTFtcYz0uPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] gpio: zynq: Add eio gpio support
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 8:09=E2=80=AFAM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:

> Add support for the EIO GPIO controller found on
> xa2ve3288 silicon.
>
> The EIO GPIO block provides access to multiplexed I/O pins exposed
> through the EIO interface. Only bank 0 and bank 1 are connected to
> external MIO pins, with 26 GPIOs per bank (52 GPIOs total). This
> change extends the Zynq GPIO driver to support the EIO GPIO
> variant.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
