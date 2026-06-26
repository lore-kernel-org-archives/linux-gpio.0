Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323563F99E6
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485080; cv=none; b=BNoLk/Qu9VNc6Qfeu02b83UV3rn17v6spfMXv0fBz3o4XwseZ4OhfoFS132994P4jwuSx27f7i8Y95gCJOMxtx3uqCfPDaFNXk3e0v0IXqoCeevderrfeAVo4HSSi36vUIW+zUe2fM1A+evcBC3HRlhsZ36stJLxM/cjmoqH+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485080; c=relaxed/simple;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlLjknkJz0MU9YI/4wr4tUBjK13MQNflNzFWD9fo+uXOWGWFrTUbgz2QW4zxGeT+ASTIcK9ylTAIxzFtCGCXjw6LNoec6Lf5f9hYfCdMgLhRHklMbr3guDn5GZoMmbbvnD+y0EUspH2eew9YVJpy/l7BVVA5YGHzcXpzHoa5RUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtFPFR86; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtFPFR86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3A01F00AC4
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782485079;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YtFPFR86jlEfPinvTKPO7Xo3Q6Pn6lfCRb4oZkeiDpFCN/D9mtc4Lfcxbv/D7oPaR
	 58UssOuuRrEHnPGYkn4D76RRI7KpSuZ0S8y2i5Z1zBdD8Sy/dRepuxmjdF8Y6i1WEg
	 zZK14SsSHAiPl+cha1o773qyZnPFafIWYkSojb+kQk2mPYHf+iBdqhRRdSz88VYHw2
	 twuY6MDayMn7HLSVUkFRYhzwi7xG99ZqOx8pw99SVBRNtXEqNmEEOAT+nHpYwMulRZ
	 57+/tXEJfpv338WK2zKdWRyYKAsC+fpdrKZVAf3mOtbTIwkQXBIklFkmOlKO4gDkBP
	 TkDkyagASTcCw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so875237e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoSyYv6QlCbFWOIg94KzgGRnzYAf65LNfHMTYKQToqoC+m6uSRKcjvok4JqNISIyDrx1SFiVUxXTeJD@vger.kernel.org
X-Gm-Message-State: AOJu0YzDG48a28YNyT/C1UKgURwcJ1aF/OKT6EyUyaOOJovUMBtazF7T
	rvZ8+1XgdXb9qkewHWRBiyimi3IEGRvQ5wWT6ijl+LhHpAieUNnTKEbEKFII3T4tywACRSETzcl
	gRUOXjWHSBjM8qltvACvcTZclcqZE2p/r6l5+IBZbSA==
X-Received: by 2002:a05:6512:1325:b0:5a8:8db6:b3d with SMTP id
 2adb3069b0e04-5aea1f4b9aamr2215524e87.24.1782485077659; Fri, 26 Jun 2026
 07:44:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
 <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com> <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Date: Fri, 26 Jun 2026 07:44:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
X-Gm-Features: AVVi8CdivKvRCew0jR-PMn3z_xAGV9V8TCmmlzMbwwdMXjc2U3bvSB-7dauR6_Q
Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jun 2026 15:00:36 +0200, Linus Walleij <linusw@kernel.org> said:
> On Wed, Jun 10, 2026 at 9:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualco=
mm.com> wrote:
>
>
>> Add PMG1110 GPIO support with its compatible string and match data.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>
> Acked-by: Linus Walleij <linusw@kernel.org>
>
> Bartosz will queue the patch, I think.
>
> Yours,
> Linus Walleij
>

I will go through the pending patches next week. Thanks.

Bart
