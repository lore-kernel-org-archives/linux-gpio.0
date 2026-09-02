Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F444E046
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345155; cv=none; b=o/65xE2deJ5SJGAJM5RWQrRQfTW4me7g+SzcD/oM6KbvXOvIHGPJti3rqW3tvQLvGI8/m9MfSkDuCTzzhB1gUs5HK5zuVjVk5WiR2pgAfWvcz21ZlH78cV0MnymCbxUdBrjIEmdiQzcY+z7t/pGMhudajnZCtTZ43eh6cC3my7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345155; c=relaxed/simple;
	bh=tjorZOyUEZli99n78tX8qW3WPaOMRl7icPyo+EABtDo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTYbkelyPbU2ze8NSOD8Ek+bJwcfcdOX6qL1+rMmYg6u9qj/pD2kNaGH8GXyOybzoygXNJlt7CcBN8fuV6XxZf4BTSZ1cVRefJS6/LFk1Zsn65QgEjBe1sUQ/BDDfTYpE0ie8isDY2ffiFmuwgQfZkO6bjMZy1mlc0i28mToNJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+qLe9/t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+qLe9/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D171F0155B
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 10:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788345153;
	bh=tjorZOyUEZli99n78tX8qW3WPaOMRl7icPyo+EABtDo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=P+qLe9/t3d1Fz/fuZ5VNbrLuCQlYOMaEBp6c2IRoJlznE+F9TZc+cJyzlM2hD+uH2
	 0sX2B3SJ8gCPC/1HwR60h1wjPNBJflOapKbnOGH5w3SAGUddLYgR62FjZPNN7nEoDh
	 8X0Aj1xrgkPeACUPG6xc6XN+oZlebZkFpjgvLEPps7yadLhTSmdM+mz3zk/UiHyyXw
	 IyoPW2mC+uXetb/CTgGlrwkRulWLX0mUvXTHUly9AZXMn5ccbstNLyyPoIv3WBXqrv
	 jsCE4SKKahXgGlXfHSZtCbzUnoWoIdq23bESOb77J5YOWeuXOgPCSHS8UGN3ck9ja1
	 OF1JLYx8vbEmA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2707334e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 03:32:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTvak5qJ0bgd37Rd4KJcvYvpJRmY3IvywER7Wr9uuszi4Dk/3G4FA6YB79WVEHYIqUcVx6qOk5sEu4@vger.kernel.org
X-Gm-Message-State: AFuF++lash6Nb4Xl3THoFGnDFcbL6n7WAK1Nv+dXtzoNSLvjFfHKkdFv
	/chuF6IxupIEedc4iapJADS1LGRqjkDj8CpRUFjSzNh31TpKh2Y8UjpldLm9+yabBSCN3/N6iuR
	+myHKVnEql/p6gqFlMyps1Q2f5nF1qy7TuaBCCcZFSw==
X-Received: by 2002:a05:6512:3c87:b0:5aa:6981:333 with SMTP id
 2adb3069b0e04-5b60c2f750dmr658558e87.16.1788345152317; Wed, 02 Sep 2026
 03:32:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 03:32:30 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 03:32:30 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <b6a6d425-c981-438e-9309-5aa00bc23c43@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-2-149dd4372ac8@alex-min.fr>
 <CAMRc=MdKYW_NQpqBES5UcyNqBJd_t1cHiLA3av0wWSWwFgOH-g@mail.gmail.com> <b6a6d425-c981-438e-9309-5aa00bc23c43@app.fastmail.com>
Date: Wed, 2 Sep 2026 03:32:30 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeMscTxVPdbvJQjf10qTupUG9NHSaNbQ_nZfjHFWK04qw@mail.gmail.com>
X-Gm-Features: AcwNN1W_XRj9jUauvd70S79AOK1R1xdpEIV7rKNNnNvlbuCyrrE0xLdl4SDXrgU
Message-ID: <CAMRc=MeMscTxVPdbvJQjf10qTupUG9NHSaNbQ_nZfjHFWK04qw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] pinctrl: qcom: Register functions before enabling pinctrl
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Aug 2026 09:52:50 +0200, MINETTE Alexandre
<contact@alex-min.fr> said:
> Hi Bartosz,
>
> It seems the patch has already been applied to linux-next with commit 981aefd53b3cdafae0e45332a1023b80d67f52be, so there's nothing to do, sorry for the confusion

Not only in linux-next. It's actually been released in v7.2.

Bart
