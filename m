Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF632BE056
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890650; cv=none; b=SvWd+3Sc3RMER1E/We4XudZ+djJB9Qc3tmjpqpF2VsfnTIBWo5geRwTD9h26GsNV81BmmgtNogDdu5OF1NAGSnulKa4igfiaf0vXhcGPKcsudAdaJiiU6fwDbfVLodu8s7h3HDxZHXDHx4QhTPt+9TXlPy0pj5FtRbClWS6vNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890650; c=relaxed/simple;
	bh=0JeXke4yrp//2jr+m7hmWb8VpYLnSF8U95s+7e6qDHA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STnHwfdoSLBcALm6K/9yyQ04PsrHsB2dgN0DfbusD7AGMV+VG5wGWL9K6w9KzaagxrM7GI9DsNSHW7KG33KYBsFNzpUPbUggZn3PERDIbKKFn0pHRWsl2LYfE7lrmMh5kT8Nwx++QvLm64R7UfZUSEf/WGpWKXxDW4hHNFrXIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUcec2xU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUcec2xU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5731F00ACA
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890648;
	bh=0JeXke4yrp//2jr+m7hmWb8VpYLnSF8U95s+7e6qDHA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kUcec2xUGizUm4jYUSRVNZUZ2PitJiw0h3ynkag1RrglT7Nx4bbkWtRyE8ediOF0p
	 kd1/sIVGCsAhftKS9cCJ7eY+fQrN1zaow/1mvSkwVapkI+i+N9/ojg/Heamz05Xe7x
	 nxH9FpWYuiH8oJdnh5r2UNhGu05KnQ18HlcI7UkRoMsElxegmitw3P0G9zRnj159T9
	 tdNxyDbSfJqq+dsShojhOwWlBakqerd7NCX8lQxuMuAuRBiYaDjXK1Cvm1vd0PwQqz
	 0fZ/M7fSsa0DnGf7DFCnaGebST51PzABCpHekGZ0JfF00Hwt1Djo1KGaTHrJGVghkn
	 muRXKtmcHOJIg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebae2f310so291523e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrM7MQ7CWjkdXdD0UBcE7IVE7RrPiwP/EXuuwiUinR7u5bohYnWGqhp71YHJqRo4Uhlh+PG7WP5bhJ8@vger.kernel.org
X-Gm-Message-State: AOJu0YxCB31PNEp8HwQSFj17S7ib6YN7LOJNWB67uBCI1o6Ab8QMGu4R
	OfBxhWX+VOOZcDZ65Cy04jkRYftXBN+wq3QBX99Hw7tAmXp0uaaJmkA0p49qCfszKNBdtLASR37
	quulw6lW1lOsko3WjgpGIL2oBfYm4EMelbr/c2cVcrg==
X-Received: by 2002:a05:6512:66c6:10b0:5ae:bbe4:f4b9 with SMTP id
 2adb3069b0e04-5aec68b65bamr58169e87.55.1782890647604; Wed, 01 Jul 2026
 00:24:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:24:05 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:24:05 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLneg_hxaBbcH915K8h1aec3L2gHKMhCmmj_eZ3iOs=VJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
 <CAD++jLneg_hxaBbcH915K8h1aec3L2gHKMhCmmj_eZ3iOs=VJA@mail.gmail.com>
Date: Wed, 1 Jul 2026 03:24:05 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mcug-E9KDk7UBfKVhN4mwP+rjeUsT9CrNrZ4UhmdRF2WQ@mail.gmail.com>
X-Gm-Features: AVVi8CcteT0RaTmV3zZX-RGkX-SuXhqlfYUURo1c1xqnTSRwT0M9M5dI5mPTCrY
Message-ID: <CAMRc=Mcug-E9KDk7UBfKVhN4mwP+rjeUsT9CrNrZ4UhmdRF2WQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Jul 2026 09:00:33 +0200, Linus Walleij <linusw@kernel.org> said:
> On Fri, Jun 26, 2026 at 3:08=E2=80=AFPM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>
>> Pins 143 and 151 were not included in the PDC wakeup map. They are
>> normally used for PCIe2A and PCIe3a PERST# respectively, so they're
>> unlikely to be excercised in practice, but still add them for the sake
>> of completeness.
>>
>> Fixes: c0e4c71a9e7c ("pinctrl: qcom: Introduce sc8280xp TLMM driver")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> LGTM Bartosz will queue Qualcomm patches, but I see he's
> already on CC albeit in the qcom address.
>
> Is this an urgent or a nonurgent fix?
>

Now queued, thanks.

Konrad: I use my kernel.org address for linux develpment as per MAINTAINERS=
 so
may miss email sent to oss.qualcomm.com.

Thanks,
Bart
