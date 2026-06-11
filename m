Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830463DB309
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179641; cv=none; b=uwHhrb0oGuqOBuJTwlfuTvbwdmMr+imzJUDXrCmEO1MwuL8qIQi+sfAW5YoGMkCRoF/QlN1H3rnSstVrOUbtwLCL4YZ5XX8aexM5yyEJYM0viseKjkC3ytoVG4rFBNKnvdfpV6ZdOttKXsebwuP/6MebDsPNNBsYK2qGmB3gCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179641; c=relaxed/simple;
	bh=Y5O0esjs9rbfPvesVaqPzOrKWkANIwU8MkgR6MrhlOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0VDlBrm9kbihtL6zZjf140/LfmhujSayx1uh2Yb0ZwPD8YxnS5Zf3yvZeYFWA6QD5GvXdHppF7j0ErxP+j6ZZkj5CLPFvw3oHMO2lm/VjH4dc/RaN45vwoR+AkFyZIlwBxZWaWsBCFx5WbQBb9RkJAVHDxNgg6nMVGYrUq5hcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFiXffe5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFiXffe5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC621F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179640;
	bh=Y5O0esjs9rbfPvesVaqPzOrKWkANIwU8MkgR6MrhlOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZFiXffe50qrmpBwvo6Ll3SV8r3CXDSuesxaMt9JaFPggLkLsMcyHm7aMWfNnuJJha
	 R55/zVbwXtDrqc6E34eRR3aOPUU6eBJYvkazexD9Tzk0VBSq04d/0g0i1BJDvZPGtc
	 xfypQR4zOHNnrKeMnklJ4p6wwFbprWPuC/c4qAzo0eRiFLroHzJqbPjsBys1zkyK3w
	 qXvjaSpmYPM8AdPNQpyUcZQMa/ZlTfVveSaQa/qrDS79zLMhzwykQkzZPPwt7HWcv9
	 dKHyjS9WaEIn/HhsArNNaXmuaehrrlLMXNnolv+aMH3OCjJcrd+KnPZoKnX9Pva04k
	 mZJovRBakSJcw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so7625104e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+xI4Q3oy6RMasOAdLHbQi/YJss3sCzt3o6iv0pM0OYrfoR1KNnaLpMTN2n5ASREYHub/zPHtnDD/sx@vger.kernel.org
X-Gm-Message-State: AOJu0YzfP7saggzKeuJLIwJCRGncTRv2/ld2qtaApu7CREI62IYPz6rG
	2Wkbp9rg2XyWP+WCFuRHVcwfPjG6ELpsYP7rDd5HYqTW1JHLc8RmHjh2YXK6innJ5mehs/VHVVp
	5Udh9ya7LFR4fnlRM9q3hOJjtThJ4NVA=
X-Received: by 2002:a05:6512:224e:b0:5aa:655b:ac29 with SMTP id
 2adb3069b0e04-5ad27ac04c3mr852433e87.13.1781179638920; Thu, 11 Jun 2026
 05:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
In-Reply-To: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:07:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXpK5YbiY18UDyCB7qTk-oAFAf8Lp3795f4Mm2AYfn9g@mail.gmail.com>
X-Gm-Features: AVVi8CeScm66JLE7bgnGC6_ZMAcAqvuYgWnMiYZr-LWLvJEzrFjcAgE3TS_WfZc
Message-ID: <CAD++jLkXpK5YbiY18UDyCB7qTk-oAFAf8Lp3795f4Mm2AYfn9g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:43=E2=80=AFPM Navya Malempati
<navya.malempati@oss.qualcomm.com> wrote:

> The macros QUP_I3C and UFS_RESET are defined in some platforms
> and yet not used. Remove these macros as they are unnecessary.
>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
