Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DF2BDC26
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974456; cv=none; b=CfpQvc/P4xW53FNjry6D9IoWp5nIDWB1dAcJ9W2GipWLx8YUlRDjWvf7azXFzWA7ddm4aHmnNlS+s1Fz+8TyLBCnO/PXwif9Gs5MNjg4gvqD/9bfPLcgzZv8F1EGAUv6iOEjzny0xcUhlRrsTyBesmDvAPnbSDNmvzMq4yITY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974456; c=relaxed/simple;
	bh=/unGMp9opoNIJ6Kru/7vutp3Ovpo4/hi5PlbcV8Fe6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZl1f7hcPT2Sm04piG3KP1rJOAH9Mh/IeVtLEI67mwpWCJKSU2cdvrzVLAc+v0mt2f4CJJn0Wl93INX2tV3qG9DCeFS0b4JHab1PmA12YCPoaOMPoPWGlNgIC8atxcKUCqVf2FQ1WX7qu17YmtDr9dJGxZnYI2wZQSklysqWdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9NWnAqn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9NWnAqn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAB8C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974455;
	bh=/unGMp9opoNIJ6Kru/7vutp3Ovpo4/hi5PlbcV8Fe6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m9NWnAqnSzn+aO3RwarQ8PDf4i7K1foTPR381UAmh0vuGGVaCauNLiJsE0CRI2eLs
	 8WZaOkV4xpuubkGXqbPlrC5AV5Fnq6YO4x0LA74RwZv8ibCcPWu7v2+FVdFph6tOqI
	 jteUFmHjNsXnFD62G4cgdTQMWaqAHhmTHFMnFPS8lplXQAuDpAjNaxYhg1ogMhCF8V
	 7DP7Ydne9oq5wZUYmq4BimgiYh/Ro1nCL4h7zggjcveTYZCbJ3bu29Q1CUdgqD0Xx3
	 T/YNQCxLy1/9JS52lmVExVpi+YrWDLt2kIfmb9exKKNbnAgUeyDCH2uTi9LFsT/ZpE
	 pBRPlaFo2NQ8g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a860667fabso3942547e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:47:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zzySy+81ZMqAUr9vSd4wf++15bTd203MYvfAXmzWYvQeJNxVzHCaAmKXnciSvL2FhNqILhuKThj3g@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTIP3RDALAbvKYLj5FJWoE+q3LtG4ZS4o/7g0igtX8Hpadi/G
	UF95rVMbzu4kPFBXM6uUl9xb+HQBBTyUlLUVqoi8JiYmnYto/LqnF1KtntCVW08mF/3wJCIkv/0
	tLNGNbSIBFrk9h1FfsvspJFPJXSAtc8w=
X-Received: by 2002:a05:6512:3f10:b0:5a4:1389:98c with SMTP id
 2adb3069b0e04-5a8631c1183mr4987451e87.30.1777974454637; Tue, 05 May 2026
 02:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-eliza_pinctrl-v2-1-feff875e8137@oss.qualcomm.com>
In-Reply-To: <20260429-eliza_pinctrl-v2-1-feff875e8137@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:47:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLk0f3DgTpEK5eCY+igLo70nx9=DhFnX4HagMzTBAPQdXw@mail.gmail.com>
X-Gm-Features: AVHnY4IhPLHdLCO1mdo6JcTLgs14S2OEwZrOt9oXPD0aLEbL_gegvh6bPOPk3T0
Message-ID: <CAD++jLk0f3DgTpEK5eCY+igLo70nx9=DhFnX4HagMzTBAPQdXw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Remove unused macro definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 8:15=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
> platforms they are unused.
>
> No functional impact.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij
