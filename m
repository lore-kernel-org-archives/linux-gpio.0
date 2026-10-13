Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A74D37C4
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934264; cv=none; b=oyy/g6bg/WFCWTVA6VuiBe0jDFL+9IjxKxMkL/sou/Qcx6wxPz4upfVk5ft+CUu7Ti56FKVtHB8kp2KkqpTpQvC1L82n7cZkSAMwATw1uuzTsXuUBhi94AT8hfK6aMkCU/qiwlK6G9CFLKDlsLg4LvFRe9z7SfuPOtxZttnrm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934264; c=relaxed/simple;
	bh=9f9NLdM3DRtuPBkjP7egipXAuBf5O2ZQpTJ6081sC5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYF5SSQHr8aiNDUChMlxLZKvR7Z/fTL8MgQnhI+T+sa4i/T3Lb5PeCLbPeQBe0GAqm2yT9lJUytVHyIH4XgAUvntFHN/eWAX6m0dd1OErHCyjJyjCs/+9Tfj1U3p5RMNI7SaBEwHR22Qfmo7tJ0tOyehop46TLlDsz2WIFuYz9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOvYKe6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOvYKe6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE981F00893
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934262;
	bh=9f9NLdM3DRtuPBkjP7egipXAuBf5O2ZQpTJ6081sC5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cOvYKe6/RHWICOEYmRDgV1/CJfXN6zxTPVa/ggFa8azzpJRLfZ2Vo/2Ar2YsPfWVm
	 0/8zH8osSU/5FsuZbN/LhW8CcX74hIAMvAaMLVB6dWGyntAQI3WxOTDZFW0uMH5HY+
	 3xv67x1AfqlxAzDEKm14sUDvJ6vWbFZkM8YOKNlydXNENR2kCs5FHFg+m6x7/+LIvV
	 bayGrYm9IetFKRECdnvKYl4H+hz8yHgWPNfraagJ4b45VPzUv3be/HNt7SgC69VETq
	 9YZC4+oEPyEj02C9Et6IFBeJ/ho9EA2SQnr51gMlTunqFsvVApghEiDoo65ysfpy3K
	 pjgmnHQbLaF9w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a9761758adso29065771fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 16:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaklqJLv7z+bqJ6iHnzAxNgd8Ssyudpb2igZ7wiqbGbG0dmlYULJ7HvNKRLjyYCSIAFaiLy4Gik/tU@vger.kernel.org
X-Gm-Message-State: AFq9FYJjaUmD8RUeqlLmAv2HNUOy714fRjdLcEiaiIAgr0UT3a2V17bw
	+2i1vziEzlfAkMBp2k4gNyYuYmBB/DgpbfXCQeOypnydjGHsZwbZLnKzhvKF01bnRuV36sJety8
	fRgeIY9C01mfs6bkdA+cijUV9dr6LVWs=
X-Received: by 2002:a05:651c:e17:b0:3aa:e460:a1e with SMTP id
 38308e7fff4ca-3aae4600da8mr7501681fa.8.1791934261486; Tue, 13 Oct 2026
 16:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
In-Reply-To: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:30:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkyvp+DAQTFT2oyydjyCwqSO1DmCgQExbsVsOBYRuQLAQ@mail.gmail.com>
X-Gm-Features: AclHuK--NzRkxrMOOurKIIgZ9lTUtEMpVE9dR3r-rR7PD9mLnaGJV8p3MYT60oY
Message-ID: <CAD++jLkyvp+DAQTFT2oyydjyCwqSO1DmCgQExbsVsOBYRuQLAQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Yd_Tseng@asmedia.com.tw, Jesse1_Chang@asmedia.com.tw, 
	Richard_Hsu@asmedia.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:43=E2=80=AFAM Szuying Chen <Chloe_Chen@asmedia.co=
m.tw> wrote:

> This commit implements the new gpio-amdptpci driver to support the
> GPIO functionality on AMD PT PCI platforms.
>
> Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
> Co-authored-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
>
> v1->v2:

NACK

I have provided feedback on v1 which was ignored.
Read it and incorporate it.

Yours,
Linus Walleij
