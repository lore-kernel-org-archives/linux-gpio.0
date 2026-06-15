Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42D04071C0
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538868; cv=none; b=MZs39MnvALYXSeD/rwfSdtMsGZLXDxgn0FDepKiiz31v9cdnJL8DJUEUKARustZTTgmKdwHzmPr5bGyWBp52Rfu2nxP6CISz8cDXHwT5wrxo7S03kr2u66o00VcsIFC9gKSGEW/TcakNDPBAXLLUzMJaHXR8/GY6w1PGhnt1R3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538868; c=relaxed/simple;
	bh=6WeSHd2Kgkfc3AOw0PGjpJ7rv/tKIjwp3JoEKKb5LCo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVgPd547h5/LQmnZUybyO94p0LPfcT5GFCDY7P81rzkk6EpolbhhzDQPZHJMGJXNLcIhqBNykXR7AsTBWfzx8aMgqlxfhAa6hywf3fQkS1OfZ6KIplEBfnoSmBoejpQopIxHRkon1gK4lunGmA1W+IvSeVFwv8zuonBQfQ/hBMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtxePJUE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtxePJUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA7B1F00ACA
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781538867;
	bh=6WeSHd2Kgkfc3AOw0PGjpJ7rv/tKIjwp3JoEKKb5LCo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BtxePJUEIFNn0Bo251FJ04DAuRM4mvKmHQytjtZt8WgU6raWWYmRdi0jJP6osfipc
	 ZJ5qMCaMvYnn0taCCXB7jSyNUbxkW8ExI/X+MS/CO59ofZtUGbccU7ARbGXwB1nfeE
	 qldBs9MO1S3PckPgtyhg12HGahB8bomH3y8ITM22A02vlITsaOFX0yI+GoUwPwVj+r
	 jqBuuqlShBBGywDh2TAV5NSxE81Q4MnG73CNM4bE7kFEL8QydOAZNRO+JowColtsMz
	 KMKXTmfbxWWaqfCRzpHNSMBt2AeAS/1oTpPjzhIfi/QS2GZMD7sQ0FyHDZ3GU5kC1y
	 /BKgmNirrbO6A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso32277141fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:54:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/MYhPhczKCW6ozrv53aVwTLVJC4ptDzW+apSabqfo4adz/fjwfLNDidcRZIJIgbwyRE/Xm4qVQj9U9@vger.kernel.org
X-Gm-Message-State: AOJu0YwTgXqKJlA5htFqxMMOuDWWssTdvkn7qkDBtynJ9EnH95yqySry
	tWFyZIu/wIE23aTPPqlbuR2UCKZhG+0aD6RYykP5qPmklFIWVSMGGI2JQPNurCozfx2sgoxQc5f
	2sjCvzcRnuH+AayeXqhE6zKhBCN3WvclIA7rGT6YbeA==
X-Received: by 2002:a05:651c:2107:b0:38e:d3ec:4f87 with SMTP id
 38308e7fff4ca-3992b27b888mr44663281fa.21.1781538866270; Mon, 15 Jun 2026
 08:54:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 08:54:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 08:54:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jL=gPF9jzPe90sy0W6ogEWq6LqTnbRfnoH5qxwGnBTiGMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com> <CAD++jL=gPF9jzPe90sy0W6ogEWq6LqTnbRfnoH5qxwGnBTiGMg@mail.gmail.com>
Date: Mon, 15 Jun 2026 08:54:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfLspdy3Ncx7_dq57KXYs2ge=ZCp3jO2D7z6Gd=8XN9XQ@mail.gmail.com>
X-Gm-Features: AVVi8Ce9BGZ_y0bxQoqNxK8CUH9a7WMK-mS0rkciiVd5FoqS3eBKMeawqIaooQ0
Message-ID: <CAMRc=MfLspdy3Ncx7_dq57KXYs2ge=ZCp3jO2D7z6Gd=8XN9XQ@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 0/2] pinctrl: qcom: lpass-lpi: Switch to PM
 clock framework
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, 
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 11:37:43 +0200, Linus Walleij <linusw@kernel.org> said:
> On Fri, May 22, 2026 at 10:47=E2=80=AFPM Ajay Kumar Nandam
> <ajay.nandam@oss.qualcomm.com> wrote:
>
>> This series converts LPASS LPI pinctrl runtime clock handling to the PM
>> clock framework and ensures GPIO register accesses runtime-resume the
>> block before MMIO.
>
> I hope I can get some feedback from the Qualcomm maintainers
> or I will feel tempted to just apply this...
>
> Actually the volume of Qualcomm patches has gone up the recent
> months so I'm starting to feel like I need a Qualcomm submaintainer
> who does the nice things that Geert does for Renesas and Krzysztof
> does for Samsung Exynos and collect the Qcom/MSM patches and
> send pull request to me. Think about it! (I know very well Bjorn and
> Krzysztof have enough to do alread, so maybe someone else?)
>

Hi!

I've been volunteered to do this. If you agree, should I have a separate tr=
ee
like for Renesas and Samsung and make pull-requests to you?

Bart
