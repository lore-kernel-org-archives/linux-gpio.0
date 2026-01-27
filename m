Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B926CE39
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505635; cv=none; b=cpmkeK3JoFr86gyOknp2Wk4ZgknmDeH4QFJ/IaUwL2ZfT6V9GWD+ooZy7j4r5G+4XPtk2AQ/YIAZqS9Yw0ZWGL3XGUC/VYbg+2oJCjvYBglF46VNuhiBefbLQ0OBe6nVfXShDDLh26hMqL7BQUiEWsZuekrjDYdTD+i9NCRiv9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505635; c=relaxed/simple;
	bh=p0IYKPvLat3QfnpDZR/OU3ZqUxwUEKvk7ycHfQxUWZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFpYynjzAefu17gWqGJz9eLFBM392fPjmvaHqZSHSCKmVH70owQZo5t6B2tCiO6ZTV07HO5USPeLoxf71kteUgZNFRIUhLUCoMHDKYUtxEt0QgDar5FwLLy8Ex4x+Wvo3xiH/j8lKWulEkHXnOwcArc0zcOqFkulKTc1CW7JydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vbv6PsAc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vbv6PsAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EF6C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505635;
	bh=p0IYKPvLat3QfnpDZR/OU3ZqUxwUEKvk7ycHfQxUWZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vbv6PsAcMvUdBF01LOt0+TN5btOmRSbzCatgsMvnx4lfsrDRysDt16czedra04lJH
	 pDKAJ5n3pDEMgnCRArvyJCKrQ4jDXf5Rr3gqSKtbT3fmD+lHRtV2wj2X91POQj4Kb2
	 PSaKME6xYEp7yahOmFSxcwd5RfmHoR2PP9yjAzRrJ9I7A7AJHPrMqrJ+q4BDp1tjNt
	 kcwvt7SSEQo9t5zVKTmvvKArxUTvH4rOt+P/0iuGK6ao3+QWWeuI0TpgqyL0x/bwJu
	 6rhdMtxd/qrxtgv9AiHYW3hH+u25GNWozBWvp/sZ77G543QL1MAzMnSWZ3bbowoKVI
	 pTq55Djhp2y6A==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-793fdbb8d3aso48183237b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWExmLXZ+sD+ZBDWu8lFDCTUK6H/adCpVING/CwrV9VcJQ/lpq8EUZIv42ntbvOYxDQMPw747DIHp9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03ducpWT6ck1Fca2SJyD34/Q4cBPumQZCHkLjEaDphU5pSUjS
	sYFUQNUDpZ5PLzhBhOlzXysox5eLjPqZ7jTrLore7+CQ6dk6kBmKPKF/AReN6bCCKcmoEppWwBo
	ETefQUSTZ2lfVO8Wt/5FzfyJ8/CT55gg=
X-Received: by 2002:a05:690e:408c:b0:649:58f1:6cdc with SMTP id
 956f58d0204a3-6498fc54ed4mr526512d50.66.1769505634986; Tue, 27 Jan 2026
 01:20:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com> <20260121-debug_bus-v3-2-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-2-4d32451180d0@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:20:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=kUV4ApYB4xYRKK_qH4Z-i2PUuis+1pd+w+nbtWC-FvQ@mail.gmail.com>
X-Gm-Features: AZwV_QiHuD4uxcaT0lvjfGOgtaMK3IHUr5k1uRq3DPN_dABfrTBvSM80ZXPyZJI
Message-ID: <CAD++jL=kUV4ApYB4xYRKK_qH4Z-i2PUuis+1pd+w+nbtWC-FvQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 1:35=E2=80=AFPM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> HDP being functional depends on the debug configuration on the platform
> that can be checked using the access-controllers property, document it.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
