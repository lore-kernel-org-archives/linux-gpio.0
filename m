Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF83AB29D
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859474; cv=none; b=fw67Is8aMlsuMXzeEamOHCv1+ddEFgRbXcl58OUd5SpTQFQrFnHOfES34f9bIiQHiKzR5vDsVrzmBBhFbpYXyw+RaEPrfg6JwV9bj9dgUY5qq4davu3HQaswKHES46vd4W8wjFqdl72rlvHNcbbbPgu32rcebHczvnjVZTgh1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859474; c=relaxed/simple;
	bh=eKvzCc322fl5N0+7gcXHhAyB/HAAszO9oZGPts34+oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqge0b7sKZzXt+T5J97a7IKfxMdaTfO/DnTjdyr3DvLoY43JprpfNQn8ipdlAXRsoateklSdt7JB6orthlMuwN42tY6Y994PEzOK15SCPL+sHw6BuET2ns7cWtfggj5MT+f/t2v7na2LL8J02BZSK2ZIvCUVyQMdrA6KIWkHGug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BG1xSiLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BG1xSiLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13716C4CEF7
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774859474;
	bh=eKvzCc322fl5N0+7gcXHhAyB/HAAszO9oZGPts34+oM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BG1xSiLIjSlH1+C5ray0lsdKPxmyQqiGt2tw1IVTxwcpMDqbfzMmZXdi57hlCEUEj
	 L3hgo2yFiiE93f4WFxmF4yHx0j9ho0WZluuiowDyxcQhTGECnMXRZkMe/1iD7PxEaN
	 drEf0Jaat2KvIniu2JUXqiAyy3bZfwCTy89VtF1RvRe8Rdf2PXEIyNsW096X5mBJjz
	 mGs91r2EkFIZcvTmnL2P0aJic0ATnFxVdvtciUyv0FytrT0ZR+0Xpp/flkRXomNFAd
	 MAAOWF8B4oo/qyRj2H+lZ/06wknZQVPrwojALMmh4PYw8lhn6no32W/OtAQ8rvN3Qo
	 s/0mMKpiQI2Zw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65015facf32so1754265d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6QKIBfDIAw4KdQAYNPVWAVYuDZ2zT9evSkJwg19INR0KfCgbZ1Odp7chY7HC5qJIygbz5jaFmMU5d@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3Sqho9NDO1ZzUAu33fzW2rZhWA/7qGJyo+mxFq9Sf/pZCLOE
	B6P6Yod15jvHgZ33X6CBH4EEYRT95a7ZDbW5QHmVha68IOCBvldzWI3dEekurqNWca3ERtAROF+
	0HjMU9Lj0g4m7NsWh4SqbVBcwP6KoLME=
X-Received: by 2002:a05:690c:389:b0:79a:3a33:93a with SMTP id
 00721157ae682-79bde0b0492mr116304437b3.37.1774859473483; Mon, 30 Mar 2026
 01:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com> <20260327171240.3222755-2-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260327171240.3222755-2-mukesh.ojha@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 30 Mar 2026 10:31:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLna8XSqyo0m=59k3UFpZEmC3Kszh=oKeEFX_jXDpW9BMw@mail.gmail.com>
X-Gm-Features: AQROBzDohunATUWqEjHd6JUfuS0cCpw1GKYJTKpnQBK3emFWxJ5qIyJPBB03r4Q
Message-ID: <CAD++jLna8XSqyo0m=59k3UFpZEmC3Kszh=oKeEFX_jXDpW9BMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Drop redundant intr_target_reg on
 modern SoCs
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 6:16=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:

> On all Qualcomm TLMM generations from APQ8084 onwards, the interrupt
> target routing bits are located in the same register as the interrupt
> configuration bits (intr_cfg_reg). Only five older SoCs =E2=80=94 APQ8064=
,
> IPQ8064, MDM9615, MSM8660 and MSM8960 =E2=80=94 have a genuinely separate
> interrupt target routing register at a different offset (0x400 + 0x4 * id=
).
>
> Replace MSM_ACCESSOR(intr_target) with a custom accessor that falls back
> to intr_cfg_reg when intr_target_reg is zero. Apply the same fallback in
> the SCM path. Drop the now-redundant .intr_target_reg initializer from
> all SoC drivers where it duplicated intr_cfg_reg, keeping it only in
> the five drivers where it genuinely differs.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Patch applied so we get some rotation in linux-next for this. If Bj=C3=B6rn
has opinions
I will just pull it out again.

Yours,
Linus Walleij
